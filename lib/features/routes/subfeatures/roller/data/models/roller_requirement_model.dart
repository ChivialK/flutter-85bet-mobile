import 'package:flutter_85bet_mobile/core/mobx_store_export.dart';
import 'package:flutter_85bet_mobile/utils/json_util.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'roller_requirement_current.dart';
import 'roller_requirement_target.dart';
import 'roller_requirement_type.dart';

part 'roller_requirement_model.freezed.dart';

@freezed
abstract class RollerRequirementModel with _$RollerRequirementModel {
  const factory RollerRequirementModel({
    @JsonKey(name: 'type', fromJson: decodeRollerRequirementType)
        List<RollerRequirementType> types,
    @JsonKey(name: 'target', fromJson: decodeRollerRequirementTarget)
        Map<String, List<RollerRequirementTarget>> targets,
    @JsonKey(name: 'current', fromJson: decodeRollerRequirementCurrent)
        List<RollerRequirementCurrent> current,
    @nullable @Default(true) bool hasData,
  }) = _RollerRequirementModel;

  static RollerRequirementModel jsonToRequirementModel(
          Map<String, dynamic> jsonMap) =>
      _$_RollerRequirementModel(
        types: decodeRollerRequirementType(jsonMap['type']),
        targets: decodeRollerRequirementTarget(jsonMap['target']),
        current: decodeRollerRequirementCurrent(jsonMap['current']),
      );
}

List<RollerRequirementType> decodeRollerRequirementType(dynamic str) {
  try {
    return JsonUtil.decodeMapToModelList(
      str,
      (jsonMap) => RollerRequirementType.jsonToRequirementType(jsonMap),
      addKey: false,
      tag: 'RollerRequirementModel',
    );
  } catch (e) {
    MyLogger.error(msg: 'decode roller requirement type has exception: $e');
    return [];
  }
}

List<RollerRequirementCurrent> decodeRollerRequirementCurrent(dynamic str) {
  try {
    return JsonUtil.decodeMapToModelList(
      str,
      (jsonMap) => RollerRequirementCurrent.jsonToRequirementCurrent(jsonMap),
      tag: 'RollerRequirementModel',
    );
  } catch (e) {
    MyLogger.error(msg: 'decode roller requirement current has exception: $e');
    return [];
  }
}

Map<String, List<RollerRequirementTarget>> decodeRollerRequirementTarget(
    dynamic str) {
  if (str is Map == false) return Map();
  Map<String, dynamic> map = str;
  try {
    return map.map((key, value) => MapEntry(
        key,
        JsonUtil.decodeMapToModelList(
          value,
          (jsonMap) => RollerRequirementTarget.jsonToRequirementTarget(jsonMap),
          addKey: false,
        )));
  } catch (e) {
    debugPrint('decode roller requirement target has exception: $e');
    return Map();
  }
}
