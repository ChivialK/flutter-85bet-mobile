import 'package:flutter_85bet_mobile/core/repository_export.dart';

import '../models/flow_model.dart';

class FlowsApi {
  static const String GET_RECORD = "api/rollback";
}

abstract class FlowsRepository {
  Future<Either<Failure, List<FlowModel>>> getDataModel(int page);
}

class FlowsRepositoryImpl implements FlowsRepository {
  final DioApiService dioApiService;
  final JwtInterface jwtInterface;
  final tag = 'FlowRepository';

  FlowsRepositoryImpl(
      {@required this.dioApiService, @required this.jwtInterface}) {
    Future.sync(() => jwtInterface.checkJwt('/'));
  }

  @override
  Future<Either<Failure, List<FlowModel>>> getDataModel(int page) async {
    final result = await requestModelList<FlowModel>(
      request: dioApiService.get(FlowsApi.GET_RECORD),
      jsonToModel: FlowModel.jsonToFlowModel,
      tag: 'remote-FLOW',
    );
//    debugPrint('test response type: ${result.runtimeType}, data: $result');
    return result.fold(
      (failure) => Left(failure),
      (list) => Right(list),
    );
  }
}
