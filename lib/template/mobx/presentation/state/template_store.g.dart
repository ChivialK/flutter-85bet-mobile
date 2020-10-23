// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'template_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TemplateStore on _TemplateStore, Store {
  Computed<StoreState> _$stateComputed;

  @override
  StoreState get state => (_$stateComputed ??=
          Computed<StoreState>(() => super.state, name: '_TemplateStore.state'))
      .value;

  final _$_descFutureAtom = Atom(name: '_TemplateStore._descFuture');

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

  final _$descriptionAtom = Atom(name: '_TemplateStore.description');

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  final _$errorMessageAtom = Atom(name: '_TemplateStore.errorMessage');

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

  final _$getDescriptionAsyncAction =
      AsyncAction('_TemplateStore.getDescription');

  @override
  Future<void> getDescription() {
    return _$getDescriptionAsyncAction.run(() => super.getDescription());
  }

  @override
  String toString() {
    return '''
description: ${description},
errorMessage: ${errorMessage},
state: ${state}
    ''';
  }
}
