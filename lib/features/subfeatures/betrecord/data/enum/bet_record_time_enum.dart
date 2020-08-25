import 'package:flutter_85bet_mobile/core/internal/local_strings.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vnum/vnum.dart';

part 'bet_record_time_enum.freezed.dart';

@freezed
abstract class BetRecordTime with _$BetRecordTime {
  const factory BetRecordTime({
    int index,
    String label,
  }) = _BetRecordTime;
}

@VnumDefinition
class BetRecordTimeEnum extends Vnum<BetRecordTime> {
  /// Case Definition
  static BetRecordTimeEnum today = BetRecordTimeEnum.define(
      BetRecordTime(index: 0, label: localeStr.spinnerDateToday));
  static BetRecordTimeEnum yesterday = BetRecordTimeEnum.define(
      BetRecordTime(index: 1, label: localeStr.spinnerDateYesterday));
  static BetRecordTimeEnum month = BetRecordTimeEnum.define(
      BetRecordTime(index: 2, label: localeStr.spinnerDateMonth));
  static BetRecordTimeEnum all = BetRecordTimeEnum.define(
      BetRecordTime(index: 3, label: localeStr.spinnerDateAll));
  static BetRecordTimeEnum custom = BetRecordTimeEnum.define(
      BetRecordTime(index: 4, label: localeStr.spinnerDateCustom));

  /// Used for defining cases
  const BetRecordTimeEnum.define(BetRecordTime fromValue)
      : super.define(fromValue);

  /// Used for loading enum using value
  factory BetRecordTimeEnum(BetRecordTime value) =>
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
