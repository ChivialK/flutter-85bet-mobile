import 'language_code.dart';

class Language {
  /// APP Language
  bool init = false;

  bool locked = false;

  LanguageCode _locale = defaultLocale;

  set setLocale(String localeCode) =>
      _locale = LanguageCode.getByCode(localeCode);

  String get jsonKey => _locale.value.contentKey;

  String get code => _locale.value.code;

  String get webCode => _locale.value.webCode;

  String get webKey => 'lang';

  bool get isChinese => _locale == LanguageCode.zh;
}
