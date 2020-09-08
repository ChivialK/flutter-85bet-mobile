import 'package:freezed_annotation/freezed_annotation.dart';

part 'center_vip_setting_model.freezed.dart';
part 'center_vip_setting_model.g.dart';

@freezed
abstract class CenterVipSettingModel with _$CenterVipSettingModel {
  const factory CenterVipSettingModel.model({
    @JsonKey(name: 'setting', fromJson: CenterVipSettingModel.jsonToCenterVipSettingItem)
        CenterVipSettingItem item,
    String title,
  }) = CenterVipSetting;

  const factory CenterVipSettingModel.content({
    String allgame,
    String slotgame,
    String casinogame,
    String sportgame,
    String fishgame,
    String lotterygame,
    String cardgame,
  }) = CenterVipSettingItem;

  factory CenterVipSettingModel.fromJson(Map<String, dynamic> json) =>
      _$CenterVipSettingModelFromJson(json);

  static CenterVipSetting jsonToCenterVipSetting(Map<String, dynamic> jsonMap) {
    jsonMap['runtimeType'] = 'model';
    return _$CenterVipSettingModelFromJson(jsonMap);
  }

  static CenterVipSettingItem jsonToCenterVipSettingItem(
      Map<String, dynamic> jsonMap) {
    jsonMap['runtimeType'] = 'content';
    return _$CenterVipSettingModelFromJson(jsonMap);
  }
}
