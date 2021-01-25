import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/exports_for_route_widget.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/cached_network_image.dart';
import 'package:flutter_85bet_mobile/features/user/data/entity/login_status.dart';

import 'home_display_size_calc.dart';

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
  LoginStatus _userData;
  bool isUserContent = false;

  double _iconScale;
  double _areaHeight;
  BorderSide _widgetBorder;
  Widget _contentWidget;

  void toastLogin() {
    callToastInfo(localeStr.messageErrorNotLogin);
  }

  @override
  void initState() {
    _iconScale =
        (Global.device.widthScale > 1.0) ? Global.device.widthScale : 1.0;
    _areaHeight = widget.sizeCalc.shortcutMaxHeight;
    _userData = getAppGlobalStreams.lastStatus;
    debugPrint('updating member area height: $_areaHeight');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
        maxWidth: Global.device.width - 20,
        maxHeight: _areaHeight,
      ),
      decoration: BoxDecoration(
        color: themeColor.homeBoxBgColor,
        border: Border.all(color: themeColor.defaultBorderColor, width: 1.0),
        borderRadius: BorderRadius.all(Radius.circular(2.0)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            spreadRadius: 2.15,
            blurRadius: 6.0,
            offset: Offset(1, 1), // changes position of shadow
          ),
        ],
      ),
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      child: _contentWidget,
    );
  }

  Widget _buildContent(BuildContext context) {
    return Row(
      children: <Widget>[
        _buildShortcuts(),
//        if (isUserContent)
//          Expanded(
//            flex: 1,
//            child: _buildUserArea(),
//          )
      ],
    );
  }

  Widget _buildShortcuts() {
    return Expanded(
      flex: 4,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: _createIconButton(
                  page: RoutePage.sideTutorial,
                  imageUrl: themeColor.isDarkTheme
                      ? 'images/box1.jpg'
                      : 'images/box1_Color1.jpg'),
            ),
            Expanded(
              flex: 1,
              child: _createIconButton(
                  replaceLabel: localeStr.homeHintFreeUsage,
                  imageUrl: themeColor.isDarkTheme
                      ? 'images/box2.jpg'
                      : 'images/box2_Color1.jpg'),
            ),
            Expanded(
              flex: 1,
              child: _createIconButton(
                  page: RoutePage.promo,
                  imageUrl: themeColor.isDarkTheme
                      ? 'images/box6.jpg'
                      : 'images/box6_Color1.jpg',
                  isLast: true),
            ),
          ],
        ),
      ),
    );
  }

  Widget _createIconButton({
    RoutePage page,
    bool isUserOnly = false,
    String replaceLabel,
    String imageUrl,
    IconData iconData,
    bool isLast = false,
  }) {
    return Container(
      decoration:
          BoxDecoration(border: (isLast) ? null : Border(right: _widgetBorder)),
      margin: const EdgeInsets.fromLTRB(8.0, 2.0, 2.0, 2.0),
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
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            (imageUrl != null)
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(36.0),
                    child: Container(
                        constraints: BoxConstraints.tight(Size(
                                widget.sizeCalc.shortcutMaxIconSize,
                                widget.sizeCalc.shortcutMaxIconSize) *
                            _iconScale),
                        child: networkImageBuilder(imageUrl)),
                  )
                : Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: themeColor.homeBoxIconBgColor,
                    ),
                    constraints: BoxConstraints.tight(Size(
                            widget.sizeCalc.shortcutMinIconSize,
                            widget.sizeCalc.shortcutMinIconSize) *
                        _iconScale),
                    padding: const EdgeInsets.all(6.0),
                    child: Transform.scale(
                      scale: 0.75,
                      child: (iconData != null)
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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: AutoSizeText.rich(
                  TextSpan(
                    text: replaceLabel ?? page.pageTitle ?? '',
                    style: TextStyle(
                      fontSize: FontSize.SMALLER.value,
                      color: themeColor.homeBoxIconTextColor,
                    ),
                  ),
                  minFontSize: FontSize.SMALLER.value - 4.0,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
