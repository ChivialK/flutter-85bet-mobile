import 'package:freezed_annotation/freezed_annotation.dart';

part 'withdraw_model.freezed.dart';

@freezed
abstract class WithdrawModel with _$WithdrawModel {
  const factory WithdrawModel({
    int code,
    dynamic data,
    String msg,
  }) = _WithdrawModel;

  static WithdrawModel jsonToWithdrawModel(Map<String, dynamic> jsonMap) =>
      _$_WithdrawModel(
        code: jsonMap['code'] as int,
        data: jsonMap['data'],
        msg: jsonMap['msg'] as String,
      );
}
