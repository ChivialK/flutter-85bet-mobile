// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feature_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FeatureScreenStore on _FeatureScreenStore, Store {
  Computed<int> _$navIndexComputed;

  @override
  int get navIndex =>
      (_$navIndexComputed ??= Computed<int>(() => super.navIndex,
              name: '_FeatureScreenStore.navIndex'))
          .value;

  final _$errorMessageAtom = Atom(name: '_FeatureScreenStore.errorMessage');

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

  final _$_streamRouteAtom = Atom(name: '_FeatureScreenStore._streamRoute');

  @override
  ObservableStream<RouteInfo> get _streamRoute {
    _$_streamRouteAtom.reportRead();
    return super._streamRoute;
  }

  @override
  set _streamRoute(ObservableStream<RouteInfo> value) {
    _$_streamRouteAtom.reportWrite(value, super._streamRoute, () {
      super._streamRoute = value;
    });
  }

  final _$pageInfoAtom = Atom(name: '_FeatureScreenStore.pageInfo');

  @override
  RouteInfo get pageInfo {
    _$pageInfoAtom.reportRead();
    return super.pageInfo;
  }

  @override
  set pageInfo(RouteInfo value) {
    _$pageInfoAtom.reportWrite(value, super.pageInfo, () {
      super.pageInfo = value;
    });
  }

  final _$_streamUserAtom = Atom(name: '_FeatureScreenStore._streamUser');

  @override
  ObservableStream<LoginStatus> get _streamUser {
    _$_streamUserAtom.reportRead();
    return super._streamUser;
  }

  @override
  set _streamUser(ObservableStream<LoginStatus> value) {
    _$_streamUserAtom.reportWrite(value, super._streamUser, () {
      super._streamUser = value;
    });
  }

  final _$userLoggedInAtom = Atom(name: '_FeatureScreenStore.userLoggedIn');

  @override
  bool get userLoggedIn {
    _$userLoggedInAtom.reportRead();
    return super.userLoggedIn;
  }

  @override
  set userLoggedIn(bool value) {
    _$userLoggedInAtom.reportWrite(value, super.userLoggedIn, () {
      super.userLoggedIn = value;
    });
  }

  @override
  String toString() {
    return '''
errorMessage: ${errorMessage},
pageInfo: ${pageInfo},
userLoggedIn: ${userLoggedIn},
navIndex: ${navIndex}
    ''';
  }
}
