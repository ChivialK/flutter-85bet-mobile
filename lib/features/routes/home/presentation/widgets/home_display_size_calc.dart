import 'package:flutter/foundation.dart' show debugPrint;
import 'package:flutter_85bet_mobile/core/internal/font_size.dart';
import 'package:flutter_85bet_mobile/core/internal/global.dart';

class HomeDisplaySizeCalc {
  final double bannerImageScale = 600.0 / Global.device.width;
  final double marqueeHeight = 36.0;
  final double shortcutTitleHeight = 0;
  final double shortcutMaxIconSize = 28.0;
  final double shortcutMinIconSize = 24.0;
  final double shortcutMinTextHeight = FontSize.NORMAL.value * 1.75;
  final double shortcutMaxTextHeight = FontSize.NORMAL.value * 2.75;
  final double _barItemInset = 8.0;

  double _bannerHeight;

  double _shortcutMaxHeight;
  double _shortcutMinHeight;

  double _barMinWidth;
  double _barMaxWidth;
  double _barItemWidth;
  double _tabWidthFactor;

  double _tabPageMinWidth;
  double _tabPageMaxWidth;
  double _tabPageMaxHeight;

  HomeDisplaySizeCalc() {
    debugPrint('--------HomeDisplaySizeCalc--------');
    double availableWidth =
        Global.device.width - Global.device.safeHorizontalPadding;
    _barMaxWidth = (availableWidth * 0.4).floorToDouble();
    _barMinWidth = _barMaxWidth - _barItemInset;
    _tabWidthFactor = (Global.device.widthScale > 1.5) ? 1.5 : 1.0;
    debugPrint('available width: $availableWidth');
    debugPrint('tab bar width: $_barMinWidth~$_barMaxWidth');

    if (_barMaxWidth > 180) _barMaxWidth = 180;
    if (_barMinWidth > _barMaxWidth) _barMinWidth = _barMaxWidth - 16;
    debugPrint('adjusted tab bar width: $_barMinWidth~$_barMaxWidth');
    _barItemWidth = _barMinWidth - _barItemInset;

    _shortcutMaxHeight = shortcutMaxIconSize +
        shortcutMaxTextHeight +
        shortcutTitleHeight +
        10 +
        16;
    _shortcutMinHeight = _shortcutMaxHeight - 16.0;
    debugPrint('----');
    _bannerHeight = 231 / bannerImageScale;
    debugPrint('banner height: $_bannerHeight');
    debugPrint('shortcut box height: $_shortcutMinHeight~$_shortcutMaxHeight');
    debugPrint('shortcut box title height: $shortcutTitleHeight');

    double availableHeight =
        Global.device.featureContentHeight - _bannerHeight - _shortcutMaxHeight;
    debugPrint('----');
    debugPrint('content available height: $availableHeight');

    _tabPageMaxHeight = availableHeight;
    debugPrint('tab page height: $_barMinWidth~$_barMaxWidth');

    _tabPageMinWidth = Global.device.width * 0.5;
    _tabPageMaxWidth = availableWidth - _barMaxWidth - 24;
    debugPrint('tab page width: $_tabPageMinWidth~$_tabPageMaxWidth');
    if (_tabPageMaxWidth < _tabPageMinWidth)
      _tabPageMinWidth = _tabPageMaxWidth;
    debugPrint('adjusted tab page width: $_tabPageMinWidth~$_tabPageMaxWidth');
    debugPrint('-----------------------------------');
  }

  double get bannerHeight => _bannerHeight;

  double get shortcutMaxHeight => _shortcutMaxHeight;
  double get shortcutMaxHeightUser => _shortcutMaxHeight - shortcutTitleHeight;
  double get shortcutMinHeight => _shortcutMinHeight;

  double get barMaxWidth => _barMaxWidth;
  double get barMinWidth => _barMinWidth;
  double get barMaxHeight => _tabPageMaxHeight;
  double get barItemWidth => _barItemWidth;

  double get pageMaxWidth => _tabPageMaxWidth;
  double get pageMinWidth => _tabPageMinWidth;
  double get pageMaxHeight => _tabPageMaxHeight;

  double get userPageMaxHeight => _tabPageMaxHeight + shortcutTitleHeight;

  double get widthFactor => _tabWidthFactor;
}
