import 'package:flutter_85bet_mobile/mylogger.dart';
import 'package:flutter_85bet_mobile/utils/json_util.dart';
import 'package:flutter_85bet_mobile/utils/value_util.dart'
    show ValueUtilExtension;
import 'package:freezed_annotation/freezed_annotation.dart';

import '../entity/center_account_entity.dart';
import '../entity/center_vip_entity.dart';

part 'center_model.freezed.dart';

@freezed
abstract class CenterModel with _$CenterModel {
  const factory CenterModel({
    @JsonKey(name: 'accountcode', defaultValue: '') String accountCode,
    @JsonKey(name: 'accountid', defaultValue: -1) int accountId,
    @JsonKey(name: 'dob', defaultValue: '') String birthDate,
    @JsonKey(name: 'mobileno', defaultValue: '') String phone,
    @Default('') String gender,
    @Default('') String email,
    @Default('') String wechat,
    @JsonKey(name: 'firstname', defaultValue: '') String firstName,
    @JsonKey(name: 'auto_transfer', defaultValue: '-1') String autoTransfer,
    @JsonKey(name: 'cGP_wallet', defaultValue: '') String cgpWallet,
    @JsonKey(name: 'cPW_wallet', defaultValue: '') String cpwWallet,
    @JsonKey(name: 'address', fromJson: _jsonList) List lotto,
    @JsonKey(name: 'allgame') num allGame,
    @JsonKey(name: 'allgame_level') int allGameLevel,
    @JsonKey(name: 'allgame_value') int allGameValue,
    @JsonKey(name: 'cardgame') num cardGame,
    @JsonKey(name: 'cardgame_level') int cardGameLevel,
    @JsonKey(name: 'cardgame_value') int cardGameValue,
    @JsonKey(name: 'casinogame') num casinoGame,
    @JsonKey(name: 'casinogame_level') int casinoGameLevel,
    @JsonKey(name: 'casinogame_value') int casinoGameValue,
    @JsonKey(name: 'fishgame') num fishGame,
    @JsonKey(name: 'fishgame_level') int fishGameLevel,
    @JsonKey(name: 'fishgame_value') int fishGameValue,
    @JsonKey(name: 'lotterygame') num lotteryGame,
    @JsonKey(name: 'lotterygame_level') int lotteryGameLevel,
    @JsonKey(name: 'lotterygame_value') int lotteryGameValue,
    @JsonKey(name: 'slotgame') num slotGame,
    @JsonKey(name: 'slotgame_level') int slotGameLevel,
    @JsonKey(name: 'slotgame_value') int slotGameValue,
    @JsonKey(name: 'sportgame') num sportGame,
    @JsonKey(name: 'sportgame_level') int sportGameLevel,
    @JsonKey(name: 'sportgame_value') int sportGameValue,
    @JsonKey(name: 'vip_option') dynamic vipOption,
    @JsonKey(name: 'vip_setting') dynamic vipSetting,
  }) = _CenterModel;

