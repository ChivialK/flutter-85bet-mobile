import 'package:flutter_85bet_mobile/core/internal/global.dart';
import 'package:flutter_85bet_mobile/utils/json_util.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'vip_level_model.freezed.dart';

@freezed
abstract class VipLevelModel with _$VipLevelModel {
  const factory VipLevelModel({
    @JsonKey(name: 'level', fromJson: decodeVipLevelName)
        List<VipLevelName> levels,
    @JsonKey(name: 'option', fromJson: decodeVipLevelOption)
        List<VipLevelOption> options,
    @JsonKey(name: 'vip') Map<String, dynamic> rules,
  }) = _VipLevelModel;

  static VipLevelModel jsonToVipLevelModel(Map<String, dynamic> jsonMap) =>
      _$_VipLevelModel(
        levels: decodeVipLevelName(jsonMap['level']),
        options: decodeVipLevelOption(jsonMap['option'])
          ..removeWhere((element) =>
              element.type == 'img' ||
              element.name == 'viplevel' ||
              element.name == 'incentive' ||
              element.name == 'allgamekeep'),
        rules: jsonMap['vip'],
      );
}

@freezed
abstract class VipLevelName with _$VipLevelName {
  const factory VipLevelName({
    String key,
    String title,
    String img,
  }) = _VipLevelName;

  static VipLevelName jsonToVipLevelName(Map<String, dynamic> jsonMap) =>
      _$_VipLevelName(
        title: jsonMap['title'] as String,
        img: jsonMap['img'] as String,
      );
}

List<VipLevelName> decodeVipLevelName(dynamic str) =>
    JsonUtil.decodeMapToModelList(
      str,
      (jsonMap) => VipLevelName.jsonToVipLevelName(jsonMap),
      tag: 'VipLevelName',
    );

@freezed
abstract class VipLevelOption with _$VipLevelOption {
  const factory VipLevelOption({
    String key,
    String name,
    String ch,
    String type,
  }) = _VipLevelOption;

  static VipLevelOption jsonToVipLevelOption(Map<String, dynamic> jsonMap) {
    String labelKey;
    if (jsonMap.containsKey('ch'))
      labelKey = 'ch';
    else
      labelKey = Global.jsonLabelKey;
    return _$_VipLevelOption(
      key: jsonMap['key'] as String,
      name: jsonMap['name'] as String,
      ch: (jsonMap.containsKey(labelKey)) ? jsonMap[labelKey] as String : '',
      type: jsonMap['type'] as String,
    );
  }
}

List<VipLevelOption> decodeVipLevelOption(dynamic str) =>
    JsonUtil.decodeMapToModelList(
      str,
      (jsonMap) => VipLevelOption.jsonToVipLevelOption(jsonMap),
      tag: 'VipLevelOption',
    );
