import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_85bet_mobile/features/exports_for_route_widget.dart';

import 'state/roller_store.dart';
import 'widgets/roller_display.dart';

class RollerRoute extends StatefulWidget {
  @override
  _RollerRouteState createState() => _RollerRouteState();
}

class _RollerRouteState extends State<RollerRoute> {
  RollerStore _store;
  List<ReactionDisposer> _disposers;

  @override
  void initState() {
    _store ??= sl.get<RollerStore>();
    super.initState();
    // execute action on init
    _store.getInitData();
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
      onWillPop: () async {
        debugPrint('pop roller route');
        Future.delayed(
            Duration(milliseconds: 100), () => RouterNavigate.navigateBack());
        return Future(() => true);
      },
      child: Scaffold(
        body: Container(
          alignment: Alignment.topCenter,
          child: Observer(
            // Observe using specific widget
            builder: (_) {
              switch (_store.state) {
                case RollerStoreState.loading:
                  return LoadingWidget();
                case RollerStoreState.loaded:
                  return RollerDisplay(_store);
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
