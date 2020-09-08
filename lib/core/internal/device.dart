import 'package:flutter/foundation.dart' show debugPrint;
import 'package:flutter/widgets.dart'
    show EdgeInsets, MediaQueryData, Orientation;
import 'package:flutter_85bet_mobile/core/internal/global.dart';
import 'package:package_info/package_info.dart';

class Device {
  final bool isIos;
  final MediaQueryData _mediaQueryData;

  PackageInfo packageInfo;
  String _version;

  double _screenWidth;
  double _screenHeight;

  /// ex. device virtual button, phone's notch area
  EdgeInsets _screenPadding;

  /// ex. status bar area
  EdgeInsets _screenViewPadding;

  /// ex. on-screen virtual button, also changes while keyboard pops
  EdgeInsets _screenViewInset;

  // screen width compare with test device
  double _screenWidthScale;
  // screen height compare with test device
  double _screenHeightScale;
  // computed button height
  double _screenButtonHeight;

  Device(this._mediaQueryData, this.isIos) {
    PackageInfo.fromPlatform().then((PackageInfo info) {
      packageInfo = info;
      _version = (packageInfo.buildNumber == '1' ||
              packageInfo.buildNumber == packageInfo.version)
          ? packageInfo.version
          : '${packageInfo.version}+${packageInfo.buildNumber}';
      debugPrint('packageInfo: '
          'app=${packageInfo.appName}, '
          'package=${packageInfo.packageName}, '
          'pkg version=${packageInfo.version}, '
          'pkg build=${packageInfo.buildNumber}, '
          'app version=$_version');
    });
    _screenWidth = double.parse(_mediaQueryData.size.width.toStringAsFixed(2));
    _screenHeight =
        double.parse(_mediaQueryData.size.height.toStringAsFixed(2));
    _screenWidthScale = _screenWidth / Global.TEST_DEVICE_WIDTH;
    _screenHeightScale = _screenHeight / Global.TEST_DEVICE_HEIGHT;

    _screenPadding = _mediaQueryData.padding;
    _screenViewPadding = _mediaQueryData.viewPadding;
    _screenViewInset = _mediaQueryData.viewInsets;
    _screenButtonHeight = (_screenHeightScale > 1)
        ? (36 * _screenHeightScale).ceilToDouble()
        : 36.0;
  }

  @override
  String toString() {
    return 'width=$_screenWidth\n'
        'width scale=$_screenWidthScale\n'
        'height=$_screenHeight\n'
        'height scale=$_screenHeightScale\n'
        'ratio=$ratio, hor=$ratioHor\n'
        'padding=${_mediaQueryData.padding}\n'
        'view padding=${_mediaQueryData.viewPadding}\n'
        'view inset=${_mediaQueryData.viewInsets}\n'
        'button=$_screenButtonHeight';
  }

  /// App Version
  String get appVersion => '${packageInfo.version}+${packageInfo.buildNumber}';
  String get appVersionSide =>
      '${packageInfo.version}+${packageInfo.buildNumber}${(Global.addAnalytics) ? ' (GA)' : ''}';

  /// device's current orientation
  Orientation get orientation => _mediaQueryData.orientation;

  MediaQueryData get query => _mediaQueryData;

  /// screen's ratio = width / height
  double get ratio => _mediaQueryData.size.aspectRatio;

  /// screen's ratio = height / width
  double get ratioHor => _mediaQueryData.size.flipped.aspectRatio;

  /// device's width
  double get width => _screenWidth;

  /// device's height
  double get height => _screenHeight;

  /// device's width scale
  double get widthScale => _screenWidthScale;

  /// device's height
  double get heightScale => _screenHeightScale;

  double get safeHorizontalPadding => _mediaQueryData.padding.horizontal;

  double get safeVerticalPadding => _screenPadding.vertical;

  EdgeInsets get dialogInset => _mediaQueryData.viewInsets;

  double get safeInset => _screenViewInset.bottom;

  double get safeFloat => _screenViewPadding.bottom + _screenViewInset.bottom;

  /// device's relative button height
  double get comfortButtonHeight => _screenButtonHeight;

  double get featureContentHeight =>
      _screenHeight - Global.APP_TOOLS_HEIGHT - safeInset - safeVerticalPadding;
}
