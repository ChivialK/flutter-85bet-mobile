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

  final _$_levelFutureAtom = Atom(name: '_VipLevelStore._levelFuture');

  @override
  ObservableFuture<Either<Failure, VipLevelModel>> get _levelFuture {
    _$_levelFutureAtom.reportRead();
    return super._levelFuture;
  }

  @override
  set _levelFuture(ObservableFuture<Either<Failure, VipLevelModel>> value) {
    _$_levelFutureAtom.reportWrite(value, super._levelFuture, () {
      super._levelFuture = value;
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

  final _$getLevelAsyncAction = AsyncAction('_VipLevelStore.getLevel');

  @override
  Future<void> getLevel() {
    return _$getLevelAsyncAction.run(() => super.getLevel());
  }

  @override
  String toString() {
    return '''
errorMessage: ${errorMessage},
state: ${state}
    ''';
  }
}
