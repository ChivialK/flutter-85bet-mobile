// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegisterStore on _RegisterStore, Store {
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

  final _$postRegisterAsyncAction = AsyncAction('_RegisterStore.postRegister');

  @override
  Future<void> postRegister(RegisterForm form) {
    return _$postRegisterAsyncAction.run(() => super.postRegister(form));
  }

  final _$postLoginAsyncAction = AsyncAction('_RegisterStore.postLogin');

  @override
  Future<void> postLogin(LoginForm form) {
    return _$postLoginAsyncAction.run(() => super.postLogin(form));
  }

  final _$sendVerifyAsyncAction = AsyncAction('_RegisterStore.sendVerify');

  @override
  Future<bool> sendVerify(MobileVerifyForm form) {
    return _$sendVerifyAsyncAction.run(() => super.sendVerify(form));
  }

  @override
  String toString() {
    return '''
registerResult: ${registerResult},
waitForRegister: ${waitForRegister},
errorMessage: ${errorMessage}
    ''';
  }
}
