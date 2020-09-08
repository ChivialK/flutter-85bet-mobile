// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EventStore on _EventStore, Store {
  final _$hasNewMessageAtom = Atom(name: '_EventStore.hasNewMessage');

  @override
  bool get hasNewMessage {
    _$hasNewMessageAtom.reportRead();
    return super.hasNewMessage;
  }

  @override
  set hasNewMessage(bool value) {
    _$hasNewMessageAtom.reportWrite(value, super.hasNewMessage, () {
      super.hasNewMessage = value;
    });
  }

  final _$errorMessageAtom = Atom(name: '_EventStore.errorMessage');

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

  final _$getWebsiteListAsyncAction = AsyncAction('_EventStore.getWebsiteList');

  @override
  Future<void> getWebsiteList() {
    return _$getWebsiteListAsyncAction.run(() => super.getWebsiteList());
  }

  final _$getNewMessageCountAsyncAction =
      AsyncAction('_EventStore.getNewMessageCount');

  @override
  Future<void> getNewMessageCount() {
    return _$getNewMessageCountAsyncAction
        .run(() => super.getNewMessageCount());
  }

  final _$getAdsAsyncAction = AsyncAction('_EventStore.getAds');

  @override
  Future<void> getAds() {
    return _$getAdsAsyncAction.run(() => super.getAds());
  }

  @override
  String toString() {
    return '''
hasNewMessage: ${hasNewMessage},
errorMessage: ${errorMessage}
    ''';
  }
}
