import 'package:freezed_annotation/freezed_annotation.dart';

part 'transfer_form.freezed.dart';

@freezed
abstract class TransferForm with _$TransferForm {
  const factory TransferForm({
    @required String amount,
    @required String from,
    @required String to,
  }) = _TransferForm;
}

extension TransferFormExtension on TransferForm {
  bool get isValid => amount.isNotEmpty && from.isNotEmpty && to.isNotEmpty;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'amount': this.amount,
      'from': this.from,
      'to': this.to,
    };
  }
}
