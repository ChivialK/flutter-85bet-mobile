// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegisterStore on _RegisterStore, Store {
  Computed<RegisterStoreState> _$stateComputed;

  @override
  RegisterStoreState get state =>
      (_$stateComputed ??= Computed<RegisterStoreState>(() => super.state,
              name: '_RegisterStore.state'))
          .value;

  final _$_initFutureAtom = Atom(name: '_RegisterStore._initFuture');

  @override
  ObservableFuture<dynamic> get _initFuture {
    _$_initFutureAtom.reportRead();
    return super._initFuture;
  }

  @override
  set _initFuture(ObservableFuture<dynamic> value) {
    _$_initFutureAtom.reportWrite(value, super._initFuture, () {
      super._initFuture = value;
    });
  }

  final _$captchaDataAtom = Atom(name: '_RegisterStore.captchaData');

  @override
  CaptchaData get captchaData {
    _$captchaDataAtom.reportRead();
    return super.captchaData;
  }

  @override
  set captchaData(CaptchaData value) {
    _$captchaDataAtom.reportWrite(value, super.captchaData, () {
      super.captchaData = value;
    });
  }

  final _$registerResultAtom = Atom(name: '_RegisterStore.registerResult');

  @override
  RequestStatusModel get registerResult {
    _$registerResultAtom.reportRead();
    return super.registerResult;
  }

  @override
  set registerResult(RequestStatusModel value) {
    _$registerResultAtom.reportWrite(value, super.registerResult, () {
      super.registerResult = value;
    });
  }

  final _$waitForRegisterAtom = Atom(name: '_RegisterStore.waitForRegister');

  @override
  bool get waitForRegister {
    _$waitForRegisterAtom.reportRead();
    return super.waitForRegister;
  }

  @override
  set waitForRegister(bool value) {
    _$waitForRegisterAtom.reportWrite(value, super.waitForRegister, () {
      super.waitForRegister = value;
    });
  }

  final _$errorMessageAtom = Atom(name: '_RegisterStore.errorMessage');

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

  final _$initializeAsyncAction = AsyncAction('_RegisterStore.initialize');

  @override
  Future<void> initialize() {
    return _$initializeAsyncAction.run(() => super.initialize());
  }

  final _$getCaptchaAsyncAction = AsyncAction('_RegisterStore.getCaptcha');

  @override
  Future<void> getCaptcha() {
    return _$getCaptchaAsyncAction.run(() => super.getCaptcha());
  }

  final _$postRegisterAsyncAction = AsyncAction('_RegisterStore.postRegister');

  @override
  Future<void> postRegister(RegisterForm form, String captcha) {
    return _$postRegisterAsyncAction
        .run(() => super.postRegister(form, captcha));
  }

  final _$postLoginAsyncAction = AsyncAction('_RegisterStore.postLogin');

  @override
  Future<void> postLogin(LoginForm form) {
    return _$postLoginAsyncAction.run(() => super.postLogin(form));
  }

  @override
  String toString() {
    return '''
captchaData: ${captchaData},
registerResult: ${registerResult},
waitForRegister: ${waitForRegister},
errorMessage: ${errorMessage},
state: ${state}
    ''';
  }
}
