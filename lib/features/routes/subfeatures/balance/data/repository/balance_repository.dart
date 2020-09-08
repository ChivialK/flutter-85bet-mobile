import 'package:flutter_85bet_mobile/core/repository_export.dart';
import 'package:flutter_85bet_mobile/features/routes/subfeatures/transfer/data/form/transfer_form.dart';

class BalanceApi {
  static const String GET_PROMISE = "api/allBlancePromise";
  static const String GET_BALANCE = "api/balance";
  static const String GET_LIMIT = "api/get_account/creditlimit";
  static const String POST_TRANSFER = "api/transfer";
}

abstract class BalanceRepository {
  Future<Either<Failure, List<String>>> getPromise();
  Future<Either<Failure, String>> getBalance(String platform);
  Future<Either<Failure, String>> getLimit();
  Future<Either<Failure, RequestStatusModel>> postTransfer(TransferForm form);
}

class BalanceRepositoryImpl implements BalanceRepository {
  final DioApiService dioApiService;
  final JwtInterface jwtInterface;
  final tag = 'BalanceRepository';

  BalanceRepositoryImpl(
      {@required this.dioApiService, @required this.jwtInterface}) {
    Future.sync(() => jwtInterface.checkJwt('/'));
  }

  @override
  Future<Either<Failure, List<String>>> getPromise() async {
    final result = await requestDataString(
      request: dioApiService.get(
        BalanceApi.GET_PROMISE,
        userToken: jwtInterface.token,
      ),
      allowJsonString: true,
      tag: 'remote-PROMISE',
    );
//    debugPrint('test response type: ${result.runtimeType}, data: $result');
    return result.fold(
      (failure) => Left(failure),
      (str) {
        try {
          var list = JsonUtil.decodeArray(str);
//          debugPrint('balance promise result: $list');
          return Right(list.map((e) => e.toString()).toList());
        } on Exception {
          return Left(Failure.jsonFormat());
        }
      },
    );
  }

  @override
  Future<Either<Failure, String>> getBalance(String platform) async {
    final result = await requestDataString(
      request: dioApiService.get(
        '${BalanceApi.GET_BALANCE}/$platform',
        userToken: jwtInterface.token,
      ),
      allowJsonString: true,
      tag: 'remote-BALANCE',
    );
//    debugPrint('test response type: ${result.runtimeType}, data: $result');
    return result.fold(
      (failure) => Left(failure),
      (data) {
        try {
          var map = jsonDecode(data);
          if (map.containsKey('balance')) {
            debugPrint('decoded credit: ${map['balance']}');
            return Right(map['balance']);
          } else {
            debugPrint('decoded: $map');
            return Right('---');
          }
        } catch (e) {
          debugPrint('balance error: $platform');
          return Right('');
        }
      },
    );
  }

  @override
  Future<Either<Failure, String>> getLimit() async {
    final result = await requestDataString(
      request: dioApiService.get(
        BalanceApi.GET_LIMIT,
        userToken: jwtInterface.token,
      ),
      allowJsonString: true,
      tag: 'remote-LIMIT',
    );
//    debugPrint('test response type: ${result.runtimeType}, data: $result');
    return result.fold(
      (failure) => Left(failure),
      (data) {
        try {
          var map = jsonDecode(data);
          if (map.containsKey('creditlimit')) {
            debugPrint('decoded limit: ${map['creditlimit']}');
            return Right(map['creditlimit']);
          } else {
            debugPrint('decoded: $map');
            return Right('-1');
          }
        } catch (e) {
          debugPrint('credit limit error: $e');
          return Right('');
        }
      },
    );
  }

  @override
  Future<Either<Failure, RequestStatusModel>> postTransfer(
    TransferForm form,
  ) async {
    final result = await requestModel<RequestStatusModel>(
      request:
          dioApiService.post(BalanceApi.POST_TRANSFER, data: form.toJson()),
      jsonToModel: RequestStatusModel.jsonToStatusModel,
      tag: 'remote-TRANSFER',
    );
//    debugPrint('test response type: ${result.runtimeType}, data: $result');
    return result.fold(
      (failure) => Left(failure),
      (model) async {
        String platform = (form.from == '0') ? form.to : form.from;
        await requestDataString(
          request:
              dioApiService.get('${BalanceApi.GET_BALANCE}/$platform/reload'),
          allowJsonString: true,
          tag: 'remote-RELOAD',
        );
        return Right(model);
      },
    );
  }
}