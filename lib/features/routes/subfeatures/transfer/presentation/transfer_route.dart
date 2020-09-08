import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/core/network/handler/request_status_model.dart';
import 'package:flutter_85bet_mobile/features/exports_for_route_widget.dart';

import 'state/transfer_store.dart';
import 'widgets/transfer_display.dart';

class TransferRoute extends StatefulWidget {
  @override
  _TransferRouteState createState() => _TransferRouteState();
}

class _TransferRouteState extends State<TransferRoute> {
  TransferStore _store;
  List<ReactionDisposer> _disposers;
  CancelFunc toastDismiss;

  @override
  void initState() {
    _store ??= sl.get<TransferStore>();
    super.initState();
    // execute action on init
    _store.getPlatforms();
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
        (String msg) {
          if (msg != null && msg.isNotEmpty) {
            callToastError(msg);
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
          print('reaction on wait transfer: $wait');
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
          print('reaction on transfer result: $result');
          if (result == null) return;
          if (result.isSuccess) {
            callToastInfo(result.msg, icon: Icons.check_circle_outline);
          } else {
            callToastError(result.msg);
          }
        },
      ),
    ];
  }

  @override
  void dispose() {
    _store.closeStreams();
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
        print('pop transfer route');
        Future.delayed(
            Duration(milliseconds: 100), () => RouterNavigate.navigateBack());
        return Future(() => true);
      },
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(12.0),
          child: Observer(
            // Observe using specific widget
            builder: (_) {
              switch (_store.state) {
                case TransferStoreState.initial:
                  return SizedBox.shrink();
                case TransferStoreState.loading:
                  return LoadingWidget();
                case TransferStoreState.loaded:
                  return TransferDisplay(store: _store);
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
