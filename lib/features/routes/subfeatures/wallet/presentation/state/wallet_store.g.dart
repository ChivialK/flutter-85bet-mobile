// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$WalletStore on _WalletStore, Store {
  Computed<WalletStoreState> _$stateComputed;

  @override
  WalletStoreState get state =>
      (_$stateComputed ??= Computed<WalletStoreState>(() => super.state,
              name: '_WalletStore.state'))
          .value;

  final _$_walletFutureAtom = Atom(name: '_WalletStore._walletFuture');

  @override
  ObservableFuture<Either<Failure, WalletModel>> get _walletFuture {
    _$_walletFutureAtom.reportRead();
    return super._walletFuture;
  }

  @override
  set _walletFuture(ObservableFuture<Either<Failure, WalletModel>> value) {
    _$_walletFutureAtom.reportWrite(value, super._walletFuture, () {
      super._walletFuture = value;
    });
  }

  final _$walletAtom = Atom(name: '_WalletStore.wallet');

  @override
  WalletModel get wallet {
    _$walletAtom.reportRead();
    return super.wallet;
  }

  @override
  set wallet(WalletModel value) {
    _$walletAtom.reportWrite(value, super.wallet, () {
      super.wallet = value;
    });
  }

  final _$changeSuccessAtom = Atom(name: '_WalletStore.changeSuccess');

  @override
  bool get changeSuccess {
    _$changeSuccessAtom.reportRead();
    return super.changeSuccess;
  }

  @override
  set changeSuccess(bool value) {
    _$changeSuccessAtom.reportWrite(value, super.changeSuccess, () {
      super.changeSuccess = value;
    });
  }

  final _$waitForTypeChangeAtom = Atom(name: '_WalletStore.waitForTypeChange');

  @override
  bool get waitForTypeChange {
    _$waitForTypeChangeAtom.reportRead();
    return super.waitForTypeChange;
  }

  @override
  set waitForTypeChange(bool value) {
    _$waitForTypeChangeAtom.reportWrite(value, super.waitForTypeChange, () {
      super.waitForTypeChange = value;
    });
  }

  final _$waitForTransferAtom = Atom(name: '_WalletStore.waitForTransfer');

  @override
  bool get waitForTransfer {
    _$waitForTransferAtom.reportRead();
    return super.waitForTransfer;
  }

  @override
  set waitForTransfer(bool value) {
    _$waitForTransferAtom.reportWrite(value, super.waitForTransfer, () {
      super.waitForTransfer = value;
    });
  }

  final _$transferProgressAtom = Atom(name: '_WalletStore.transferProgress');

  @override
  String get transferProgress {
    _$transferProgressAtom.reportRead();
    return super.transferProgress;
  }

  @override
  set transferProgress(String value) {
    _$transferProgressAtom.reportWrite(value, super.transferProgress, () {
      super.transferProgress = value;
    });
  }

  final _$transferSuccessAtom = Atom(name: '_WalletStore.transferSuccess');

  @override
  bool get transferSuccess {
    _$transferSuccessAtom.reportRead();
    return super.transferSuccess;
  }

  @override
  set transferSuccess(bool value) {
    _$transferSuccessAtom.reportWrite(value, super.transferSuccess, () {
      super.transferSuccess = value;
    });
  }

  final _$errorMessageAtom = Atom(name: '_WalletStore.errorMessage');

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

  final _$getWalletAsyncAction = AsyncAction('_WalletStore.getWallet');

  @override
  Future<dynamic> getWallet() {
    return _$getWalletAsyncAction.run(() => super.getWallet());
  }

  final _$updateCreditAsyncAction = AsyncAction('_WalletStore.updateCredit');

  @override
  Future<dynamic> updateCredit() {
    return _$updateCreditAsyncAction.run(() => super.updateCredit());
  }

  final _$postWalletTypeAsyncAction =
      AsyncAction('_WalletStore.postWalletType');

  @override
  Future<dynamic> postWalletType(bool toSingle) {
    return _$postWalletTypeAsyncAction
        .run(() => super.postWalletType(toSingle));
  }

  final _$postWalletTransferAsyncAction =
      AsyncAction('_WalletStore.postWalletTransfer');

  @override
  Future<dynamic> postWalletTransfer() {
    return _$postWalletTransferAsyncAction
        .run(() => super.postWalletTransfer());
  }

  @override
  String toString() {
    return '''
wallet: ${wallet},
changeSuccess: ${changeSuccess},
waitForTypeChange: ${waitForTypeChange},
waitForTransfer: ${waitForTransfer},
transferProgress: ${transferProgress},
transferSuccess: ${transferSuccess},
errorMessage: ${errorMessage},
state: ${state}
    ''';
  }
}
