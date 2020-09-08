import 'package:flutter_85bet_mobile/core/error/exceptions.dart';
import 'package:flutter_85bet_mobile/core/repository_export.dart';

import '../models/promo_freezed.dart';
import 'promo_local_storage.dart';

class PromoApi {
  static const String GET_PROMO = "api/promo";
}

abstract class PromoRepository {
  Future<Either<Failure, List<PromoEntity>>> getPromos();
  Future<Either<Failure, List<PromoEntity>>> getCachedPromos();
}

class PromoRepositoryImpl implements PromoRepository {
  final DioApiService dioApiService;
  final NetworkInfo networkInfo;
  final PromoLocalStorage localStorage;
  final tag = 'PromoRepository';

  PromoRepositoryImpl({
    @required this.dioApiService,
    @required this.networkInfo,
    @required this.localStorage,
  });

  List<PromoEntity> _transformPromoModels(List<PromoModel> data) {
    final list = data.map((model) {
      return model.entity;
    }).toList();
    MyLogger.log(msg: 'mapped promo models: ${list.length}', tag: tag);
    return list;
  }

  @override
  Future<Either<Failure, List<PromoEntity>>> getPromos() async {
    final connected = await networkInfo.isConnected;
    if (connected) {
      final result = await requestModelList<PromoModel>(
        request: dioApiService.get(PromoApi.GET_PROMO),
        jsonToModel: PromoModel.jsonToPromoModel,
        tag: 'remote-PROMO',
      );
//      debugPrint('test response type: ${result.runtimeType}, data: $result');
      return result.fold(
        (failure) {
          if (failure.typeIndex == 0)
            return getCachedPromos();
          else
            return Left(failure);
        },
        (models) => Right(_transformPromoModels(models)),
      );
    }
    return getCachedPromos();
  }

  @override
  Future<Either<Failure, List<PromoEntity>>> getCachedPromos() async {
    try {
      debugPrint('accessing promo data storage...');
      var cached = await localStorage.getCachedPromos();
//      debugPrint('data from cached source: $cached');
      if (cached.isNotEmpty)
        return Right(cached);
      else
        return Left(Failure.network());
    } on HiveDataException {
      MyLogger.debug(msg: 'no cached promo', tag: tag);
      return Right(new List<PromoEntity>(0));
    }
  }
}
