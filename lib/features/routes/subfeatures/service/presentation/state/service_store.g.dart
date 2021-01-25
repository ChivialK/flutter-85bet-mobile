// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ServiceStore on _ServiceStore, Store {
  Computed<ServiceStoreState> _$stateComputed;

  @override
  ServiceStoreState get state =>
      (_$stateComputed ??= Computed<ServiceStoreState>(() => super.state,
              name: '_ServiceStore.state'))
          .value;

  final _$_dataFutureAtom = Atom(name: '_ServiceStore._dataFuture');

  @override
  ObservableFuture<Either<Failure, ServiceModel>> get _dataFuture {
    _$_dataFutureAtom.reportRead();
    return super._dataFuture;
  }

  @override
  set _dataFuture(ObservableFuture<Either<Failure, ServiceModel>> value) {
    _$_dataFutureAtom.reportWrite(value, super._dataFuture, () {
      super._dataFuture = value;
    });
  }

  final _$dataAtom = Atom(name: '_ServiceStore.data');

  @override
  ServiceModel get data {
    _$dataAtom.reportRead();
    return super.data;
  }

  @override
  set data(ServiceModel value) {
    _$dataAtom.reportWrite(value, super.data, () {
      super.data = value;
    });
  }

  final _$errorMessageAtom = Atom(name: '_ServiceStore.errorMessage');

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

  final _$getWebsiteListAsyncAction =
      AsyncAction('_ServiceStore.getWebsiteList');

  @override
  Future<void> getWebsiteList() {
    return _$getWebsiteListAsyncAction.run(() => super.getWebsiteList());
  }

  @override
  String toString() {
    return '''
data: ${data},
errorMessage: ${errorMessage},
state: ${state}
    ''';
  }
}
