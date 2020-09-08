import 'package:freezed_annotation/freezed_annotation.dart';

part 'deposit_result.freezed.dart';
part 'deposit_result.g.dart';

@freezed
abstract class DepositResult with _$DepositResult {
  const factory DepositResult({
    @nullable bool ss,
    @nullable String url,
    @Default('') String msg,
    int code,
    @JsonKey(name: 'ledgerindex', defaultValue: -1) int ledger,
  }) = _DepositResult;

  factory DepositResult.fromJson(Map<String, dynamic> json) =>
      _$DepositResultFromJson(json);

  static DepositResult jsonToDepositResult(Map<String, dynamic> jsonMap) =>
      DepositResult.fromJson(jsonMap);
}
