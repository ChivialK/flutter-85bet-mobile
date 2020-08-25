// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bet_record_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BetRecordStore on _BetRecordStore, Store {
  Computed<BetRecordStoreState> _$stateComputed;

  @override
  BetRecordStoreState get state =>
      (_$stateComputed ??= Computed<BetRecordStoreState>(() => super.state,
              name: '_BetRecordStore.state'))
          .value;

  final _$_typeFutureAtom = Atom(name: '_BetRecordStore._typeFuture');

  @override
  ObservableFuture<Either<Failure, List<BetRecordTypeModel>>> get _typeFuture {
    _$_typeFutureAtom.reportRead();
    return super._typeFuture;
  }

  @override
  set _typeFuture(
      ObservableFuture<Either<Failure, List<BetRecordTypeModel>>> value) {
    _$_typeFutureAtom.reportWrite(value, super._typeFuture, () {
      super._typeFuture = value;
    });
  }

  final _$errorMessageAtom = Atom(name: '_BetRecordStore.errorMessage');

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

  final _$waitForRecordResponseAtom =
      Atom(name: '_BetRecordStore.waitForRecordResponse');

  @override
  bool get waitForRecordResponse {
    _$waitForRecordResponseAtom.reportRead();
    return super.waitForRecordResponse;
  }

  @override
  set waitForRecordResponse(bool value) {
    _$waitForRecordResponseAtom.reportWrite(value, super.waitForRecordResponse,
        () {
      super.waitForRecordResponse = value;
    });
  }

  final _$getTypesAsyncAction = AsyncAction('_BetRecordStore.getTypes');

  @override
  Future<void> getTypes() {
    return _$getTypesAsyncAction.run(() => super.getTypes());
  }

  final _$getRecordAsyncAction = AsyncAction('_BetRecordStore.getRecord');

  @override
  Future<void> getRecord(BetRecordForm form) {
    return _$getRecordAsyncAction.run(() => super.getRecord(form));
  }

  @override
  String toString() {
    return '''
errorMessage: $errorMessage,
waitForRecordResponse: $waitForRecordResponse,
state: $state
    ''';
  }
}
