import 'dart:io' show Cookie;

import 'package:flutter_85bet_mobile/core/error/exceptions.dart';
import 'package:flutter_85bet_mobile/core/internal/global.dart';
import 'package:flutter_85bet_mobile/core/repository_export.dart';
import 'package:flutter_85bet_mobile/utils/regex_util.dart';

import '../entity/banner_entity.dart';
import '../entity/game_entity.dart';
import '../entity/marquee_entity.dart';
import '../form/platform_game_form.dart';
import '../models/banner_model.dart';
import '../models/game_model.dart';
import '../models/game_platform.dart';
import '../models/game_types.dart';
import '../models/marquee_model.dart';
import '../models/marquee_model_list.dart';
import 'home_local_storage.dart';

class HomeApi {
  static const String BANNER = "api/banner";
  static const String MARQUEE = "api/marquee";
  static const String GAME_ALL = "api/getAll";
  static const String GAME_RECOMMEND = "api/getRecommend";
  static const String GAME_FAVORITE = "api/getallfavorite";
  static const String GAME_OPEN = "api/open/";
  static const String GAME_URL = "api/openUrl/";
  static const String POST_FAVORITE_PLATFORM = "api/setfavoriteplatform";
  static const String POST_FAVORITE_GAME = "api/setfavorite";

  /// Post with data PlatformGameForm
  static const String LOGIN = "api/login";
  static const String GAME_INDEX = "api/getindexGame";
}

abstract class HomeRepository {
  Future<Either<Failure, List<BannerEntity>>> getBanners();

  Future<Either<Failure, List<BannerEntity>>> getCachedBanners();

  Future<Either<Failure, List<MarqueeEntity>>> getMarquees();

  Future<Either<Failure, List<MarqueeEntity>>> getCachedMarquees();

  Future<Either<Failure, GameTypes>> getGameTypes();

  Future<Either<Failure, GameTypes>> getCachedGameTypes();

  Future<Either<Failure, List<GameEntity>>> getGames(PlatformGameForm form);

  Future<Either<Failure, List>> getRecommend();

  Future<Either<Failure, List>> getFavorites();

  Future<Either<Failure, bool>> postFavoritePlatform(int id, bool favorite);

  Future<Either<Failure, bool>> postFavoriteGame(int id, bool favorite);

  Future<Either<Failure, String>> getGameUrl(String requestUrl);
}

class HomeRepositoryImpl implements HomeRepository {
  final NetworkInfo networkInfo;
  final DioApiService dioApiService;
  final HomeLocalStorage localStorage;
  final JwtInterface jwtInterface;
  final tag = 'HomeRepository';

  HomeRepositoryImpl({
    @required this.networkInfo,
    @required this.dioApiService,
    @required this.localStorage,
    @required this.jwtInterface,
  });

  @override
  Future<Either<Failure, List<BannerEntity>>> getBanners() async {
    final connected = await networkInfo.isConnected;
    if (!connected) return getCachedBanners();

    final result = await requestModelList<BannerModel>(
      request: dioApiService.get(HomeApi.BANNER),
      jsonToModel: BannerModel.jsonToBannerModel,
      tag: 'remote-BANNER',
    );
//    debugPrint('test response type: ${result.runtimeType}, data: $result');
    return result.fold(
      (failure) {
        if (failure.typeIndex == 0)
          return getCachedBanners();
        else
          return Left(failure);
      },
      (models) => Right(_transformBannerModel(models)),
    );
  }

  List<BannerEntity> _transformBannerModel(List<BannerModel> data) {
    final list = data.map((model) {
      return model.entity;
    }).toList();
    MyLogger.log(msg: 'mapped banner model: ${list.length}', tag: tag);
    localStorage.cacheBanners(list);
    return list;
  }

  @override
  Future<Either<Failure, List<BannerEntity>>> getCachedBanners() async {
    try {
      debugPrint('accessing banner local data source...');
      var cached = await localStorage.getCachedBanners();
//      debugPrint('data from cached source: $cached');
      if (cached.isNotEmpty)
        return Right(cached);
      else
        return Left(Failure.network());
    } on HiveDataException {
      MyLogger.debug(msg: 'no cached banner', tag: tag);
      return Right(new List<BannerEntity>(0));
    }
  }

  @override
  Future<Either<Failure, List<MarqueeEntity>>> getMarquees() async {
//    final connected = await networkInfo.isConnected;
//    if (!connected) return getCachedMarquees();

    final result = await requestModel<MarqueeModelList>(
      request: dioApiService.get(HomeApi.MARQUEE),
      jsonToModel: MarqueeModelList.jsonToMarqueeModelList,
      tag: 'remote-MARQUEE',
    );
//    debugPrint('test response type: ${result.runtimeType}, data: $result');
    return result.fold(
      (failure) => Left(failure),
      (model) => Right(_transformMarqueeModelList(model.marquees)),
    );
  }

