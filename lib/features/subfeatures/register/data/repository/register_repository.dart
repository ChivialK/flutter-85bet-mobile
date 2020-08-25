import 'dart:convert' show jsonDecode;

import 'package:flutter_85bet_mobile/core/repository_export.dart';

import '../form/register_form.dart';

class RegisterApi {
  static const String POST_REGISTER = "api/reg";
}

abstract class RegisterRepository {
  Future<Either<Failure, RequestStatusModel>> postRegister(RegisterForm form);
}

class RegisterRepositoryImpl implements RegisterRepository {
  final DioApiService dioApiService;
  final tag = 'RegisterRepository';
  bool jwtChecked = false;

  RegisterRepositoryImpl({@required this.dioApiService});

  @override
  Future<Either<Failure, RequestStatusModel>> postRegister(
    RegisterForm form,
  ) async {
    final result = await requestDataString(
      request: dioApiService.post(
        RegisterApi.POST_REGISTER,
        data: form.toJson(),
      ),
      allowJsonString: true,
      tag: 'remote-REGISTER',
    );
//    print('test response type: ${result.runtimeType}, data: $result');
    return result.fold(
      (failure) => Left(failure),
      (result) {
//        print('register result: $result');
        if (result == null || result.isEmpty)
          return Right(RequestStatusModel(status: 'success'));
        else
          return Right(RequestStatusModel.fromJson(jsonDecode(result)));
      },
    );
  }
}
