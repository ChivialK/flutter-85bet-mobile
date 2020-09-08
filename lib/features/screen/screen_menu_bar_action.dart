import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/exports_for_route_widget.dart';
import 'package:flutter_85bet_mobile/features/user/register/presentation/register_route.dart';

import 'feature_screen_inherited_widget.dart';

class ScreenMenuBarAction extends StatefulWidget {
  final FeatureScreenInheritedWidget viewState;

  ScreenMenuBarAction(this.viewState);

  @override
  _ScreenMenuBarActionState createState() => _ScreenMenuBarActionState();
}

class _ScreenMenuBarActionState extends State<ScreenMenuBarAction> {
  Widget _buttonsWidget;
  bool _usingUserAction = false;

  @override
  void didUpdateWidget(ScreenMenuBarAction oldWidget) {
    _buttonsWidget = null;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    _buttonsWidget ??= _createButtons();
    return Observer(builder: (_) {
      final hasUser = widget.viewState.store.hasUser ?? false;
      if (hasUser != _usingUserAction) {
        _usingUserAction = hasUser;
      }
      return (_usingUserAction) ? SizedBox.shrink() : _buttonsWidget;
    });
  }

  Widget _createButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: ButtonTheme(
        height: 30,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(4.0),
        ),
        child: Row(
          children: <Widget>[
            RaisedButton(
              child: new Text(
                localeStr.pageTitleLogin,
                style: TextStyle(
                  fontSize: FontSize.NORMAL.value + 1,
                  color: Themes.buttonTextPrimaryColor,
                ),
              ),
              visualDensity: VisualDensity(horizontal: -3.0),
              onPressed: () => RouterNavigate.navigateToPage(RoutePage.login),
            ),
            SizedBox(width: 4.0),
            RaisedButton(
              child: new Text(
                localeStr.pageTitleRegister,
                style: TextStyle(
                  fontSize: FontSize.NORMAL.value + 1,
                  color: Themes.buttonTextPrimaryColor,
                ),
              ),
              visualDensity: VisualDensity(horizontal: -3.0),
//                onPressed: () =>
//                    RouterNavigate.navigateToPage(RoutePage.register),
              onPressed: () {
                showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (_) => new RegisterRoute(isDialog: true),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
