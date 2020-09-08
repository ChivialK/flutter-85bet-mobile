import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/exports_for_route_widget.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/warning_display.dart';
import 'package:flutter_85bet_mobile/features/user/data/entity/login_status.dart';
import 'package:flutter_85bet_mobile/res.dart';
import 'package:flutter_85bet_mobile/utils/regex_util.dart';

import '../state/home_store.dart';
import 'home_display_size_calc.dart';
import 'home_store_inherit_widget.dart';

///
/// Creates a widget to show member info under Marquee
/// @author H.C.CHIANG
/// @version 2020/6/19
///
class HomeShortcutWidget extends StatefulWidget {
  final HomeDisplaySizeCalc sizeCalc;
  HomeShortcutWidget({
    Key key,
    @required this.sizeCalc,
  }) : super(key: key);

  @override
  HomeShortcutWidgetState createState() => HomeShortcutWidgetState();
}

class HomeShortcutWidgetState extends State<HomeShortcutWidget> {
  HomeStore _store;
  LoginStatus _userData;
  bool isUserContent = false;
  String _currentCredit;

  double _areaHeight;
  BorderSide _widgetBorder;
  Widget _contentWidget;
  bool _singleLine = false;

  void updateUser() {
    debugPrint('updating member area data...');
    setState(() {
      _userData = getAppGlobalStreams.lastStatus;
      debugPrint('member area user: $_userData');
      if (_userData.loggedIn) _store?.getCredit();
    });
  }

  void toastLogin() {
    callToastInfo(localeStr.messageErrorNotLogin);
  }

  @override
  void initState() {
    _singleLine = (Global.lang == 'vi')
        ? Global.device.width >= 442.0
        : Global.device.width >= 360.0;
    _areaHeight = widget.sizeCalc.shortcutMaxHeight;
    _userData = getAppGlobalStreams.lastStatus;
    debugPrint('updating member area height: $_areaHeight');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _store ??= HomeStoreInheritedWidget.of(context).store;
    if (_store == null) {
      return Center(
        child: WarningDisplay(
          message:
              Failure.internal(FailureCode(type: FailureType.HOME, code: 11))
                  .message,
        ),
      );
    }

    _widgetBorder ??= BorderSide(
      color: Themes.homeBoxDividerColor,
      style: BorderStyle.solid,
    );

    if (isUserContent != _userData.loggedIn) {
      isUserContent = _userData.loggedIn;
      _contentWidget = _buildContent(context);
    }
    _contentWidget ??= _buildContent(context);

    return Container(
      constraints: BoxConstraints(
        maxWidth: Global.device.width,
        maxHeight: _areaHeight,
      ),
      color: Themes.homeBoxBgColor,
      child: _contentWidget,
    );
  }

  Widget _buildContent(BuildContext context) {
    return Row(
      children: <Widget>[
        _buildShortcuts(),
        if (isUserContent)
          Expanded(
            flex: 1,
            child: _buildUserArea(),
          )
      ],
    );
  }

  Widget _buildUserArea() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Res.homeBoxUserAreaBg),
          fit: BoxFit.fill,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              '${_userData.currentUser.account}',
              style: TextStyle(color: Themes.homeBoxInfoTextColor),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 6.0),
            child: Text(
              '${localeStr.homeHintMemberCreditLeft}',
              style: TextStyle(color: Themes.homeBoxInfoTextColor),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StreamBuilder<String>(
                  stream: _store.creditStream,
                  initialData: _store.userCredit,
                  builder: (_, snapshot) {
                    if (_currentCredit != snapshot.data) {
                      _currentCredit = snapshot?.data ?? '';
                      debugPrint(
                          'home page user credit updated: $_currentCredit');
                    }
                    if (_currentCredit.length > 12) {
                      return FittedBox(
                        child: Text(
                          formatValue(_currentCredit,
                              floorIfZero: false, creditSign: false),
                          style: TextStyle(color: Themes.homeBoxInfoTextColor),
                          textAlign: TextAlign.center,
                        ),
                      );
                    } else
                      return Text(
                        formatValue(_currentCredit,
                            floorIfZero: false, creditSign: false),
                        style: TextStyle(color: Themes.homeBoxInfoTextColor),
                        textAlign: TextAlign.center,
                      );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShortcuts() {
    return Expanded(
      flex: 4,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(top: 6.0, bottom: 2.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: _createIconButton(
                const IconData(0xe95d, fontFamily: 'IconMoon'),
                localeStr.pageTitleDeposit,
                () {
                  (isUserContent)
                      ? RouterNavigate.navigateToPage(RoutePage.deposit)
                      : toastLogin();
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: _createIconButton(
                const IconData(0xe96f, fontFamily: 'IconMoon'),
                localeStr.pageTitleMemberWithdraw,
                () {
                  (isUserContent)
                      ? RouterNavigate.navigateToPage(RoutePage.withdraw)
                      : toastLogin();
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: _createIconButton(
                const IconData(0xe96c, fontFamily: 'IconMoon'),
                localeStr.pageTitleMemberTransfer,
                () {
                  (isUserContent)
                      ? RouterNavigate.navigateToPage(RoutePage.transfer)
                      : toastLogin();
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: _createIconButton(
                const IconData(0xe96e, fontFamily: 'IconMoon'),
                'VIP',
                () => RouterNavigate.navigateToPage(RoutePage.sideVipLevel),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _createIconButton(IconData icon, String label, Function func) {
    return Container(
      decoration: BoxDecoration(border: Border(right: _widgetBorder)),
      margin: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
      child: GestureDetector(
        onTap: func,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ConstrainedBox(
                constraints: BoxConstraints.tightFor(
                  height: (_areaHeight >= widget.sizeCalc.shortcutMaxHeight)
                      ? widget.sizeCalc.shortcutMaxIconSize
                      : widget.sizeCalc.shortcutMinIconSize,
                ),
                child: FittedBox(
                    child: Icon(icon, color: Themes.homeBoxIconColor))),
            Container(
              padding: EdgeInsets.only(top: (label.hasChinese) ? 4.0 : 6.0),
              height: (_singleLine)
                  ? widget.sizeCalc.shortcutMinTextHeight
                  : widget.sizeCalc.shortcutMaxTextHeight,
//              alignment: Alignment.center,
              child: Text(
                label,
                style: TextStyle(color: Themes.homeBoxIconTextColor),
                maxLines: (_singleLine) ? 1 : 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
