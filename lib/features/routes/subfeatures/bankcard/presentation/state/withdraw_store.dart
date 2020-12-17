import 'package:flutter_85bet_mobile/core/mobx_store_export.dart';
import 'package:flutter_85bet_mobile/features/general/data/error/error_message_map.dart';
import 'package:flutter_85bet_mobile/features/router/route_enum.dart';

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
  ObservableFuture<Either<Failure, String>> _cgpFuture;

  @observable
  ObservableFuture<Either<Failure, String>> _cpwFuture;

  @observable
  bool waitForWithdrawResult = false;

  @observable
  WithdrawModel withdrawResult;

  String cgpUrl = '';
  String cpwUrl = '';
  String rollback = '';

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
    if ((_cgpFuture == null || _cgpFuture.status == FutureStatus.rejected) &&
        (_cpwFuture == null || _cpwFuture.status == FutureStatus.rejected)) {
      return WithdrawStoreState.initial;
    }
    // Pending Future means "loading"
    // Fulfilled Future means "loaded"
    return _cgpFuture.status == FutureStatus.pending &&
            _cpwFuture.status == FutureStatus.pending
        ? WithdrawStoreState.loading
        : WithdrawStoreState.loaded;
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
          (data) => rollback = data,
        );
      });
    } on Exception {
      setErrorMsg(code: 3);
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
      setErrorMsg(code: 4);
    }
  }
}
