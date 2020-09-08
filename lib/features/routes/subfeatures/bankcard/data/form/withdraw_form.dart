import 'package:freezed_annotation/freezed_annotation.dart';

part 'withdraw_form.freezed.dart';

@freezed
abstract class WithdrawForm with _$WithdrawForm {
  const factory WithdrawForm({
    @required String amount,
    @required String password,
    @required String type,
  }) = _WithdrawForm;
}

extension WithdrawFormExtension on WithdrawForm {
  bool get isValid =>
      amount.isNotEmpty && password.isNotEmpty && type.isNotEmpty;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'amount': this.amount,
      'password': this.password,
      'type': this.type,
    };
  }
}