  List<MarqueeEntity> _transformMarqueeModelList(List<MarqueeModel> data) {
    final list = data.map((model) {
      return model.entity;
    }).toList();
    MyLogger.log(msg: 'mapped marquee model: ${list.length}', tag: tag);
//    localStorage.cacheMarquees(list);
    return list;
  }

  @override
  Future<Either<Failure, List<MarqueeEntity>>> getCachedMarquees() async {
    try {
      debugPrint('accessing marquee local data source...');
      var cached = await localStorage.getCachedMarquees();
//      debugPrint('data from cached source: $cached');
      if (cached.isNotEmpty)
        return Right(cached);
      else
        return Left(Failure.network());
    } on HiveDataException {
      MyLogger.debug(msg: 'no cached marquee', tag: tag);
      return Right(new List<MarqueeEntity>(0));
    }
  }

  @override
  Future<Either<Failure, GameTypes>> getGameTypes() async {
    final connected = await networkInfo.isConnected;
    if (!connected) return getCachedGameTypes();

    final result = await requestModel<GameTypes>(
      request: dioApiService.post(
        HomeApi.GAME_ALL,
        data: {
          "accountid": jwtInterface.accountId,
        },
      ),
      jsonToModel: GameTypes.jsonToGameTypes,
      tag: 'remote-GAME_ALL',
    );
//    debugPrint('test response type: ${result.runtimeType}, data: $result');
    return result.fold(
      (failure) => Left(failure),
      (model) => Right(_transformGameTypeModelList(model)),
    );
  }

  GameTypes _transformGameTypeModelList(GameTypes data) {
    final entity = data.shrink;
    MyLogger.log(msg: 'mapped game-type model: ${entity.debug}', tag: tag);
    localStorage.cacheGameTypes(entity);
    return entity;
  }

  @override
  Future<Either<Failure, GameTypes>> getCachedGameTypes() async {
    try {
      debugPrint('accessing game-types local data source...');
      var cached = await localStorage.getCachedGameTypes();
//      debugPrint('data from cached source: $cached');
      if (cached != null &&
          cached.categories.isNotEmpty &&
          cached.platforms.isNotEmpty)
        return Right(cached);
      else
        return Left(Failure.network());
    } on HiveDataException {
      MyLogger.debug(msg: 'no cached game-types', tag: tag);
      return Right(new GameTypes(categories: [], platforms: []));
    }
  }

  @override
  Future<Either<Failure, List<GameEntity>>> getGames(
    PlatformGameForm form,
  ) async {
    final result = await requestModelList<GameModel>(
      request: dioApiService.postForm(HomeApi.GAME_INDEX, form.toJson()),
      jsonToModel: GameModel.jsonToGameModel,
      tag: 'remote-GAMES',
    );
//    debugPrint('test response type: ${result.runtimeType}, data: $result');
    return result.fold(
      (failure) => Left(failure),
      (list) => Right(_transformGamesModel(list)),
    );
  }

  List<GameEntity> _transformGamesModel(List<GameModel> data) {
    final list = data.map((model) {
      return model.entity;
    }).toList();
    MyLogger.log(msg: 'mapped game models: ${list.length}', tag: tag);
    return list;
  }

  @override
  Future<Either<Failure, String>> getGameUrl(String requestUrl) async {
    if (requestUrl == null || requestUrl.isEmpty) {
      MyLogger.error(msg: 'game url is empty', tag: tag);
      return Left(Failure.internal(FailureCode(type: FailureType.WEB_URL)));
    }

    final connected = await networkInfo.isConnected;
    if (!connected) return Left(Failure.network());

    List<Cookie> cookies = DioApiService.loadCookies(
        Uri.parse('${Global.CURRENT_BASE}${HomeApi.LOGIN}'));
    debugPrint('Cookies: $cookies');

    Map<String, dynamic> headers = new Map();
    cookies.forEach((element) {
      headers[element.name] = element.value;
      if (element.name == 'token_mobile')
        headers.putIfAbsent('JWT-TOKEN', () => element.value);
    });
    debugPrint('Mapped Cookies: $headers');

    final result = await requestDataString(
      request: dioApiService.get(
        '${HomeApi.GAME_URL}$requestUrl',
        headers: headers,
      ),
      tag: 'remote-GAME_URL',
    );

    return result.fold(
      (failure) => Left(failure),
      (data) => (data.isUrl || (data.isHtmlFormat && data.contains('</form>')))
          ? Right(data)
          : Left(Failure.errorMessage(msg: data)),
    );
  }

