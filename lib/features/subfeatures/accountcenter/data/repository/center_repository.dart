import 'package:flutter_85bet_mobile/core/repository_export.dart';
import 'package:flutter_85bet_mobile/features/member/data/repository/member_jwt_interface.dart';
import 'package:flutter_85bet_mobile/utils/json_util.dart';

import '../form/center_password_form.dart';
import '../models/center_model.dart';

class CenterApi {
  static const String GET_ACCOUNT = "api/center";
  static const String GET_CGP_URL = "api/bindcgp";
  static const String GET_CPW_URL = "api/bindcpw";
  static const String POST_PASSWORD = "api/edit_password";
  static const String POST_BIRTH = "api/edit_dob";
  static const String POST_EMAIL = "api/edit_email";
  static const String POST_WECHAT = "api/edit_wechat";
  static const String POST_LUCKY = "api/edit_lucky";
  static const String POST_VERIFY_REQUEST = "api/sendMessage";
  static const String POST_VERIFY = "api/checkVerifyCode";
  static const String JWT_CHECK_HREF = "/center";
}

abstract class CenterRepository {
  Future<Either<Failure, CenterModel>> getAccount();
  Future<Either<Failure, List<String>>> getCgpBindUrl();
  Future<Either<Failure, List<String>>> getCpwBindUrl();
  Future<Either<Failure, RequestStatusModel>> postPassword(
      CenterPasswordForm form);
  Future<Either<Failure, RequestStatusModel>> postBirth(String dateOfBirth);
  Future<Either<Failure, RequestStatusModel>> postEmail(String email);
  Future<Either<Failure, RequestStatusModel>> postWechat(String wechatId);
  Future<Either<Failure, RequestStatusModel>> postLucky(List<int> numbers);
  Future<Either<Failure, RequestCodeModel>> postVerifyRequest(String mobile);
  Future<Either<Failure, RequestCodeModel>> postVerify(
      String mobile, String code);
}

class CenterRepositoryImpl implements CenterRepository {
  final DioApiService dioApiService;
  final MemberJwtInterface jwtInterface;
  final tag = 'CenterRepository';
  bool jwtChecked = false;

  CenterRepositoryImpl(
      {@required this.dioApiService, @required this.jwtInterface}) {
    Future.value(jwtInterface.checkJwt('/'))
        .then((value) => jwtChecked = value.isSuccess);
  }
  @override
  Future<Either<Failure, CenterModel>> getAccount() async {
    final result = await requestModel<CenterModel>(
      request: dioApiService.get(
        CenterApi.GET_ACCOUNT,
        userToken: jwtInterface.token,
      ),
      jsonToModel: CenterModel.jsonToCenterModel,
      tag: 'remote-ACCOUNT',
    );
//    debugPrint('test response type: ${result.runtimeType}, data: $result');
    return result.fold(
      (failure) => Left(failure),
      (model) =>
          (model.accountCode != null) ? Right(model) : Left(Failure.token()),
    );
  }

  @override
  Future<Either<Failure, List<String>>> getCgpBindUrl() async {
    final result = await requestDataString(
      request: dioApiService.get(
        CenterApi.GET_CGP_URL,
        userToken: jwtInterface.token,
      ),
      allowJsonString: true,
      tag: 'remote-CGP_URL',
    );
//    debugPrint('test response type: ${result.runtimeType}, data: $result');
    return result.fold(
      (failure) => Left(failure),
      (data) => Right(_parseWalletUrl(data)),
    );
  }

  @override
  Future<Either<Failure, List<String>>> getCpwBindUrl() async {
    final result = await requestDataString(
      request: dioApiService.get(
        CenterApi.GET_CPW_URL,
        userToken: jwtInterface.token,
      ),
      allowJsonString: true,
      tag: 'remote-CGP_URL',
    );
//    debugPrint('test response type: ${result.runtimeType}, data: $result');
    return result.fold(
      (failure) => Left(failure),
      (data) => Right(_parseWalletUrl(data)),
    );
  }

  List<String> _parseWalletUrl(String jsonStr) {
    if (jsonStr.startsWith('{')) {
//      debugPrint('encode: ${jsonEncode(jsonStr)}');
//      debugPrint('decode: ${jsonDecode(jsonStr)}');
      Map map = jsonDecode(jsonStr);
      var url = (map.containsKey('url')) ? '${map['url']}' : '';
      var qrcode = (map.containsKey('qrcode')) ? '${map['qrcode']}' : '';
      return [url, qrcode];
    } else {
      return [];
    }
  }

