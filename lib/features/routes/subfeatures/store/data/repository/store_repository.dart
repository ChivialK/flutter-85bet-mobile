import 'package:flutter_85bet_mobile/core/network/dio_api_service.dart';
import 'package:flutter_85bet_mobile/core/repository_export.dart';
import 'package:flutter_85bet_mobile/features/routes/subfeatures/store/data/form/store_exchange_form.dart';
import 'package:flutter_85bet_mobile/utils/json_util.dart';
import 'package:flutter_85bet_mobile/utils/value_util.dart';
import 'package:meta/meta.dart' show required;

import '../form/store_exchange_history_form.dart';
import '../models/store_banner_model.dart';
import '../models/store_exchange_model.dart';
import '../models/store_product_model.dart';
import '../models/store_rules_model.dart';

class StoreApi {
  static const String POST_BANNER = "api/listBanner";
  static const String POST_PRODUCT = "api/listproduct";
  static const String POST_POINT = "api/listpoint";
  static const String POST_EXCHANGE_HISTORY = "api/listexchange";
  static const String POST_PLATFORM_DOLLAR = "api/listdoller";
  static const String POST_PROVINCE = "api/getProvince";
  static const String POST_CITY = "api/getCity";
  static const String POST_EXCHANGE = "api/exchange";
  static const String POST_RULES = "api/listRule";
}

abstract class StoreRepository {
  Future<Either<Failure, List<StoreBannerModel>>> getBanners();

  Future<Either<Failure, List<StoreProductModel>>> getProduct({int productId});

  Future<Either<Failure, num>> getPoint();

  Future<Either<Failure, StoreRulesModel>> getRules();

  Future<Either<Failure, StoreExchangeModel>> getExchange(
      StoreExchangeHistoryForm form);

  Future<Either<Failure, Map<String, String>>> getProvinces();

  Future<Either<Failure, Map<String, String>>> getMapByCode(String code);

  Future<Either<Failure, dynamic>> postExchange(StoreExchangeForm form);
}

class StoreRepositoryImpl implements StoreRepository {
  final DioApiService dioApiService;
  final JwtInterface jwtInterface;
  final tag = 'StoreRepository';

  StoreRepositoryImpl(
      {@required this.dioApiService, @required this.jwtInterface}) {
    Future.sync(() => jwtInterface.checkJwt('/'));
  }

  @override
  Future<Either<Failure, List<StoreBannerModel>>> getBanners() async {
    final result = await requestModel<RequestCodeModel>(
      request: dioApiService.post(
        StoreApi.POST_BANNER,
        userToken: jwtInterface.token,
      ),
      jsonToModel: RequestCodeModel.jsonToCodeModel,
      tag: 'remote-STORE',
    );
//    debugPrint('test response type: ${result.runtimeType}, data: $result');
    return result.fold(
      (failure) => Left(failure),
      (model) {
        if (model.isSuccess == false) return Left(Failure.server());
        if (model.data != null && model.data.toString().isNotEmpty) {
          return Right(JsonUtil.decodeArrayToModel(
            model.data,
            (jsonMap) => StoreBannerModel.jsonToStoreBannerModel(jsonMap),
          ));
        } else {
          MyLogger.warn(
              msg: 'store banners returns empty, data: ${model.data}',
              tag: 'remote-STORE');
          return Right([]);
        }
      },
    );
  }

  @override
  Future<Either<Failure, List<StoreProductModel>>> getProduct(
      {int productId}) async {
    final result = await requestModel<RequestCodeModel>(
      request: dioApiService.post(
        StoreApi.POST_PRODUCT,
        userToken: jwtInterface.token,
        param: (productId != null) ? {'productid': productId} : null,
      ),
      jsonToModel: RequestCodeModel.jsonToCodeModel,
      tag: 'remote-STORE',
    );
//    debugPrint('test response type: ${result.runtimeType}, data: $result');
    return result.fold(
      (failure) => Left(failure),
      (model) {
        if (model.isSuccess == false) return Left(Failure.server());
        if (model.data != null && model.data.toString().isNotEmpty) {
          return Right(JsonUtil.decodeArrayToModel(
            model.data,
            (jsonMap) => StoreProductModel.jsonToStoreProductModel(jsonMap),
          ));
        } else {
          MyLogger.warn(
              msg: 'store product returns empty, data: ${model.data}',
              tag: 'remote-STORE');
          return Right([]);
        }
      },
    );
  }

