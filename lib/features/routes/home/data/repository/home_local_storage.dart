import 'package:flutter_85bet_mobile/core/data/hive_actions.dart';
import 'package:flutter_85bet_mobile/core/error/exceptions.dart';
import 'package:flutter_85bet_mobile/mylogger.dart';
import 'package:hive/hive.dart';

import '../entity/banner_entity.dart';
import '../entity/marquee_entity.dart';
import '../models/game_category_model.dart';
import '../models/game_platform.dart';
import '../models/game_types.dart';

abstract class HomeLocalStorage {
  void closeBox(HomeBox homeBox);

  /// Gets the cached [BannerEntity] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [HiveDataException] if no cached data is present.
  Future<List<BannerEntity>> getCachedBanners();
  Future<void> cacheBanners(List<BannerEntity> bannersToCache);

  /// Gets the cached [MarqueeEntity] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [HiveDataException] if no cached data is present.
  Future<List<MarqueeEntity>> getCachedMarquees();
  Future<void> cacheMarquees(List<MarqueeEntity> marqueesToCache);

  /// Gets the cached [GameTypes] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [HiveDataException] if no cached data is present.
  Future<GameTypes> getCachedGameTypes();
  Future<void> cacheGameTypes(GameTypes typesToCache);
}

const CACHED_HOME_BANNER = 'CACHED_BANNER';
const CACHED_HOME_MARQUEE = 'CACHED_MARQUEE';
const CACHED_HOME_GAME_CATEGORY = 'CACHED_CATEGORY';
const CACHED_HOME_GAME_PLATFORM = 'CACHED_PLATFORM';

enum HomeBox { Banner, Marquee, Category, Platform }

class HomeLocalStorageImpl implements HomeLocalStorage {
  final tag = 'HomeLocalStorage';

  String _getBoxName(HomeBox homeBox) {
    String boxName;
    switch (homeBox) {
      case HomeBox.Banner:
        boxName = CACHED_HOME_BANNER;
        break;
      case HomeBox.Marquee:
        boxName = CACHED_HOME_MARQUEE;
        break;
      case HomeBox.Category:
        boxName = CACHED_HOME_GAME_CATEGORY;
        break;
      case HomeBox.Platform:
        boxName = CACHED_HOME_GAME_PLATFORM;
        break;
    }
    return boxName;
  }

  Future<Box> _getHiveBox(HomeBox homeBox) async {
    return getHiveBox(_getBoxName(homeBox));
  }

  @override
  void closeBox(HomeBox homeBox) => closeHiveBox(_getBoxName(homeBox));

  @override
  Future<List<BannerEntity>> getCachedBanners() async {
    try {
      var box = await _getHiveBox(HomeBox.Banner);
      return box.getData<BannerEntity>(logKeyword: 'banner');
    } on HiveDataException {
      return [];
    } catch (e) {
      MyLogger.error(
          msg: 'box get data has exception: $e', error: e, stackTrace: e);
      return [];
    }
  }

  @override
  Future<void> cacheBanners(List<BannerEntity> bannersToCache) async {
    var box = await _getHiveBox(HomeBox.Banner);
    if (box.hasData()) {
      bannersToCache.addNewToHive(
          box: box, identifier: 'banner', filterKey: 'id');
    } else {
      bannersToCache.addAllToHive(box: box, identifier: 'banner');
    }
    MyLogger.print(
        msg: 'cached banners in HIVE: ${box.values.length}', tag: tag);
    return box.compact();
  }

  @override
  Future<List<MarqueeEntity>> getCachedMarquees() async {
    try {
      var box = await _getHiveBox(HomeBox.Marquee);
      return box.getData<MarqueeEntity>(logKeyword: 'marquee');
    } on HiveDataException {
      return [];
    } catch (e) {
      MyLogger.error(
          msg: 'box get data has exception: $e', error: e, stackTrace: e);
      return [];
    }
  }

  @override
  Future<void> cacheMarquees(List<MarqueeEntity> marqueesToCache) async {
    var box = await _getHiveBox(HomeBox.Marquee);
    if (box.hasData()) {
      marqueesToCache.addNewToHive(
          box: box, identifier: 'marquee', filterKey: 'id');
    } else {
      marqueesToCache.addAllToHive(box: box, identifier: 'marquee');
    }
    MyLogger.print(
        msg: 'cached marquees in HIVE: ${box.values.length}', tag: tag);
    return box.compact();
  }

  @override
  Future<GameTypes> getCachedGameTypes() async {
    try {
      var box1 = await _getHiveBox(HomeBox.Category);
      final categories =
          box1.getData<GameCategoryModel>(logKeyword: 'type-category');
      var box2 = await _getHiveBox(HomeBox.Platform);
      final platforms =
          box2.getData<GamePlatformEntity>(logKeyword: 'type-platform');
      return GameTypes(categories: categories, platforms: platforms);
    } on HiveDataException {
      return GameTypes(categories: [], platforms: []);
    } catch (e) {
      MyLogger.error(
          msg: 'box get data has exception: $e', error: e, stackTrace: e);
      return GameTypes(categories: [], platforms: []);
    }
  }

  @override
  Future<void> cacheGameTypes(GameTypes typesToCache) async {
    var cBox = await _getHiveBox(HomeBox.Category);
    if (cBox.hasData()) {
      typesToCache.categories.addNewToHive(
          box: cBox, identifier: 'type-category', filterKey: 'id');
    } else {
      typesToCache.categories
          .addAllToHive(box: cBox, identifier: 'type-category');
    }
    cBox.compact();
    MyLogger.print(
        msg: 'cached category in HIVE: ${cBox.values.length}', tag: tag);

    var pBox = await _getHiveBox(HomeBox.Platform);
    if (pBox.hasData()) {
      typesToCache.platforms.addNewToHive(
          box: pBox, identifier: 'type-platform', filterKey: 'id');
    } else {
      typesToCache.platforms
          .addAllToHive(box: pBox, identifier: 'type-platform');
    }
    MyLogger.print(
        msg: 'cached platform in HIVE: ${pBox.values.length}', tag: tag);
    return pBox.compact();
  }
}
