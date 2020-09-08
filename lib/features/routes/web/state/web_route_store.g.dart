// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'web_route_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$WebRouteStore on _WebRouteStore, Store {
  Computed<WebRouteStoreState> _$stateComputed;

  @override
  WebRouteStoreState get state =>
      (_$stateComputed ??= Computed<WebRouteStoreState>(() => super.state,
              name: '_WebRouteStore.state'))
          .value;

  final _$_descFutureAtom = Atom(name: '_WebRouteStore._descFuture');

  @override
  ObservableFuture<String> get _descFuture {
    _$_descFutureAtom.reportRead();
    return super._descFuture;
  }

  @override
  set _descFuture(ObservableFuture<String> value) {
    _$_descFutureAtom.reportWrite(value, super._descFuture, () {
      super._descFuture = value;
    });
  }

  final _$descAtom = Atom(name: '_WebRouteStore.desc');

  @override
  String get desc {
    _$descAtom.reportRead();
    return super.desc;
  }

  @override
  set desc(String value) {
    _$descAtom.reportWrite(value, super.desc, () {
      super.desc = value;
    });
  }

  final _$errorMessageAtom = Atom(name: '_WebRouteStore.errorMessage');

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

  final _$getDescAsyncAction = AsyncAction('_WebRouteStore.getDesc');

  @override
  Future<dynamic> getDesc() {
    return _$getDescAsyncAction.run(() => super.getDesc());
  }

  @override
  String toString() {
    return '''
desc: $desc,
errorMessage: $errorMessage,
state: $state
    ''';
  }
}
