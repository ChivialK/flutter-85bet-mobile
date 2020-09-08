// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balance_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BalanceStore on _BalanceStore, Store {
  Computed<BalanceStoreState> _$stateComputed;

  @override
  BalanceStoreState get state =>
      (_$stateComputed ??= Computed<BalanceStoreState>(() => super.state,
              name: '_BalanceStore.state'))
          .value;

  final _$_promiseFutureAtom = Atom(name: '_BalanceStore._promiseFuture');

  @override
  ObservableFuture<Either<Failure, List<String>>> get _promiseFuture {
    _$_promiseFutureAtom.reportRead();
    return super._promiseFuture;
  }

  @override
  set _promiseFuture(ObservableFuture<Either<Failure, List<String>>> value) {
    _$_promiseFutureAtom.reportWrite(value, super._promiseFuture, () {
      super._promiseFuture = value;
    });
  }

  final _$balanceUpdatedAtom = Atom(name: '_BalanceStore.balanceUpdated');

  @override
  String get balanceUpdated {
    _$balanceUpdatedAtom.reportRead();
    return super.balanceUpdated;
  }

  @override
  set balanceUpdated(String value) {
    _$balanceUpdatedAtom.reportWrite(value, super.balanceUpdated, () {
      super.balanceUpdated = value;
    });
  }

  final _$transferResultAtom = Atom(name: '_BalanceStore.transferResult');

  @override
  RequestStatusModel get transferResult {
    _$transferResultAtom.reportRead();
    return super.transferResult;
  }

  @override
  set transferResult(RequestStatusModel value) {
    _$transferResultAtom.reportWrite(value, super.transferResult, () {
      super.transferResult = value;
    });
  }

  final _$waitForTransferResultAtom =
      Atom(name: '_BalanceStore.waitForTransferResult');

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

  final _$errorMessageAtom = Atom(name: '_BalanceStore.errorMessage');

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

  final _$getPromisesAsyncAction = AsyncAction('_BalanceStore.getPromises');

  @override
  Future<void> getPromises() {
    return _$getPromisesAsyncAction.run(() => super.getPromises());
  }

  final _$getBalancesAsyncAction = AsyncAction('_BalanceStore.getBalances');

  @override
  Future<void> getBalances() {
    return _$getBalancesAsyncAction.run(() => super.getBalances());
  }

  final _$getBalanceAsyncAction = AsyncAction('_BalanceStore.getBalance');

  @override
  Future<void> getBalance(String platform, {bool showProgress = false}) {
    return _$getBalanceAsyncAction
        .run(() => super.getBalance(platform, showProgress: showProgress));
  }

  final _$getCreditLimitAsyncAction =
      AsyncAction('_BalanceStore.getCreditLimit');

  @override
  Future<void> getCreditLimit() {
    return _$getCreditLimitAsyncAction.run(() => super.getCreditLimit());
  }

  final _$postTransferAsyncAction = AsyncAction('_BalanceStore.postTransfer');

  @override
  Future<void> postTransfer(TransferForm form) {
    return _$postTransferAsyncAction.run(() => super.postTransfer(form));
  }

  final _$exeGridActionAsyncAction = AsyncAction('_BalanceStore.exeGridAction');

  @override
  Future<void> exeGridAction(BalanceGridAction action, String platform) {
    return _$exeGridActionAsyncAction
        .run(() => super.exeGridAction(action, platform));
  }

  @override
  String toString() {
    return '''
balanceUpdated: ${balanceUpdated},
transferResult: ${transferResult},
waitForTransferResult: ${waitForTransferResult},
errorMessage: ${errorMessage},
state: ${state}
    ''';
  }
}
