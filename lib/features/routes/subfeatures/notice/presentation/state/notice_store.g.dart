// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notice_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NoticeStore on _NoticeStore, Store {
  Computed<NoticeStoreState> _$stateComputed;

  @override
  NoticeStoreState get state =>
      (_$stateComputed ??= Computed<NoticeStoreState>(() => super.state,
              name: '_NoticeStore.state'))
          .value;

  final _$_dataFutureAtom = Atom(name: '_NoticeStore._dataFuture');

  @override
  ObservableFuture<Either<Failure, NoticeModel>> get _dataFuture {
    _$_dataFutureAtom.reportRead();
    return super._dataFuture;
  }

  @override
  set _dataFuture(ObservableFuture<Either<Failure, NoticeModel>> value) {
    _$_dataFutureAtom.reportWrite(value, super._dataFuture, () {
      super._dataFuture = value;
    });
  }

  final _$errorMessageAtom = Atom(name: '_NoticeStore.errorMessage');

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

  final _$getDataAsyncAction = AsyncAction('_NoticeStore.getData');

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  @override
  String toString() {
    return '''
errorMessage: ${errorMessage},
state: ${state}
    ''';
  }
}
