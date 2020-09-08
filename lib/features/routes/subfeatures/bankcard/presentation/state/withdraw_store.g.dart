// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'withdraw_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$WithdrawStore on _WithdrawStore, Store {
  Computed<WithdrawStoreState> _$stateComputed;

  @override
  WithdrawStoreState get state =>
      (_$stateComputed ??= Computed<WithdrawStoreState>(() => super.state,
              name: '_WithdrawStore.state'))
          .value;

  final _$_cgpFutureAtom = Atom(name: '_WithdrawStore._cgpFuture');

  @override
  ObservableFuture<Either<Failure, String>> get _cgpFuture {
    _$_cgpFutureAtom.reportRead();
    return super._cgpFuture;
  }

  @override
  set _cgpFuture(ObservableFuture<Either<Failure, String>> value) {
    _$_cgpFutureAtom.reportWrite(value, super._cgpFuture, () {
      super._cgpFuture = value;
    });
  }

  final _$_cpwFutureAtom = Atom(name: '_WithdrawStore._cpwFuture');

  @override
  ObservableFuture<Either<Failure, String>> get _cpwFuture {
    _$_cpwFutureAtom.reportRead();
    return super._cpwFuture;
  }

  @override
  set _cpwFuture(ObservableFuture<Either<Failure, String>> value) {
    _$_cpwFutureAtom.reportWrite(value, super._cpwFuture, () {
      super._cpwFuture = value;
    });
  }

  final _$waitForWithdrawResultAtom =
      Atom(name: '_WithdrawStore.waitForWithdrawResult');

  @override
  bool get waitForWithdrawResult {
    _$waitForWithdrawResultAtom.reportRead();
    return super.waitForWithdrawResult;
  }

  @override
  set waitForWithdrawResult(bool value) {
    _$waitForWithdrawResultAtom.reportWrite(value, super.waitForWithdrawResult,
        () {
      super.waitForWithdrawResult = value;
    });
  }

  final _$withdrawResultAtom = Atom(name: '_WithdrawStore.withdrawResult');

  @override
  WithdrawModel get withdrawResult {
    _$withdrawResultAtom.reportRead();
    return super.withdrawResult;
  }

  @override
  set withdrawResult(WithdrawModel value) {
    _$withdrawResultAtom.reportWrite(value, super.withdrawResult, () {
      super.withdrawResult = value;
    });
  }

  final _$errorMessageAtom = Atom(name: '_WithdrawStore.errorMessage');

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

  final _$getCgpWalletAsyncAction = AsyncAction('_WithdrawStore.getCgpWallet');

  @override
  Future<void> getCgpWallet() {
    return _$getCgpWalletAsyncAction.run(() => super.getCgpWallet());
  }

  final _$getCpwWalletAsyncAction = AsyncAction('_WithdrawStore.getCpwWallet');

  @override
  Future<void> getCpwWallet() {
    return _$getCpwWalletAsyncAction.run(() => super.getCpwWallet());
  }

  final _$getRollbackAsyncAction = AsyncAction('_WithdrawStore.getRollback');

  @override
  Future<void> getRollback() {
    return _$getRollbackAsyncAction.run(() => super.getRollback());
  }

  final _$sendRequestAsyncAction = AsyncAction('_WithdrawStore.sendRequest');

  @override
  Future<void> sendRequest(WithdrawForm form) {
    return _$sendRequestAsyncAction.run(() => super.sendRequest(form));
  }

  @override
  String toString() {
    return '''
waitForWithdrawResult: $waitForWithdrawResult,
withdrawResult: $withdrawResult,
errorMessage: $errorMessage,
state: $state
    ''';
  }
}
