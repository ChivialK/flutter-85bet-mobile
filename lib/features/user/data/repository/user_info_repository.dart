import 'package:flutter_85bet_mobile/core/repository_export.dart';
import 'package:flutter_85bet_mobile/features/user/data/models/user_model.dart';

class UserInfoApi {
  static const String GET_ACCOUNT_LIMIT = "api/get_account";
  static const String GET_NEW_MESSAGE_COUNT = 'api/stationCount';
}

abstract class UserInfoRepository {
  Future<Either<Failure, String>> updateCredit();

  Future<Either<Failure, bool>> checkNewMessage();
}

class UserInfoRepositoryImpl implements UserInfoRepository {
  final DioApiService dioApiService;
  final JwtInterface jwtInterface;
  final tag = 'UserInfoRepository';

  UserInfoRepositoryImpl(
      {@required this.dioApiService, @required this.jwtInterface}) {
    Future.sync(() => jwtInterface.checkJwt('/'));
  }

  @override
  Future<Either<Failure, String>> updateCredit() async {
    final result = await requestModel<UserModel>(
      request: dioApiService.get(UserInfoApi.GET_ACCOUNT_LIMIT,
          userToken: jwtInterface.token),
      jsonToModel: UserModel.jsonToUserModel,
      tag: 'remote-USER_INFO',
    );
//    debugPrint('test response type: ${result.runtimeType}, data: $result');
    return result.fold(
      (failure) => Left(failure),
      (data) => Right(data.credit),
    );
  }

  @override
  Future<Either<Failure, bool>> checkNewMessage() async {
    final result = await requestModel<RequestCodeModel>(
      request: dioApiService.get(UserInfoApi.GET_NEW_MESSAGE_COUNT),
      jsonToModel: RequestCodeModel.jsonToCodeModel,
      tag: 'remote-EVENT',
    );
//    debugPrint('test response type: ${result.runtimeType}, data: $result');
    return result.fold(
      (failure) => Left(failure),
      (model) {
        if (model.isSuccess == false) return Right(false);
        Map<String, dynamic> data = model.data;
        if (data != null && data.containsKey('count') && data['count'] > 0)
          return Right(true);
        else
          return Right(false);
      },
    );
  }
}
