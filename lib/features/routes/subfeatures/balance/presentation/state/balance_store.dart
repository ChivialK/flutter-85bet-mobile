import 'package:flutter_85bet_mobile/core/internal/local_strings.dart';
import 'package:flutter_85bet_mobile/core/mobx_store_export.dart';
import 'package:flutter_85bet_mobile/core/network/handler/request_status_model.dart';
import 'package:flutter_85bet_mobile/features/router/app_global_streams.dart';
import 'package:flutter_85bet_mobile/features/routes/subfeatures/transfer/data/form/transfer_form.dart';
import 'package:flutter_85bet_mobile/features/user/data/repository/user_info_repository.dart';
import 'package:flutter_85bet_mobile/utils/regex_util.dart';
import 'package:flutter_85bet_mobile/utils/value_util.dart'
    show ValueUtilExtension;

import '../../data/repository/balance_repository.dart';
import '../../presentation/enum/balance_grid_action.dart';

part 'balance_store.g.dart';

class BalanceStore = _BalanceStore with _$BalanceStore;

enum BalanceStoreState { initial, loading, loaded }

abstract class _BalanceStore with Store {
  final BalanceRepository _repository;
  final UserInfoRepository _infoRepository;

  final StreamController<String> _loadingController =
      StreamController<String>.broadcast();

  _BalanceStore(this._repository, this._infoRepository);

  @observable
  ObservableFuture<Either<Failure, List<String>>> _promiseFuture;

  List<String> promises;
  int totalPlatform;
  Map<String, String> balanceMap;

  Stream<String> get loadingStream => _loadingController.stream;

  int balanceRequestProgress;

  @observable
  String balanceUpdated = '';

  @observable
  RequestStatusModel transferResult;

  @observable
  bool waitForTransferResult = false;

  bool _cancelRequest = false;

  double creditLimit;

  @observable
  String errorMessage;

  void setErrorMsg(
          {String msg, bool showOnce = false, FailureType type, int code}) =>
      errorMessage = getErrorMsg(
          from: FailureType.BALANCE,
          msg: msg,
          showOnce: showOnce,
          type: type,
          code: code);

  @computed
  BalanceStoreState get state {
    // If the user has not yet triggered a action or there has been an error
    if (_promiseFuture == null ||
        _promiseFuture.status == FutureStatus.rejected) {
      return BalanceStoreState.initial;
    }
    // Pending Future means "loading"
    // Fulfilled Future means "loaded"
    return _promiseFuture.status == FutureStatus.pending
        ? BalanceStoreState.loading
        : BalanceStoreState.loaded;
  }

  @action
  Future<void> getPromises() async {
    try {
      // Reset the possible previous error message.
      errorMessage = null;
      // Fetch from the repository and wrap the regular Future into an observable.
      _promiseFuture = ObservableFuture(_repository.getPromise());
      // ObservableFuture extends Future - it can be awaited and exceptions will propagate as usual.
      await _promiseFuture.then(
        (result) => result.fold(
          (failure) => setErrorMsg(msg: failure.message, showOnce: true),
          (list) {
            promises = list;
            totalPlatform = list.length;
            debugPrint('balance promise list: $list');
            if (promises.isNotEmpty) getBalances();
          },
        ),
      );
    } on Exception {
      setErrorMsg(code: 1);
    }
  }

  void sinkProgress({bool reset = false, bool close = false}) {
    if (_loadingController.isClosed) return;
    if (close) {
      balanceRequestProgress = -1;
      _loadingController.sink.add('');
      return;
    }
    if (reset)
      balanceRequestProgress = 1;
    else
      balanceRequestProgress += 1;
    _loadingController.sink.add('$balanceRequestProgress / $totalPlatform');
  }

  @action
  Future<void> getBalances() async {
    try {
      // Reset the possible previous error message.
      _cancelRequest = false;
      balanceMap = new Map();
      sinkProgress(reset: true);
      // Fetch from the repository and wrap the regular Future into an observable.
      // TODO change this to stream might run faster??
      await Future.forEach(promises, (platform) async {
        if (_cancelRequest) return;
        await getBalance(platform, showProgress: true);
      }).whenComplete(() {
        debugPrint('balance map: $balanceMap');
        sinkProgress(close: true);
      });
    } on Exception {
      setErrorMsg(code: 2);
    }
  }

