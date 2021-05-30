import 'package:freezed_annotation/freezed_annotation.dart';

part 'roller_requirement_target.freezed.dart';

@freezed
abstract class RollerRequirementTarget with _$RollerRequirementTarget {
  const factory RollerRequirementTarget({
    int id,
    String name,
    String type,
    int require,
    int count,
    String time,
    String status,
    @JsonKey(name: 'updated_at') String date,
    @JsonKey(name: 'vaild') bool valid,
    int sort,
  }) = _RollerRequirementTarget;

  static RollerRequirementTarget jsonToRequirementTarget(
          Map<String, dynamic> jsonMap) =>
      _$_RollerRequirementTarget(
        id: jsonMap['id'] as int,
        name: jsonMap['name'] as String,
        type: jsonMap['type'] as String,
        require: jsonMap['require'] as int,
        count: jsonMap['count'] as int,
        time: jsonMap['time'] as String,
        status: jsonMap['status'] as String,
        date: jsonMap['updated_at'] as String,
        valid: jsonMap['vaild'] as bool,
        sort: jsonMap['sort'] as int,
      );
}
