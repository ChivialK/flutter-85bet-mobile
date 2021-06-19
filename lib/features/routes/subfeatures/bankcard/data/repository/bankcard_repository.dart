import 'package:flutter_85bet_mobile/core/repository_export.dart';

import '../form/bankcard_form.dart';
import '../models/bankcard_model.dart';

class BankcardApi {
  static const String GET_CARD = "api/bankcard";
  static const String GET_CARD_VERIFIED = "api/phoneVerification";
  static const String POST_PROVINCES = "api/getProvince";
  static const String POST_BANKS = "api/getBankid";
  static const String POST_CITY = "api/getCity";
  static const String POST_NEW_CARD = "api/addbankcard";
}

abstract class BankcardRepository {
  Future<Either<Failure, BankcardModel>> getBankcard(bool isWithdraw);

  Future<Either<Failure, RequestCodeModel>> postBankcard(BankcardForm form);

  Future<Either<Failure, Map<String, String>>> getBanks();

  Future<Either<Failure, Map<String, String>>> getProvinces();

  Future<Either<Failure, Map<String, String>>> getMapByCode(String code);
}

class BankcardRepositoryImpl implements BankcardRepository {
  final DioApiService dioApiService;
  final JwtInterface jwtInterface;
  final tag = 'BankcardRepository';

  BankcardRepositoryImpl(
      {@required this.dioApiService, @required this.jwtInterface}) {
    Future.sync(() => jwtInterface.checkJwt('/'));
  }

  @override
  Future<Either<Failure, BankcardModel>> getBankcard(bool isWithdraw) async {
    final result = await requestModel<RequestCodeModel>(
      request: dioApiService.get(
        (isWithdraw) ? BankcardApi.GET_CARD_VERIFIED : BankcardApi.GET_CARD,
        userToken: jwtInterface.token,
      ),
      jsonToModel: RequestCodeModel.jsonToCodeModel,
      tag: 'remote-BANKCARD',
    );
//    debugPrint('test response type: ${result.runtimeType}, data: $result');
    return result.fold(
      (failure) => Left(failure),
      (data) {
        if (data.isSuccess && data.data.toString().isNotEmpty) {
          MyLogger.print(msg: 'bankcard map: ${data.data}', tag: tag);
          if (data.data is Map) {
            return Right(BankcardModel.jsonToBankcardModel(data.data)
                .copyWith(hasCard: true));
          } else if (data.data is String) {
            return Right(
                BankcardModel.jsonToBankcardModel(jsonDecode(data.data))
                    .copyWith(hasCard: true));
          } else {
            return Left(Failure.dataType());
          }
        } else {
          return Right(BankcardModel(hasCard: false));
        }
      },
    );
  }

  @override
  Future<Either<Failure, RequestCodeModel>> postBankcard(
      BankcardForm form) async {
    final result = await requestModel<RequestCodeModel>(
      request: dioApiService.post(
        BankcardApi.POST_NEW_CARD,
        data: form.toJson(),
        userToken: jwtInterface.token,
      ),
      jsonToModel: RequestCodeModel.jsonToCodeModel,
      tag: 'remote-BANKCARD_NEW',
    );
//    debugPrint('test response type: ${result.runtimeType}, data: $result');
    return result.fold(
      (failure) => Left(failure),
      (model) => Right(model),
    );
  }

  @override
  Future<Either<Failure, Map<String, String>>> getBanks() async {
    final result = await requestData(
      request: dioApiService.post(
        BankcardApi.POST_BANKS,
        userToken: jwtInterface.token,
      ),
      tag: 'remote-BANK_ID',
    );
//    debugPrint('test response type: ${result.runtimeType}, data: $result');
    return result.fold(
      (failure) => Left(failure),
      (data) {
        if (data is Map || data is String) {
          return _processMap(data, 'banks id');
        } else {
          return Left(Failure.jsonFormat());
        }
      },
    );
  }

  @override
  Future<Either<Failure, Map<String, String>>> getProvinces() async {
    final result = await requestData(
      request: dioApiService.post(
        BankcardApi.POST_PROVINCES,
        userToken: jwtInterface.token,
      ),
      tag: 'remote-BANK_PROVINCE',
    );
//    debugPrint('test response type: ${result.runtimeType}, data: $result');
    return result.fold(
      (failure) => Left(failure),
      (data) {
        if ('$data'.isEmpty || '$data' == '[]') return Right(null);
        if (data is Map || data is String) {
          return _processMap(data, 'provinces');
        } else {
          return Left(Failure.jsonFormat());
        }
      },
    );
  }

  @override
  Future<Either<Failure, Map<String, String>>> getMapByCode(String code) async {
    final result = await requestData(
      request: dioApiService.post(
        BankcardApi.POST_CITY,
        data: {"code": code},
        userToken: jwtInterface.token,
      ),
      tag: 'remote-BANK_AREA',
    );
//    debugPrint('test response type: ${result.runtimeType}, data: $result');
    return result.fold(
      (failure) => Left(failure),
      (data) {
        if (data.toString().isEmpty || data.toString() == '[]')
          return Right(null);
        if (data is Map || data is String) {
          return _processMap(data, 'areas');
        } else {
          return Left(Failure.jsonFormat());
        }
      },
    );
  }

  Either<Failure, Map<String, String>> _processMap(
    dynamic data,
    String dataName, {
    bool debug = false,
  }) {
    try {
      if (debug)
        MyLogger.print(
          msg: '$dataName data type: ${data.runtimeType}, data: \n$data',
          tag: tag,
        );

      if (data is Map) {
        return Right(data.map<String, String>(
            (key, value) => MapEntry<String, String>(key, value.toString())));
      } else {
        var map = jsonDecode('$data');
        return Right(map.map<String, String>(
            (key, value) => MapEntry<String, String>(key, value.toString())));
      }
    } catch (e) {
      MyLogger.error(
          msg: '$dataName data process error!! $e', error: e, tag: tag);
      return Left(Failure.jsonFormat());
    }
  }
}
