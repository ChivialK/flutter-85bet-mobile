// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vip_level_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$VipLevelStore on _VipLevelStore, Store {
  Computed<VipLevelStoreState> _$stateComputed;

  @override
  VipLevelStoreState get state =>
      (_$stateComputed ??= Computed<VipLevelStoreState>(() => super.state,
              name: '_VipLevelStore.state'))
          .value;

  final _$_initFutureAtom = Atom(name: '_VipLevelStore._initFuture');

  @override
  ObservableFuture<List<dynamic>> get _initFuture {
    _$_initFutureAtom.reportRead();
    return super._initFuture;
  }

  @override
  set _initFuture(ObservableFuture<List<dynamic>> value) {
    _$_initFutureAtom.reportWrite(value, super._initFuture, () {
      super._initFuture = value;
    });
  }

  final _$errorMessageAtom = Atom(name: '_VipLevelStore.errorMessage');

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

  final _$initializeAsyncAction = AsyncAction('_VipLevelStore.initialize');

  @override
  Future<void> initialize() {
    return _$initializeAsyncAction.run(() => super.initialize());
  }

  final _$getLevelAsyncAction = AsyncAction('_VipLevelStore.getLevel');

  @override
  Future<void> getLevel() {
    return _$getLevelAsyncAction.run(() => super.getLevel());
  }

  final _$getRulesAsyncAction = AsyncAction('_VipLevelStore.getRules');

  @override
  Future<void> getRules() {
    return _$getRulesAsyncAction.run(() => super.getRules());
  }

  @override
  String toString() {
    return '''
errorMessage: ${errorMessage},
state: ${state}
    ''';
  }
}
