import 'package:email_validator/email_validator.dart';
import 'package:flutter_85bet_mobile/core/internal/global.dart';

const String _loginAPI = 'api/login';
const String _gameAutoAPI = 'api/openUrl';
const String _gameAPI = 'api/open';

///
/// Special Url Regex
///
const String _serviceRegexString =
    (Global.HAS_FLEX_ROUTE) ? _tyRegString : Global.CURRENT_BASE;

const String _tyRegString = 'https://www.vip66[6-7][0-9][0-9].com';

final RegExp _routeTestRegex = RegExp("^(?:$_tyRegString/?)");

final RegExp _routeRegex = RegExp("^(?:$_serviceRegexString/?)");

final RegExp _gameAutoRegex =
    RegExp("^(?:$_serviceRegexString$_gameAutoAPI/.*)");

final RegExp _gameRegex = RegExp("^(?:$_serviceRegexString$_gameAPI/.*)");

final RegExp _loginRegex = RegExp("^(?:$_serviceRegexString$_loginAPI)");

final RegExp _ptLoginRegex = RegExp("^(?:https://login.greenjade88.com/.*\$)");

///
/// Normal Regex
///
final RegExp _imageRegex =
    RegExp("^(?:${_serviceRegexString}images/.*(jpg|png))");

final RegExp _webResRegex = RegExp("^(?=.*(js|lib|gif|png|html)).*\$");

final RegExp _htmlRegex = RegExp('<\s*html.*?>.*?<\s*/\s*html.*?>');

final RegExp _urlRegex = RegExp(
    r'^((?:.|\n)*?)((http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:‌​,.;]*)?)',
    caseSensitive: false);

final RegExp _dateRegex =
    RegExp('((19|20)[0-9][0-9])-(0[1-9]|1[0-2])-(0[1-9]|1[0-9]|2[0-9]|3[0-1])');

final RegExp _dateRegexFull = RegExp(
    '^([0-9]{4}[-/]?((0[13-9]|1[012])[-/]?(0[1-9]|[12][0-9]|30)|(0[13578]|1[02])[-/]?31|02[-/]?(0[1-9]|1[0-9]|2[0-8]))|([0-9]{2}(([2468][048]|[02468][48])|[13579][26])|([13579][26]|[02468][048])00)[-/]?02[-/]?29)\$');

final _chineseRegex = RegExp(
    "[\u4e00-\u9fa5]|[\u3105-\u3129]|[\u02CA]|[\u02CB]|[\u02C7]|[\u02C9]");

final _chineseInvalidRegex =
    RegExp("[\u3105-\u3129]|[\u02CA]|[\u02CB]|[\u02C7]|[\u02C9]");

final _chinaPhoneRegex = RegExp(
    r'^((13[0-9])|(14[0-9])|(15[0-9])|(16[0-9])|(17[0-9])|(18[0-9])|(19[0-9]))\d{8}$');

final _digitRegex = RegExp(r'\d+');

extension RegexExtension on String {
  /// String Regex
  bool get isUrl => Uri.parse(this).hasAbsolutePath;

  bool get isEmail => EmailValidator.validate(this);

  bool get isDigits => _digitRegex.hasMatch(this);

  bool get isDate => _dateRegexFull.hasMatch(this);

  bool get isSimpleDate => _dateRegex.hasMatch(this);

  bool get isHtmlFormat =>
      _htmlRegex.hasMatch("""$this""".replaceAll('\n', ''));

  bool get isValidDate => _dateRegex.hasMatch(this);

  bool get isValidChinaPhone => _chinaPhoneRegex.hasMatch(this);

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