  @override
  Future<Either<Failure, num>> getPoint() async {
    final result = await requestModel<RequestCodeModel>(
      request: dioApiService.post(
        StoreApi.POST_POINT,
        userToken: jwtInterface.token,
      ),
      jsonToModel: RequestCodeModel.jsonToCodeModel,
      tag: 'remote-STORE',
    );
//    debugPrint('test response type: ${result.runtimeType}, data: $result');
    return result.fold(
      (failure) => Left(failure),
      (model) {
        if (model.isSuccess == false) return Left(Failure.server());
        if (model.data != null &&
            model.data.toString().isNotEmpty &&
            (model.data as Map).containsKey('point')) {
          var value = (model.data as Map)['point'];
          return (value is num)
              ? Right(value)
              : Right(value.toString().strToInt);
        } else {
          return Right(-1);
        }
      },
    );
  }

  @override
  Future<Either<Failure, StoreRulesModel>> getRules() async {
    final dollarResult = await _getPlatformDollar();
    final rulesResult = await _getRules();
    if (dollarResult.isLeft() || rulesResult.isLeft())
      return Left(Failure.server());

    var dollarData = dollarResult.fold(
      (left) => null,
      (right) => (right.isSuccess) ? right.data : null,
    );
    if (dollarData == null || dollarData.toString().isEmpty) {
      MyLogger.warn(
          msg: 'store dollar data empty. platforms: $dollarResult',
          tag: 'remote-STORE');
      return Left(Failure.server());
    }

    var rulesData = rulesResult.fold(
      (left) => null,
      (right) => (right.isSuccess) ? right.data : null,
    );
    if (rulesData == null || rulesData.toString().isEmpty) {
      MyLogger.warn(
          msg: 'store rules data empty. rules: $rulesData',
          tag: 'remote-STORE');
      return Left(Failure.server());
    }

    try {
      return Right(StoreRulesModel(
        platformRules: JsonUtil.decodeArrayToModel(
          dollarData,
          (jsonMap) => StorePlatformDollar.jsonToStorePlatformDollar(jsonMap),
        ),
        rules: JsonUtil.decodeArrayToModel(
          rulesData,
          (jsonMap) => StoreRuleData.jsonToStoreRuleData(jsonMap),
        ),
      ));
    } on Exception {
      MyLogger.error(
          msg: 'store rules decode error.\n'
              'platforms: $dollarResult\n'
              'rules: $rulesResult',
          tag: 'remote-STORE');
      return Left(Failure.jsonFormat());
    }
  }

  Future<Either<Failure, RequestCodeModel>> _getPlatformDollar() async {
    final result = await requestModel<RequestCodeModel>(
      request: dioApiService.post(
        StoreApi.POST_PLATFORM_DOLLAR,
        userToken: jwtInterface.token,
      ),
      jsonToModel: RequestCodeModel.jsonToCodeModel,
      tag: 'remote-STORE',
    );
//    debugPrint('test response type: ${result.runtimeType}, data: $result');
    return result.fold(
      (failure) => Left(failure),
      (model) => Right(model),
    );
  }

  Future<Either<Failure, RequestCodeModel>> _getRules() async {
    final result = await requestModel<RequestCodeModel>(
      request: dioApiService.post(
        StoreApi.POST_RULES,
        userToken: jwtInterface.token,
      ),
      jsonToModel: RequestCodeModel.jsonToCodeModel,
      tag: 'remote-STORE',
    );
//    debugPrint('test response type: ${result.runtimeType}, data: $result');
    return result.fold(
      (failure) => Left(failure),
      (model) => Right(model),
    );
  }

