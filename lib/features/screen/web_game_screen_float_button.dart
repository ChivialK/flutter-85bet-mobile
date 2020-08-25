import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/export_internal_file.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/float_expand_widget.dart';

import 'web_game_screen_store.dart';

class WebGameScreenFloatButton extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final WebGameScreenStore store;
  final Function onReturnHome;

  WebGameScreenFloatButton({
    Key key,
    @required this.scaffoldKey,
    @required this.store,
    this.onReturnHome,
  }) : super(key: key);

  @override
  WebGameScreenFloatButtonState createState() =>
      WebGameScreenFloatButtonState();
}

class WebGameScreenFloatButtonState extends State<WebGameScreenFloatButton> {
  final double _expandIconScale = 1.15;
  final double _expandArrowIconScale = 1.5;
  final double _arrowIconScale = 1.25;
  final bool isIos = Global.device.isIos;

  FloatExpandController _controller;
  double _widthRatio;
  double _heightRatio;
  double _heightExpandRatio;
  double _expandWidthRatio;
  double _expandWidthHorRatio;
  bool _fabExpand = false;
  bool _visible = true;

  void hideTool() {
    if (mounted && _visible) setState(() => _visible = false);
  }

  void showTool() {
    if (mounted && !_visible) setState(() => _visible = true);
  }

  void _initController() {
    _controller = new FloatExpandController();
    _controller.setExpandedWidgetConfiguration(
      expendedBackgroundColor: Colors.white,
      withChild: ButtonTheme(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        buttonColor: Themes.pagerButtonColor,
        disabledColor: Themes.buttonDisabledColorDark,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              icon: FittedBox(
                fit: BoxFit.contain,
                child: Transform.scale(
                  scale: _expandIconScale,
                  child: Icon(
                    Icons.home,
                    color: Themes.iconSubColor3,
                  ),
                ),
              ),
              visualDensity: VisualDensity.compact,
              onPressed: (widget.onReturnHome != null)
                  ? () => widget.onReturnHome()
                  : () => {},
            ),
            IconButton(
              icon: FittedBox(
                fit: BoxFit.contain,
                child: Icon(
                  Icons.screen_rotation,
                  color: Themes.iconSubColor3,
                ),
              ),
              visualDensity: VisualDensity.compact,
              onPressed: (widget.store != null)
                  ? () => widget.store.rotateScreenLeft()
                  : () => {},
            ),

            /// TODO error after unlock and rotate in ios
            if (!isIos)
              IconButton(
                icon: FittedBox(
                  fit: BoxFit.contain,
                  child: Icon(
                    Icons.screen_lock_rotation,
                    color: Themes.iconSubColor3,
                  ),
                ),
                visualDensity: VisualDensity.compact,
                onPressed:
                    (widget.store != null) ? () => _lockRotate() : () => {},
              ),
            IconButton(
              icon: FittedBox(
                fit: BoxFit.contain,
                child: Transform.scale(
                  scale: _expandArrowIconScale,
                  child: Icon(
                    Icons.chevron_right,
                    color: Themes.iconSubColor3,
                  ),
                ),
              ),
              visualDensity: VisualDensity.compact,
              onPressed: () {
                _controller.collapseFAB();
                setState(() {
                  _fabExpand = false;
                });
              },
            ),
          ],
        ),
      ),
      forceCustomHeight: true,
      heightToExpandTo: _heightExpandRatio,
    );
  }

  void _lockRotate() {
    bool isLock = widget.store.isLockRotate;
    String value = (isLock) ? localeStr.btnOff : localeStr.btnOn;
    widget.store.lockRotate = !isLock;
    callToast('${localeStr.sideBtnLockRotate}($value)');
  }

  @override
  void initState() {
    // Global.device.height / 100 * _heightRatio
    _heightRatio = 6.0 / Global.device.heightScale;
    _heightExpandRatio = _heightRatio * 1.25;
    _widthRatio = _heightRatio * Global.device.ratioHor;
    // Global.device.width / 100 * _expandWidthRatio
    _expandWidthRatio = (isIos)
        ? 168 * 100 / Global.device.width
        : 216 * 100 / Global.device.width;
    _expandWidthHorRatio = (isIos)
        ? 168 * 100 / Global.device.height
        : 216 * 100 / Global.device.height;
    debugPrint(
        'expand width = ${Global.device.width} / 100 * $_expandWidthRatio');
    debugPrint(
        'expand hor width = ${Global.device.height} / 100 * $_expandWidthHorRatio');
    debugPrint(
        'expand width ratio= $_expandWidthRatio, hor= $_expandWidthHorRatio');
    super.initState();
    _initController();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _visible,
      maintainState: true,
      maintainAnimation: true,
      child: FloatExpandWidget(
        controller: _controller,
        collapsedColor: Colors.white30,
        useAsFloatingSpaceBar: _fabExpand,
        useAsFloatingActionButton: !_fabExpand,
        floatingActionButtonIcon: Icons.chevron_left,
        floatingActionButtonIconSizeFactor: _heightRatio,
        floatingActionButtonIconScale: _arrowIconScale,
        floatingActionButtonContainerWidth: _widthRatio,
        floatingActionButtonContainerHeight: _heightRatio,
        onFloatingActionButtonTapped: () {
          setState(() {
            _fabExpand = true;
          });
          _controller.expandFAB();
        },
        // take 60% of the screen horizontally
        floatingSpaceBarContainerWidth:
            Global.device.orientation == Orientation.portrait
                ? _expandWidthRatio
                : _expandWidthHorRatio,
      ),
    );
  }
}
