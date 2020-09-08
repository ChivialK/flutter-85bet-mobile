import 'package:flutter_85bet_mobile/core/base/data_operator.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/center_vip_setting_model.dart';

part 'center_vip_entity.freezed.dart';

@freezed
abstract class CenterVipEntity with _$CenterVipEntity implements DataOperator {
  const factory CenterVipEntity({
    dynamic vipOption,
    dynamic vipSetting,
    int allGame,
    int allGameLevel,
    int allGameValue,
    int cardGame,
    int cardGameLevel,
    int cardGameValue,
    int casinoGame,
    int casinoGameLevel,
    int casinoGameValue,
    int fishGame,
    int fishGameLevel,
    int fishGameValue,
    int lotteryGame,
    int lotteryGameLevel,
    int lotteryGameValue,
    int slotGame,
    int slotGameLevel,
    int slotGameValue,
    int sportGame,
    int sportGameLevel,
    int sportGameValue,
  }) = _CenterVipEntity;
}

//@override
//String operator [](String key) {
//switch (key.toLowerCase()) {
//case 'allgame':
//return '$allGameValue';
//case 'slotgame':
//return '$slotGameValue';
//case 'casinogame':
//return '$casinoGameValue';
//case 'sportgame':
//return '$sportGameValue';
//case 'fishgame':
//return '$fishGameValue';
//case 'lotterygame':
//return '$lotteryGameValue';
//case 'cardgame':
//return '$cardGameValue';
//default:
//return '-1';
//}
//}

extension CenterVipEntityExtension on CenterVipEntity {
  List<String> get getBlockKeys =>
      new List.from(vipOption.keys.map((value) => '$value'));

  List<String> get getBlockTitles =>
      new List.from(vipOption.values.map((value) => '$value'));

  List<String> get getLevelLabels =>
      new List.from(vipSetting.values.map((value) => '${value['title']}'));

  Map<String, CenterVipSettingItem> get getLevelRequirements =>
      Map<String, CenterVipSettingItem>.from(vipSetting.map((key, value) {
        return MapEntry(key.toString(),
            CenterVipSettingModel.jsonToCenterVipSettingItem(value['setting']));
      }));
}
