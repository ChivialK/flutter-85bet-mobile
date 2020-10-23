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
    @Default('') String gender,
    @Default('') String email,
    @Default('') String wechat,
    @JsonKey(name: 'firstname', defaultValue: '') String firstName,
    @JsonKey(name: 'auto_transfer', defaultValue: '-1') String autoTransfer,
    @JsonKey(name: 'cGP_wallet', defaultValue: '') String cgpWallet,
    @JsonKey(name: 'cPW_wallet', defaultValue: '') String cpwWallet,
    @JsonKey(name: 'address', fromJson: _jsonList) List lotto,
    @JsonKey(name: 'allgame') int allGame,
    @JsonKey(name: 'allgame_level') int allGameLevel,
    @JsonKey(name: 'allgame_value') int allGameValue,
    @JsonKey(name: 'cardgame') int cardGame,
    @JsonKey(name: 'cardgame_level') int cardGameLevel,
    @JsonKey(name: 'cardgame_value') int cardGameValue,
    @JsonKey(name: 'casinogame') int casinoGame,
    @JsonKey(name: 'casinogame_level') int casinoGameLevel,
    @JsonKey(name: 'casinogame_value') int casinoGameValue,
    @JsonKey(name: 'fishgame') int fishGame,
    @JsonKey(name: 'fishgame_level') int fishGameLevel,
    @JsonKey(name: 'fishgame_value') int fishGameValue,
    @JsonKey(name: 'lotterygame') int lotteryGame,
    @JsonKey(name: 'lotterygame_level') int lotteryGameLevel,
    @JsonKey(name: 'lotterygame_value') int lotteryGameValue,
    @JsonKey(name: 'slotgame') int slotGame,
    @JsonKey(name: 'slotgame_level') int slotGameLevel,
    @JsonKey(name: 'slotgame_value') int slotGameValue,
    @JsonKey(name: 'sportgame') int sportGame,
    @JsonKey(name: 'sportgame_level') int sportGameLevel,
    @JsonKey(name: 'sportgame_value') int sportGameValue,
    @JsonKey(name: 'vip_option') var vipOption,
    @JsonKey(name: 'vip_setting') var vipSetting,
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
        allGame: jsonMap['allgame'] as int,
        allGameLevel: jsonMap['allgame_level'] as int,
        allGameValue: jsonMap['allgame_value'] as int,
        cardGame: jsonMap['cardgame'] as int,
        cardGameLevel: jsonMap['cardgame_level'] as int,
        cardGameValue: jsonMap['cardgame_value'] as int,
        casinoGame: jsonMap['casinogame'] as int,
        casinoGameLevel: jsonMap['casinogame_level'] as int,
        casinoGameValue: jsonMap['casinogame_value'] as int,
        fishGame: jsonMap['fishgame'] as int,
        fishGameLevel: jsonMap['fishgame_level'] as int,
        fishGameValue: jsonMap['fishgame_value'] as int,
        lotteryGame: jsonMap['lotterygame'] as int,
        lotteryGameLevel: jsonMap['lotterygame_level'] as int,
        lotteryGameValue: jsonMap['lotterygame_value'] as int,
        slotGame: jsonMap['slotgame'] as int,
        slotGameLevel: jsonMap['slotgame_level'] as int,
        slotGameValue: jsonMap['slotgame_value'] as int,
        sportGame: jsonMap['sportgame'] as int,
        sportGameLevel: jsonMap['sportgame_level'] as int,
        sportGameValue: jsonMap['sportgame_value'] as int,
        vipOption: jsonMap['vip_option'],
        vipSetting: jsonMap['vip_setting'],
      );
}

extension CenterModelExtension on CenterModel {
  List<int> get getLottoList {
    try {
      return List.castFrom<dynamic, int>(this.lotto);
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
        gender: gender,
        email: email,
        wechat: wechat,
        firstName: firstName,
        autoTransfer: autoTransfer,
        cgpWallet: cgpWallet,
        cpwWallet: cpwWallet,
      );
    } on Exception catch (e) {
      print('center account data error: $e');
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