  @override
  Future<Either<Failure, List>> getRecommend() async {
    final result = await requestData(
      request: dioApiService.post(
        HomeApi.GAME_RECOMMEND,
        data: {
          'accountid': jwtInterface.accountId,
        },
      ),
      tag: 'remote-RECOMMEND',
    );
//    debugPrint('test response type: ${result.runtimeType}, data: $result');
    return result.fold(
      (failure) => Left(failure),
      (data) {
        debugPrint('check recommend data type: ${data.runtimeType}');
        if (data is List) return Right(_decodeMixedData(data));
        if (data is Map) return Right(_decodeMixedData(data.values.toList()));
        if (data is String) {
          if (data.startsWith('[') && data.endsWith(']')) {
            return Right(_decodeMixedData(jsonDecode(data)));
          } else if (data.startsWith('{') && data.endsWith('}')) {
            return Right(
                _decodeMixedData((jsonDecode(data) as Map).values.toList()));
          }
        }
        return Left(Failure.jsonFormat());
      },
    );
  }

  List _decodeMixedData(List data) {
    if (data == null || data.isEmpty) return [];
    List decodedList = data.map((map) {
      try {
        if (map.containsKey('platform'))
          return GameModel.jsonToGameModel(map).entity;
        else if (map.containsKey('site'))
          return GamePlatform.jsonToGamePlatformEntity(map);
        else
          return '';
      } catch (e) {
        return '';
      }
    }).toList();
    decodedList.removeWhere((element) => element == '');
//    debugPrint('decoded recommend games: $decodedList');
    return decodedList;
  }

  @override
  Future<Either<Failure, List>> getFavorites() async {
    final connected = await networkInfo.isConnected;
    if (!connected) return Left(Failure.network());

    final result = await requestData(
      request: dioApiService.post(
        HomeApi.GAME_FAVORITE,
        data: {
          'accountid': jwtInterface.accountId,
        },
      ),
      tag: 'remote-FAVORITE',
    );
//    debugPrint('test response type: ${result.runtimeType}, data: $result');
    return result.fold(
      (failure) => Left(failure),
      (data) {
        debugPrint('check favorite data type: ${data.runtimeType}');
        Map map = new Map();
        if (data is Map)
          map = data;
        else if (data is String)
          map = jsonDecode(data);
        else
          return Left(Failure.jsonFormat());

        List dataList = new List();
        map.forEach((key, value) {
//            debugPrint('$key data is List: ${value is List}');
          if (value is List)
            dataList.addAll(value);
          else
            MyLogger.warn(
              msg: 'data type error, $key data is ${value.runtimeType}',
              tag: tag,
            );
        });
        return Right(_decodeMixedData(dataList));
      },
    );
  }

  @override
  Future<Either<Failure, bool>> postFavoritePlatform(
    int id,
    bool favorite,
  ) async {
    final result = await requestData(
      request: dioApiService.post(
        HomeApi.POST_FAVORITE_PLATFORM,
        data: {
          'accountid': jwtInterface.accountId,
          'id': id,
          'status': (favorite) ? '1' : '0',
        },
      ),
      tag: 'remote-FAVORITE',
    );
//    debugPrint('test response type: ${result.runtimeType}, data: $result');
    return result.fold(
      (failure) => Left(failure),
      (data) {
        if (data is String)
          return Right(data == '1' || data == 'true');
        else if (data is bool)
          return Right(data);
        else if (data is int)
          return Right(data == 1);
        else
          return Left(Failure.dataType());
      },
    );
  }

  @override
  Future<Either<Failure, bool>> postFavoriteGame(int id, bool favorite) async {
    final connected = await networkInfo.isConnected;
    if (!connected) return Left(Failure.network());

    final result = await requestData(
      request: dioApiService.post(
        HomeApi.POST_FAVORITE_GAME,
        data: {
          'accountid': jwtInterface.accountId,
          'gameid': id,
          'status': (favorite) ? '1' : '0',
        },
      ),
      tag: 'remote-FAVORITE',
    );
//    debugPrint('test response type: ${result.runtimeType}, data: $result');
    return result.fold(
      (failure) => Left(failure),
      (data) {
        if (data is String)
          return Right(data == '1' || data == 'true');
        else if (data is bool)
          return Right(data);
        else if (data is int)
          return Right(data == 1);
        else
          return Left(Failure.dataType());
      },
    );
  }
}
