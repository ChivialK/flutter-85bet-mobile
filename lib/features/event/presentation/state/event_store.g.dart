// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EventStore on _EventStore, Store {
  final _$showEventOnHomeAtom = Atom(name: '_EventStore.showEventOnHome');

  @override
  bool get showEventOnHome {
    _$showEventOnHomeAtom.reportRead();
    return super.showEventOnHome;
  }

  @override
  set showEventOnHome(bool value) {
    _$showEventOnHomeAtom.reportWrite(value, super.showEventOnHome, () {
      super.showEventOnHome = value;
    });
  }

  final _$hasSignedEventAtom = Atom(name: '_EventStore.hasSignedEvent');

  @override
  bool get hasSignedEvent {
    _$hasSignedEventAtom.reportRead();
    return super.hasSignedEvent;
  }

  @override
  set hasSignedEvent(bool value) {
    _$hasSignedEventAtom.reportWrite(value, super.hasSignedEvent, () {
      super.hasSignedEvent = value;
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

  final _$getUserCreditAsyncAction = AsyncAction('_EventStore.getUserCredit');

  @override
  Future<void> getUserCredit() {
    return _$getUserCreditAsyncAction.run(() => super.getUserCredit());
  }

  final _$getEventAsyncAction = AsyncAction('_EventStore.getEvent');

  @override
  Future<void> getEvent() {
    return _$getEventAsyncAction.run(() => super.getEvent());
  }

  final _$signEventAsyncAction = AsyncAction('_EventStore.signEvent');

  @override
  Future<bool> signEvent() {
    return _$signEventAsyncAction.run(() => super.signEvent());
  }

  final _$getAdsAsyncAction = AsyncAction('_EventStore.getAds');

  @override
  Future<void> getAds() {
    return _$getAdsAsyncAction.run(() => super.getAds());
  }

  @override
  String toString() {
    return '''
showEventOnHome: ${showEventOnHome},
hasSignedEvent: ${hasSignedEvent},
errorMessage: ${errorMessage}
    ''';
  }
}