  @action
  Future<void> getBalance(String platform, {bool showProgress = false}) async {
    try {
      // Reset the possible previous error message.
      errorMessage = null;
      balanceUpdated = null;
      // Fetch from the repository and wrap the regular Future into an observable.
      await _repository.getBalance(platform).then(
        (result) {
          result.fold(
            (failure) => balanceMap[platform] = 'x',
            (data) {
              if (showProgress) sinkProgress();
              var credit =
                  (data.isDigits) ? formatValue(data, floorIfInt: true) : data;
              balanceMap[platform] = credit;
              debugPrint('add balance to map: $platform, credit: $credit');
              balanceUpdated = platform;
            },
          );
        },
      );
    } on Exception {
      setErrorMsg(code: 3);
    }
  }

  @action
  Future<void> getCreditLimit() async {
    try {
      // Reset the possible previous error message.
      errorMessage = null;
      // Fetch from the repository and wrap the regular Future into an observable.
      await _infoRepository.updateCredit().then(
        (result) {
          result.fold(
            (failure) {
              setErrorMsg(msg: failure.message, showOnce: true);
              getAppGlobalStreams.resetCredit();
            },
            (value) {
              getAppGlobalStreams.updateCredit(value);
              creditLimit = value.strToDouble;
            },
          );
        },
      ).whenComplete(() => debugPrint('credit limit: $creditLimit'));
    } on Exception {
      setErrorMsg(code: 4);
    }
  }

  @action
  Future<void> postTransfer(TransferForm form) async {
    try {
      // Reset the possible previous error message.
      errorMessage = null;
      transferResult = null;
      // ObservableFuture extends Future - it can be awaited and exceptions will propagate as usual.
      await _repository
          .postTransfer(form)
          .whenComplete(() => waitForTransferResult = false)
          .then((result) {
        debugPrint('transfer from ${form.from} to ${form.to} result: $result');
        result.fold(
          (failure) => setErrorMsg(msg: failure.message, showOnce: true),
          (data) {
            transferResult = data;
            if (data.isSuccess) {
              Future.delayed(Duration(milliseconds: 500), () {
                (form.from == '0')
                    ? getBalance(form.to)
                    : getBalance(form.from);
                getCreditLimit();
              });
            }
          },
        );
      });
    } on Exception {
      waitForTransferResult = false;
      setErrorMsg(code: 5);
    }
  }

  @action
  Future<void> exeGridAction(BalanceGridAction action, String platform) async {
    debugPrint('execute $platform grid action: $action');
    if (action == BalanceGridAction.transferIn ||
        action == BalanceGridAction.transferOut) waitForTransferResult = true;

    switch (action) {
      case BalanceGridAction.transferIn:
        debugPrint('account limit: $creditLimit');
        if (creditLimit > 1) {
          postTransfer(
            TransferForm(
              from: '0',
              to: platform,
              amount: '${creditLimit.floor()}',
            ),
          );
        } else {
          waitForTransferResult = false;
          errorMessage =
              localeStr.balanceTransferAmountError('$creditSymbol$creditLimit');
        }
        break;
      case BalanceGridAction.transferOut:
        var credit = balanceMap[platform].strToDouble;
        debugPrint('platform limit: $credit');
        if (credit >= 1) {
          postTransfer(
            TransferForm(
              from: platform,
              to: '0',
              amount: '${credit.floor()}',
            ),
          );
        } else {
          waitForTransferResult = false;
          errorMessage =
              localeStr.balanceTransferAmountError('$creditSymbol$credit');
        }
        break;
      case BalanceGridAction.refresh:
        getBalance(platform);
        break;
    }
  }

  Future<void> closeStreams() {
    try {
      _cancelRequest = true;
      return Future.wait([
        _loadingController.close(),
      ]);
    } catch (e) {
      MyLogger.warn(
          msg: 'close balance stream error', error: e, tag: 'BalanceStore');
      return null;
    }
  }
}
