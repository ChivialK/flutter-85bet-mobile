import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/event/presentation/state/event_store.dart';
import 'package:flutter_85bet_mobile/features/exports_for_route_widget.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/cached_network_image.dart';
import 'package:flutter_85bet_mobile/features/themes/icon_code.dart';
import 'package:flutter_85bet_mobile/features/user/data/entity/login_status.dart';

import 'home_display_size_calc.dart';

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
  double _areaHeight;
  double _leftAreaMaxWidth;
  double _leftAreaMinWidth;
  double _leftAreaTextSize;

  bool _smallerWidget = false;
  Size _iconSize;

  LoginStatus _userData;
  bool isUserContent = false;
  Widget _contentWidget;
  BorderSide _widgetBorder;

  // Widget _infoWidget;
  // String _currentCredit;
  //
  // void _updateTextSize(bool updateView) {
  //   double textSize = (_userData.currentUser.account.length > 10 ||
  //           _userData.currentUser.credit.strToDouble > 10000)
  //       ? FontSize.SMALLER.value
  //       : FontSize.NORMAL.value;
  //
  //   if (_leftAreaTextSize != textSize) {
  //     _leftAreaTextSize = textSize;
  //     if (updateView)
  //       Future.delayed(Duration(milliseconds: 200), () {
  //         setState(() {});
  //       });
  //   }
  // }

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
    _areaHeight = Global.device.height / 10.5;
    if (_areaHeight < widget.sizeCalc.shortcutMinHeight)
      _areaHeight = widget.sizeCalc.shortcutMinHeight;
    if (_areaHeight > widget.sizeCalc.shortcutMaxHeight)
      _areaHeight = widget.sizeCalc.shortcutMaxHeight;

    double availableWidth =
        (Global.device.width >= 600) ? 200 : Global.device.width / 3;
    _leftAreaMinWidth = FontSize.NORMAL.value * 6;
    _leftAreaMaxWidth = FontSize.NORMAL.value * 8.5;

    if (Global.device.isIos) _leftAreaMinWidth += 8;
    if (Global.device.width > 600) {
      _leftAreaMinWidth = _leftAreaMinWidth * 1.5;
      _leftAreaMaxWidth = _leftAreaMaxWidth * 2;
    } else if (Global.device.isIos) _leftAreaMaxWidth += 8;

    if (_leftAreaMinWidth < availableWidth) _leftAreaMinWidth = availableWidth;
    if (_leftAreaMaxWidth < _leftAreaMinWidth)
      _leftAreaMaxWidth = _leftAreaMinWidth;

    _userData = getAppGlobalStreams.lastStatus;
    debugPrint('updating member area height: $_areaHeight');
    super.initState();
    _smallerWidget = _areaHeight < widget.sizeCalc.shortcutMaxHeight;
    _iconSize = (_smallerWidget)
        ? Size(widget.sizeCalc.shortcutMinIconSize,
            widget.sizeCalc.shortcutMinIconSize)
        : Size(widget.sizeCalc.shortcutMaxIconSize,
            widget.sizeCalc.shortcutMaxIconSize);
  }

  @override
  Widget build(BuildContext context) {
    if (isUserContent != _userData.loggedIn) {
      isUserContent = _userData.loggedIn;
      _contentWidget = _buildContent(context);
    }
    _contentWidget ??= _buildContent(context);
    _widgetBorder ??= BorderSide(
      color: themeColor.homeBoxDividerColor,
      width: 2.0,
      style: BorderStyle.solid,
    );
    return Container(
      constraints: BoxConstraints(
        maxWidth: Global.device.width - 16.0,
        maxHeight: (isUserContent)
            ? _areaHeight - widget.sizeCalc.shortcutTitleHeight
            : _areaHeight,
      ),
      child: Stack(
        // use stack to hide frame line between widgets
        children: [
          Container(
            decoration: BoxDecoration(
              color: themeColor.homeBoxBgColor,
              border: Border.fromBorderSide(_widgetBorder),
              borderRadius: BorderRadius.circular(4.0),
            ),
            padding: (isUserContent)
                ? EdgeInsets.zero
                : EdgeInsets.only(
                    top: widget.sizeCalc.shortcutTitleHeight - 2.0,
                  ),
            child: _contentWidget,
          ),
          if (!isUserContent)
            Container(
              height: widget.sizeCalc.shortcutTitleHeight,
              decoration: BoxDecoration(
                color: themeColor.defaultAccentColor,
                border: Border.fromBorderSide(_widgetBorder),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4.0),
                  topRight: Radius.circular(4.0),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6.0),
                    child: Text(
                      localeStr.homeHintWelcomeLogin,
                      style: TextStyle(color: themeColor.homeBoxHintTextColor),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // Container(
        //   constraints: (isUserContent)
        //       ? BoxConstraints(
        //           maxWidth: _leftAreaMaxWidth,
        //           minWidth: _leftAreaMinWidth,
        //         )
        //       : BoxConstraints.tightFor(width: _leftAreaMinWidth - 12.0),
        //   alignment: Alignment.center,
        //   child: _buildLeftContent(context),
        // ),
        // VerticalDivider(
        //   thickness: 2.0,
        //   color: themeColor.homeBoxDividerColor,
        // ),
        _buildRightContent(),
      ],
    );
  }

  //
  // Widget _buildLeftContent(BuildContext context) {
  //   if (!isUserContent) {
  //     /// if not logged in, show a login button
  //     return Container(
  //       margin: const EdgeInsets.fromLTRB(12.0, 8.0, 4.0, 8.0),
  //       child: RaisedButton(
  //         visualDensity: VisualDensity(horizontal: 3.0),
  //         color: themeColor.homeBoxBgColor,
  //         shape: RoundedRectangleBorder(
  //           side: BorderSide(color: themeColor.defaultAccentColor),
  //           borderRadius: BorderRadius.circular(4.0),
  //         ),
  //         child: AutoSizeText(
  //           localeStr.pageTitleLogin2,
  //           style: TextStyle(color: themeColor.homeBoxButtonTextColor),
  //           minFontSize: 10.0,
  //           maxLines: 2,
  //           overflow: TextOverflow.ellipsis,
  //         ),
  //         onPressed: () => showDialog(
  //           context: context,
  //           barrierDismissible: true,
  //           builder: (_) => new LoginRoute(
  //             returnHomeAfterLogin: true,
  //             isDialog: true,
  //           ),
  //         ),
  //       ),
  //     );
  //   } else {
  //     /// if logged in, show member info
  //     if (_leftAreaTextSize == null) _updateTextSize(false);
  //     return Container(
  //       margin: const EdgeInsets.fromLTRB(8.0, 8.0, 0.0, 8.0),
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: <Widget>[
  //           Row(
  //             mainAxisSize: MainAxisSize.max,
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: [
  //               Padding(
  //                 padding: const EdgeInsets.only(left: 8.0),
  //                 child: RichText(
  //                   overflow: TextOverflow.visible,
  //                   textAlign: TextAlign.center,
  //                   text: TextSpan(
  //                     text: '${_userData.currentUser.account}',
  //                     style: TextStyle(
  //                       color: themeColor.homeBoxInfoTextColor,
  //                       fontSize: _leftAreaTextSize,
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //           Row(
  //             mainAxisSize: MainAxisSize.max,
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: [
  //               StreamBuilder<String>(
  //                 stream: getAppGlobalStreams.creditStream,
  //                 initialData: getAppGlobalStreams.getCredit(addSymbol: true),
  //                 builder: (_, snapshot) {
  //                   if (_currentCredit != snapshot.data) {
  //                     _currentCredit = snapshot.data;
  //                     debugPrint(
  //                         'home page user credit updated: $_currentCredit');
  //                     _infoWidget = _buildUserInfo();
  //                     _updateTextSize(true);
  //                   }
  //                   _infoWidget ??= _buildUserInfo();
  //                   return _infoWidget;
  //                 },
  //               ),
  //             ],
  //           ),
  //         ],
  //       ),
  //     );
  //   }
  // }
  //
  // Widget _buildUserInfo() {
  //   return RichText(
  //     maxLines: 1,
  //     overflow: TextOverflow.visible,
  //     textAlign: TextAlign.center,
  //     text: TextSpan(
  //       children: <TextSpan>[
  //         TextSpan(
  //           text: '${localeStr.homeHintMemberCreditLeft} ',
  //           style: TextStyle(fontSize: _leftAreaTextSize - 2.0),
  //         ),
  //         TextSpan(
  //           text: (_currentCredit.contains('-'))
  //               ? _currentCredit
  //               : formatValue(
  //                   _currentCredit,
  //                   floorIfInt: true,
  //                   floorIfZero: false,
  //                   creditSign: false,
  //                 ),
  //           style: TextStyle(
  //             color: themeColor.homeBoxInfoTextColor,
  //             fontSize: _leftAreaTextSize,
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildRightContent() {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: _createShortcutButton(
                page: RoutePage.depositFeature,
                isUserOnly: true,
                iconData: IconCode.navDeposit,
              ),
            ),
            Expanded(
              flex: 1,
              child: _createShortcutButton(
                page: RoutePage.withdraw,
                isUserOnly: true,
                iconData: IconCode.gridWithdraw,
              ),
            ),
            Expanded(
              flex: 1,
              child: _createShortcutButton(
                page: RoutePage.transfer,
                isUserOnly: true,
                iconData: IconCode.gridTransfer,
              ),
            ),
            Expanded(
              flex: 1,
              child: _createShortcutButton(
                page: RoutePage.sideVipLevel,
                iconData: IconCode.gridVip,
              ),
            ),
            // Expanded(
            //   flex: 1,
            //   child: _createShortcutButton(
            //     page: RoutePage.promo,
            //     iconData: IconCode.navPromo,
            //     isLast: true,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget _createShortcutButton({
    RoutePage page,
    bool isUserOnly = false,
    String replaceLabel,
    String imageUrl,
    IconData iconData,
    bool isLast = false,
  }) {
    return Container(
      // decoration: (!isLast)
      //     ? BoxDecoration(border: Border(right: _widgetBorder))
      //     : null,
      margin: const EdgeInsets.symmetric(vertical: 2.0),
      child: GestureDetector(
        onTap: () {
          if (isUserOnly && !isUserContent && page != null) {
            toastLogin();
          } else if (page != null) {
            RouterNavigate.navigateToPage(page);
          } else {
            callToastInfo(localeStr.workInProgress);
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Container(
                constraints: BoxConstraints.tight(_iconSize),
                child: (imageUrl != null)
                    ? (imageUrl.startsWith('assets/'))
                        ? Image.asset(imageUrl)
                        : networkImageBuilder(imageUrl)
                    : (iconData != null)
                        ? Icon(
                            iconData,
                            color: themeColor.homeBoxIconColor,
                          )
                        : Icon(
                            Icons.broken_image,
                            color: themeColor.homeBoxIconColor,
                          ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(top: 4.0),
                alignment: Alignment.center,
                child: AutoSizeText(
                  replaceLabel ?? page.pageTitle ?? '',
                  style: TextStyle(color: themeColor.homeBoxIconTextColor),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  minFontSize: FontSize.SMALLER.value,
                  maxFontSize: FontSize.NORMAL.value,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
