import 'dart:collection' show HashMap;

import 'package:flutter_85bet_mobile/core/mobx_store_export.dart';
import 'package:flutter_85bet_mobile/features/exports_for_route_widget.dart';
import 'package:flutter_85bet_mobile/features/router/app_global_streams.dart';

import '../../data/entity/banner_entity.dart';
import '../../data/entity/game_entity.dart';
import '../../data/entity/marquee_entity.dart';
import '../../data/form/platform_game_form.dart';
import '../../data/models/game_category_model.dart';
import '../../data/models/game_platform.dart';
import '../../data/models/game_types.dart';
import '../../data/repository/home_repository.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

enum HomeStoreState { initial, loading, loaded }

abstract class _HomeStore with Store {
  final HomeRepository _repository;

  static StreamController<List<BannerEntity>> _bannerController =
      StreamController<List<BannerEntity>>.broadcast();
  static StreamController<List<MarqueeEntity>> _marqueeController =
      StreamController<List<MarqueeEntity>>.broadcast();

  static StreamController<List<GameCategoryModel>> _tabController =
      StreamController<List<GameCategoryModel>>.broadcast();
  static StreamController<String> _gamesRetrieveController =
      StreamController<String>.broadcast();

  static StreamController<List> _recommendController =
      StreamController<List>.broadcast();
  static StreamController<List> _favoriteController =
      StreamController<List>.broadcast();

  final StreamController<String> _searchPlatformController =
      StreamController<String>.broadcast();

  final StreamController<String> _searchGameController =
      StreamController<String>.broadcast();

  _HomeStore(this._repository) {
    debugPrint('init home store');
    _bannerController.stream.listen((event) {
//      debugPrint('home stream banners: ${event.length}');
      banners = event;
    });
    _marqueeController.stream.listen((event) {
//      debugPrint('home stream marquees: ${event.length}');
      marquees = event;
    });
//    _tabController.stream.listen((event) {
//      debugPrint('home stream games tab: ${event.length}');
//    });
    _gamesRetrieveController.stream.listen((event) {
      debugPrint('home stream games retrieve: $event');
    });
    _recommendController.stream.listen((event) {
//      debugPrint('home stream games recommend: ${event.length}');
      recommends = event;
    });
    _favoriteController.stream.listen((event) {
//      debugPrint('home stream games favorite: ${event.length}');
      favorites = event
        ..removeWhere(
          (element) => (element is GameEntity || element is GamePlatformEntity)
              ? element.favorite != 1 && element.favorite != '1'
              : false,
        );
    });
    _searchPlatformController.stream.listen((event) {
//      debugPrint('home stream search platform: $event');
      searchPlatform = event;
    });
//    _searchGameController.stream.listen((event) {
//      debugPrint('home stream search game: $event');
//    });
  }

  Stream<List<BannerEntity>> get bannerStream => _bannerController.stream;

  Stream<List<MarqueeEntity>> get marqueeStream => _marqueeController.stream;

  Stream<List<GameCategoryModel>> get tabStream => _tabController.stream;

  Stream<String> get gamesStream => _gamesRetrieveController.stream;

  Stream<List> get recommendStream => _recommendController.stream;

  Stream<List> get favoriteStream => _favoriteController.stream;

  Stream<String> get showPlatformStream => _searchPlatformController.stream;

  Stream<String> get searchGameStream => _searchGameController.stream;

  @observable
  ObservableFuture<List> _initFuture;

  /// Home Data
  List<BannerEntity> banners;
  List<MarqueeEntity> marquees;
  GameTypes _gameTypes;
  List<GameCategoryModel> homeTabs;
  List recommends;
  List favorites;

  /// Search
  String searchPlatform = '';

  // Key = category
  HashMap<String, List<GamePlatformEntity>> homePlatformMap;

  // Key = site/category
  HashMap<String, List<GameEntity>> _homeGamesMap;

  bool hasPlatformGames(String key) =>
      _homeGamesMap != null && _homeGamesMap.containsKey(key);

  bool hasGameInMap(String key, int gameId) =>
      _homeGamesMap.containsKey(key) &&
      _homeGamesMap[key].any((game) => game.gameUrl.endsWith('/$gameId'));

