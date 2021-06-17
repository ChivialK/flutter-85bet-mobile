import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/event/presentation/state/event_store.dart';
import 'package:flutter_85bet_mobile/features/exports_for_route_widget.dart';
import 'package:flutter_85bet_mobile/features/user/data/entity/login_status.dart';
import 'package:flutter_85bet_mobile/features/user/register/presentation/register_route.dart';

import 'feature_screen_inherited_widget.dart';

class ScreenMenuBarAction extends StatefulWidget {
  final FeatureScreenInheritedWidget viewState;
  final EventStore eventStore;

  ScreenMenuBarAction(this.viewState, {this.eventStore});

  @override
  _ScreenMenuBarActionState createState() => _ScreenMenuBarActionState();
}

class _ScreenMenuBarActionState extends State<ScreenMenuBarAction> {
  Widget _buttonsWidget;
  Widget _userStreamWidget;
  bool _usingUserAction = false;

  LoginStatus _userData;
  Widget _infoWidget;
  String _currentCredit;

  void updateUser() {
    debugPrint('updating member area data...');
    setState(() {
      _userData = getAppGlobalStreams.lastStatus;
      debugPrint('member area user: $_userData');
      if (_userData.loggedIn) widget.eventStore?.getUserCredit();
    });
  }

  @override
  void initState() {
    super.initState();
    _userData = getAppGlobalStreams.lastStatus;
  }

  @override
  void didUpdateWidget(ScreenMenuBarAction oldWidget) {
    _buttonsWidget = null;
    _userStreamWidget = null;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    _buttonsWidget ??= _createButtons();
    _userStreamWidget ??= _createInfoStream();
    return Observer(builder: (_) {
      final hasUser = widget.viewState.store.hasUser ?? false;
      if (hasUser != _usingUserAction) {
        _userData = getAppGlobalStreams.lastStatus;
        _usingUserAction = hasUser;
      }
      return (_usingUserAction) ? _userStreamWidget : _buttonsWidget;
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
        buttonColor: themeColor.buttonPrimaryColor,
        child: Row(
          children: <Widget>[
            RaisedButton(
              child: new Text(
                localeStr.pageTitleLogin,
                style: TextStyle(
                  fontSize: FontSize.NORMAL.value + 1,
                  color: themeColor.buttonTextPrimaryColor,
                ),
              ),
              visualDensity: VisualDensity(horizontal: -3.0),
              onPressed: () => RouterNavigate.navigateToPage(RoutePage.login,
                  arg: LoginRouteArguments(returnHomeAfterLogin: true)),
            ),
            // SizedBox(width: 4.0),
            // RaisedButton(
            //   child: new Text(
            //     localeStr.pageTitleRegisterFree,
            //     style: TextStyle(
            //       fontSize: FontSize.NORMAL.value + 1,
            //       color: themeColor.buttonTextPrimaryColor,
            //     ),
            //   ),
            //   visualDensity: VisualDensity(horizontal: -3.0),
            //   // onPressed: () =>
            //   //     RouterNavigate.navigateToPage(RoutePage.register),
            //   onPressed: () {
            //     showDialog(
            //       context: context,
            //       barrierDismissible: true,
            //       builder: (_) => new RegisterRoute(isDialog: true),
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }

  Widget _createInfoStream() {
    return StreamBuilder<String>(
      stream: getAppGlobalStreams.creditStream,
      initialData: getAppGlobalStreams.getCredit(addSymbol: true),
      builder: (_, snapshot) {
        if (_currentCredit != snapshot.data) {
          _currentCredit = snapshot.data;
          debugPrint('home page user credit updated: $_currentCredit');
          _infoWidget = _buildUserInfo();
        }
        _infoWidget ??= _buildUserInfo();
        return _infoWidget;
      },
    );
  }

  Widget _buildUserInfo() {
    if (_userData.loggedIn && _userData.currentUser != null) {
      return Container(
        constraints: BoxConstraints(maxWidth: Global.device.width * 0.5),
        margin: const EdgeInsets.only(right: 8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: RichText(
                overflow: TextOverflow.visible,
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6.0),
                        constraints: BoxConstraints.tightFor(height: 28.0),
                        child: Image.asset(
                          'assets/images/vip/user_vip_${_userData.currentUser.vip}.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    TextSpan(
                      text: '${_userData.currentUser.account}   ',
                      style: TextStyle(
                        color: themeColor.secondaryTextColor1,
                      ),
                    ),
                    TextSpan(
                      text: (_currentCredit.contains('-'))
                          ? _currentCredit
                          : formatAsCreditNum(_currentCredit.strToDouble),
                      style: TextStyle(color: themeColor.homeBoxInfoTextColor),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return SizedBox.shrink();
    }
  }
}
