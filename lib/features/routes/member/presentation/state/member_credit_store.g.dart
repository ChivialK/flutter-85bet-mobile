// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_credit_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MemberCreditStore on _MemberCreditStore, Store {
  final _$_userStreamAtom = Atom(name: '_MemberCreditStore._userStream');

  @override
  ObservableStream<LoginStatus> get _userStream {
    _$_userStreamAtom.reportRead();
    return super._userStream;
  }

  @override
  set _userStream(ObservableStream<LoginStatus> value) {
    _$_userStreamAtom.reportWrite(value, super._userStream, () {
      super._userStream = value;
    });
  }

  final _$userAtom = Atom(name: '_MemberCreditStore.user');

  @override
  UserEntity get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(UserEntity value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$hasNewMessageAtom = Atom(name: '_MemberCreditStore.hasNewMessage');

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

  final _$creditAtom = Atom(name: '_MemberCreditStore.credit');

  @override
  String get credit {
    _$creditAtom.reportRead();
    return super.credit;
  }

  @override
  set credit(String value) {
    _$creditAtom.reportWrite(value, super.credit, () {
      super.credit = value;
    });
  }

  final _$errorMessageAtom = Atom(name: '_MemberCreditStore.errorMessage');

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

  final _$getNewMessageCountAsyncAction =
      AsyncAction('_MemberCreditStore.getNewMessageCount');

  @override
  Future<void> getNewMessageCount() {
    return _$getNewMessageCountAsyncAction
        .run(() => super.getNewMessageCount());
  }

  final _$getUserCreditAsyncAction =
      AsyncAction('_MemberCreditStore.getUserCredit');

  @override
  Future<void> getUserCredit() {
    return _$getUserCreditAsyncAction.run(() => super.getUserCredit());
  }

  @override
  String toString() {
    return '''
user: ${user},
hasNewMessage: ${hasNewMessage},
credit: ${credit},
errorMessage: ${errorMessage}
    ''';
  }
}
