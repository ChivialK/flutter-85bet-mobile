import 'package:flutter/foundation.dart' show debugPrint;
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
    @JsonKey(name: 'phone_verification', defaultValue: '0') String verified,
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
    @JsonKey(name: 'allgame_value') num allGameValue,
    @JsonKey(name: 'cardgame') num cardGame,
    @JsonKey(name: 'cardgame_level') int cardGameLevel,
    @JsonKey(name: 'cardgame_value') num cardGameValue,
    @JsonKey(name: 'casinogame') num casinoGame,
    @JsonKey(name: 'casinogame_level') int casinoGameLevel,
    @JsonKey(name: 'casinogame_value') num casinoGameValue,
    @JsonKey(name: 'fishgame') num fishGame,
    @JsonKey(name: 'fishgame_level') int fishGameLevel,
    @JsonKey(name: 'fishgame_value') num fishGameValue,
    @JsonKey(name: 'lotterygame') num lotteryGame,
    @JsonKey(name: 'lotterygame_level') int lotteryGameLevel,
    @JsonKey(name: 'lotterygame_value') num lotteryGameValue,
    @JsonKey(name: 'slotgame') num slotGame,
    @JsonKey(name: 'slotgame_level') int slotGameLevel,
    @JsonKey(name: 'slotgame_value') num slotGameValue,
    @JsonKey(name: 'sportgame') num sportGame,
    @JsonKey(name: 'sportgame_level') int sportGameLevel,
    @JsonKey(name: 'sportgame_value') num sportGameValue,
    @JsonKey(name: 'vip_option') dynamic vipOption,
    @JsonKey(name: 'vip_setting') dynamic vipSetting,
  }) = _CenterModel;

  static CenterModel jsonToCenterModel(Map<String, dynamic> jsonMap) =>
      _$_CenterModel(
        accountCode: jsonMap['accountcode'] as String ?? '',
        accountId: jsonMap['accountid'] as int ?? -1,
        birthDate: jsonMap['dob'] as String ?? '',
        phone: jsonMap['mobileno'] as String ?? '',
        verified: jsonMap['phone_verification'] as String ?? '0',
        gender: jsonMap['gender'] as String ?? '',
        email: jsonMap['email'] as String ?? '',
        wechat: jsonMap['wechat'] as String ?? '',
        firstName: jsonMap['firstname'] as String ?? '',
        autoTransfer: jsonMap['auto_transfer'] as String ?? '-1',
        cgpWallet: jsonMap['cGP_wallet'] as String ?? '',
        cpwWallet: jsonMap['cPW_wallet'] as String ?? '',
        lotto: _jsonList(jsonMap['address']),
        allGame: jsonMap['allgame'] as num,
        allGameLevel: '${jsonMap['allgame_level']}'.strToInt,
        allGameValue: jsonMap['allgame_value'] as num,
        cardGame: jsonMap['cardgame'] as num,
        cardGameLevel: '${jsonMap['cardgame_level']}'.strToInt,
        cardGameValue: jsonMap['cardgame_value'] as num,
        casinoGame: jsonMap['casinogame'] as num,
        casinoGameLevel: '${jsonMap['casinogame_level']}'.strToInt,
        casinoGameValue: jsonMap['casinogame_value'] as num,
        fishGame: jsonMap['fishgame'] as num,
        fishGameLevel: '${jsonMap['fishgame_level']}'.strToInt,
        fishGameValue: jsonMap['fishgame_value'] as num,
        lotteryGame: jsonMap['lotterygame'] as num,
        lotteryGameLevel: '${jsonMap['lotterygame_level']}'.strToInt,
        lotteryGameValue: jsonMap['lotterygame_value'] as num,
        slotGame: jsonMap['slotgame'] as num,
        slotGameLevel: '${jsonMap['slotgame_level']}'.strToInt,
        slotGameValue: jsonMap['slotgame_value'] as num,
        sportGame: jsonMap['sportgame'] as num,
        sportGameLevel: '${jsonMap['sportgame_level']}'.strToInt,
        sportGameValue: jsonMap['sportgame_value'] as num,
        vipOption: jsonMap['vip_option'],
        vipSetting: jsonMap['vip_setting'],
      );
}

extension CenterModelExtension on CenterModel {
  List<num> get getLottoList {
    try {
      return List.castFrom<dynamic, num>(this.lotto);
    } catch (e) {
      debugPrint(e);
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
        verified: verified,
        gender: gender,
        email: email,
        wechat: wechat,
        firstName: firstName,
        autoTransfer: autoTransfer,
        cgpWallet: cgpWallet,
        cpwWallet: cpwWallet,
      );
    } on Exception catch (e) {
      debugPrint('center account data error: $e');
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
      debugPrint('center vip data error: $e');
      return null;
    }
  }
}

List _jsonList(dynamic jsonStr) =>
    JsonUtil.decodeArray(jsonStr, returnNullOnError: true);
