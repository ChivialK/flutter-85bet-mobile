import 'package:flutter_85bet_mobile/core/mobx_store_export.dart';
import 'package:flutter_85bet_mobile/core/network/handler/request_code_model.dart';

import '../../data/form/bankcard_form.dart';
import '../../data/models/bankcard_model.dart';
import '../../data/repository/bankcard_repository.dart';

part 'bankcard_store.g.dart';

class BankcardStore = _BankcardStore with _$BankcardStore;

enum BankcardStoreState { initial, loading, loaded }

abstract class _BankcardStore with Store {
  final BankcardRepository _repository;

  _BankcardStore(this._repository);

  @observable
  ObservableFuture<Either<Failure, BankcardModel>> _bankcardFuture;

  @observable
  BankcardModel bankcard;

  @observable
  Map<String, String> provinceMap;

  @observable
  Map<String, String> banksMap;

  @observable
  Map<String, String> cityMap;

  @observable
  Map<String, String> areaMap;

  @observable
  bool waitForNewCardResult = false;

  @observable
  RequestCodeModel newCardResult;

  @observable
  String errorMessage;

  void setErrorMsg({
    String msg,
    bool showOnce = false,
    FailureType type,
    int code,
  }) =>
      errorMessage = getErrorMsg(
          from: FailureType.BANKCARD,
          msg: msg,
          showOnce: showOnce,
          type: type,
          code: code);

  @computed
  BankcardStoreState get state {
    // If the user has not yet searched for a weather forecast or there has been an error
    if (_bankcardFuture == null ||
        _bankcardFuture.status == FutureStatus.rejected) {
      return BankcardStoreState.initial;
    }
    // Pending Future means "loading"
    // Fulfilled Future means "loaded"
    return _bankcardFuture.status == FutureStatus.pending
        ? BankcardStoreState.loading
        : BankcardStoreState.loaded;
  }

  @action
  Future<void> getBankcard(bool isWithdraw) async {
    try {
      // Reset the possible previous error message.
      errorMessage = null;
      // ObservableFuture extends Future - it can be awaited and exceptions will propagate as usual.
      _bankcardFuture = ObservableFuture(_repository.getBankcard(isWithdraw));
      await _bankcardFuture.then((result) {
//        debugPrint('bankcard result: $result');
        result.fold(
          (failure) => setErrorMsg(msg: failure.message, showOnce: true),
          (data) => bankcard = data,
        );
      });
    } on Exception {
      setErrorMsg(code: 1);
    }
  }

  @action
  Future<void> getBanks() async {
    try {
      // Reset the possible previous error message.
      errorMessage = null;
      // ObservableFuture extends Future - it can be awaited and exceptions will propagate as usual.
      await _repository.getBanks().then((result) {
//        debugPrint('bank ids map result: $result');
        result.fold(
          (failure) => setErrorMsg(msg: failure.message, showOnce: true),
          (data) {
            if (data != null) banksMap = data;
          },
        );
      });
    } on Exception {
      setErrorMsg(code: 2);
    }
  }

  @action
  Future<void> getProvinces() async {
    try {
      // Reset the possible previous error message.
      errorMessage = null;
      // ObservableFuture extends Future - it can be awaited and exceptions will propagate as usual.
      await _repository.getProvinces().then((result) {
//        debugPrint('province map result: $result');
        result.fold(
          (failure) => setErrorMsg(msg: failure.message, showOnce: true),
          (data) {
            if (data != null && data.isNotEmpty) {
              provinceMap = data;
            }
          },
        );
      });
    } on Exception {
      setErrorMsg(code: 3);
    }
  }

  @action
  Future<void> getCities(String provinceCode, {bool showError = true}) async {
    try {
      // Reset the possible previous error message.
      errorMessage = null;
      // ObservableFuture extends Future - it can be awaited and exceptions will propagate as usual.
      await _repository.getMapByCode(provinceCode).then((result) {
//        debugPrint('city map result: $result');
        result.fold(
          (failure) {
            if (showError)
              setErrorMsg(msg: failure.message, showOnce: true);
            else
              debugPrint(failure.message);
          },
          (data) {
            if (data != null && data.isNotEmpty) cityMap = data;
          },
        );
      });
    } on Exception {
      setErrorMsg(code: 4);
    }
  }

  @action
  Future<void> getAreas(String cityCode) async {
    try {
      // Reset the possible previous error message.
      errorMessage = null;
      // ObservableFuture extends Future - it can be awaited and exceptions will propagate as usual.
      await _repository.getMapByCode(cityCode).then((result) {
//        debugPrint('area map result: $result');
        result.fold(
          (failure) => setErrorMsg(msg: failure.message, showOnce: true),
          (data) {
            if (data != null && data.isNotEmpty) areaMap = data;
          },
        );
      });
    } on Exception {
      setErrorMsg(code: 5);
    }
  }

  @action
  Future<void> sendRequest(BankcardForm form) async {
    try {
      // Reset the possible previous error message.
      errorMessage = null;
      newCardResult = null;
      waitForNewCardResult = true;
      // ObservableFuture extends Future - it can be awaited and exceptions will propagate as usual.
      await _repository
          .postBankcard(form)
          .whenComplete(() => waitForNewCardResult = false)
          .then((result) {
        debugPrint('bankcard bind result: $result');
        result.fold(
          (failure) => setErrorMsg(msg: failure.message, showOnce: true),
          (data) => newCardResult = data,
        );
      });
    } on Exception {
      waitForNewCardResult = false;
      setErrorMsg(code: 6);
    }
  }
}
