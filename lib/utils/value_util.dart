import 'package:flutter_85bet_mobile/mylogger.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart' show required;

/// Check if the [value] is bigger than [min], and smaller than [max]
bool rangeCheck({@required num value, @required num min, num max = 0}) {
  if (max != 0)
    return value >= min && value <= max;
  else
    return value >= min;
}

final String creditSymbol = '￥ ';
final NumberFormat numFormat = new NumberFormat("###0.00", "en_US");
final NumberFormat creditFormat =
    new NumberFormat("$creditSymbol#,##0.00", "en_US");
final RegExp replaceRegex = RegExp('$creditSymbol|,');

String formatNum(
  num n, {
  bool addCreditSign = false,
  bool floorIfInt = false,
  bool floorIfZero = true,
}) {
  final s = (addCreditSign) ? creditFormat.format(n) : numFormat.format(n);
  // debugPrint(
  //     'formatting num: $s, floor Int: $floorIfInt, floor zero: $floorIfZero');
  if (!floorIfZero && s.strToDouble == 0)
    return s;
  else if (floorIfInt && (s.endsWith('.00') || s.endsWith('.0000')))
    return s.substring(0, s.indexOf('.'));
  else
    return s;
}

String formatAsCreditNum(
  num n, {
  bool floorIfInt = true,
  bool floorIfZero = true,
}) {
  final s = creditFormat.format(n);
  if (!floorIfZero && s.strToDouble == 0)
    return s.replaceAll(creditSymbol, '');
  else if (floorIfInt && s.endsWith('.00'))
    return s.substring(0, s.indexOf('.')).replaceAll(creditSymbol, '');
  else
    return s.replaceAll(creditSymbol, '');
}

String intToStr(int value, {bool creditSign = false}) =>
    formatValue(value, creditSign: creditSign);

String doubleToStr(double value,
        {bool floor = false,
        bool floorIfInt = false,
        bool creditSign = false}) =>
    formatValue(value,
        floor: floor, floorIfInt: floorIfInt, creditSign: creditSign);

int stringToInt(String str, {bool printErrorStack = true}) {
  try {
    if (str == null || str.isEmpty) return -1;
    if (str.contains('.'))
      return double.parse(str.replaceAll(replaceRegex, '').trim()).floor();
    else
      return int.parse(str.replaceAll(replaceRegex, '').trim());
  } catch (e, s) {
    MyLogger.warn(
        msg: (printErrorStack)
            ? 'parse value has exception, str: $str\nstack:\n$s'
            : 'parse value has exception, str: $str',
        tag: 'strToInt');
    return -1;
  }
}

double stringToDouble(String str) {
  try {
    if (str == null || str.isEmpty) return double.parse('-1');
    return double.parse(str.replaceAll(replaceRegex, '').trim());
  } catch (e) {
    MyLogger.warn(msg: 'parse value has exception', tag: 'strToDouble');
    return double.parse('-1');
  }
}

bool valueIsEqual(String first, String second) {
  return stringToDouble(first).compareTo(stringToDouble(second)) == 0;
}

/// [floorValue] floor value to int
/// [floorIfInt] floor value to int if value is not double
/// [floorIfZero] floor value to int if value is 0
/// [creditSign] add a credit sign as string prefix
String formatValue(
  dynamic value, {
  bool floor = false,
  bool floorIfInt = false,
  bool floorIfZero = true,
  bool creditSign = false,
}) {
  num formatted = (value is int || value is double)
      ? value
      : double.parse(value.replaceAll(replaceRegex, '').trim());
  try {
    var result = formatNum(
      formatted,
      addCreditSign: creditSign,
      floorIfInt: floorIfInt || floor,
      floorIfZero: floorIfZero,
    );
    // debugPrint('format value result: $result');
    return (floor && result.contains('.'))
        ? '${result.substring(0, result.indexOf('.'))}'.trim()
        : result.trim();
  } catch (e) {
    MyLogger.warn(msg: 'trim value has exception', error: e, tag: 'trimValue');
    return '$formatted';
  }
}

extension ValueUtilExtension on String {
  int get strToInt =>
      (this != null) ? stringToInt(this, printErrorStack: false) : -1;

  int get strToIntDebug => stringToInt(this);

  double get strToDouble => stringToDouble(this);

  String get basicFormat => formatValue(this);
}
