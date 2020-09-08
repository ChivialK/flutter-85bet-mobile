// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UpdateStore on _UpdateStore, Store {
  final _$errorMessageAtom = Atom(name: '_UpdateStore.errorMessage');

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

  final _$getVersionAsyncAction = AsyncAction('_UpdateStore.getVersion');

  @override
  Future<bool> getVersion() {
    return _$getVersionAsyncAction.run(() => super.getVersion());
  }

  @override
  String toString() {
    return '''
errorMessage: ${errorMessage}
    ''';
  }
}