  List<GameEntity> getPlatformGames(String key) =>
      (_homeGamesMap.containsKey(key)) ? _homeGamesMap[key] : [];

  void showSearchPlatform(String platformClassName) {
    _searchPlatformController.sink.add(platformClassName);
  }

  void clearPlatformSearch() => searchPlatform = '';

  void searchGame({String searchKey, bool clear = false}) {
    if (clear) {
      _searchGameController.sink.add('');
    } else if (searchKey != null) {
      _searchGameController.sink.add(searchKey);
    }
  }

  /// Game Url
  @observable
  bool waitForGameUrl = false;

  @observable
  String gameUrl;

  /// Shortcut Credit
  bool hasUser = false;

  /// Store Internal
  bool waitForInitializeData = false;
  bool waitForBanner = false;
  bool waitForMarquee = false;
  bool waitForGameTypes = false;
  bool waitForRecommend = false;
  bool waitForFavorite = false;

  @observable
  String errorMessage;

  void setErrorMsg(
          {String msg, bool showOnce = false, FailureType type, int code}) =>
      errorMessage = getErrorMsg(
          from: FailureType.HOME,
          msg: msg,
          showOnce: showOnce,
          type: type,
          code: code);

  @computed
  HomeStoreState get state {
    // If the user has not yet triggered a action or there has been an error
    if (_initFuture == null || _initFuture.status == FutureStatus.rejected) {
      return HomeStoreState.initial;
    }
    // Pending Future means "loading"
    // Fulfilled Future means "loaded"
    return _initFuture.status == FutureStatus.pending && waitForInitializeData
        ? HomeStoreState.loading
        : HomeStoreState.loaded;
  }

  @action
  Future<void> getInitializeData({bool force = false}) async {
    try {
      // Reset the possible previous error message.
      errorMessage = null;
      waitForInitializeData = true;
      // Fetch from the repository and wrap the regular Future into an observable.
      _initFuture = ObservableFuture(Future.wait([
        if (banners == null || (force && banners.isEmpty))
          Future.value(getBanners()),
        if (marquees == null || force) Future.value(getMarquees()),
        if (_gameTypes == null || force) Future.value(getGameTypes()),
      ]));
      // ObservableFuture extends Future - it can be awaited and exceptions will propagate as usual.
      await _initFuture.whenComplete(() {
        waitForInitializeData = false;
//        debugPrint('banners: ${banners?.length}, '
//            'marquees: ${marquees?.length}, '
//            'gametypes: ${_gameTypes.categories.length}');
        if (force) checkHomeTabs();
      });
    } on Exception {
      waitForInitializeData = false;
      setErrorMsg(code: 1);
    }
  }

  @action
  Future<void> getBanners() async {
    if (waitForBanner) return;
    try {
      // Reset the possible previous error message.
      errorMessage = null;
      waitForBanner = true;
      // Fetch from the repository and wrap the regular Future into an observable.
      debugPrint('requesting home banner data...');
      await _repository
          .getBanners()
          .then(
            (result) => result.fold(
              (failure) {
                setErrorMsg(msg: failure.message, showOnce: true);
                _bannerController.sink.add(null);
              },
              (list) {
//                debugPrint('home store banners: $list');
                // creates a new list then add to stream
                // otherwise the data will lost after navigate
                _bannerController.sink.add(List.from(list));
              },
            ),
          )
          .whenComplete(() => waitForBanner = false);
    } on Exception {
      waitForBanner = false;
      setErrorMsg(type: FailureType.BANNER);
    }
  }

  @action
  Future<void> getMarquees() async {
    if (waitForMarquee) return;
    try {
      // Reset the possible previous error message.
      errorMessage = null;
      waitForMarquee = true;
      // Fetch from the repository and wrap the regular Future into an observable.
      debugPrint('requesting home marquee data...');
      await _repository
          .getMarquees()
          .then(
            (result) => result.fold(
              (failure) {
                setErrorMsg(msg: failure.message, showOnce: true);
                _marqueeController.sink.add([]);
              },
              (list) {
//            debugPrint('home store marquees: $list');
                // creates a new list then add to stream
                // otherwise the data will lost after navigate
                if (list.isNotEmpty) {
                  if (list.length == 1) {
                    // repeat the text for marquee to run anim
                    _marqueeController.sink.add(List.from(list)..addAll(list));
                  } else {
                    _marqueeController.sink.add(List.from(list));
                  }
                }
              },
            ),
          )
          .whenComplete(() => waitForMarquee = false);
    } on Exception {
      waitForMarquee = false;
      setErrorMsg(type: FailureType.MARQUEE);
    }
  }

