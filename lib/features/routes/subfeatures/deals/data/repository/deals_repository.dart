import 'package:flutter_85bet_mobile/core/repository_export.dart';

import '../form/deals_form.dart';
import '../models/deals_model.dart';

class DealsApi {
  static const String GET_RECORD = "api/getTransaction";
}

abstract class DealsRepository {
  Future<Either<Failure, DealsModel>> getDataModel(DealsForm form);
}

class DealsRepositoryImpl implements DealsRepository {
  final DioApiService dioApiService;
  final JwtInterface jwtInterface;
  final tag = 'DealsRepository';

  DealsRepositoryImpl(
      {@required this.dioApiService, @required this.jwtInterface}) {
    Future.sync(() => jwtInterface.checkJwt('/'));
  }

  @override
  Future<Either<Failure, DealsModel>> getDataModel(DealsForm form) async {
    final result = await requestModel<DealsModel>(
      request: dioApiService.get(
        DealsApi.GET_RECORD,
        data: form.toJson,
      ),
      jsonToModel: DealsModel.jsonToDealsModel,
      tag: 'remote-DEALS',
    );
//    debugPrint('test response type: ${result.runtimeType}, data: $result');
    return result.fold(
      (failure) => Left(failure),
      (model) => Right(model),
    );
  }
}
