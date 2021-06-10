import 'package:freezed_annotation/freezed_annotation.dart';

part 'roller_requirement_type.freezed.dart';

@freezed
abstract class RollerRequirementType with _$RollerRequirementType {
  const factory RollerRequirementType({
    int id,
    String name,
    String ch,
    String status,
    @JsonKey(name: 'updated_at') String date,
  }) = _RollerRequirementType;

  static RollerRequirementType jsonToRequirementType(
          Map<String, dynamic> jsonMap) =>
      _$_RollerRequirementType(
        id: jsonMap['id'] as int,
        name: jsonMap['name'] as String,
        ch: jsonMap['ch'] as String,
        status: jsonMap['status'] as String,
        date: jsonMap['updated_at'] as String,
      );
}
