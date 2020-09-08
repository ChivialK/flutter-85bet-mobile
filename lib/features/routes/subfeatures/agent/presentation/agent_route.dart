import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/exports_for_route_widget.dart';

import 'state/agent_store.dart';
import 'widgets/agent_display.dart';

class AgentRoute extends StatefulWidget {
  @override
  _AgentRouteState createState() => _AgentRouteState();
}

class _AgentRouteState extends State<AgentRoute> {
  AgentStore _store;
  List<ReactionDisposer> _disposers;
  CancelFunc toastDismiss;

  @override
  void initState() {
    _store ??= sl.get<AgentStore>();
    super.initState();
    // execute action on init
    _store.getAgentData();
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
      /* Reaction on new agent action */
      reaction(
        // Observe in page
        // Tell the reaction which observable to observe
        (_) => _store.waitForAgentResponse,
        // Run some logic with the content of the observed field
        (bool wait) {
          debugPrint('reaction on wait agent: $wait');
          if (wait) {
            toastDismiss = callToastLoading();
          } else if (toastDismiss != null) {
            toastDismiss();
            toastDismiss = null;
          }
        },
      ),
      /* Reaction on agent request result */
      reaction(
        // Observe in page
        // Tell the reaction which observable to observe
        (_) => _store.mergeAdResult,
        // Run some logic with the content of the observed field
        (result) {
          debugPrint('reaction on merge ad result: $result');
          if (result == null) return;
          if (result.isSuccess) {
            try {
              Navigator.of(context).pop();
            } on Exception {}
            callToastInfo(
              result.msg,
              icon: Icons.check_circle_outline,
            );
          } else {
            callToastError(result.msg);
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
        debugPrint('pop agent route');
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
                case AgentStoreState.initial:
                  return SizedBox.shrink();
                case AgentStoreState.loading:
                  return LoadingWidget();
                case AgentStoreState.loaded:
                  return AgentDisplay(_store);
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
