import 'package:flutter_85bet_mobile/core/repository_export.dart';

import '../form/login_form.dart';
import '../form/register_form.dart';
import '../models/user_model.dart';

class UserApi {
  static const String LOGIN = "api/login";
  static const String GET_ACCOUNT = "api/get_account";
  static const String POST_REGISTER = "api/reg";
  static const String JWT_CHECK_HREF = "/myaccount";
  static const String LOGOUT = "api/logout";
}

abstract class UserRepository {
  /// Login user and get user info
  Future<Either<Failure, UserModel>> login(LoginForm form);

  /// Register new user
  Future<Either<Failure, RequestStatusModel>> postRegister(RegisterForm form);
}

class UserRepositoryImpl implements UserRepository {
  final DioApiService dioApiService;
  final JwtInterface jwtInterface;
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
        debugPrint('data response type: ${data.runtimeType}');
        try {
          if (data.toString().contains('token_mobile')) {
            // extract token from response data
            final token =
                data.substring(data.indexOf('=') + 1, data.indexOf(';'));
            debugPrint('token: $token');
            MyLogger.log(msg: 'start validate token...', tag: tag);
            return await checkToken(form.account, token);
          } else if (data.toString().contains('"msg":')) {
            RequestStatusModel loginStatus = JsonUtil.decodeToModel(data,
                (jsonMap) => RequestStatusModel.jsonToStatusModel(jsonMap));
            debugPrint('login result: $loginStatus');
            return Left(Failure.login(loginStatus));
          }
        } catch (e, s) {
          debugPrint('login has exception: $e, stack:\n$s');
        }
        return Left(Failure.dataType());
      },
    );
  }

  ///
  /// Calls the [JwtInterface.checkJwt] to check if the returned token is valid,
  /// then calls [getAccount] to retrieve user info.
  ///
  Future<Either<Failure, UserModel>> checkToken(
      String account, String token) async {
    return await Future.delayed(Duration(milliseconds: 500), () {
      return jwtInterface.checkJwt(
        UserApi.JWT_CHECK_HREF,
        loginAccount: account,
        loginToken: token,
      );
    }).then((result) {
      return result.fold((failure) => Left(failure), (status) async {
        if (status.isSuccess) {
          MyLogger.log(
              msg:
                  'id ${status.msg} token is valid, requesting account info...',
              tag: tag);
          jwtInterface.accountId = status.msg;
          return await getAccount(token);
        } else {
          MyLogger.warn(msg: 'token is not valid: $status', tag: tag);
          jwtInterface.clearToken();
          return Left(Failure.token(FailureType.LOGIN));
        }
      });
    });
  }

  ///
  /// Calls the service [UserApi.GET_ACCOUNT] endpoint,
  /// and decode json into [UserModel].
  ///
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

  @override
  Future<Either<Failure, RequestStatusModel>> postRegister(
      RegisterForm form) async {
    final result = await requestModel<RequestStatusModel>(
      request: dioApiService.post(
        UserApi.POST_REGISTER,
        data: form.toJson(),
      ),
      jsonToModel: RequestStatusModel.jsonToStatusModel,
      tag: 'remote-REGISTER',
    );
//    debugPrint('test response type: ${result.runtimeType}, data: $result');
    return result.fold(
      (failure) => Left(failure),
      (data) => Right(data),
    );
  }
}
