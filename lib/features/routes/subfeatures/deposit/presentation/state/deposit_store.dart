import 'package:flutter_85bet_mobile/core/mobx_store_export.dart';

import '../../data/form/deposit_form.dart';
import '../../data/model/deposit_info.dart';
import '../../data/model/deposit_result.dart';
import '../../data/model/payment_type.dart';
import '../../data/model/payment_type_data.dart';
import '../../data/repository/deposit_repository.dart';

part 'deposit_store.g.dart';

class DepositStore = _DepositStore with _$DepositStore;

enum DepositStoreState { initial, loading, loaded, error }

abstract class _DepositStore with Store {
  final DepositRepository _repository;

  _DepositStore(this._repository);

  @observable
  ObservableFuture<void> _initFuture;

  List<PaymentType> paymentTypes;

  List<DepositInfo> _infoList;

  Map<int, String> banks;

  // Map<int, List<PaymentPromoData>> promoMap;

  Map<int, String> depositRule;

  bool get hasRules => depositRule != null && depositRule.isNotEmpty;

  @observable
  bool waitForDepositResult = false;

  @observable
  DepositResult depositResult;

  @observable
  String errorMessage;

  bool _errorState = false;

  void setErrorMsg({
    String msg,
    bool showOnce = false,
    FailureType type,
    int code,
  }) =>
      errorMessage = getErrorMsg(
          from: FailureType.DEPOSIT,
          msg: msg,
          showOnce: showOnce,
          type: type,
          code: code);

  DepositInfo getPaymentInfo(int bankAccountId) => _infoList.singleWhere(
        (info) => info.bankAccountId == bankAccountId,
        orElse: () => null,
      );

  @computed
  DepositStoreState get state {
    // If the user has not yet searched for a weather forecast or there has been an error
    if (_initFuture == null || _initFuture.status == FutureStatus.rejected) {
      return DepositStoreState.initial;
    }
    if (_errorState) return DepositStoreState.error;
    // Pending Future means "loading"
    // Fulfilled Future means "loaded"
    return _initFuture.status == FutureStatus.pending
        ? DepositStoreState.loading
        : DepositStoreState.loaded;
  }

  @computed
  List<DepositInfo> get getLocalDepositInfoList {
    List<PaymentTypeLocalData> localDepositType = new List();
    paymentTypes.forEach((type) {
      localDepositType.addAll(type.data.whereType<PaymentTypeLocalData>());
    });
    localDepositType.removeWhere((element) => element.payment.strToInt > 5);
    // localDepositType.forEach((element) {
    //   debugPrint('all local deposit data: $element');
    // });
    // list.forEach((element) {
    //   debugPrint('all deposit info: $element');
    // });
    final List<DepositInfo> localInfoList = _infoList
        .where((info) => localDepositType
            .any((element) => element.bankAccountId == info.bankAccountId))
        .toList();
    localInfoList.forEach((element) {
      debugPrint('all local deposit info: $element');
    });
    return localInfoList;
  }

  @action
  Future<void> getInitializeData() async {
    try {
      // Reset the possible previous error message.
      errorMessage = null;
      // Fetch from the repository and wrap the regular Future into an observable.
      _initFuture = ObservableFuture(Future.wait([
        if (paymentTypes == null) Future.value(getPaymentTypes()),
        // if (promoMap == null) Future.value(getPaymentPromo()),
        if (banks == null) Future.value(getDepositBanks()),
        if (depositRule == null) Future.value(getDepositRule()),
      ]));
      // ObservableFuture extends Future - it can be awaited and exceptions will propagate as usual.
      await _initFuture;
    } on Exception {
      //errorMessage = "Couldn't fetch description. Is the device online?";
      setErrorMsg(code: 1);
    }
  }

