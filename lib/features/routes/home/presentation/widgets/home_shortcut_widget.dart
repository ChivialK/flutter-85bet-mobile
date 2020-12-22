import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/event/event_inject.dart';
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
  final EventStore eventStore;

  HomeShortcutWidget({
    Key key,
    @required this.sizeCalc,
    @required this.eventStore,
  }) : super(key: key);

  @override
  HomeShortcutWidgetState createState() => HomeShortcutWidgetState();
}

class HomeShortcutWidgetState extends State<HomeShortcutWidget> {
  final List<MemberGridItem> shortcuts = [
    MemberGridItem.deposit,
    MemberGridItem.withdraw,
    MemberGridItem.transfer,
    MemberGridItem.vip,
  ];

  HomeStore _store;
  LoginStatus _userData;
  bool isUserContent = false;
  String _currentCredit;

  double _areaHeight;
  BorderSide _widgetBorder;
  Widget _contentWidget;
  Widget _userCreditWidget;
  bool _singleLine = false;

  void updateUser() {
    debugPrint('updating member area data...');
    setState(() {
      _userData = getAppGlobalStreams.lastStatus;
      debugPrint('member area user: $_userData');
      if (_userData.loggedIn) widget.eventStore?.getUserCredit();
    });
  }

  void toastLogin() {
    callToastInfo(localeStr.messageErrorNotLogin);
  }

  @override
  void initState() {
    _singleLine = (Global.localeCode == 'vi')
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
      color: themeColor.homeBoxDividerColor,
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
      color: themeColor.homeBoxBgColor,
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
    _userCreditWidget ??= _buildUserCreditWidget();
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Res.index_member),
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
              style: TextStyle(color: themeColor.homeBoxInfoTextColor),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 6.0),
            child: Text(
              '${localeStr.homeHintMemberCreditLeft}',
              style: TextStyle(color: themeColor.homeBoxInfoTextColor),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: _userCreditWidget,
          ),
        ],
      ),
    );
  }

  Widget _buildUserCreditWidget() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        StreamBuilder<String>(
          stream: getAppGlobalStreams.creditStream,
          initialData: getAppGlobalStreams.getCredit(addSymbol: false),
          builder: (_, snapshot) {
            if (_currentCredit != snapshot.data) {
              _currentCredit = snapshot?.data ?? '';
              debugPrint('home page user credit updated: $_currentCredit');
            }
            if (_currentCredit.contains('-')) {
              return Text(
                _currentCredit,
                style: TextStyle(color: themeColor.homeBoxInfoTextColor),
                textAlign: TextAlign.center,
              );
            } else {
              return FittedBox(
                fit:
                    (_currentCredit.length > 12) ? BoxFit.contain : BoxFit.none,
                child: Text(
                  formatValue(_currentCredit,
                      floorIfZero: false, creditSign: false),
                  style: TextStyle(color: themeColor.homeBoxInfoTextColor),
                  textAlign: TextAlign.center,
                ),
              );
            }
          },
        ),
      ],
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
            children: List<Widget>.generate(shortcuts.length, (index) {
              return Expanded(
                flex: 1,
                child: _createIconButton(shortcuts[index]),
              );
            })),
      ),
    );
  }

  Widget _createIconButton(MemberGridItem item) {
    final String label = item.value.label;
    return Container(
      decoration: BoxDecoration(border: Border(right: _widgetBorder)),
      margin: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
      child: GestureDetector(
        onTap: () {
          (item.value.isUserOnly == false)
              ? RouterNavigate.navigateToPage(item.value.route)
              : (item.value.isUserOnly && isUserContent)
                  ? RouterNavigate.navigateToPage(item.value.route)
                  : toastLogin();
        },
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
                    child: Icon(item.value.iconData,
                        color: themeColor.homeBoxIconColor))),
            Container(
              padding: EdgeInsets.only(top: (label.hasChinese) ? 4.0 : 6.0),
              height: (_singleLine)
                  ? widget.sizeCalc.shortcutMinTextHeight
                  : widget.sizeCalc.shortcutMaxTextHeight,
//              alignment: Alignment.center,
              child: RichText(
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.visible,
                text: TextSpan(
                  text: label,
                  style: TextStyle(
                    fontSize: (label.countLength >= 8)
                        ? FontSize.SMALLER.value
                        : FontSize.NORMAL.value,
                    color: themeColor.homeBoxIconTextColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
