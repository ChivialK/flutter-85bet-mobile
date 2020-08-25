import 'package:email_validator/email_validator.dart';
import 'package:flutter_85bet_mobile/core/internal/global.dart';

const String _loginAPI = 'api/login';
const String _gameAutoAPI = 'api/openUrl';
const String _gameAPI = 'api/open';

const String _serviceRegexString =
    (Global.IS_TEST_VER) ? Global.CURRENT_BASE : _tyRegString;
const String _tyRegString = 'https://www.vip66[6-7][0-9][0-9].com';

final RegExp _routeRegex = RegExp("^(?:$_serviceRegexString/?)");
final RegExp _gameAutoRegex =
    RegExp("^(?:$_serviceRegexString$_gameAutoAPI/.*)");
final RegExp _gameRegex = RegExp("^(?:$_serviceRegexString$_gameAPI/.*)");
final RegExp _imageRegex =
    RegExp("^(?:${_serviceRegexString}images/.*(jpg|png))");
final RegExp _loginRegex = RegExp("^(?:$_serviceRegexString$_loginAPI)");
final RegExp _ptLoginRegex = RegExp("^(?:https://login.greenjade88.com/.*\$)");
final RegExp _webResRegex = RegExp("^(?=.*(js|lib|gif|png|html)).*\$");
final RegExp _routeTestRegex = RegExp("^(?:$_tyRegString/?)");

final RegExp _htmlRegex = RegExp('<\s*html.*?>.*?<\s*/\s*html.*?>');

final RegExp _urlRegex = RegExp(
    r'^((?:.|\n)*?)((http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:‌​,.;]*)?)',
    caseSensitive: false);

final RegExp _dateRegex =
    RegExp('((19|20)[0-9][0-9])-(0[1-9]|1[0-2])-(0[1-9]|1[0-9]|2[0-9]|3[0-1])');

final _chineseRegex = RegExp(
    "[\u4e00-\u9fa5]|[\u3105-\u3129]|[\u02CA]|[\u02CB]|[\u02C7]|[\u02C9]");

final _chineseInvalidRegex =
    RegExp("[\u3105-\u3129]|[\u02CA]|[\u02CB]|[\u02C7]|[\u02C9]");

extension RegexExtension on String {
  /// String Regex
  bool get isUrl => Uri.parse(this).isAbsolute || _urlRegex.hasMatch(this);
  bool get isEmail => EmailValidator.validate(this);
  bool get isHtmlFormat =>
      _htmlRegex.hasMatch("""$this""".replaceAll('\n', ''));
  bool get isValidDate => _dateRegex.hasMatch(this);
  bool get hasChinese => _chineseRegex.hasMatch(this);
  bool get hasInvalidChinese => _chineseInvalidRegex.hasMatch(this);

  /// URL's Regex
  bool get testTyRouteUrl => _routeTestRegex.hasMatch(this);
  bool get isRouteUrl => _routeRegex.hasMatch(this);
  bool get isLoginUrl => _loginRegex.hasMatch(this);
  bool get isGameAutoUrl => _gameAutoRegex.hasMatch(this);
  bool get isGameUrl => _gameRegex.hasMatch(this);
  bool get isImageUrl => _imageRegex.hasMatch(this);
  bool get isPtLoginUrl => _ptLoginRegex.hasMatch(this);
  bool get isWebResource => _webResRegex.hasMatch(this);

  int get countLength {
    int ch = 0;
    int en = 0;
    for (int code in codeUnits) {
      if (_chineseRegex.hasMatch(String.fromCharCode(code)))
        ch += 1;
      else
        en += 1;
    }
//    debugPrint('$this -> ch=$ch, en=$en');
    return ch + (en / 2).ceil();
  }
}
