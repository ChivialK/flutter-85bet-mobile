import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/exports_for_route_widget.dart';

import 'state/bet_record_store.dart';
import 'widgets/bet_record_display.dart';

class BetRecordRoute extends StatefulWidget {
  @override
  _BetRecordRouteState createState() => _BetRecordRouteState();
}

class _BetRecordRouteState extends State<BetRecordRoute> {
  BetRecordStore _store;
  List<ReactionDisposer> _disposers;
  CancelFunc toastDismiss;

  @override
  void initState() {
    _store ??= sl.get<BetRecordStore>();
    super.initState();
    // execute action on init
    _store.getTypes();
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
            callToastError(message, delayedMilli: 200);
          }
        },
      ),
      /* Reaction on bet record action */
      reaction(
        // Observe in page
        // Tell the reaction which observable to observe
        (_) => _store.waitForRecordResponse,
        // Run some logic with the content of the observed field
        (bool wait) {
          debugPrint('reaction on wait bet record: $wait');
          if (wait) {
            toastDismiss = callToastLoading();
          } else if (toastDismiss != null) {
            toastDismiss();
            toastDismiss = null;
          }
        },
      ),
    ];
  }

  @override
  void dispose() {
    try {
      _store.closeStreams();
      if (toastDismiss != null) {
        toastDismiss();
        toastDismiss = null;
      }
      _disposers.forEach((d) => d());
    } on Exception {}
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        debugPrint('pop bets route');
        Future.delayed(
            Duration(milliseconds: 100), () => RouterNavigate.navigateBack());
        return Future(() => true);
      },
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(12.0),
          child: Observer(
            // Observe using specific widget
            builder: (_) {
              switch (_store.state) {
                case BetRecordStoreState.initial:
                  return SizedBox.shrink();
                case BetRecordStoreState.loading:
                  return LoadingWidget();
                case BetRecordStoreState.loaded:
                  return BetRecordDisplay(store: _store);
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
