// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStore, Store {
  Computed<List<GameCategoryModel>> _$homeUserTabsComputed;

  @override
  List<GameCategoryModel> get homeUserTabs => (_$homeUserTabsComputed ??=
          Computed<List<GameCategoryModel>>(() => super.homeUserTabs,
              name: '_HomeStore.homeUserTabs'))
      .value;
  Computed<HomeStoreState> _$stateComputed;

  @override
  HomeStoreState get state => (_$stateComputed ??=
          Computed<HomeStoreState>(() => super.state, name: '_HomeStore.state'))
      .value;

  final _$_initFutureAtom = Atom(name: '_HomeStore._initFuture');

  @override
  ObservableFuture<List<dynamic>> get _initFuture {
    _$_initFutureAtom.reportRead();
    return super._initFuture;
  }

  @override
  set _initFuture(ObservableFuture<List<dynamic>> value) {
    _$_initFutureAtom.reportWrite(value, super._initFuture, () {
      super._initFuture = value;
    });
  }

  final _$waitForGameUrlAtom = Atom(name: '_HomeStore.waitForGameUrl');

  @override
  bool get waitForGameUrl {
    _$waitForGameUrlAtom.reportRead();
    return super.waitForGameUrl;
  }

  @override
  set waitForGameUrl(bool value) {
    _$waitForGameUrlAtom.reportWrite(value, super.waitForGameUrl, () {
      super.waitForGameUrl = value;
    });
  }

  final _$gameUrlAtom = Atom(name: '_HomeStore.gameUrl');

  @override
  String get gameUrl {
    _$gameUrlAtom.reportRead();
    return super.gameUrl;
  }

  @override
  set gameUrl(String value) {
    _$gameUrlAtom.reportWrite(value, super.gameUrl, () {
      super.gameUrl = value;
    });
  }

  final _$errorMessageAtom = Atom(name: '_HomeStore.errorMessage');

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

  final _$getInitializeDataAsyncAction =
      AsyncAction('_HomeStore.getInitializeData');

  @override
  Future<void> getInitializeData({bool force = false}) {
    return _$getInitializeDataAsyncAction
        .run(() => super.getInitializeData(force: force));
  }

  final _$getBannersAsyncAction = AsyncAction('_HomeStore.getBanners');

  @override
  Future<void> getBanners() {
    return _$getBannersAsyncAction.run(() => super.getBanners());
  }

  final _$getMarqueesAsyncAction = AsyncAction('_HomeStore.getMarquees');

  @override
  Future<void> getMarquees() {
    return _$getMarqueesAsyncAction.run(() => super.getMarquees());
  }

  final _$getGameTypesAsyncAction = AsyncAction('_HomeStore.getGameTypes');

  @override
  Future<void> getGameTypes() {
    return _$getGameTypesAsyncAction.run(() => super.getGameTypes());
  }

  final _$getGamesAsyncAction = AsyncAction('_HomeStore.getGames');

  @override
  Future<void> getGames(PlatformGameForm form, String key) {
    return _$getGamesAsyncAction.run(() => super.getGames(form, key));
  }

  final _$getGameUrlAsyncAction = AsyncAction('_HomeStore.getGameUrl');

  @override
  Future<void> getGameUrl(String param) {
    return _$getGameUrlAsyncAction.run(() => super.getGameUrl(param));
  }

  @override
  String toString() {
    return '''
waitForGameUrl: ${waitForGameUrl},
gameUrl: ${gameUrl},
errorMessage: ${errorMessage},
homeUserTabs: ${homeUserTabs},
state: ${state}
    ''';
  }
}
