import 'package:vnum/vnum.dart';

@VnumDefinition
class FontSize extends Vnum<double> {
  static const minus = 2;

  /// font size = 12
  static const FontSize SMALL = const FontSize.define(12.0);

  /// font size = 13
  static const FontSize SMALLER = const FontSize.define(13.0);

  /// font size = 14
  static const FontSize NORMAL = const FontSize.define(14.0);

  /// font size = 16
  static const FontSize SUBTITLE = const FontSize.define(16.0);

  /// font size = 18
  static const FontSize MESSAGE = const FontSize.define(18.0);

  /// font size = 20
  static const FontSize TITLE = const FontSize.define(20.0);

  /// font size = 24
  static const FontSize HEADER = const FontSize.define(24.0);

  /// font size = 28
  static const FontSize LARGE = const FontSize.define(28.0);

  /// font size = 32
  static const FontSize XLARGE = const FontSize.define(32.0);

  /// Used for defining cases
  const FontSize.define(double fromValue) : super.define(fromValue - minus);

  @override
  String toString() {
    return 'FontSize ${this.value}';
  }
}
