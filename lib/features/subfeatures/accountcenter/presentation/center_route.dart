import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/exports_for_route_widget.dart';

import 'state/center_store.dart';
import 'widgets/center_display.dart';
import 'widgets/center_store_inherit_widget.dart';

class CenterRoute extends StatefulWidget {
  @override
  _CenterRouteState createState() => _CenterRouteState();
}

class _CenterRouteState extends State<CenterRoute> {
  final GlobalKey routeKey = new GlobalKey();
  CenterStore _store;
  List<ReactionDisposer> _disposers;
  CancelFunc toastDismiss;

  @override
  void initState() {
    _store ??= sl.get<CenterStore>();
    super.initState();
    // execute action on init
    _store.getAccount();
  }

  @override
  void didChangeDependencies() {
    debugPrint('center didChangeDependencies');
    super.didChangeDependencies();
    _disposers ??= [
      reaction(
        // Observe in page
        // Tell the reaction which observable to observe
        (_) => _store.errorMessage,
        // Run some logic with the content of the observed field
        (String msg) {
          if (msg != null && msg.isNotEmpty) {
            callToastError(msg);
          }
        },
      ),
      /* Reaction on wait response change */
      reaction(
        // Observe in page
        // Tell the reaction which observable to observe
        (_) => _store.waitForResponse,
        // Run some logic with the content of the observed field
        (bool wait) {
          if (wait) {
            toastDismiss = callToastLoading();
          } else if (toastDismiss != null) {
            toastDismiss();
            toastDismiss = null;
          }
        },
      ),
      /* Reaction on request response change */
      reaction(
        // Observe in page
        // Tell the reaction which observable to observe
        (_) => _store.requestResponse,
        // Run some logic with the content of the observed field
        (response) {
          if (response.isSuccess) {
            switch (_store.currentRequest) {
              case CenterStoreAction.birth:
              case CenterStoreAction.email:
              case CenterStoreAction.wechat:
              case CenterStoreAction.lucky:
                callToastInfo(
                  localeStr.messageTaskSuccess(localeStr.centerTextButtonBind),
                  icon: Icons.check_circle_outline,
                );
                break;
              case CenterStoreAction.password:
                callToastInfo(
                  localeStr.messageTaskSuccess(localeStr.centerTextButtonEdit),
                  icon: Icons.check_circle_outline,
                );
                RouterNavigate.navigateBack();
                break;
              case CenterStoreAction.verify_request:
              case CenterStoreAction.verify:
                localeStr.messageTaskSuccess(response.msg);
                break;
            }
          } else {
            switch (_store.currentRequest) {
              case CenterStoreAction.birth:
              case CenterStoreAction.email:
              case CenterStoreAction.wechat:
              case CenterStoreAction.lucky:
                callToastError(
                    '${localeStr.messageTaskFailed(localeStr.centerTextButtonBind)}: ${response.msg}');
                break;
              case CenterStoreAction.password:
                callToastError(localeStr
                    .messageTaskFailed(localeStr.centerTextButtonEdit));
                break;
              case CenterStoreAction.verify_request:
              case CenterStoreAction.verify:
                callToastError(localeStr.messageTaskFailed(response.msg));
                break;
            }
          }
        },
      ),
    ];
  }

  @override
  void dispose() {
    try {
      _store.closeStreams();
      _disposers.forEach((d) => d());
    } on Exception {}
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        debugPrint('pop center route');
        Future.delayed(
            Duration(milliseconds: 100), () => RouterNavigate.navigateBack());
        return Future(() => true);
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: CenterStoreInheritedWidget(
            key: routeKey,
            store: _store,
            child: Observer(
              // Observe using specific widget
              builder: (_) {
                switch (_store.state) {
                  case CenterStoreState.initial:
                    return SizedBox.shrink();
                  case CenterStoreState.loading:
                    return LoadingWidget();
                  case CenterStoreState.loaded:
                    return CenterDisplay();
                  default:
                    return SizedBox.shrink();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
