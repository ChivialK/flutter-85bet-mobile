import 'package:flutter_85bet_mobile/core/repository_export.dart';

class MemberApi {
  static const String GET_LIMIT = "api/get_account/creditlimit";
  static const String GET_NEW_MESSAGE_COUNT = 'api/stationCount';
}

abstract class MemberRepository {
  Future<Either<Failure, String>> updateCredit(String account);
  Future<Either<Failure, bool>> checkNewMessage();
}

class MemberRepositoryImpl implements MemberRepository {
  final DioApiService dioApiService;
  final JwtInterface jwtInterface;
  final tag = 'MemberRepository';

  MemberRepositoryImpl(
      {@required this.dioApiService, @required this.jwtInterface}) {
    Future.sync(() => jwtInterface.checkJwt('/'));
  }

  @override
  Future<Either<Failure, bool>> checkNewMessage() async {
    final result = await requestModel<RequestCodeModel>(
      request: dioApiService.get(MemberApi.GET_NEW_MESSAGE_COUNT),
      jsonToModel: RequestCodeModel.jsonToCodeModel,
      tag: 'remote-MEMBER',
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

  @override
  Future<Either<Failure, String>> updateCredit(String account) async {
    final result = await requestDataString(
      request: dioApiService.get(
        MemberApi.GET_LIMIT,
        userToken: jwtInterface.token,
      ),
      allowJsonString: true,
      tag: 'remote-MEMBER',
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
            return Left(Failure.token(FailureType.CREDIT));
          }
        } catch (e) {
          debugPrint('credit limit error: $e');
          return Left(Failure.server());
        }
      },
    );
  }
}
