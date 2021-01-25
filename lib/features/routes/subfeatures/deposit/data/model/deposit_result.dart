import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_85bet_mobile/utils/value_util.dart';

part 'deposit_result.freezed.dart';

@freezed
abstract class DepositResult with _$DepositResult {
  const factory DepositResult({
    @nullable bool ss,
    @nullable String url,
    @Default('') String msg,
    int code,
    @JsonKey(name: 'ledgerindex', defaultValue: -1) int ledger,
  }) = _DepositResult;

  static DepositResult jsonToDepositResult(Map<String, dynamic> jsonMap) =>
      _$_DepositResult(
        ss: jsonMap['ss'] as bool,
        url: jsonMap['url'] as String,
        msg: jsonMap['msg'] as String ?? '',
        code: jsonMap['code'] as int,
        ledger: (jsonMap.containsKey('ledgerindex'))
            ? '${jsonMap['ledgerindex']}'.strToInt
            : -1,
      );
}
