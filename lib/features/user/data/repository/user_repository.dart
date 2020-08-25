import 'package:flutter_85bet_mobile/core/network/dio_api_service.dart';
import 'package:flutter_85bet_mobile/core/repository_export.dart';
import 'package:flutter_85bet_mobile/features/member/data/repository/member_jwt_interface.dart';
import 'package:flutter_85bet_mobile/utils/json_util.dart';

import '../form/login_form.dart';
import '../models/user_model.dart';

class UserApi {
  static const String LOGIN = "api/login";
  static const String GET_ACCOUNT = "api/get_account";
  static const String JWT_CHECK = "api/checkJwt";
  static const String JWT_CHECK_HREF = "/myaccount";
  static const String LOGOUT = "api/logout";
}

abstract class UserRepository {
  /// Login user and retrieve token, check it with [checkJwt], then calls [getAccount] to return data.
  Future<Either<Failure, UserModel>> login(LoginForm form);

  /// Calls the service [UserApi.GET_ACCOUNT] endpoint, and decode json into [UserModel].
  Future<Either<Failure, UserModel>> getAccount(String token);
}

class UserRepositoryImpl implements UserRepository {
  final DioApiService dioApiService;
  final MemberJwtInterface jwtInterface;
  final tag = 'UserRepository';

  UserRepositoryImpl(
      {@required this.dioApiService, @required this.jwtInterface});

  /// Calls the service [UserApi.LOGIN] endpoint with [form] to get user token.
  Future<Either<Failure, dynamic>> _getToken(LoginForm form) {
    debugPrint('start requesting token...');
    return requestHeader(
      request: dioApiService.post(UserApi.LOGIN, data: form.toJson()),
      header: 'set-cookie',
      tag: 'remote-USER',
    );
  }

  @override
  Future<Either<Failure, UserModel>> login(LoginForm form) async {
    final result = await _getToken(form);
//    debugPrint('test response type: ${result.runtimeType}, data: $result');
    return result.fold(
      (failure) => Left(failure),
      (data) async {
        if (data is String && data.isNotEmpty) {
          // data contains status string when failed
          if (data.contains('status')) {
            Map<String, dynamic> map = jsonDecode(data);
            return Left(
                Failure.login(RequestStatusModel.jsonToStatusModel(map)));
          }

          // extract token from response data
          final token =
              data.substring(data.indexOf('=') + 1, data.indexOf(';'));
          MyLogger.debug(msg: 'token: \n$token', tag: tag);
          MyLogger.log(msg: 'start validate token...', tag: tag);

          // check extracted token is valid
          return await Future.delayed(Duration(milliseconds: 500), () {
            return jwtInterface.checkJwt(
              UserApi.JWT_CHECK_HREF,
              loginAccount: form.account,
              loginToken: token,
            );
          }).then((status) async {
            if (status.isSuccess) {
              MyLogger.log(
                msg: 'id ${status.msg} token is valid, '
                    'requesting account info...',
                tag: tag,
              );
              jwtInterface.accountId = status.msg;
              return await getAccount(token);
            } else {
              MyLogger.warn(msg: 'token is not valid: $status', tag: tag);
              jwtInterface.clearToken();
              return Left(Failure.token());
            }
          });
        } else {
          /// return login failure status
          RequestStatusModel statusModel;
          try {
            statusModel = JsonUtil.decodeToModel(
              data,
              RequestStatusModel.jsonToStatusModel,
              tag: tag,
            );
          } on Exception {
            statusModel = RequestStatusModel(
              status: 'failed',
              msg: Failure.dataType().message,
            );
          }
          return Left(Failure.login(statusModel));
        }
      },
    );
  }

  @override
  Future<Either<Failure, UserModel>> getAccount(String token) async {
    final result = await requestModel<UserModel>(
      request: dioApiService.get(UserApi.GET_ACCOUNT, userToken: token),
      jsonToModel: UserModel.jsonToUserModel,
      tag: 'remote-USER',
    );
//    debugPrint('test response type: ${result.runtimeType}, data: $result');
    return result.fold(
      (failure) => Left(failure),
      (model) => Right(model),
    );
  }
}
