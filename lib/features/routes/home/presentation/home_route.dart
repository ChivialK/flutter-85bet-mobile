import 'package:after_layout/after_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/exports_for_route_widget.dart';

import 'state/home_store.dart';
import 'widgets/home_display.dart';
import 'widgets/home_display_provider.dart';

///
/// Main View of [FeatureRouter.homeRoute]
/// @author H.C.CHIANG
/// @version 2020/6/18
///
class HomeRoute extends StatefulWidget {
  @override
  _HomeRouteState createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> with AfterLayoutMixin {
  final GlobalKey _viewKey = new GlobalKey();

  HomeStore _store;
  List<ReactionDisposer> _disposers;
  CancelFunc toastDismiss;

  @override
  void initState() {
    _store ??= sl.get<HomeStore>();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _disposers ??= [
      reaction(
        // Observe in page
        // Tell the reaction which observable to observe
        (_) => _store.errorMessage,
        // Run some logic with the content of the observed field
        (String message) {
          if (message != null && message.isNotEmpty) {
            if (message.contains('code')) {
              callToastError(message, delayedMilli: 200);
            } else {
              callToastError(
                message,
                delayedMilli: 200,
                duration: ToastDuration.LONG,
              );
            }
          }
        },
      ),
      /* Reaction on wait game url */
      reaction(
        // Observe in page
        // Tell the reaction which observable to observe
        (_) => _store.waitForGameUrl,
        // Run some logic with the content of the observed field
        (bool wait) {
          debugPrint('reaction on wait game url: $wait');
          if (wait) {
            toastDismiss = callToastLoading();
          } else if (toastDismiss != null) {
            toastDismiss();
            toastDismiss = null;
          }
        },
      ),
      /* Reaction on game url retrieved */
      reaction(
        // Observe in page
        // Tell the reaction which observable to observe
        (_) => _store.gameUrl,
        // Run some logic with the content of the observed field
        (String url) {
          if (url != null && url.isNotEmpty) {
            MyLogger.info(msg: 'opening game: $url', tag: 'HomeRoute');
            Future.delayed(Duration(milliseconds: 300), () {
              _store.clearGameUrl();
              ScreenNavigate.switchScreen(
                screen: ScreenEnum.Game,
                webUrl: '$url',
              );
            });
          }
        },
      ),
    ];
  }

  @override
  void dispose() {
    _disposers.forEach((d) => d());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.topCenter,
        child: Observer(
          // Observe using specific widget
          builder: (_) {
            switch (_store.state) {
              case HomeStoreState.loading:
                return LoadingWidget();
              case HomeStoreState.loaded:
                return SingleChildScrollView(
                  physics: NeverScrollableScrollPhysics(), // user can't scroll
                  child: ConstrainedBox(
                    constraints: BoxConstraints.tight(Size(
                      Global.device.width,
                      Global.device.featureContentHeight,
                    )),
                    child: ChangeNotifierProvider<HomeDisplayProvider>.value(
                      value: sl.get<HomeDisplayProvider>(),
                      child: HomeDisplay(key: _viewKey),
                    ),
                  ),
                );
              default:
                return SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    _store.getInitializeData();
  }
}
