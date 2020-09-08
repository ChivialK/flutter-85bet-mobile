import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/core/network/handler/request_status_model.dart';
import 'package:flutter_85bet_mobile/features/exports_for_route_widget.dart';

import 'state/balance_store.dart';
import 'widgets/balance_display.dart';

class BalanceRoute extends StatefulWidget {
  @override
  _BalanceRouteState createState() => _BalanceRouteState();
}

class _BalanceRouteState extends State<BalanceRoute> {
  BalanceStore _store;
  List<ReactionDisposer> _disposers;
  CancelFunc toastDismiss;

  @override
  void initState() {
    _store ??= sl.get<BalanceStore>();
    super.initState();
    // execute action on init
    _store.getPromises();
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
            callToastError(message);
          }
        },
      ),
      /* Reaction on new transfer action */
      reaction(
        // Observe in page
        // Tell the reaction which observable to observe
        (_) => _store.waitForTransferResult,
        // Run some logic with the content of the observed field
        (bool wait) {
          debugPrint('reaction on wait transfer: $wait');
          if (wait) {
            toastDismiss = callToastLoading();
          } else if (toastDismiss != null) {
            toastDismiss();
            toastDismiss = null;
          }
        },
      ),
      /* Reaction on transfer result changed */
      reaction(
        // Observe in page
        // Tell the reaction which observable to observe
        (_) => _store.transferResult,
        // Run some logic with the content of the observed field
        (RequestStatusModel result) {
          debugPrint('reaction on transfer result: $result');
          if (result == null) return;
          if (result.isSuccess) {
            callToastInfo(
                (result.msg.isNotEmpty && result.msg.hasChinese)
                    ? result.msg
                    : localeStr.messageSuccess,
                icon: Icons.check_circle_outline);
          } else {
            callToastError((result.msg.isNotEmpty && result.msg.hasChinese)
                ? result.msg
                : localeStr
                    .messageTaskFailed(localeStr.transferResultAlertTitle));
          }
        },
      ),
    ];
  }

  @override
  void dispose() {
    if (toastDismiss != null) {
      toastDismiss();
      toastDismiss = null;
    }
    _disposers.forEach((d) => d());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        debugPrint('pop balance route');
        Future.delayed(
            Duration(milliseconds: 100), () => RouterNavigate.navigateBack());
        return Future(() => true);
      },
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(12.0),
          child: Observer(
            // Observe using specific widget
            builder: (_) {
              switch (_store.state) {
                case BalanceStoreState.initial:
                  return SizedBox.shrink();
                case BalanceStoreState.loading:
                  return LoadingWidget();
                case BalanceStoreState.loaded:
                  return BalanceDisplay(_store);
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
