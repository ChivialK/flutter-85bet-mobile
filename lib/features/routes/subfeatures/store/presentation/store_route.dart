import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/exports_for_route_widget.dart';

import 'state/point_store.dart';
import 'widgets/store_display.dart';

///
/// Main View of [Router.storeRoute]
///@author H.C.CHIANG
///@version 2020/6/7
///
class StoreRoute extends StatefulWidget {
  final int showProductId;

  StoreRoute({this.showProductId});

  @override
  _StoreRouteState createState() => _StoreRouteState();
}

class _StoreRouteState extends State<StoreRoute> {
  PointStore _store;
  List<ReactionDisposer> _disposers;
  CancelFunc toastDismiss;

  @override
  void initState() {
    _store ??= sl.get<PointStore>();
    super.initState();
    // execute action on init
    _store.getInitializeData();
    if (widget.showProductId != null) {
      _store.navProductId = widget.showProductId;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _disposers ??= [
      reaction(
        // Observe in page
        // Tell the reaction which observable to observe
        (_) => _store.waitForInitializeData,
        // Run some logic with the content of the observed field
        (bool wait) {
          debugPrint('point store initialize wait result: $wait');
          if (wait) {
            toastDismiss = callToastLoading();
          } else if (toastDismiss != null) {
            toastDismiss();
            toastDismiss = null;
          }
        },
      ),
      reaction(
        // Observe in page
        // Tell the reaction which observable to observe
        (_) => _store.errorMessage,
        // Run some logic with the content of the observed field
        (String message) {
          if (message != null && message.isNotEmpty) {
            callToastError(MessageMap.getErrorMessage(message, RouteEnum.STORE),
                delayedMilli: 200);
          }
        },
      ),
    ];
  }

  @override
  void dispose() {
    _store.closeStreams();
    _disposers.forEach((d) => d());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        debugPrint('pop store route');
        Future.delayed(
            Duration(milliseconds: 100), () => RouterNavigate.navigateBack());
        return Future(() => true);
      },
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: Observer(
            // Observe using specific widget
            builder: (_) {
              switch (_store.state) {
                case PointStoreState.initial:
                  return SizedBox.shrink();
                case PointStoreState.loading:
                  return LoadingWidget();
                case PointStoreState.loaded:
                  return SingleChildScrollView(
                    physics:
                        NeverScrollableScrollPhysics(), // user can't scroll
                    child: ConstrainedBox(
                      constraints: BoxConstraints.tight(Size(
                        Global.device.width,
                        Global.device.featureContentHeight,
                      )),
                      child: IntrinsicHeight(
                        child: StoreDisplay(_store),
                      ),
                    ),
                  );
                default:
                  return SizedBox.shrink();
              }
            },
          ),
        ),
      ),
    );
  }
}
