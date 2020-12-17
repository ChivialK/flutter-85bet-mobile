import 'package:flutter/foundation.dart' show debugPrint;
import 'package:flutter_85bet_mobile/core/internal/global.dart';
import 'package:flutter_85bet_mobile/features/themes/font_size.dart';

class HomeDisplaySizeCalc {
  final double _bannerImageScale = 600.0 / Global.device.width;
  // final double _expectBannerHeight = 231.0;
  final double marqueeHeight = 36.0;
  final double shortcutTitleHeight = 0;
  final double shortcutMaxIconSize = 28.0;
  final double shortcutMinIconSize = 20.0;
  final double shortcutMinTextHeight = FontSize.NORMAL.value * 1.75;
  final double shortcutMaxTextHeight = FontSize.NORMAL.value * 2.75;
  final double _barItemInset = 8.0;

  double _bannerHeight;
  // double _expandedBannerHeight;

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

    /// Tab Bar
    _barMaxWidth = (availableWidth * 0.4).floorToDouble();
    _barMinWidth = _barMaxWidth - _barItemInset;
    _tabWidthFactor = (Global.device.widthScale > 1.5) ? 1.5 : 1.0;
    // debugPrint('available width: $availableWidth');
    // debugPrint('tab bar width: $_barMinWidth~$_barMaxWidth');

    if (_barMaxWidth > 180) _barMaxWidth = 180;
    if (_barMinWidth > _barMaxWidth) _barMinWidth = _barMaxWidth - 16;
    _barItemWidth = _barMinWidth - _barItemInset;
    debugPrint(
        'adjusted tab bar width: $_barMinWidth~$_barMaxWidth, item: $barItemWidth');
    debugPrint('----');

    /// Shortcut
    _shortcutMaxHeight = shortcutMaxIconSize +
        shortcutMaxTextHeight +
        shortcutTitleHeight +
        16.0;
    // _shortcutMaxHeight = shortcutMaxTextHeight + shortcutTitleHeight + 24.0;
    _shortcutMinHeight = _shortcutMaxHeight - 16.0;
    debugPrint('shortcut box height: $_shortcutMinHeight~$_shortcutMaxHeight');
    debugPrint('shortcut box title height: $shortcutTitleHeight');
    debugPrint('----');

    /// Banners
    // for normal height banners
    _bannerHeight = 231 / _bannerImageScale;
    debugPrint('banner height: $_bannerHeight');

    // for banners that shortcut widget is on top of it
//     double expandBannerHeight =
//         _expectBannerHeight * 1.6 * Global.device.heightScale;
//     _bannerHeight = _expectBannerHeight / _bannerImageScale;
//     _expandedBannerHeight =
//         (expandBannerHeight + _shortcutMaxHeight) / _bannerImageScale;
//     if (_expandedBannerHeight > 320) {
//       _expandedBannerHeight = 320;
//     }
//     debugPrint(
//         'banner height: $_bannerHeight, expanded: $_expandedBannerHeight');
    debugPrint('----');

    /// Tab Page
    double availableHeight =
        Global.device.featureContentHeight - _bannerHeight - _shortcutMaxHeight;
//     double availableHeight =
//         Global.device.featureContentHeight - _expandedBannerHeight;
    // debugPrint('content available height: $availableHeight');

    _tabPageMaxHeight = availableHeight;
    debugPrint('tab page height: $_tabPageMaxHeight');

    _tabPageMinWidth = Global.device.width * 0.5;
    _tabPageMaxWidth = availableWidth - _barMaxWidth - 16;
    // debugPrint('tab page width: $_tabPageMinWidth~$_tabPageMaxWidth');
    if (_tabPageMaxWidth < _tabPageMinWidth)
      _tabPageMinWidth = _tabPageMaxWidth;
    debugPrint('adjusted tab page width: $_tabPageMinWidth~$_tabPageMaxWidth');
    debugPrint('-----------------------------------');
  }

  void updatePageHeight(bool hasShortcut) {
    double availableHeight = (hasShortcut)
        ? Global.device.featureContentHeight - _bannerHeight - shortcutMaxHeight
        : Global.device.featureContentHeight - _bannerHeight;
    debugPrint('----');
    debugPrint('content available height: $availableHeight');

    _tabPageMaxHeight = availableHeight;
    debugPrint('tab page height: $_barMinWidth~$_barMaxWidth');
  }

  double get bannerHeight => _bannerHeight;

  // double get expandedBannerHeight => _expandedBannerHeight;

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
