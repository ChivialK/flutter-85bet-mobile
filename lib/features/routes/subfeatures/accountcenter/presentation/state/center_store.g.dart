// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'center_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CenterStore on _CenterStore, Store {
  Computed<CenterStoreState> _$stateComputed;

  @override
  CenterStoreState get state =>
      (_$stateComputed ??= Computed<CenterStoreState>(() => super.state,
              name: '_CenterStore.state'))
          .value;

  final _$_accountFutureAtom = Atom(name: '_CenterStore._accountFuture');

  @override
  ObservableFuture<Either<Failure, CenterModel>> get _accountFuture {
    _$_accountFutureAtom.reportRead();
    return super._accountFuture;
  }

  @override
  set _accountFuture(ObservableFuture<Either<Failure, CenterModel>> value) {
    _$_accountFutureAtom.reportWrite(value, super._accountFuture, () {
      super._accountFuture = value;
    });
  }

  final _$accountDataReadyAtom = Atom(name: '_CenterStore.accountDataReady');

  @override
  bool get accountDataReady {
    _$accountDataReadyAtom.reportRead();
    return super.accountDataReady;
  }

  @override
  set accountDataReady(bool value) {
    _$accountDataReadyAtom.reportWrite(value, super.accountDataReady, () {
      super.accountDataReady = value;
    });
  }

  final _$waitForResponseAtom = Atom(name: '_CenterStore.waitForResponse');

  @override
  bool get waitForResponse {
    _$waitForResponseAtom.reportRead();
    return super.waitForResponse;
  }

  @override
  set waitForResponse(bool value) {
    _$waitForResponseAtom.reportWrite(value, super.waitForResponse, () {
      super.waitForResponse = value;
    });
  }

  final _$requestResponseAtom = Atom(name: '_CenterStore.requestResponse');

  @override
  dynamic get requestResponse {
    _$requestResponseAtom.reportRead();
    return super.requestResponse;
  }

  @override
  set requestResponse(dynamic value) {
    _$requestResponseAtom.reportWrite(value, super.requestResponse, () {
      super.requestResponse = value;
    });
  }

  final _$errorMessageAtom = Atom(name: '_CenterStore.errorMessage');

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

  final _$getAccountAsyncAction = AsyncAction('_CenterStore.getAccount');

  @override
  Future<void> getAccount() {
    return _$getAccountAsyncAction.run(() => super.getAccount());
  }

  final _$getCgpUrlAsyncAction = AsyncAction('_CenterStore.getCgpUrl');

  @override
  Future<void> getCgpUrl() {
    return _$getCgpUrlAsyncAction.run(() => super.getCgpUrl());
  }

  final _$getCpwUrlAsyncAction = AsyncAction('_CenterStore.getCpwUrl');

  @override
  Future<void> getCpwUrl() {
    return _$getCpwUrlAsyncAction.run(() => super.getCpwUrl());
  }

  final _$initLoginDataBoxAsyncAction =
      AsyncAction('_CenterStore.initLoginDataBox');

  @override
  Future<void> initLoginDataBox() {
    return _$initLoginDataBoxAsyncAction.run(() => super.initLoginDataBox());
  }

  final _$postPasswordAsyncAction = AsyncAction('_CenterStore.postPassword');

  @override
  Future<void> postPassword(CenterPasswordForm form) {
    return _$postPasswordAsyncAction.run(() => super.postPassword(form));
  }

  final _$_postStringDataAsyncAction =
      AsyncAction('_CenterStore._postStringData');

  @override
  Future<void> _postStringData(String data, CenterStoreAction action,
      CenterFutureTask task, Function callback) {
    return _$_postStringDataAsyncAction
        .run(() => super._postStringData(data, action, task, callback));
  }

  final _$postLuckyAsyncAction = AsyncAction('_CenterStore.postLucky');

  @override
  Future<void> postLucky(List<int> numbers) {
    return _$postLuckyAsyncAction.run(() => super.postLucky(numbers));
  }

  final _$postVerifyRequestAsyncAction =
      AsyncAction('_CenterStore.postVerifyRequest');

  @override
  Future<void> postVerifyRequest(String mobile) {
    return _$postVerifyRequestAsyncAction
        .run(() => super.postVerifyRequest(mobile));
  }

  final _$postVerifyAsyncAction = AsyncAction('_CenterStore.postVerify');

  @override
  Future<void> postVerify(String mobile, String code) {
    return _$postVerifyAsyncAction.run(() => super.postVerify(mobile, code));
  }

  @override
  String toString() {
    return '''
accountDataReady: $accountDataReady,
waitForResponse: $waitForResponse,
requestResponse: $requestResponse,
errorMessage: $errorMessage,
state: $state
    ''';
  }
}
