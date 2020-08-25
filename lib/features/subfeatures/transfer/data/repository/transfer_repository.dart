import 'package:flutter_85bet_mobile/core/repository_export.dart';
import 'package:flutter_85bet_mobile/features/member/data/repository/member_jwt_interface.dart';

import '../form/transfer_form.dart';
import '../models/transfer_balance_model.dart';
import '../models/transfer_platform_model.dart';

class TransferApi {
  static const String GET_PLATFORM = "api/getPlatform";
  static const String GET_BALANCE = "api/balance/";
  static const String POST_TRANSFER = "api/transfer";
}

abstract class TransferRepository {
  Future<Either<Failure, TransferPlatformList>> getPlatform();
  Future<Either<Failure, TransferBalanceModel>> getBalance(String platform);
  Future<Either<Failure, RequestStatusModel>> postTransfer(TransferForm form);
}

class TransferRepositoryImpl implements TransferRepository {
  final DioApiService dioApiService;
  final MemberJwtInterface jwtInterface;
  final tag = 'TransferRepository';
  bool jwtChecked = false;

  TransferRepositoryImpl(
      {@required this.dioApiService, @required this.jwtInterface}) {
    Future.value(jwtInterface.checkJwt('/'))
        .then((value) => jwtChecked = value.isSuccess);
  }

  @override
  Future<Either<Failure, TransferPlatformList>> getPlatform() async {
    final result = await requestModelList<TransferPlatformModel>(
      request: dioApiService.get(
        TransferApi.GET_PLATFORM,
        userToken: jwtInterface.token,
      ),
      jsonToModel: TransferPlatformModel.jsonToTransferPlatformModel,
      tag: 'remote-TRANSFORM',
    );
//    print('test response type: ${result.runtimeType}, data: $result');
    return result.fold(
      (failure) => Left(failure),
      (models) => Right(TransferPlatformList(list: models)),
    );
  }

  @override
  Future<Either<Failure, TransferBalanceModel>> getBalance(
      String platform) async {
    final result = await requestModel<TransferBalanceModel>(
      request: dioApiService.get(
        '${TransferApi.GET_BALANCE}$platform',
        userToken: jwtInterface.token,
      ),
      jsonToModel: TransferBalanceModel.jsonToTransferBalanceModel,
      tag: 'remote-TRANSFORM',
    );
//    print('test response type: ${result.runtimeType}, data: $result');
    return result.fold(
      (failure) => Left(failure),
      (model) => Right(model),
    );
  }

  @override
  Future<Either<Failure, RequestStatusModel>> postTransfer(
      TransferForm form) async {
    final result = await requestModel<RequestStatusModel>(
      request: dioApiService.post(
        TransferApi.POST_TRANSFER,
        userToken: jwtInterface.token,
        data: form.toJson(),
      ),
      jsonToModel: RequestStatusModel.jsonToStatusModel,
      tag: 'remote-TRANSFER',
    );
//    print('test response type: ${result.runtimeType}, data: $result');
    return result.fold(
      (failure) => Left(failure),
      (model) => Right(model),
    );
  }
}
