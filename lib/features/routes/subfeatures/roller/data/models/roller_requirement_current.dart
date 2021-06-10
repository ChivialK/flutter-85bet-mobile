import 'package:flutter/foundation.dart' show debugPrint;
import 'package:freezed_annotation/freezed_annotation.dart';

part 'roller_requirement_current.freezed.dart';

@freezed
abstract class RollerRequirementCurrent with _$RollerRequirementCurrent {
  const factory RollerRequirementCurrent({
    int day,
    int week,
    int month,
    dynamic key,
  }) = _RollerRequirementCurrent;

  static RollerRequirementCurrent jsonToRequirementCurrent(
          Map<String, dynamic> jsonMap) =>
      _$_RollerRequirementCurrent(
        day: jsonMap['day'] as int,
        week: jsonMap['week'] as int,
        month: jsonMap['month'] as int,
      );
}

extension RollerRequirementCurrentExtension on RollerRequirementCurrent {
  int getValue(String type) {
    debugPrint('asking type: $type');
    switch (type) {
      case 'day':
        return day;
      case 'week':
        return week;
      case 'month':
        return month;
      default:
        return -1;
    }
  }
}
