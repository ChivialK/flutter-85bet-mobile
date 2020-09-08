import 'package:freezed_annotation/freezed_annotation.dart';

part 'rollback_model.freezed.dart';

@freezed
abstract class RollbackModel with _$RollbackModel {
  const factory RollbackModel({
    dynamic key,
    @JsonKey(name: 'amountlocal') String amountLocal,
    @JsonKey(name: 'betreslut') int betResult,
    @JsonKey(name: 'endtime') String endTime,
    @JsonKey(name: 'fundindex') String fundIndex,
    @JsonKey(name: 'ledgerdatetime') String ledgerDatetime,
    @JsonKey(name: 'multiply') String multiply,
    @JsonKey(name: 'promoindex') String promoIndex,
    @JsonKey(name: 'promosimplified') String promoSimplified,
    @JsonKey(name: 'reference_ledgerid') String referenceLedgerId,
    @JsonKey(name: 'rollover') int rollover,
    @JsonKey(name: 'starttime') String startTime,
    @JsonKey(name: 'turnover') int turnover,
    @JsonKey(name: 'withdrawal_valid') String withdrawalValid,
  }) = _RollbackModel;

  static RollbackModel jsonToRollbackModel(Map<String, dynamic> jsonMap) =>
      _$_RollbackModel(
        amountLocal: jsonMap['amountlocal'] as String,
        betResult: jsonMap['betreslut'] as int,
        endTime: jsonMap['endtime'] as String,
        fundIndex: jsonMap['fundindex'] as String,
        ledgerDatetime: jsonMap['ledgerdatetime'] as String,
        multiply: jsonMap['multiply'] as String,
        promoIndex: jsonMap['promoindex'] as String,
        promoSimplified: jsonMap['promosimplified'] as String,
        referenceLedgerId: jsonMap['reference_ledgerid'] as String,
        rollover: jsonMap['rollover'] as int,
        startTime: jsonMap['starttime'] as String,
        turnover: jsonMap['turnover'] as int,
        withdrawalValid: jsonMap['withdrawal_valid'] as String,
        key: jsonMap['key'],
      );
}
