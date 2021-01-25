// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TransferStore on _TransferStore, Store {
  Computed<TransferStoreState> _$stateComputed;

  @override
  TransferStoreState get state =>
      (_$stateComputed ??= Computed<TransferStoreState>(() => super.state,
              name: '_TransferStore.state'))
          .value;

  final _$_platformFutureAtom = Atom(name: '_TransferStore._platformFuture');

  @override
  ObservableFuture<Either<Failure, TransferPlatformList>> get _platformFuture {
    _$_platformFutureAtom.reportRead();
    return super._platformFuture;
  }

  @override
  set _platformFuture(
      ObservableFuture<Either<Failure, TransferPlatformList>> value) {
    _$_platformFutureAtom.reportWrite(value, super._platformFuture, () {
      super._platformFuture = value;
    });
  }

  final _$platformsAtom = Atom(name: '_TransferStore.platforms');

  @override
  List<TransferPlatformModel> get platforms {
    _$platformsAtom.reportRead();
    return super.platforms;
  }

  @override
  set platforms(List<TransferPlatformModel> value) {
    _$platformsAtom.reportWrite(value, super.platforms, () {
      super.platforms = value;
    });
  }

  final _$transferResultAtom = Atom(name: '_TransferStore.transferResult');

  @override
  TransferResultModel get transferResult {
    _$transferResultAtom.reportRead();
    return super.transferResult;
  }

  @override
  set transferResult(TransferResultModel value) {
    _$transferResultAtom.reportWrite(value, super.transferResult, () {
      super.transferResult = value;
    });
  }

  final _$waitForTransferResultAtom =
      Atom(name: '_TransferStore.waitForTransferResult');

  @override
  bool get waitForTransferResult {
    _$waitForTransferResultAtom.reportRead();
    return super.waitForTransferResult;
  }

  @override
  set waitForTransferResult(bool value) {
    _$waitForTransferResultAtom.reportWrite(value, super.waitForTransferResult,
        () {
      super.waitForTransferResult = value;
    });
  }

  final _$errorMessageAtom = Atom(name: '_TransferStore.errorMessage');

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  final _$getPlatformsAsyncAction = AsyncAction('_TransferStore.getPlatforms');

  @override
  Future<void> getPlatforms() {
    return _$getPlatformsAsyncAction.run(() => super.getPlatforms());
  }

  final _$getBalanceAsyncAction = AsyncAction('_TransferStore.getBalance');

  @override
  Future<void> getBalance(String site,
      {bool isLimit = false, bool retryOnce = false}) {
    return _$getBalanceAsyncAction.run(
        () => super.getBalance(site, isLimit: isLimit, retryOnce: retryOnce));
  }

  final _$sendRequestAsyncAction = AsyncAction('_TransferStore.sendRequest');

  @override
  Future<void> sendRequest(TransferForm form) {
    return _$sendRequestAsyncAction.run(() => super.sendRequest(form));
  }

  @override
  String toString() {
    return '''
platforms: ${platforms},
transferResult: ${transferResult},
waitForTransferResult: ${waitForTransferResult},
errorMessage: ${errorMessage},
state: ${state}
    ''';
  }
}
