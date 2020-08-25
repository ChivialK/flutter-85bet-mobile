import 'package:flutter_85bet_mobile/core/mobx_store_export.dart';

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

  @observable
  String errorMessage;

  String cgpUrl = '';
  String cpwUrl = '';
  // TODO need rollback data to adjust data flow
  String rollback = '';

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
      errorMessage = "Couldn't fetch cgp wallet. Is the device online?";
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
      errorMessage = "Couldn't fetch cpw wallet. Is the device online?";
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
          (failure) => errorMessage = failure.message,
          (data) => rollback = data,
        );
      });
    } on Exception {
      errorMessage = "Couldn't fetch rollback. Is the device online?";
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
            if (failure.message == 'amountMoreThanBalance')
              errorMessage = localeStr.messageInvalidWithdrawAmount;
            else if (failure.message == 'wrongPassword')
              errorMessage = localeStr.messageInvalidWithdrawPassword;
            else
              errorMessage = failure.message;
          },
          (data) => withdrawResult = data,
        );
      });
    } on Exception {
      waitForWithdrawResult = false;
      errorMessage =
          Failure.internal(FailureCode(type: FailureType.WITHDRAW)).message;
    }
  }
}
