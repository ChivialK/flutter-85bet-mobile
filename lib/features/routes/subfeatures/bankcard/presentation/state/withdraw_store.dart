import 'package:flutter_85bet_mobile/core/mobx_store_export.dart';
import 'package:flutter_85bet_mobile/features/general/data/error/error_message_map.dart';
import 'package:flutter_85bet_mobile/features/router/app_global_streams.dart';

import '../../data/form/withdraw_form.dart';
import '../../data/models/withdraw_model.dart';
import '../../data/repository/withdraw_repository.dart';

part 'withdraw_store.g.dart';

class WithdrawStore = _WithdrawStore with _$WithdrawStore;

enum WithdrawStoreState { initial, loading, loaded }

abstract class _WithdrawStore with Store {
  final WithdrawRepository _repository;

  _WithdrawStore(this._repository);

  @observable
  ObservableFuture<List> _initFuture;

  @observable
  ObservableFuture<Either<Failure, String>> _cgpFuture;

  @observable
  ObservableFuture<Either<Failure, String>> _cpwFuture;

  @observable
  bool waitForWithdrawResult = false;

  @observable
  WithdrawModel withdrawResult;

  String cgpUrl = '';
  String cpwUrl = '';
  int rollback = 0;
  int limit = 0;

  @observable
  String errorMessage;

  void setErrorMsg({
    String msg,
    bool showOnce = false,
    FailureType type,
    int code,
  }) =>
      errorMessage = getErrorMsg(
          from: FailureType.WITHDRAW,
          msg: msg,
          showOnce: showOnce,
          type: type,
          code: code);

  @computed
  WithdrawStoreState get state {
    // If the user has not yet triggered a action or there has been an error
    if (_initFuture == null || _initFuture.status == FutureStatus.rejected) {
      return WithdrawStoreState.initial;
    }
    // Pending Future means "loading"
    // Fulfilled Future means "loaded"
    return _initFuture.status == FutureStatus.pending
        ? WithdrawStoreState.loading
        : WithdrawStoreState.loaded;
  }

  @action
  Future<void> initialize() async {
    // Reset the possible previous error message.
    errorMessage = null;
    // Fetch from the repository and wrap the regular Future into an observable.
    _initFuture = ObservableFuture(Future.wait([
      // getCgpWallet(),
      // getCpwWallet(),
      // getRollback(),
      getWithdrawLimit(),
    ]));
  }

  @action
  Future<void> getCgpWallet() async {
    try {
      // Reset the possible previous error message.
      errorMessage = null;
      // Fetch from the repository and wrap the regular Future into an observable.
      _cgpFuture = ObservableFuture(_repository.getCgpWallet());
      // ObservableFuture extends Future - it can be awaited and exceptions will propagate as usual.
      await _cgpFuture.then((result) {
        debugPrint('cgp result: $result');
        result.fold(
          (failure) => errorMessage = 'CGP ${failure.message}',
          (data) => cgpUrl = data,
        );
      });
    } on Exception {
      setErrorMsg(code: 1);
    }
  }

  @action
  Future<void> getCpwWallet() async {
    try {
      // Reset the possible previous error message.
      errorMessage = null;
      // Fetch from the repository and wrap the regular Future into an observable.
      _cpwFuture = ObservableFuture(_repository.getCpwWallet());
      // ObservableFuture extends Future - it can be awaited and exceptions will propagate as usual.
      await _cpwFuture.then((result) {
        debugPrint('cpw result: $result');
        result.fold(
          (failure) => errorMessage = 'CPW ${failure.message}',
          (data) => cpwUrl = data,
        );
      });
    } on Exception {
      setErrorMsg(code: 2);
    }
  }

  @action
  Future<void> getRollback() async {
    try {
      // Reset the possible previous error message.
      errorMessage = null;
      // ObservableFuture extends Future - it can be awaited and exceptions will propagate as usual.
      await _repository.getRollback().then((result) {
        debugPrint('rollback result: $result');
        result.fold(
          (failure) => setErrorMsg(msg: failure.message, showOnce: true),
          (data) => rollback = data.strToInt,
        );
      });
    } on Exception {
      setErrorMsg(code: 3);
    }
  }

  @action
  Future<void> getWithdrawLimit() async {
    try {
      // Reset the possible previous error message.
      errorMessage = null;
      var _userData = getAppGlobalStreams.lastStatus;
      if (!_userData.loggedIn) {
        limit = 0;
        return;
      }
      // ObservableFuture extends Future - it can be awaited and exceptions will propagate as usual.
      await _repository
          .getWithdrawLimit(_userData.currentUser.vip)
          .then((result) {
        debugPrint('withdraw limit result: $result');
        result.fold(
          (failure) => setErrorMsg(msg: failure.message, showOnce: true),
          (data) => limit = data.strToInt,
        );
      });
      debugPrint('withdraw limit: $limit');
    } on Exception {
      setErrorMsg(code: 4);
    }
  }

  @action
  Future<void> sendRequest(WithdrawForm form) async {
    try {
      // Reset the possible previous error message.
      errorMessage = null;
      withdrawResult = null;
      waitForWithdrawResult = true;
      // ObservableFuture extends Future - it can be awaited and exceptions will propagate as usual.
      await _repository
          .postWithdraw(form)
          .whenComplete(() => waitForWithdrawResult = false)
          .then((result) {
        debugPrint('withdraw result: $result');
        result.fold(
          (failure) {
            setErrorMsg(
              msg: MessageMap.getErrorMessage(
                  failure.message, RouteEnum.WITHDRAW),
            );
          },
          (data) => withdrawResult = data,
        );
      });
    } on Exception {
      waitForWithdrawResult = false;
      setErrorMsg(code: 5);
    }
  }
}
