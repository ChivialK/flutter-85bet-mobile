import 'package:flutter_85bet_mobile/core/repository_export.dart';

class UpdateApi {
  static const String POST_VERSION = "/api/appVersionUpdate";
  static const String GET_VERSION_LIST = "/api/appVersionList";
}

abstract class UpdateRepository {
//  Future<Either<Failure, RequestCodeModel>> postVersion(
//      String version, String updateUrl);
  Future<Either<Failure, List<String>>> getVersion();
}

///
/// Use Postman to manually update app version info
///
class UpdateRepositoryImpl implements UpdateRepository {
  final DioApiService dioApiService;
  final tag = 'UpdateRepository';

  UpdateRepositoryImpl(this.dioApiService);
//
//  @override
//  Future<Either<Failure, RequestCodeModel>> postVersion(
//      String version, String updateUrl) async {
//    final result = await requestData(
//      request: dioApiService.post(
//        UpdateApi.POST_VERSION,
//        data: {'app_version': version, 'app_url': updateUrl},
//      ),
//      tag: 'remote-APP_UPDATE',
//    );
////    debugPrint('test response type: ${result.runtimeType}, data: $result');
//    return result.fold(
//      (failure) => Left(failure),
//      (data) => Right(data),
//    );
//  }

  @override
  Future<Either<Failure, List<String>>> getVersion() async {
    final result = await requestModel<RequestCodeModel>(
      request: dioApiService.get(UpdateApi.GET_VERSION_LIST),
      jsonToModel: RequestCodeModel.jsonToCodeModel,
      tag: 'remote-APP_UPDATE',
    );
//    debugPrint('test response type: ${result.runtimeType}, data: $result');
    return result.fold(
      (failure) => Left(failure),
      (model) =>
          Right([model.data['app_version'] ?? '', model.data['app_url'] ?? '']),
    );
  }
}