  @action
  Future<void> getGameTypes() async {
    if (waitForGameTypes) return;
    try {
      // Reset the possible previous error message.
      errorMessage = null;
      waitForGameTypes = true;
      // Fetch from the repository and wrap the regular Future into an observable.
      debugPrint('requesting home game types data...');
      await _repository
          .getGameTypes()
          .then(
            (result) => result.fold(
              (failure) {
                setErrorMsg(msg: failure.message, showOnce: true);
                _tabController.sink.add([]);
              },
              (data) {
//                debugPrint('home store game types: $data');
                debugPrint('home stream game types: ${data.categories.length}');
                debugPrint(
                    'home stream game platforms: ${data.platforms.length}');
                // creates a new data instance then add to stream
                // otherwise the data will lost after navigate
                _gameTypes = new GameTypes(
                  categories: new List.from(data.categories),
                  platforms: new List.from(data.platforms)
                    ..removeWhere(
                        (element) => element.className == 'sb-lottery'),
                );
                _processHomeContent();
              },
            ),
          )
          .whenComplete(() => waitForGameTypes = false);
    } on Exception {
      waitForGameTypes = false;
      setErrorMsg(type: FailureType.GAMES, code: 1);
    }
  }

  @computed
  List<GameCategoryModel> get homeUserTabs =>
      List.from(homeTabs)..insert(1, favoriteCategory);

  void _processHomeContent() {
    homeTabs = new List.from(_gameTypes.categories, growable: true);
    if (homeTabs == null || homeTabs.isEmpty) return;
    final all = _gameTypes.platforms;
    List remove = new List();
    homePlatformMap = new HashMap();
    homeTabs.forEach((category) {
      var list = List<GamePlatformEntity>.from(
          all.where((platform) => category.type == platform.category));
      switch (category.type) {
        case 'gift':
        case 'movie':
          if (list == null || list.isEmpty) remove.add(category);
          break;
        default:
          if (list == null || list.isEmpty)
            homePlatformMap.putIfAbsent(
                category.type, () => List<GamePlatformEntity>());
          else
            homePlatformMap.putIfAbsent(category.type, () => list);
          break;
      }
    });
    if (remove.isNotEmpty)
      remove.forEach((element) => homeTabs.remove(element));

    // customizePlatformMap();
    homeTabs.insert(0, recommendCategory);
    // homeTabs.add(cockfightingCategory);
//    homeTabs.add(promoCategory);
//    homeTabs.add(movieWebCategory);
//     homeTabs.add(websiteCategory);

//    homePlatformMap.keys.forEach((key) => MyLogger.print(
//        msg: '$key: ${homePlatformMap[key]}\n', tag: 'HomePlatformMap'));

    checkHomeTabs();
  }

  void customizePlatformMap() {
    List<String> classNames = ['s128-sport'];
    try {
//      debugPrint('sport platforms: ${homePlatformMap['sport'].length}');
      var cockfightingGames = homePlatformMap['sport']
              ?.where((element) => classNames.contains(element.className))
              ?.toList() ??
          [];
//      debugPrint('found cockfighting games: ${cockfightingGames.length}');
      homePlatformMap['sport']
          .removeWhere((element) => classNames.contains(element.className));
      homePlatformMap.putIfAbsent(
          cockfightingCategory.type, () => cockfightingGames);
    } catch (e) {
      debugPrint(e);
    } finally {
//      debugPrint('updated sport platforms: ${homePlatformMap['sport'].length}');
//      debugPrint('updated cockfighting platforms: '
//          '${homePlatformMap[cockfightingCategory.type].length}');
    }
  }

  void checkHomeTabs() {
    if (hasUser != getAppGlobalStreams.hasUser) {
      hasUser = getAppGlobalStreams.hasUser;
//      debugPrint('home store has user = $hasUser');
      getGameTypes();
    }
    // _tabController.sink.add(homeTabs);
    if (hasUser) {
      _tabController.sink.add(homeUserTabs);
    } else {
      _tabController.sink.add(homeTabs);
    }
  }