  static CenterModel jsonToCenterModel(Map<String, dynamic> jsonMap) =>
      _$_CenterModel(
        accountCode: jsonMap['accountcode'] as String ?? '',
        accountId: jsonMap['accountid'] as int ?? -1,
        birthDate: jsonMap['dob'] as String ?? '',
        phone: jsonMap['mobileno'] as String ?? '',
        gender: jsonMap['gender'] as String ?? '',
        email: jsonMap['email'] as String ?? '',
        wechat: jsonMap['wechat'] as String ?? '',
        firstName: jsonMap['firstname'] as String ?? '',
        autoTransfer: jsonMap['auto_transfer'] as String ?? '-1',
        cgpWallet: jsonMap['cGP_wallet'] as String ?? '',
        cpwWallet: jsonMap['cPW_wallet'] as String ?? '',
        lotto: _jsonList(jsonMap['address']),
        allGame: jsonMap['allgame'] as num,
        allGameLevel: _jsonToInt(jsonMap['allgame_level']),
        allGameValue: _jsonToInt(jsonMap['allgame_value']),
        cardGame: jsonMap['cardgame'] as num,
        cardGameLevel: _jsonToInt(jsonMap['cardgame_level']),
        cardGameValue: _jsonToInt(jsonMap['cardgame_value']),
        casinoGame: jsonMap['casinogame'] as num,
        casinoGameLevel: _jsonToInt(jsonMap['casinogame_level']),
        casinoGameValue: _jsonToInt(jsonMap['casinogame_value']),
        fishGame: jsonMap['fishgame'] as num,
        fishGameLevel: _jsonToInt(jsonMap['fishgame_level']),
        fishGameValue: _jsonToInt(jsonMap['fishgame_value']),
        lotteryGame: jsonMap['lotterygame'] as num,
        lotteryGameLevel: _jsonToInt(jsonMap['lotterygame_level']),
        lotteryGameValue: _jsonToInt(jsonMap['lotterygame_value']),
        slotGame: jsonMap['slotgame'] as num,
        slotGameLevel: _jsonToInt(jsonMap['slotgame_level']),
        slotGameValue: _jsonToInt(jsonMap['slotgame_value']),
        sportGame: jsonMap['sportgame'] as num,
        sportGameLevel: _jsonToInt(jsonMap['sportgame_level']),
        sportGameValue: _jsonToInt(jsonMap['sportgame_value']),
        vipOption: jsonMap['vip_option'] as dynamic,
        vipSetting: jsonMap['vip_setting'] as dynamic,
      );
}

extension CenterModelExtension on CenterModel {
  List<int> get getLottoList {
    try {
      return List.castFrom<dynamic, int>(this.lotto);
    } catch (e) {
      print(e);
      return lotto.map((e) => e.toString().strToInt).toList();
    }
  }

  CenterAccountEntity get wrapAccountData {
    try {
      return CenterAccountEntity(
        accountCode: accountCode,
        accountId: accountId,
        birthDate: birthDate,
        phone: phone,
        gender: gender,
        email: email,
        wechat: wechat,
        firstName: firstName,
        autoTransfer: autoTransfer,
        cgpWallet: cgpWallet,
        cpwWallet: cpwWallet,
      );
    } on Exception catch (e) {
      MyLogger.debug(msg: 'center account data error: $e');
      return null;
    }
  }

  CenterVipEntity get wrapVipData {
    try {
      return CenterVipEntity(
        vipOption: vipOption,
        vipSetting: vipSetting,
        allGame: allGame,
        allGameLevel: allGameLevel,
        allGameValue: allGameValue,
        cardGame: cardGame,
        cardGameLevel: cardGameLevel,
        cardGameValue: cardGameValue,
        casinoGame: casinoGame,
        casinoGameLevel: casinoGameLevel,
        casinoGameValue: casinoGameValue,
        fishGame: fishGame,
        fishGameLevel: fishGameLevel,
        fishGameValue: fishGameValue,
        lotteryGame: lotteryGame,
        lotteryGameLevel: lotteryGameLevel,
        lotteryGameValue: lotteryGameValue,
        slotGame: slotGame,
        slotGameLevel: slotGameLevel,
        slotGameValue: slotGameValue,
        sportGame: sportGame,
        sportGameLevel: sportGameLevel,
        sportGameValue: sportGameValue,
      );
    } on Exception catch (e) {
      print('center vip data error: $e');
      return null;
    }
  }
}

List _jsonList(dynamic jsonStr) =>
    JsonUtil.decodeArray(jsonStr, returnNullOnError: true);

int _jsonToInt(dynamic jsonStr) {
  if (jsonStr == null)
    return -1;
  else if (jsonStr is String)
    return jsonStr.strToInt;
  else if (jsonStr is num)
    return '$jsonStr'.strToInt;
  else
    return -1;
}
