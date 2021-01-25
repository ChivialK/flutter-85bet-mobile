import 'dart:collection' show HashMap;

import 'package:flutter_85bet_mobile/core/mobx_store_export.dart';
import 'package:flutter_85bet_mobile/features/export_internal_file.dart';
import 'package:flutter_85bet_mobile/features/general/data/error/error_message_map.dart';
import 'package:flutter_85bet_mobile/features/router/app_global_streams.dart';
import 'package:flutter_85bet_mobile/utils/regex_util.dart';

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
  }

  Stream<List<BannerEntity>> get bannerStream => _bannerController.stream;

  Stream<List<MarqueeEntity>> get marqueeStream => _marqueeController.stream;

  Stream<List<GameCategoryModel>> get tabStream => _tabController.stream;

  @observable
  ObservableFuture<List> _initFuture;

  List<BannerEntity> banners;

  List<MarqueeEntity> marquees;

  GameTypes _gameTypes;

  // home tab categories
  List<GameCategoryModel> homeTabs;

  // Key = category
  HashMap<String, List<GamePlatformEntity>> homePlatformMap;
  // Key = site/category
  HashMap<String, List<GameEntity>> _homeGamesMap;

  @observable
  List<GameEntity> recommends;

  @observable
  List<GameEntity> favorites;

  @observable
  bool waitForGameUrl = false;

  @observable
  String gameUrl;

  bool waitForInitializeData = false;
  bool waitForBanner = false;
  bool waitForMarquee = false;
  bool waitForGameTypes = false;
  bool waitForRecommend = false;
  bool waitForFavorite = false;

  @observable
  String errorMessage;

  void setErrorMsg({
    String msg,
    bool showOnce = false,
    FailureType type,
    int code,
  }) =>
      errorMessage = getErrorMsg(
          from: FailureType.HOME,
          msg: msg,
          showOnce: showOnce,
          type: type,
          code: code);

  bool hasGameInMap(String key, int gameId) =>
      _homeGamesMap.containsKey(key) &&
      _homeGamesMap[key].any((game) => game.gameUrl.endsWith('/$gameId'));

  void clearGameUrl() => gameUrl = null;

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
//         if (force) checkHomeTabs();
      });
    } on Exception {
      waitForInitializeData = false;
      //errorMessage = "Couldn't fetch description. Is the device online?";
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
                _bannerController.sink.add([]);
              },
              (list) {
                debugPrint('home store banners: $list');
                // creates a new list then add to stream
                // otherwise the data will lost after navigate
                _bannerController.sink.add(List.from(list));
              },
            ),
          )
          .whenComplete(() => waitForBanner = false);
    } on Exception {
      waitForBanner = false;
      //errorMessage = "Couldn't fetch description. Is the device online?";
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
                  int textCount = 0;
                  list.forEach(
                      (element) => textCount += element.content.countLength);
                  // debugPrint('home store marquee text count: $textCount \n' +
                  //     'home store marquee width: ${Global.device.width} \n' +
                  //     'home store marquee text expect size: ${textCount * FontSize.NORMAL.value}');
                  if (list.length < 2 ||
                      textCount * FontSize.NORMAL.value < Global.device.width) {
                    _marqueeController.sink.add(List.from(list + list));
                  } else {
                    _marqueeController.sink.add(List.from(list));
                  }
                } else {
                  _marqueeController.sink.add([]);
                }
              },
            ),
          )
          .whenComplete(() => waitForMarquee = false);
    } on Exception {
      waitForMarquee = false;
      //errorMessage = "Couldn't fetch description. Is the device online?";
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
                homeTabs = [];
                _tabController.sink.add(homeTabs);
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
                  platforms: new List.from(data.platforms),
                );
                _processHomeContent();
              },
            ),
          )
          .whenComplete(() => waitForGameTypes = false);
    } on Exception {
      waitForGameTypes = false;
      //errorMessage = "Couldn't fetch description. Is the device online?";
      setErrorMsg(type: FailureType.GAMES, code: 1);
    }
  }

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

    homeTabs.insert(0, recommendCategory);
    homeTabs.insert(1, favoriteCategory);
    homeTabs.add(memberCategory);

    // homePlatformMap.keys.forEach((key) => MyLogger.debug(
    //     msg: '$key: ${homePlatformMap[key]}\n', tag: 'HomePlatformMap'));
    _tabController.sink.add(homeTabs);
  }

  @action
  Future<List<GameEntity>> getGames({
    PlatformGameForm form,
    String storeMapKey,
    GamePlatformEntity platform,
    bool getFromNetwork = false,
  }) async {
    try {
      final _key = storeMapKey ?? platform.className.replaceAll('-', '/');
      final _form = form ??
          PlatformGameForm(
            category: platform.category,
            platform: platform.site,
          );

      // check if data exists
      _homeGamesMap ??= new HashMap();
      if (_homeGamesMap.containsKey(_key) && !getFromNetwork) {
        return _homeGamesMap[_key];
      }
      // Reset the possible previous error message.
      errorMessage = null;
      // Fetch from the repository and wrap the regular Future into an observable.
      debugPrint('requesting home platform games: $_form');
      return await _repository.getGames(_form).then(
            (result) => result.fold(
              (failure) {
                setErrorMsg(msg: failure.message, showOnce: true);
                return _homeGamesMap[_key];
              },
              (list) {
                // debugPrint('home store platform games: $list');
                _homeGamesMap[_key] = new List.from(list);
                return _homeGamesMap[_key];
              },
            ),
          );
    } on Exception {
      //errorMessage = "Couldn't fetch description. Is the device online?";
      setErrorMsg(type: FailureType.GAMES, code: 2);
      return [];
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
      //errorMessage = "Couldn't fetch description. Is the device online?";
      setErrorMsg(type: FailureType.GAMES, code: 3);
    }
  }

  @action
  Future<void> getRecommend() async {
    if (waitForRecommend) return null;
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
              (failure) {
                setErrorMsg(msg: failure.message);
                recommends = [];
              },
              (list) {
//                debugPrint('home store game recommend: $list');
                // creates a new data instance then add to stream
                // otherwise the data will lost after navigate
                if (recommends != list) {
                  recommends = list
                      .where((item) =>
                          item is GameEntity && item.gameUrl.startsWith('va/'))
                      .map((e) => e as GameEntity)
                      .toList();
                  debugPrint('home store game recommend updated');
                }
              },
            ),
          )
          .whenComplete(() => waitForRecommend = false);
    } on Exception {
      waitForRecommend = false;
      setErrorMsg(type: FailureType.RECOMMENDS);
      recommends = [];
    }
  }

  @action
  Future<void> getFavorites() async {
    if (waitForFavorite || !getAppGlobalStreams.hasUser) return null;
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
              (failure) {
                setErrorMsg(msg: failure.message);
                favorites = [];
              },
              (list) {
                // debugPrint('home store game favorite: $list');
                // creates a new data instance then add to stream
                // otherwise the data will lost after navigate
                if (list != favorites) {
                  favorites = list
                      .where((item) =>
                          item is GameEntity && item.gameUrl.startsWith('va/'))
                      .map((e) => e as GameEntity)
                      .toList();
                }
              },
            ),
          )
          .whenComplete(() => waitForFavorite = false);
    } on Exception {
      waitForFavorite = false;
      setErrorMsg(type: FailureType.FAVORITE, code: 1);
      favorites = [];
    }
  }

  @action
  Future<bool> postFavorite({
    @required GameEntity entity,
    @required bool favorite,
  }) async {
    try {
      // Reset the possible previous error message.
      errorMessage = null;
      // Fetch from the repository and wrap the regular Future into an observable.
      debugPrint('posting home favorite: $entity');
      int id = entity.id;
      return await _repository.postFavoriteGame(id, favorite).then(
            (result) => result.fold(
              (failure) {
                MyLogger.warn(msg: 'set game $id favorite failed: $failure');
                return false;
              },
              (success) {
                MyLogger.log(msg: 'set game $id favorite($favorite) success');
                Future.microtask(() => _updateGamesFavor(entity, favorite));
                return true;
              },
            ),
          );
    } on Exception {
      setErrorMsg(type: FailureType.FAVORITE, code: 2);
      return false;
    }
  }

  void _updateGamesFavor(GameEntity entity, bool isFavorite) {
    final newItem = entity.copyWith(favorite: (isFavorite) ? 1 : 0);

    List info = entity.gameUrl.split('/');
    String key = '${info[0]}/${info[1]}';
    // debugPrint('game map key: $key');

    if (_homeGamesMap != null && _homeGamesMap.containsKey(key)) {
      try {
        // debugPrint('game map items: ${_homeGamesMap[key]}');
        int index =
            _homeGamesMap[key].indexWhere((game) => game.id == entity.id);
        // debugPrint('game map item index: $index');
        _homeGamesMap[key][index] = newItem;
        debugPrint('updated game map item: ${_homeGamesMap[key][index]}');
      } catch (e) {
        MyLogger.warn(
            msg: 'update game map ($key) failed: $e', tag: 'HomeStore');
        getGames(
          form: PlatformGameForm(
            category: info[1],
            platform: info[0],
          ),
          storeMapKey: key,
        );
      }
    }

    if (isFavorite) {
      if (favorites == null) {
        getFavorites();
      } else if (!favorites.any((element) => element.id == entity.id)) {
        favorites = List.of(favorites)..add(newItem);
      }
    } else {
      bool success = favorites.remove(entity);
      if (!success) {
        debugPrint('favorite item not found: $entity');
        debugPrint('favorites: $favorites');
        getFavorites();
      } else {
        favorites = List.of(favorites);
      }
    }
    // debugPrint('favorite update: $favorites');

    _updateRecommendsFavor(entity, newItem);
  }

  void _updateRecommendsFavor(GameEntity oldEntity, GameEntity newEntity) {
    if (recommends != null && recommends.isNotEmpty) {
      try {
        debugPrint('looking for $oldEntity in recommends list');
        // debugPrint('recommend has game: ${recommends.contains(oldEntity)}');
        int rIndex = recommends.indexOf(oldEntity);
        if (rIndex == -1) {
          final item = recommends.singleWhere(
            (element) =>
                element is GameEntity &&
                element.id == oldEntity.id &&
                element.gameUrl == oldEntity.gameUrl,
            orElse: () => null,
          );
          rIndex = recommends.indexOf(item);
        }

        if (rIndex == -1) {
          MyLogger.debug(
              msg: 'recommend item index not found, requesting from server...',
              tag: 'HomeStore');
          getRecommend();
        } else {
          debugPrint('updating recommend game to $newEntity');
          recommends.replaceRange(rIndex, rIndex + 1, [newEntity]);
          // List<GameEntity> list = new List.of(recommends);
          // recommends = null;
          // recommends = list;
          debugPrint('recommend list item updated, index: $rIndex');
        }
      } catch (e) {
        MyLogger.warn(
            msg: 'update recommend game failed: $e', tag: 'HomeStore');
      }
    }
  }

  Future<void> closeStreams() {
    try {
      return Future.wait([
        _bannerController.close(),
        _marqueeController.close(),
        _tabController.close(),
      ]);
    } catch (e) {
      MyLogger.warn(msg: 'close home stream error', error: e, tag: 'HomeStore');
      return null;
    }
  }
}
