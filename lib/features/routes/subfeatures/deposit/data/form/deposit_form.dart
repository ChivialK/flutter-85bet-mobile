import 'package:flutter_85bet_mobile/core/internal/global.dart';
import 'package:flutter_85bet_mobile/utils/value_util.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'deposit_form.freezed.dart';

@freezed
abstract class DepositDataForm with _$DepositDataForm {
  const factory DepositDataForm({
    @required int methodId,
    @Default(-1) int bankId,
    @required int bankIndex,
    @Default('-1') String amount,
    @Default('1') String gateway,
    @Default(-1) int localBank,
    @Default('') String localBankCard,
    @Default('') String transactionCode,
  }) = _DepositDataForm;
}

extension DepositDataFormExtension on DepositDataForm {
  /// This method is not reversible
  Map<String, dynamic> toJson() {
    String amt = this.amount;
    if (Global.localeCode == 'zh' && !amt.contains('.')) amt += ".00";
    if (localBank != null && localBank != -1) {
      return <String, dynamic>{
        'amount': amt,
        'bankaccountid': this.bankId,
        'bankindex': this.bankIndex.toString(),
        'deposit_method': this.methodId.toString(),
        'gateway': this.gateway,
        'localbank': this.localBank,
        'localbankno': this.localBankCard,
      };
    } else if (transactionCode != null && transactionCode.isNotEmpty) {
      return <String, dynamic>{
        'amount': amt,
        'bankaccountid': this.bankId,
        'bankindex': this.bankIndex.toString(),
        'deposit_method': this.methodId.toString(),
        'gateway': this.gateway,
        'vntransactionid': this.transactionCode,
      };
    } else {
      return <String, dynamic>{
        'amount': amt,
        'bankaccountid': this.bankId,
        'bankindex': this.bankIndex.toString(),
        'deposit_method': this.methodId.toString(),
        'gateway': this.gateway,
      };
    }
  }

  bool get isLocalPayValid =>
      amount != '-1' &&
      amount.isNotEmpty &&
      bankIndex != -1 &&
      bankId != -1 &&
      methodId != -1 &&
      gateway.strToInt != -1 &&
      localBank != -1 &&
      localBankCard.isNotEmpty;

  bool get isOnlinePayValid =>
      amount != '-1' &&
      amount.isNotEmpty &&
      methodId != -1 &&
      gateway.strToInt != -1 &&
      bankIndex != -1 &&
      bankId != -1;

  bool get isQrPayValid =>
      amount != '-1' &&
      amount.isNotEmpty &&
      methodId != -1 &&
      gateway.strToInt != -1 &&
      bankIndex != -1 &&
      bankId != -1 &&
      transactionCode.isNotEmpty;
}