  @action
  Future<void> getPaymentTypes() async {
    try {
      // Reset the possible previous error message.
      errorMessage = null;
      // Fetch from the repository and wrap the regular Future into an observable.
      // ObservableFuture extends Future - it can be awaited and exceptions will propagate as usual.
      await _repository.getPayment().then((result) {
        // debugPrint('payment store type result: $result');
        result.fold(
          (failure) {
            setErrorMsg(msg: failure.message, showOnce: true);
            _errorState = true;
          },
          (data) {
            // data.forEach((element) {
            //   debugPrint('debug payment type: $element');
            // });
            paymentTypes = data;
            if (data.isNotEmpty) {
              getDepositInfo();
            }
          },
        );
      });
    } on Exception {
      _errorState = true;
      setErrorMsg(code: 2);
    }
  }

//   @action
//   Future<void> getPaymentPromo() async {
//     try {
//       // Reset the possible previous error message.
//       errorMessage = null;
//       // Fetch from the repository and wrap the regular Future into an observable.
//       // ObservableFuture extends Future - it can be awaited and exceptions will propagate as usual.
//       await _repository.getPaymentPromo().then((result) {
// //        debugPrint('payment store promo result: $result');
//         result.fold(
//           (failure) {
//             setErrorMsg(msg: failure.message, showOnce: true);
//           },
//           (data) {
//             promoMap ??= new Map();
//             promoMap[1] = data.getDataList(true);
//             promoMap[2] = data.getDataList(false);
// //            debugPrint('payment promo map: $promoMap');
//           },
//         );
//       });
//     } on Exception {
//       setErrorMsg(code: 3);
//     }
//   }

  @action
  Future<void> getDepositInfo() async {
    try {
      // Reset the possible previous error message.
      errorMessage = null;
      // Fetch from the repository and wrap the regular Future into an observable.
      // ObservableFuture extends Future - it can be awaited and exceptions will propagate as usual.
      await _repository.getDepositInfo().then((result) {
        // debugPrint('deposit info result: $result');
        result.fold(
          (failure) {
            setErrorMsg(msg: failure.message, showOnce: true);
            _infoList = [];
          },
          (list) => _infoList = new List.from(list) ?? [],
        );
      });
    } on Exception {
      setErrorMsg(code: 4);
      _infoList = [];
    }
  }

  @action
  Future<void> getDepositBanks() async {
    try {
      // Reset the possible previous error message.
      errorMessage = null;
      // Fetch from the repository and wrap the regular Future into an observable.
      // ObservableFuture extends Future - it can be awaited and exceptions will propagate as usual.
      await _repository.getDepositBanks().then((result) {
//        debugPrint('deposit banks result: $result');
        result.fold(
          (failure) => setErrorMsg(msg: failure.message, showOnce: true),
          (data) => banks = data,
        );
      });
    } on Exception {
      setErrorMsg(code: 5);
    }
  }

  @action
  Future<void> getDepositRule() async {
    try {
      // Reset the possible previous error message.
      errorMessage = null;
      // Fetch from the repository and wrap the regular Future into an observable.
      // ObservableFuture extends Future - it can be awaited and exceptions will propagate as usual.
      await _repository.getDepositRule().then((result) {
//        debugPrint('deposit rule result: $result');
        result.fold(
          (failure) => setErrorMsg(msg: failure.message, showOnce: true),
          (data) => depositRule = data,
        );
      });
    } on Exception {
      setErrorMsg(code: 6);
    }
  }

  @action
  Future<String> getDepositPic(int paymentBankId) async {
    try {
      // Reset the possible previous error message.
      errorMessage = null;
      // Fetch from the repository and wrap the regular Future into an observable.
      // ObservableFuture extends Future - it can be awaited and exceptions will propagate as usual.
      return await _repository
          .getDepositQr(paymentBankId)
          .then((result) => result.fold(
                (failure) {
                  setErrorMsg(msg: failure.message);
                  return '';
                },
                (data) => data,
              ));
    } on Exception {
      setErrorMsg(code: 6);
      return '';
    }
  }

  @action
  Future<void> sendRequest(DepositDataForm form) async {
    try {
      if (waitForDepositResult) return;
      // Reset the possible previous error message.
      errorMessage = null;
      depositResult = null;
      waitForDepositResult = true;
      // Fetch from the repository and wrap the regular Future into an observable.
      // ObservableFuture extends Future - it can be awaited and exceptions will propagate as usual.
      await _repository
          .postDeposit(form)
          .whenComplete(() => waitForDepositResult = false)
          .then((result) {
//        debugPrint('payment store promo result: $result');
        result.fold(
          (failure) => setErrorMsg(msg: failure.message),
          (data) => depositResult = data,
        );
      });
    } on Exception {
      waitForDepositResult = false;
      setErrorMsg(code: 7);
    }
  }
}
