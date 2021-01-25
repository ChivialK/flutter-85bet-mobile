import 'package:flutter_85bet_mobile/core/internal/local_strings.dart';
import 'package:flutter_85bet_mobile/features/export_internal_file.dart';
import 'package:flutter_85bet_mobile/features/themes/theme_dark.dart';
import 'package:flutter_85bet_mobile/features/themes/theme_light.dart';
import 'package:vnum/vnum.dart';

import 'theme_color_interface.dart';

@VnumDefinition
class ThemeColorEnum extends Vnum<String> {
  static const ThemeColorEnum DEFAULT = const ThemeColorEnum.define('default');

  static const ThemeColorEnum LIGHT = const ThemeColorEnum.define('light');

  static const ThemeColorEnum DARK = const ThemeColorEnum.define('dark');

  /// Used for defining cases
  const ThemeColorEnum.define(String fromValue) : super.define(fromValue);

  /// Used for loading enum using value
  factory ThemeColorEnum(String value) => Vnum.fromValue(value, ThemeColorEnum);

  /// Iterating cases
  /// All value needs to be constant for this to work
  static List<Vnum> get listAll => Vnum.allCasesFor(ThemeColorEnum);

  /// Get Enum by value
  static ThemeColorEnum getByValue(String value) =>
      ThemeColorEnum.listAll.singleWhere(
        (color) => color.value == value,
        orElse: () => ThemeColorEnum.DEFAULT,
      );

  /// Set app theme default value
  static ThemeColorEnum get getSelectorDefault => ThemeColorEnum.LIGHT;

  String get label {
    switch (value) {
      case 'dark':
        return localeStr.themeColorDark;
      case 'light':
        return localeStr.themeColorLight;
      default:
        return getSelectorDefault.label;
    }
  }

  ThemeColorInterface get interface {
    switch (value) {
      case 'dark':
        return ThemeDark();
      case 'light':
        return ThemeLight();
      default:
        return getSelectorDefault.interface;
    }
  }
}
