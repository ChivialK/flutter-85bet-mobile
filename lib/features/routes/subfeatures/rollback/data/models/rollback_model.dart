import 'package:flutter_85bet_mobile/utils/value_util.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'rollback_model.freezed.dart';

@freezed
abstract class RollbackModel with _$RollbackModel {
  const factory RollbackModel({
    String code,
    @JsonKey(name: 'fundindex') String index,
    @JsonKey(name: 'amountlocal') String amount,
    @JsonKey(name: 'ledgerdatetime') String ledgerDatetime,
    @JsonKey(name: 'withdrawal_valid') String withdrawalValid,
    @JsonKey(name: 'promoindex') num promoIndex,
    @JsonKey(name: 'multiply') num multiply,
    @JsonKey(name: 'bind_ledgerindex') String ledgerIndex,
    @JsonKey(name: 'promosimplified') String promoSimplified,
    @JsonKey(name: 'betreslut') String betResult,
    @JsonKey(name: 'starttime') String startTime,
    @JsonKey(name: 'turnover') String turnOver,
    @JsonKey(name: 'endtime') String endTime,
    @JsonKey(name: 'rollover') String rollOver,
    dynamic key,
  }) = _RollbackModel;

  static RollbackModel jsonToRollbackModel(Map<String, dynamic> jsonMap) {
    return _$_RollbackModel(
      code: jsonMap['code'] as String,
      index: jsonMap['fundindex'] as String,
      amount: jsonMap['amountlocal'] as String,
      ledgerDatetime: jsonMap['ledgerdatetime'] as String,
      withdrawalValid: jsonMap['withdrawal_valid'] as String,
      promoIndex: (jsonMap['promoindex'] is num)
          ? jsonMap['promoindex'] as num
          : '${jsonMap['promoindex']}'.strToInt,
      multiply: (jsonMap['multiply'] is num)
          ? jsonMap['multiply'] as num
          : '${jsonMap['multiply']}'.strToInt,
      ledgerIndex: jsonMap['bind_ledgerindex'] as String,
      promoSimplified: jsonMap['promosimplified'] as String,
      betResult: '${jsonMap['betreslut']}',
      startTime: jsonMap['starttime'] as String,
      turnOver: '${jsonMap['turnover']}',
      endTime: jsonMap['endtime'] as String,
      rollOver: '${jsonMap['rollover']}',
      key: jsonMap['key'],
    );
  }
}
