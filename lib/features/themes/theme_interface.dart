import 'package:flutter/painting.dart';
import 'package:flutter_85bet_mobile/injection_container.dart';

import 'theme_color_interface.dart';
import 'theme_settings.dart';

export 'font_size.dart';
export 'hex_color.dart';
export 'theme_color_interface.dart';

ThemeColorInterface get themeColor => ThemeInterface.theme.interface;

abstract class ThemeInterface {
  static ThemeSettings theme = sl.get<ThemeSettings>();

  /*******************************************************************
   * Variables                                                       *
   *******************************************************************/

  /// Input Field Settings
  static const double fieldHeight = 53.6;
  static const double fieldIconSize = 24.0;
  static const double prefixTextWidthFactor = 0.3;
  static const double prefixTextSpacing = 0.0;
  static const double prefixIconWidthFactor = 0.166;
  static const double suffixWidthFactor = 0.314;
  static const double horizontalInset = 32.0;
  static const double minusSize = 8.0;

  /*******************************************************************
   * Decoration                                                      *
   *******************************************************************/

  /// Decor Color
  static Color get themeIconBgColor =>
      (themeColor.isDarkTheme) ? null : themeColor.iconBgColor;

  static Gradient get themeIconBgGradient =>
      (themeColor.isDarkTheme) ? radialGradient : radialGradientLight;

  /// Container Decor
  static BoxDecoration get layerShadowDecor => BoxDecoration(
      color: themeColor.defaultLayeredBackgroundColor,
      boxShadow: ThemeInterface.layerShadow);

  static BoxDecoration get layerShadowDecorRound => BoxDecoration(
      color: themeColor.defaultLayeredBackgroundColor,
      borderRadius: BorderRadius.all(Radius.circular(4.0)),
      boxShadow: ThemeInterface.layerShadow);

  static BoxDecoration get layerShadowDecorRoundLight => BoxDecoration(
      color: themeColor.defaultLayeredBackgroundColor,
      borderRadius: BorderRadius.all(Radius.circular(4.0)),
      boxShadow: ThemeInterface.layerShadowLight);

  static BoxDecoration get layerShadowDecorRoundAlpha => BoxDecoration(
      color: themeColor.defaultLayeredBackgroundColorAlpha,
      borderRadius: BorderRadius.all(Radius.circular(4.0)),
      boxShadow: ThemeInterface.layerShadow);

  static BoxDecoration get layerShadowDecorRoundTop => BoxDecoration(
      color: themeColor.defaultLayeredBackgroundColor,
      borderRadius: BorderRadius.vertical(top: Radius.circular(8.0)),
      boxShadow: ThemeInterface.layerShadowLight);

  static BoxDecoration get layerShadowDecorRoundBottom => BoxDecoration(
      color: themeColor.defaultLayeredBackgroundColor,
      borderRadius: BorderRadius.vertical(bottom: Radius.circular(8.0)),
      boxShadow: ThemeInterface.layerShadowLight);

  static BoxDecoration get gridItemShadowDecor => BoxDecoration(
      color: themeColor.defaultLayeredBackgroundColor,
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      boxShadow: ThemeInterface.gridItemShadow);

  static BoxDecoration get iconDecorNoColor => BoxDecoration(
      shape: BoxShape.circle, boxShadow: ThemeInterface.iconShadowExtend);

  static BoxDecoration get pageIconContainerDecor => BoxDecoration(
      shape: BoxShape.circle,
      color: themeIconBgColor,
      gradient: themeIconBgGradient,
      boxShadow: ThemeInterface.iconBottomShadow);

  /// Container Shadow
  static List<BoxShadow> layerShadow = <BoxShadow>[
    BoxShadow(
      color: Color(0x61000000),
      spreadRadius: 2.15,
      blurRadius: 3.0,
      offset: Offset(3, 3), // changes position of shadow
    ),
  ];

  static List<BoxShadow> layerShadowLight = <BoxShadow>[
    BoxShadow(
      color: Color(0x42000000),
      spreadRadius: 2.15,
      blurRadius: 3.0,
      offset: Offset(3, 3), // changes position of shadow
    ),
  ];

  static List<BoxShadow> gridItemShadow = <BoxShadow>[
    BoxShadow(
      color: Color(0x1f000000),
      spreadRadius: 1.15,
      blurRadius: 2.0,
      offset: Offset(2, 2), // changes position of shadow
    ),
  ];

  static List<BoxShadow> iconBottomShadow = <BoxShadow>[
    BoxShadow(
        color: Color(0x42000000),
        spreadRadius: 1.15,
        blurRadius: 2.0,
        offset: Offset(1, 2))
  ];

  static List<BoxShadow> iconShadowExtend = <BoxShadow>[
    BoxShadow(
        color: Color(0x73000000),
        spreadRadius: 2.25,
        blurRadius: 7.0,
        offset: Offset(2, 6))
  ];

  /// Container Gradient
  static Gradient radialGradient = RadialGradient(
    colors: [
      Color(0x40a4a4a4),
      Color(0xcc25272c),
    ],
    stops: [0.1, 0.8],
    radius: 0.7,
    tileMode: TileMode.clamp,
  );

  static Gradient radialGradientLight = RadialGradient(
    colors: [
      Color(0xffd7c3b3),
      Color(0xffc1a180),
    ],
    stops: [0.1, 0.8],
    radius: 0.7,
    tileMode: TileMode.clamp,
  );

  static Gradient get navBarGradient => (themeColor.isDarkTheme)
      ? LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            themeColor.barLinearColor1,
            themeColor.barLinearColor2,
            themeColor.barLinearColor3,
          ],
          stops: [0.1, 0.47, 1.0],
          tileMode: TileMode.clamp,
        )
      : LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomLeft,
          colors: [
            themeColor.barLinearColor1,
            themeColor.barLinearColor2,
          ],
          stops: [0.1, 1.0],
          tileMode: TileMode.clamp,
        );

  static Gradient get menuBarGradient => (themeColor.isDarkTheme)
      ? LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            themeColor.barLinearColor1,
            themeColor.barLinearColor2,
            themeColor.barLinearColor3,
          ],
          stops: [0.1, 0.2, 1.0],
          tileMode: TileMode.clamp,
        )
      : LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomLeft,
          colors: [
            themeColor.barLinearColor1,
            themeColor.barLinearColor2,
          ],
          stops: [0.1, 1.0],
          tileMode: TileMode.clamp,
        );
}