  @override
  Future<Either<Failure, StoreExchangeModel>> getExchange(
    StoreExchangeHistoryForm form,
  ) async {
    final result = await requestModel<RequestCodeModel>(
      request: dioApiService.post(
        StoreApi.POST_EXCHANGE_HISTORY,
        userToken: jwtInterface.token,
        param: (form is StoreExchangeHistoryInit) ? form.toJson() : null,
        data: (form is StoreExchangeHistoryQuery) ? form.toJson() : null,
      ),
      jsonToModel: RequestCodeModel.jsonToCodeModel,
      tag: 'remote-STORE',
    );
//    debugPrint('test response type: ${result.runtimeType}, data: $result');
    return result.fold(
      (failure) => Left(failure),
      (model) {
        if (model.isSuccess == false)
          return (model.msg != null && model.msg.isNotEmpty)
              ? Left(Failure.errorMessage(msg: model.msg))
              : Left(Failure.server());

        if (model.data != null && model.data.toString().isNotEmpty) {
          try {
            return Right(JsonUtil.decodeToModel<StoreExchangeModel>(
              model.data,
              (jsonMap) => StoreExchangeModel.jsonToStoreExchangeModel(jsonMap),
            ));
          } on Exception {
            MyLogger.error(
                msg: 'store exchange data decode error: ${model.data}',
                tag: 'remote-STORE');
            return Left(Failure.jsonFormat());
          }
        } else {
          return Right(StoreExchangeModel(total: 0));
        }
      },
    );
  }

  @override
  Future<Either<Failure, Map<String, String>>> getProvinces() async {
    final result = await requestDataString(
      request: dioApiService.post(
        StoreApi.POST_PROVINCE,
        userToken: jwtInterface.token,
      ),
      allowJsonString: true,
      tag: 'remote-STORE',
    );
//    debugPrint('test response type: ${result.runtimeType}, data: $result');
    return result.fold(
      (failure) => Left(failure),
      (str) {
        try {
          Map<String, dynamic> map = jsonDecode(str);
          return Right(map.map<String, String>(
            (key, value) => MapEntry<String, String>(key, value.toString()),
          ));
        } on Exception {
          MyLogger.error(
              msg: 'store province data decode error: $str',
              tag: 'remote-STORE');
          return Left(Failure.jsonFormat());
        }
      },
    );
  }

  @override
  Future<Either<Failure, Map<String, String>>> getMapByCode(String code) async {
    final result = await requestDataString(
      request: dioApiService.post(
        StoreApi.POST_CITY,
        data: {"code": code},
        userToken: jwtInterface.token,
      ),
      allowJsonString: true,
      tag: 'remote-STORE',
    );
//    debugPrint('test response type: ${result.runtimeType}, data: $result');
    return result.fold(
      (failure) => Left(failure),
      (str) {
        if (str == '[]') return Right(Map());
        try {
          Map<String, dynamic> map = jsonDecode(str);
          return Right(map.map<String, String>(
            (key, value) => MapEntry<String, String>(key, value.toString()),
          ));
        } on Exception {
          MyLogger.error(
              msg: 'store city data decode error: $str', tag: 'remote-STORE');
          return Left(Failure.jsonFormat());
        }
      },
    );
  }

  @override
  Future<Either<Failure, dynamic>> postExchange(StoreExchangeForm form) async {
    final result = await requestDataString(
      request: dioApiService.post(
        StoreApi.POST_EXCHANGE,
        data: form.toJson,
        userToken: jwtInterface.token,
      ),
      allowJsonString: true,
      tag: 'remote-STORE',
    );
//    debugPrint('test response type: ${result.runtimeType}, data: $result');
    return result.fold(
      (failure) => Left(failure),
      (str) {
        try {
          Map<String, dynamic> map = jsonDecode(str);
          if (map.containsKey('code'))
            return Right(JsonUtil.decodeToModel(
                map, (jsonMap) => RequestCodeModel.jsonToCodeModel(jsonMap)));
          else
            return Right(JsonUtil.decodeToModel(map,
                (jsonMap) => RequestStatusModel.jsonToStatusModel(jsonMap)));
        } on Exception {
          MyLogger.error(
              msg: 'store exchange result decode error: $str',
              tag: 'remote-STORE');
          return Left(Failure.jsonFormat());
        }
      },
    );
  }
}
