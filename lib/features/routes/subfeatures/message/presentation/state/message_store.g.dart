// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MessageStore on _MessageStore, Store {
  Computed<MessageStoreState> _$stateComputed;

  @override
  MessageStoreState get state =>
      (_$stateComputed ??= Computed<MessageStoreState>(() => super.state,
              name: '_MessageStore.state'))
          .value;

  final _$_dataFutureAtom = Atom(name: '_MessageStore._dataFuture');

  @override
  ObservableFuture<Either<Failure, List<MessageModel>>> get _dataFuture {
    _$_dataFutureAtom.reportRead();
    return super._dataFuture;
  }

  @override
  set _dataFuture(ObservableFuture<Either<Failure, List<MessageModel>>> value) {
    _$_dataFutureAtom.reportWrite(value, super._dataFuture, () {
      super._dataFuture = value;
    });
  }

  final _$errorMessageAtom = Atom(name: '_MessageStore.errorMessage');

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

  final _$getDataAsyncAction = AsyncAction('_MessageStore.getData');

  @override
  Future<dynamic> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  final _$updateMessageStatusAsyncAction =
      AsyncAction('_MessageStore.updateMessageStatus');

  @override
  Future<dynamic> updateMessageStatus(int id) {
    return _$updateMessageStatusAsyncAction
        .run(() => super.updateMessageStatus(id));
  }

  @override
  String toString() {
    return '''
errorMessage: $errorMessage,
state: $state
    ''';
  }
}
