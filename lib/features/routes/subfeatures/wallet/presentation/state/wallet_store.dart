import 'package:flutter_85bet_mobile/core/mobx_store_export.dart';

import '../../data/models/wallet_model.dart';
import '../../data/repository/wallet_repository.dart';

part 'wallet_store.g.dart';

class WalletStore = _WalletStore with _$WalletStore;

enum WalletStoreState { initial, loading, loaded }

abstract class _WalletStore with Store {
  final WalletRepository _repository;

  _WalletStore(this._repository);

  @observable
  ObservableFuture<Either<Failure, WalletModel>> _walletFuture;

  @observable
  WalletModel wallet;

  @observable
  bool changeSuccess;

  @observable
  bool waitForTypeChange = false;

  @observable
  bool waitForTransfer;

  bool waitForUpdate = false;

  bool showingDialog = false;

  StreamController<String> _progressController;

  /* observe progress change */
  @observable
  String transferProgress;

  @observable
  bool transferSuccess;

  StringBuffer transferErrorList;

  @observable
  String errorMessage;

  void setErrorMsg({
    String msg,
    bool showOnce = false,
    FailureType type,
    int code,
  }) =>
      errorMessage = getErrorMsg(
          from: FailureType.WALLET,
          msg: msg,
          showOnce: showOnce,
          type: type,
          code: code);

  @computed
  WalletStoreState get state {
    // If the user has not yet triggered a action or there has been an error
    if (_walletFuture == null ||
        _walletFuture.status == FutureStatus.rejected) {
      return WalletStoreState.initial;
    }
    // Pending Future means "loading"
    // Fulfilled Future means "loaded"
    return _walletFuture.status == FutureStatus.pending
        ? WalletStoreState.loading
        : WalletStoreState.loaded;
  }

  @action
  Future getWallet() async {
    try {
      // Reset the possible previous error message.
      errorMessage = null;
      // Fetch from the repository and wrap the regular Future into an observable.
      _walletFuture = ObservableFuture(_repository.getWallet());
      // ObservableFuture extends Future - it can be awaited and exceptions will propagate as usual.
      await _walletFuture.then((result) => result.fold(
            (failure) => setErrorMsg(msg: failure.message, showOnce: true),
            (data) {
              wallet = data;
              debugPrint('wallet updated: $wallet');
            },
          ));
    } on Exception {
      setErrorMsg(code: 1);
    }
  }

  @action
  Future updateCredit() async {
    if (waitForUpdate) return;
    try {
      // Reset the possible previous error message.
      errorMessage = null;
      waitForUpdate = true;
      wallet = wallet.copyWith(credit: '---');
      // Fetch from the repository and wrap the regular Future into an observable.
      // ObservableFuture extends Future - it can be awaited and exceptions will propagate as usual.
      await _repository
          .getWallet()
          .then((result) => result.fold(
                (failure) => setErrorMsg(msg: failure.message, showOnce: true),
                (data) {
                  wallet = data;
                  debugPrint('wallet updated: $wallet');
                },
              ))
          .whenComplete(() => waitForUpdate = false);
    } on Exception {
      waitForUpdate = false;
      setErrorMsg(code: 2);
    }
  }

  @action
  Future postWalletType(bool toSingle) async {
    try {
      debugPrint('change wallet to single: $toSingle');
      // Reset the possible previous error message.
      errorMessage = null;
      changeSuccess = null;
      waitForTypeChange = true;
      // Fetch from the repository and wrap the regular Future into an observable.
      // ObservableFuture extends Future - it can be awaited and exceptions will propagate as usual.
      await _repository
          .postWalletType(toSingle)
          .then(
            (result) => result.fold(
              (failure) => setErrorMsg(msg: failure.message, showOnce: true),
              (data) {
                changeSuccess = data == 'success';
                Future.delayed(Duration(milliseconds: 500), () => getWallet());
              },
            ),
          )
          .whenComplete(() => waitForTypeChange = false);
    } on Exception {
      waitForTypeChange = false;
      setErrorMsg(code: 3);
    }
  }

  @action
  Future postWalletTransfer() async {
    try {
      // Reset the possible previous error message.
      transferErrorList = null;
      transferSuccess = null;
      transferProgress = '0/0';
      _progressController = new StreamController();
      _progressController.stream.listen((progress) {
        debugPrint('wallet transfer progress: $progress');
        transferProgress = progress;
      });
      waitForTransfer = true;
      // Fetch from the repository and wrap the regular Future into an observable.
      // ObservableFuture extends Future - it can be awaited and exceptions will propagate as usual.
      await _repository
          .postTransferAll(_progressController)
          .then(
            (result) => result.fold(
              (failure) {
                transferErrorList ??= new StringBuffer();
                transferErrorList.write(failure.message);
                transferSuccess = false;
              },
              (Map map) {
                debugPrint('wallet transfer result: ${map.length}');
                map.forEach((key, value) {
                  if (value.toString() != '200') {
                    transferErrorList ??= new StringBuffer();
                    if (transferErrorList.isNotEmpty)
                      transferErrorList.write(', ');
                    transferErrorList.write('${key.toString().toUpperCase()}');
                  }
                });
                transferSuccess =
                    transferErrorList == null || transferErrorList.isEmpty;
                MyLogger.debug(
                    msg:
                        'wallet transfer error: ${transferErrorList.toString()}',
                    tag: 'Wallet');
                updateCredit();
              },
            ),
          )
          .whenComplete(() => Future.delayed(
              Duration(milliseconds: 500), () => waitForTransfer = false));
    } on Exception {
      waitForTypeChange = false;
      transferSuccess = false;
      setErrorMsg(code: 4);
    }
  }

  @action
  Future<void> cancelWalletTransfer() async {
    if (transferSuccess == null) {
      await _repository.cancelTransferAll();
    }
  }

  Future<void> closeStream() async {
    try {
      if (_progressController.isClosed == false) {
        transferProgress = null;
        transferErrorList = null;
        _progressController.close();
      }
    } catch (e) {
      MyLogger.warn(
          msg: 'close wallet transfer progress stream error', error: e);
    }
  }
}
