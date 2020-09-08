import 'package:flutter_85bet_mobile/core/internal/local_strings.dart';
import 'package:vnum/vnum.dart';

@VnumDefinition
class BetRecordTimeEnum extends Vnum<int> {
  /// Case Definition
  static const BetRecordTimeEnum today = const BetRecordTimeEnum.define(0);
  static const BetRecordTimeEnum yesterday = const BetRecordTimeEnum.define(1);
  static const BetRecordTimeEnum month = const BetRecordTimeEnum.define(2);
  static const BetRecordTimeEnum all = const BetRecordTimeEnum.define(3);
  static const BetRecordTimeEnum custom = const BetRecordTimeEnum.define(4);

  /// Used for defining cases
  const BetRecordTimeEnum.define(int fromValue) : super.define(fromValue);

  /// Used for loading enum using value
  factory BetRecordTimeEnum(int value) =>
      Vnum.fromValue(value, BetRecordTimeEnum);

  /// (optional) Extend your Vnums
  static List<BetRecordTimeEnum> list = [
    BetRecordTimeEnum.today,
    BetRecordTimeEnum.yesterday,
    BetRecordTimeEnum.month,
    BetRecordTimeEnum.all,
    BetRecordTimeEnum.custom,
  ];
}

extension BetRecordTimeEnumExtension on BetRecordTimeEnum {
  String get label {
    switch (value) {
      case 0:
        return localeStr.spinnerDateToday;
      case 1:
        return localeStr.spinnerDateYesterday;
      case 2:
        return localeStr.spinnerDateMonth;
      case 3:
        return localeStr.spinnerDateAll;
      case 4:
        return localeStr.spinnerDateCustom;
      default:
        return '??';
    }
  }
}
