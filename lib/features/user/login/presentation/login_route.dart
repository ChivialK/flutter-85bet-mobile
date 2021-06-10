import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/exports_for_route_widget.dart';

import 'state/login_store.dart';
import 'widgets/login_display.dart';

class LoginRoute extends StatefulWidget {
  final bool returnHomeAfterLogin;
  final bool isDialog;

  LoginRoute({
    this.returnHomeAfterLogin = false,
    this.isDialog = false,
  });

  @override
  _LoginRouteState createState() => _LoginRouteState();
}

class _LoginRouteState extends State<LoginRoute> {
  LoginStore _store;
  List<ReactionDisposer> _disposers;

  @override
  void initState() {
    _store ??= sl.get<LoginStore>();
    super.initState();
    // execute action on init
    _store.initialize();
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
        // Run some logic with the content of the observed field
        (String message) {
          debugPrint('received login error message: $message');
          if (message != null && message.isNotEmpty)
            callToastError(message, delayedMilli: 200);
        },
      ),
    ];
  }

  @override
  void dispose() {
    try {
      _store.close();
      _disposers.forEach((d) => d());
    } on Exception {}
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        debugPrint('pop login route');
        Future.delayed(
            Duration(milliseconds: 100), () => RouterNavigate.navigateBack());
        return Future(() => true);
      },
      child: Scaffold(
        body: Observer(
          // Observe using specific widget
          builder: (_) {
            switch (_store.state) {
              case LoginStoreState.loading:
                return LoadingWidget();
              case LoginStoreState.loaded:
                return new LoginDisplay(
                  store: _store,
                  returnHome: widget.returnHomeAfterLogin,
                  isDialog: widget.isDialog,
                );
              default:
                return SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