  @action
  Future<void> getGames(PlatformGameForm form, String key) async {
    try {
      _homeGamesMap ??= new HashMap();
      if (_homeGamesMap.containsKey(key)) {
        _gamesRetrieveController.sink.add(key);
        return;
      }
      // Reset the possible previous error message.
      errorMessage = null;
      // Fetch from the repository and wrap the regular Future into an observable.
      debugPrint('requesting home platform games: $form');
      await _repository.getGames(form).then(
            (result) => result.fold(
              (failure) => setErrorMsg(msg: failure.message, showOnce: true),
              (list) {
                debugPrint('home store platform games: ${list.length}');
                _homeGamesMap[key] = new List.from(list);
                _gamesRetrieveController.sink.add(key);
              },
            ),
          );
    } on Exception {
      setErrorMsg(type: FailureType.GAMES, code: 2);
    }
  }

  @action
  Future<void> getRecommend() async {
    if (waitForRecommend) return;
    try {
      // Reset the possible previous error message.
      errorMessage = null;
      waitForRecommend = true;
      // Fetch from the repository and wrap the regular Future into an observable.
      debugPrint('requesting home recommend data...');
      await _repository
          .getRecommend()
          .then(
            (result) => result.fold(
              (failure) => setErrorMsg(msg: failure.message, showOnce: true),
              (list) {
//                debugPrint('home store game recommend: $list');
                // creates a new data instance then add to stream
                // otherwise the data will lost after navigate
                if (recommends != list)
                  _recommendController.sink.add(List.from(list));
              },
            ),
          )
          .whenComplete(() => waitForRecommend = false);
    } on Exception {
      waitForRecommend = false;
      setErrorMsg(type: FailureType.RECOMMENDS);
    }
  }

  @action
  Future<void> getFavorites() async {
    if (waitForFavorite) return;
    try {
      // Reset the possible previous error message.
      errorMessage = null;
      waitForFavorite = true;
      // Fetch from the repository and wrap the regular Future into an observable.
      debugPrint('requesting home favorite data...');
      await _repository
          .getFavorites()
          .then(
            (result) => result.fold(
              (failure) => setErrorMsg(msg: failure.message, showOnce: true),
              (list) {
                debugPrint('home store game favorite: $list');
                // creates a new data instance then add to stream
                // otherwise the data will lost after navigate
                if (list != favorites)
                  _favoriteController.sink.add(List.from(list));
              },
            ),
          )
          .whenComplete(() => waitForFavorite = false);
    } on Exception {
      waitForFavorite = false;
      setErrorMsg(type: FailureType.FAVORITE, code: 1);
    }
  }

  @action
  Future<void> postFavorite({
    @required dynamic entity,
    @required bool favorite,
  }) async {
    try {
      bool isPlatform = entity is GamePlatformEntity;
      int id = entity.id;
      // Reset the possible previous error message.
      errorMessage = null;
      // Fetch from the repository and wrap the regular Future into an observable.
      debugPrint('posting home favorite: $entity');
      if (isPlatform)
        await _repository.postFavoritePlatform(id, favorite).then(
              (result) => result.fold(
                (failure) => MyLogger.warn(
                    msg: 'set platform $id favorite failed: $failure'),
                (success) {
                  MyLogger.log(
                      msg: 'set platform $id favorite($favorite) success');
                  _updatePlatformMap(entity, favorite);
                },
              ),
            );
      else
        await _repository.postFavoriteGame(id, favorite).then(
              (result) => result.fold(
                (failure) => MyLogger.warn(
                    msg: 'set game $id favorite failed: $failure'),
                (success) {
                  MyLogger.log(msg: 'set game $id favorite($favorite) success');
                  _updateGameMap(entity, favorite);
                },
              ),
            );
    } on Exception {
      setErrorMsg(type: FailureType.FAVORITE, code: 2);
    }
  }

