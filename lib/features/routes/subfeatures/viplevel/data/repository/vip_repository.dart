import 'package:flutter_85bet_mobile/core/repository_export.dart';

import '../models/vip_level_model.dart';

class VipLevelApi {
  static const String GET_LEVEL = "api/vipLevel";
  static const String GET_RULE = "api/getVipRule";
}

abstract class VipLevelRepository {
  Future<Either<Failure, VipLevelModel>> getLevel();
}

class VipLevelRepositoryImpl implements VipLevelRepository {
  final DioApiService dioApiService;
  final tag = 'VipLevelRepository';

  VipLevelRepositoryImpl({@required this.dioApiService});

  @override
  Future<Either<Failure, VipLevelModel>> getLevel() async {
    final result = await requestModel<VipLevelModel>(
      request: dioApiService.get(VipLevelApi.GET_LEVEL),
      jsonToModel: VipLevelModel.jsonToVipLevelModel,
      tag: 'remote-VIP',
    );
//    debugPrint('test response type: ${result.runtimeType}, data: $result');
    return result.fold(
      (failure) => Left(failure),
      (model) => Right(model),
    );
  }
}
