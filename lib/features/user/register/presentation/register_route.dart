import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/exports_for_route_widget.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/dialog_widget.dart';

import 'state/register_store.dart';
import 'widget/register_display.dart';
import 'widget/register_display_dialog.dart';
import 'widget/register_store_inherited_widget.dart';

class RegisterRoute extends StatefulWidget {
  final bool isDialog;

  RegisterRoute({this.isDialog = false});

  @override
  _RegisterRouteState createState() => _RegisterRouteState();
}

class _RegisterRouteState extends State<RegisterRoute> {
  RegisterStore _store;
  List<ReactionDisposer> _disposers;

  @override
  void initState() {
    _store ??= sl.get<RegisterStore>();
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
            callToastError(message, delayedMilli: 200);
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
    if (widget.isDialog) {
      return DialogWidget(
        constraints: BoxConstraints.tight(Size(
          Global.device.width,
          Global.device.height,
        )),
        padding: EdgeInsets.zero,
        customBg: const Color(0xc9ffffff),
        roundParam: 0.0,
        canClose: false,
        children: [
          InkWell(
            // to dismiss the keyboard when the user tabs out of the TextField
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            focusColor: Colors.transparent,
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: RegisterStoreInheritedWidget(
              store: _store,
              child: RegisterDisplayDialog(),
            ),
          ),
        ],
      );
    } else {
      return WillPopScope(
        onWillPop: () {
          debugPrint('pop register route');
          Future.delayed(
              Duration(milliseconds: 100), () => RouterNavigate.navigateBack());
          return Future(() => true);
        },
        child: Scaffold(
          body: Container(
            width: Global.device.width,
            padding: const EdgeInsets.all(12.0),
            child: InkWell(
              // to dismiss the keyboard when the user tabs out of the TextField
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              focusColor: Colors.transparent,
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: RegisterStoreInheritedWidget(
                store: _store,
                child: RegisterDisplay(),
              ),
            ),
          ),
        ),
      );
    }
  }
}
