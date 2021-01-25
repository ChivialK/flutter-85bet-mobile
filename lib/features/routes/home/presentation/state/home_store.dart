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
  static StreamController<String> _gamesRetrieveController =
      StreamController<String>.broadcast();

  final StreamController<String> _searchPlatformController =
      StreamController<String>.broadcast();

  final StreamController<String> _gameTitleController =
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
    _gamesRetrieveController.stream.listen((event) {
      debugPrint('home stream games retrieve: $event');
    });
    _searchPlatformController.stream.listen((event) {
      debugPrint('home stream search recommend: $event');
      searchPlatform = event;
    });
    _gameTitleController.stream.listen((event) {
      debugPrint('home stream game title: $event');
    });
    _searchGameController.stream.listen((event) {
      debugPrint('home stream search game: $event');
    });
  }

  Stream<List<BannerEntity>> get bannerStream => _bannerController.stream;

  Stream<List<MarqueeEntity>> get marqueeStream => _marqueeController.stream;

  Stream<List<GameCategoryModel>> get tabStream => _tabController.stream;

  Stream<String> get gamesStream => _gamesRetrieveController.stream;

  Stream<String> get showPlatformStream => _searchPlatformController.stream;

  Stream<String> get homeGameTitleStream => _gameTitleController.stream;

  Stream<String> get searchGameStream => _searchGameController.stream;

  @observable
  ObservableFuture<List> _initFuture;

  List<BannerEntity> banners;

  List<MarqueeEntity> marquees;

  GameTypes _gameTypes;

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

  /// home tab tab categories
  List<GameCategoryModel> homeTabs;

  bool hasUser = false;

  @computed
  List<GameCategoryModel> get homeUserTabs => homeTabs;
//      new List.from(
//        [recommendCategory, favoriteCategory] + homeTabs,
//           + [movieEgCategory, movieNewCategory],
//      );

  String searchPlatform = '';

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
                  _marqueeController.sink.add([
//                    MarqueeEntity(
//                        id: 0,
//                        content: localeStr.homeHintDefaultMarquee,
//                        url: '')
                  ]);
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

    customizePlatformMap();
    homeTabs.add(cockfightingCategory);
    homeTabs.add(promoCategory);
    homeTabs.add(websiteCategory);

//    homePlatformMap.keys.forEach((key) => MyLogger.debugPrint(
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

  bool checkUser() {
    if (hasUser != getAppGlobalStreams.hasUser) {
      hasUser = getAppGlobalStreams.hasUser;
      debugPrint('home store has user = $hasUser');
      return true;
    }
    return false;
  }

  void checkHomeTabs() {
    if (checkUser()) getGameTypes();
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
                debugPrint('home store platform games: $list');
                _homeGamesMap[key] = new List.from(list);
                _gamesRetrieveController.sink.add(key);
              },
            ),
          );
    } on Exception {
      //errorMessage = "Couldn't fetch description. Is the device online?";
      setErrorMsg(type: FailureType.GAMES, code: 2);
    }
  }

  void setGameTitle({GamePlatformEntity platform, bool clear = false}) {
    if (clear) {
      _gameTitleController.sink.add('');
      searchGame(clear: true);
    } else if (platform != null) {
      _gameTitleController.sink.add(
          'images/games/gameTitle/${platform.category}_game_${platform.site.toLowerCase()}.png');
    }
  }

  void searchGame({String searchKey, bool clear = false}) {
    if (clear) {
      _searchGameController.sink.add('');
    } else if (searchKey != null) {
      _searchGameController.sink.add(searchKey);
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

  void clearGameUrl() => gameUrl = null;

  void showSearchPlatform(String platformClassName) =>
      _searchPlatformController.sink.add(platformClassName);

  void clearSearch() => searchPlatform = '';

  Future<void> closeStreams() {
    try {
      return Future.wait([
        _bannerController.close(),
        _marqueeController.close(),
        _tabController.close(),
        _gamesRetrieveController.close(),
        _searchPlatformController.close(),
        _gameTitleController.close(),
        _searchGameController.close(),
      ]);
    } catch (e) {
      MyLogger.warn(msg: 'close home stream error', error: e, tag: 'HomeStore');
      return null;
    }
  }
}
