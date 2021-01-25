import 'package:meta/meta.dart';

import '../../data/form/deposit_form.dart';
import '../../data/model/payment_type_data.dart';
import 'deposit_page_type.dart';

abstract class DepositPageStorageInterface {
  void clearStorage();
  void updateForm({
    @required DepositPageType page,
    @required DepositDataForm form,
    PaymentTypeData selectedPaymentType,
  });
  void updateGateway(int gateway);
}

class DepositPageStorage extends DepositPageStorageInterface {
  DepositDataForm _depositForm;
  PaymentTypeData _selectedPaymentType;

  DepositDataForm get getDepositForm => _depositForm;

  PaymentTypeData get getSelectedPaymentType => _selectedPaymentType;

  @override
  void clearStorage() {
    _depositForm = null;
    _selectedPaymentType = null;
  }

  @override
  void updateGateway(int gateway) {
    if (_depositForm != null) {
      _depositForm = _depositForm.copyWith(
        gateway: '$gateway',
      );
    }
    // debugPrint('deposit gateway updated: ${_depositForm.toJson()}');
  }

  @override
  void updateForm({
    @required DepositPageType page,
    @required DepositDataForm form,
    PaymentTypeData selectedPaymentType,
  }) {
    switch (page) {
      case DepositPageType.LOCAL_BANK_OPTION:
        _selectedPaymentType = selectedPaymentType;
        if (_depositForm != null) {
          _depositForm = _depositForm.copyWith(
            methodId: form.methodId,
            bankIndex: form.bankIndex,
            bankId: form.bankId,
            gateway: form.gateway,
          );
        } else {
          _depositForm = form;
        }
        break;
      case DepositPageType.LOCAL_BANK_DEPOSIT_INFO:
        _depositForm = _depositForm.copyWith(
          localBank: form.localBank,
          localBankCard: form.localBankCard,
          amount: form.amount,
        );
        break;
      case DepositPageType.ONLINE_BANK_OPTION:
        _selectedPaymentType = selectedPaymentType;
        if (_depositForm != null) {
          _depositForm = _depositForm.copyWith(
            methodId: form.methodId,
            bankIndex: form.bankIndex,
            bankId: form.bankId,
            gateway: form.gateway,
          );
        } else {
          _depositForm = form;
        }
        break;
      case DepositPageType.ONLINE_BANK_DEPOSIT_INFO:
        _depositForm = _depositForm.copyWith(amount: form.amount);
        break;
      case DepositPageType.QR_DEPOSIT_INFO:
      case DepositPageType.THIRD_PARTY_DEPOSIT_INFO:
        _depositForm = form;
        break;
      case DepositPageType.QR_DEPOSIT_CODE:
      case DepositPageType.ERROR:
        break;
    }
    // debugPrint('deposit form updated: ${_depositForm.toJson()}');
  }
}
