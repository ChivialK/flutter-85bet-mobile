import 'package:flutter_85bet_mobile/core/repository_export.dart';

import '../../data/models/rollback_model.dart';
import '../form/withdraw_form.dart';
import '../models/withdraw_model.dart';

class WithdrawApi {
  static const String GET_CGP = "api/getCgpWallet";
  static const String GET_CPW = "api/getCpwWallet";
  static const String GET_ROLLBACK = "api/rollback";
  static const String POST_WITHDRAW = "api/withdrawal";
  static const String POST_PROMISE = "api/balancetomain";
}

abstract class WithdrawRepository {
  Future<Either<Failure, String>> getCgpWallet();
  Future<Either<Failure, String>> getCpwWallet();
  Future<Either<Failure, String>> getRollback();
  Future<Either<Failure, WithdrawModel>> postWithdraw(WithdrawForm form);
  Future<Either<Failure, String>> postVaBalanceToMain();
}

class WithdrawRepositoryImpl implements WithdrawRepository {
  final DioApiService dioApiService;
  final JwtInterface jwtInterface;
  final tag = 'WithdrawRepository';

  WithdrawRepositoryImpl(
      {@required this.dioApiService, @required this.jwtInterface}) {
    Future.sync(() => jwtInterface.checkJwt('/'));
  }

  @override
  Future<Either<Failure, String>> getCgpWallet() async {
    final result = await requestDataString(
      request: dioApiService.get(
        WithdrawApi.GET_CGP,
        userToken: jwtInterface.token,
      ),
      tag: 'remote-CGP',
    );
//    debugPrint('test response type: ${result.runtimeType}, data: $result');
    return result.fold(
      (failure) => Left(failure),
      (data) => Right(data),
    );
  }

  @override
  Future<Either<Failure, String>> getCpwWallet() async {
    final result = await requestDataString(
      request: dioApiService.get(
        WithdrawApi.GET_CPW,
        userToken: jwtInterface.token,
      ),
      tag: 'remote-CPW',
    );
//    debugPrint('test response type: ${result.runtimeType}, data: $result');
    return result.fold(
      (failure) => Left(failure),
      (data) => Right(data),
    );
  }

  @override
  Future<Either<Failure, WithdrawModel>> postWithdraw(WithdrawForm form) async {
    final result = await requestModel<WithdrawModel>(
      request: dioApiService.post(
        WithdrawApi.POST_WITHDRAW,
        data: form.toJson(),
        userToken: jwtInterface.token,
      ),
      jsonToModel: WithdrawModel.jsonToWithdrawModel,
      tag: 'remote-WITHDRAW',
    );
//    debugPrint('test response type: ${result.runtimeType}, data: $result');
    return result.fold(
      (failure) => Left(failure),
      (model) {
        if (model.code == 0)
          return Right(model);
        else
          return Left(Failure.errorMessage(msg: model.msg));
      },
    );
  }

  @override
  Future<Either<Failure, String>> getRollback() async {
    final result = await requestData(
      request: dioApiService.get(
        WithdrawApi.GET_ROLLBACK,
        userToken: jwtInterface.token,
      ),
    );
//    debugPrint('test response type: ${result.runtimeType}, data: $result');
    return result.fold(
      (failure) => Left(failure),
      (data) {
        debugPrint('rollback data type: ${data.runtimeType}');
        if ('$data'.isEmpty) return Right('0');

        List<RollbackModel> models;
        if (data is Map)
          models = JsonUtil.decodeMapToModelList(
            data,
            (jsonMap) => RollbackModel.jsonToRollbackModel(jsonMap),
          );
        else if (data is String)
          models = JsonUtil.decodeMapToModelList(
            jsonDecode(data),
            (jsonMap) => RollbackModel.jsonToRollbackModel(jsonMap),
          );

        if (models != null && models.isNotEmpty) {
          debugPrint('rollback model: $models');
          int totalRollover = 0;
          models.forEach((element) {
            totalRollover += element.rollover;
          });
          return Right('$totalRollover');
        }
        return Right('0');
      },
    );
  }

  @override
  Future<Either<Failure, String>> postVaBalanceToMain() async {
    final result = await requestData(
      request: dioApiService.post(
        WithdrawApi.POST_PROMISE,
        data: {'accountcode': jwtInterface.account, 'plat': 'Va'},
        userToken: jwtInterface.token,
      ),
      tag: 'remote-WITHDRAW',
    );
//    debugPrint('test response type: ${result.runtimeType}, data: $result');
    return result.fold(
      (failure) => Left(failure),
      (data) {
        if (data is Map) {
          return Right(data['creditlimit'] ?? 'NaN');
        } else {
          return Right('NaN');
        }
      },
    );
  }
}
