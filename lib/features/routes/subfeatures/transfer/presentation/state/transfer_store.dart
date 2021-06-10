import 'package:flutter_85bet_mobile/core/mobx_store_export.dart';

import '../../data/form/transfer_form.dart';
import '../../data/models/transfer_platform_model.dart';
import '../../data/models/transfer_result_model.dart';
import '../../data/repository/transfer_repository.dart';

part 'transfer_store.g.dart';

class TransferStore = _TransferStore with _$TransferStore;

enum TransferStoreState { initial, loading, loaded }

abstract class _TransferStore with Store {
  final TransferRepository _repository;

  _TransferStore(this._repository) {
    _site1ValueController.stream.listen((event) {
      site1 = event;
      checkPlatformValid();
    });
    _site2ValueController.stream.listen((event) {
      site2 = event;
      checkPlatformValid();
    });
  }

  final StreamController<String> _site1ValueController =
      new StreamController<String>.broadcast();
  final StreamController<String> _site2ValueController =
      new StreamController<String>.broadcast();

  Stream<String> get site1ValueStream => _site1ValueController.stream;

  Stream<String> get site2ValueStream => _site2ValueController.stream;

  @observable
  ObservableFuture<Either<Failure, TransferPlatformList>> _platformFuture;

  @observable
  List<TransferPlatformModel> platforms;

  @observable
  TransferResultModel transferResult;

  @observable
  bool waitForTransferResult = false;

  int creditLimit = 0;

  bool isPlatformValid = false;

  String site1;
  String site2;

  @observable
  String errorMessage;

  void setErrorMsg({
    String msg,
    bool showOnce = false,
    FailureType type,
    int code,
  }) =>
      errorMessage = getErrorMsg(
          from: FailureType.TRANSFER,
          msg: msg,
          showOnce: showOnce,
          type: type,
          code: code);

  @computed
  TransferStoreState get state {
    // If the user has not yet triggered a action or there has been an error
    if (_platformFuture == null ||
        _platformFuture.status == FutureStatus.rejected) {
      return TransferStoreState.initial;
    }
    // Pending Future means "loading"
    // Fulfilled Future means "loaded"
    return _platformFuture.status == FutureStatus.pending
        ? TransferStoreState.loading
        : TransferStoreState.loaded;
  }

  @action
  Future<void> getPlatforms() async {
    try {
      // Reset the possible previous error message.
      errorMessage = null;
      // Fetch from the repository and wrap the regular Future into an observable.
      _platformFuture = ObservableFuture(_repository.getPlatform());
      // ObservableFuture extends Future - it can be awaited and exceptions will propagate as usual.
      await _platformFuture.then((result) {
        result.fold(
          (failure) => setErrorMsg(msg: failure.message, showOnce: true),
          (data) {
            platforms = data.list;
            debugPrint('platforms: $platforms');
          },
        );
      });
    } on Exception {
      setErrorMsg(code: 1);
    }
  }

  @action
  Future<void> getBalance(
    String site, {
    bool isLimit = false,
    bool retryOnce = false,
  }) async {
    try {
      // Reset the possible previous error message.
      errorMessage = null;
      // ObservableFuture extends Future - it can be awaited and exceptions will propagate as usual.
      await _repository.getBalance(site).then((result) {
        result.fold(
          (failure) => setErrorMsg(msg: failure.message, showOnce: true),
          (data) {
            bool platformClosed = data.balance == '$creditSymbol-1.00';
            bool platformMaintenance =
                data.balance.toLowerCase().contains('maintenance');
            debugPrint('$site balance: ${data.balance}');
            if (isLimit) {
              creditLimit = (platformClosed) ? 0 : data.balance.strToInt;
              debugPrint('credit limit: $creditLimit');
              if (data.balance != site1) {
                setSite1Value((platformClosed)
                    ? '$creditSymbol---'
                    : (platformMaintenance)
                        ? localeStr.balanceStatusMaintenance
                        : data.balance);
              } else if (retryOnce) {
                Future.delayed(Duration(milliseconds: 2000),
                    () => getBalance(site, isLimit: isLimit));
              }
            } else {
              if (data.balance != site2) {
                setSite2Value((platformClosed)
                    ? '$creditSymbol---'
                    : (platformMaintenance)
                        ? localeStr.balanceStatusMaintenance
                        : data.balance);
              } else if (retryOnce) {
                Future.delayed(Duration(milliseconds: 2000),
                    () => getBalance(site, isLimit: isLimit));
              }
            }
          },
        );
      });
    } on Exception {
      setErrorMsg(code: 2);
    }
  }

  @action
  Future<void> sendRequest(TransferForm form) async {
    try {
      if (waitForTransferResult) return;
      // Reset the possible previous error message.
      errorMessage = null;
      transferResult = null;
      waitForTransferResult = true;
      // ObservableFuture extends Future - it can be awaited and exceptions will propagate as usual.
      await _repository
          .postTransfer(form)
          .whenComplete(() => waitForTransferResult = false)
          .then((result) {
        debugPrint('transfer from ${form.from} to ${form.to} result: $result');
        result.fold(
          (failure) => setErrorMsg(msg: failure.message),
          (data) {
            transferResult = data;
            if (data.isSuccess) {
              Future.delayed(Duration(milliseconds: 1000), () {
                getBalance(form.from, isLimit: true, retryOnce: true);
                getBalance(form.to, retryOnce: true);
              });
            }
          },
        );
      });
    } on Exception {
      waitForTransferResult = false;
      setErrorMsg(code: 3);
    }
  }

  void setSite1Value(String text) => _site1ValueController.sink.add(text);

  void setSite2Value(String text) => _site2ValueController.sink.add(text);

  void checkPlatformValid() {
    isPlatformValid = site1 != null &&
        site1 != '$creditSymbol---' &&
        site2 != null &&
        site2 != '$creditSymbol---';
    debugPrint('platform can transfer: $isPlatformValid');
  }

  Future<void> closeStreams() async {
    try {
      _site1ValueController.close();
      _site2ValueController.close();
    } catch (e) {
      MyLogger.warn(msg: 'close transfer stream error', error: e);
    }
  }
}