  void _updatePlatformMap(GamePlatformEntity entity, bool isFavorite) {
    if (favorites != null) getFavorites();
    final newItem = entity.copyWith(favorite: (isFavorite) ? '1' : '0');
    try {
      String key = entity.category;
//      debugPrint('platforms: ${homePlatformMap[key]}');
//      debugPrint('looking for $entity in ${homePlatformMap[key]}');
      int index = homePlatformMap[key].indexOf(entity);
//      debugPrint('platform index: $index');
      if (index >= 0) {
        homePlatformMap[key][index] = newItem;
        debugPrint('updated platform map item: ${homePlatformMap[key][index]}');
      }
    } catch (e) {
      MyLogger.warn(
          msg: 'update platform map (${entity.category}) failed: $e',
          tag: 'HomeStore');
//      getGameTypes();
    }

    if (recommends != null && recommends.isNotEmpty) {
      try {
//        debugPrint('looking for $entity in $recommends');
//        debugPrint('recommend has platform: ${recommends.contains(entity)}');
        final item = recommends.singleWhere(
          (element) =>
              element is GamePlatformEntity &&
              element.id == entity.id &&
              element.className == entity.className,
          orElse: null,
        );
        if (item == null) return;
        int rIndex = recommends.indexOf(item);
        recommends[rIndex] = newItem;
        debugPrint('updated recommend list item: ${recommends[rIndex]}');
      } catch (e) {
        MyLogger.warn(
            msg: 'update recommend platform failed: $e', tag: 'HomeStore');
        getRecommend();
      }
    }
  }

  void _updateGameMap(GameEntity entity, bool isFavorite) {
    if (favorites != null) getFavorites();
    final newItem = entity.copyWith(favorite: (isFavorite) ? 1 : 0);
    List info = entity.gameUrl.split('/');
    String key = '${info[0]}/${info[1]}';
    debugPrint('game map key: $key');

    if (_homeGamesMap != null && _homeGamesMap.containsKey(key)) {
      try {
        int index = _homeGamesMap[key].indexOf(entity);
        _homeGamesMap[key][index] = newItem;
        debugPrint('updated game map item: ${_homeGamesMap[key][index]}');
      } catch (e) {
        MyLogger.warn(
            msg: 'update game map ($key) failed: $e', tag: 'HomeStore');
        getGames(
            PlatformGameForm(
              category: info[1],
              platform: info[0],
            ),
            key);
      }
    }

    if (recommends != null && recommends.isNotEmpty) {
      try {
//        debugPrint('looking for $entity in $recommends');
//        debugPrint('recommend has game: ${recommends.contains(entity)}');
        final item = recommends.singleWhere(
          (element) =>
              element is GameEntity &&
              element.id == entity.id &&
              element.gameUrl == entity.gameUrl,
          orElse: null,
        );
        if (item == null) return;
        int rIndex = recommends.indexOf(item);
        recommends[rIndex] = newItem;
        debugPrint('updated recommend list item: ${recommends[rIndex]}');
      } catch (e) {
        MyLogger.warn(
            msg: 'update recommend game failed: $e', tag: 'HomeStore');
        getRecommend();
      }
    }
  }

  @action
  Future<void> getGameUrl(String param) async {
    if (waitForGameUrl) return;
    try {
      // Reset the possible previous error message.
      errorMessage = null;
      gameUrl = null;
      waitForGameUrl = true;
      // Fetch from the repository and wrap the regular Future into an observable.
      debugPrint('requesting home game url: $param');
      await _repository
          .getGameUrl(param)
          .then(
            (result) => result.fold(
              (failure) {
                String msg = MessageMap.getErrorMessage(
                  failure.message,
                  RouteEnum.HOME,
                );
                return setErrorMsg(msg: msg, type: FailureType.GAMES);
              },
              (data) {
                debugPrint('home store game url: $data');
                gameUrl = data;
              },
            ),
          )
          .whenComplete(() => waitForGameUrl = false);
    } on Exception {
      waitForGameUrl = false;
      setErrorMsg(type: FailureType.GAMES, code: 3);
    }
  }

  void clearGameUrl() => gameUrl = null;

  Future<void> closeStreams() {
    try {
      return Future.wait([
        _bannerController.close(),
        _marqueeController.close(),
        _tabController.close(),
        _gamesRetrieveController.close(),
        _recommendController.close(),
        _favoriteController.close(),
        _searchPlatformController.close(),
        _searchGameController.close(),
      ]);
    } catch (e) {
      MyLogger.warn(msg: 'close home stream error', error: e, tag: 'HomeStore');
      return null;
    }
  }
}
