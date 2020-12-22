import 'package:meta/meta.dart';
import 'package:vnum/vnum.dart';

final LanguageCode defaultLocale = LanguageCode.vn;

@VnumDefinition
class LanguageCode extends Vnum<LanguageData> {
  /// Case Definition
  static const LanguageCode zh = const LanguageCode.define(
      const LanguageData(code: 'zh', contentKey: 'content_cn'));
  static const LanguageCode en = const LanguageCode.define(
      const LanguageData(code: 'en', contentKey: 'content_us'));
  static const LanguageCode vn = const LanguageCode.define(
      const LanguageData(code: 'vi', contentKey: 'content_vn'));
  // static const LanguageCode th = const LanguageCode.define(
  //     const LanguageData(code: 'th', contentKey: 'content_th'));

  /// Used for defining cases
  const LanguageCode.define(LanguageData fromValue) : super.define(fromValue);

  /// Used for loading enum using value
  factory LanguageCode(LanguageData value) =>
      Vnum.fromValue(value, LanguageCode);

  /// Iterating cases
  static List<LanguageCode> get listAll =>
      Vnum.allCasesFor(LanguageCode).map((e) => e as LanguageCode).toList();

  static LanguageCode getByCode(String code) => listAll.singleWhere(
        (data) => data.value.code == code,
        orElse: () => defaultLocale,
      );
}

class LanguageData {
  final String code;
  final String contentKey;

  const LanguageData({
    @required this.code,
    @required this.contentKey,
  });
}