  @override
  Future<Either<Failure, RequestStatusModel>> postPassword(
    CenterPasswordForm form,
  ) async {
    final result = await requestModel<RequestStatusModel>(
      request: dioApiService.post(
        CenterApi.POST_PASSWORD,
        data: form.toJson(),
        userToken: jwtInterface.token,
      ),
      jsonToModel: RequestStatusModel.jsonToStatusModel,
      tag: 'remote-CENTER_PWD',
    );
//    debugPrint('test response type: ${result.runtimeType}, data: $result');
    return result.fold(
      (failure) => Left(failure),
      (model) => Right(model),
    );
  }

  @override
  Future<Either<Failure, RequestStatusModel>> postBirth(
    String dateOfBirth,
  ) async {
    final result = await requestModel<RequestStatusModel>(
      request: dioApiService.post(
        CenterApi.POST_BIRTH,
        data: {'dob': dateOfBirth},
        userToken: jwtInterface.token,
      ),
      jsonToModel: RequestStatusModel.jsonToStatusModel,
      tag: 'remote-CENTER_BIRTH',
    );
//    debugPrint('test response type: ${result.runtimeType}, data: $result');
    return result.fold(
      (failure) => Left(failure),
      (model) => Right(model),
    );
  }

  @override
  Future<Either<Failure, RequestStatusModel>> postEmail(String email) async {
    final result = await requestModel<RequestStatusModel>(
      request: dioApiService.post(
        CenterApi.POST_EMAIL,
        data: {'email': email},
        userToken: jwtInterface.token,
      ),
      jsonToModel: RequestStatusModel.jsonToStatusModel,
      tag: 'remote-CENTER_EMAIL',
    );
//    debugPrint('test response type: ${result.runtimeType}, data: $result');
    return result.fold(
      (failure) => Left(failure),
      (model) => Right(model),
    );
  }

  @override
  Future<Either<Failure, RequestStatusModel>> postWechat(
    String wechatId,
  ) async {
    final result = await requestModel<RequestStatusModel>(
      request: dioApiService.post(
        CenterApi.POST_WECHAT,
        data: {'wechat': wechatId},
        userToken: jwtInterface.token,
      ),
      jsonToModel: RequestStatusModel.jsonToStatusModel,
      tag: 'remote-CENTER_WECHAT',
    );
//    debugPrint('test response type: ${result.runtimeType}, data: $result');
    return result.fold(
      (failure) => Left(failure),
      (model) => Right(model),
    );
  }

  @override
  Future<Either<Failure, RequestStatusModel>> postLucky(
    List<int> numbers,
  ) async {
    final result = await requestModel<RequestStatusModel>(
      request: dioApiService.post(
        CenterApi.POST_LUCKY,
        data: {'lucky': JsonUtil.encodeToJsonArray(numbers)},
        userToken: jwtInterface.token,
      ),
      jsonToModel: RequestStatusModel.jsonToStatusModel,
      tag: 'remote-CENTER_LUCKY',
    );
//    debugPrint('test response type: ${result.runtimeType}, data: $result');
    return result.fold(
      (failure) => Left(failure),
      (model) => Right(model),
    );
  }

  @override
  Future<Either<Failure, RequestCodeModel>> postVerifyRequest(
    String mobile,
  ) async {
    final result = await requestModel<RequestCodeModel>(
      request: dioApiService.post(
        CenterApi.POST_VERIFY_REQUEST,
        data: {'phone': mobile},
        userToken: jwtInterface.token,
      ),
      jsonToModel: RequestCodeModel.jsonToCodeModel,
      tag: 'remote-CENTER_VERIFY',
    );
//    debugPrint('test response type: ${result.runtimeType}, data: $result');
    return result.fold(
      (failure) => Left(failure),
      (model) => Right(model),
    );
  }

  @override
  Future<Either<Failure, RequestCodeModel>> postVerify(
    String mobile,
    String code,
  ) async {
    final result = await requestModel<RequestCodeModel>(
      request: dioApiService.post(
        CenterApi.POST_VERIFY,
        data: {'phone': mobile, 'code': code},
        userToken: jwtInterface.token,
      ),
      jsonToModel: RequestCodeModel.jsonToCodeModel,
      tag: 'remote-CENTER_VERIFY',
    );
//    debugPrint('test response type: ${result.runtimeType}, data: $result');
    return result.fold(
      (failure) => Left(failure),
      (model) => Right(model),
    );
  }
}
