import 'package:freezed_annotation/freezed_annotation.dart';

part 'deposit_info.freezed.dart';

@freezed
abstract class DepositInfo with _$DepositInfo {
  const factory DepositInfo({
    @JsonKey(name: 'accountname') String accountName,
    @JsonKey(name: 'bankaccountid') int bankAccountId,
    @JsonKey(name: 'bankaccountname') String bankAccountName,
    @JsonKey(name: 'bankaccountno') String bankAccountNo,
    @JsonKey(name: 'bankcode') String bankCode,
  }) = _DepositInfo;

  static DepositInfo jsonToDepositInfo(Map<String, dynamic> jsonMap) =>
      _$_DepositInfo(
        accountName: jsonMap['accountname'] as String,
        bankAccountId: jsonMap['bankaccountid'] as int,
        bankAccountName: jsonMap['bankaccountname'] as String,
        bankAccountNo: jsonMap['bankaccountno'] as String,
        bankCode: jsonMap['bankcode'] as String,
      );
}
