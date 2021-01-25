import 'dart:async' show StreamController;

import 'package:dio/dio.dart';
import 'package:flutter_85bet_mobile/core/repository_export.dart';

import '../models/wallet_model.dart';

class WalletApi {
  static const String POST_WALLET = "api/walletbalance";
  static const String POST_CHANGE = "api/changewallet";
  static const String GET_PROMISE = "api/allBalancePromise";
  static const String POST_TRANSFER = "api/balancetomain";

  static const String JWT_CHECK_HREF = "/no_transfer_wallet";
  static const String WALLET_OPTION_SINGLE = "WlraLb1";
  static const String WALLET_OPTION_MULTI = "WlraLb0";
}

abstract class WalletRepository {
  Future<Either<Failure, WalletModel>> getWallet();
  Future<Either<Failure, String>> postWalletType(bool toSingle);
  Future<Either<Failure, Map<String, dynamic>>> postTransferAll(
    StreamController<String> progressController,
  );
  Future<Either<Failure, bool>> cancelTransferAll();
}

class WalletRepositoryImpl implements WalletRepository {
  final DioApiService dioApiService;
  final JwtInterface jwtInterface;
  final tag = 'WalletRepository';

  CancelToken _postListCancelToken;

  WalletRepositoryImpl(
      {@required this.dioApiService, @required this.jwtInterface}) {
    Future.sync(() => jwtInterface.checkJwt('/'));
  }

  @override
  Future<Either<Failure, WalletModel>> getWallet() async {
    final result = await requestModel<WalletModel>(
      request: dioApiService.post(
        WalletApi.POST_WALLET,
        userToken: jwtInterface.token,
        data: {'accountcode': jwtInterface.account},
      ),
      jsonToModel: WalletModel.jsonToWalletModel,
      tag: 'remote-WALLET',
    );
//      debugPrint('test response type: ${result.runtimeType}, data: $result');
    return result.fold(
      (failure) => Left(failure),
      (model) => (model.auto != '-1')
          ? Right(model)
          : Left(Failure.token(FailureType.CREDIT)),
    );
  }

  @override
  Future<Either<Failure, String>> postWalletType(bool toSingle) async {
    final result = await requestDataString(
      request: dioApiService.post(
        WalletApi.POST_CHANGE,
        data: {
          'accountcode': jwtInterface.account,
          'status': (toSingle)
              ? WalletApi.WALLET_OPTION_SINGLE
              : WalletApi.WALLET_OPTION_MULTI,
        },
        userToken: jwtInterface.token,
      ),
      allowJsonString: true,
      tag: 'remote-WALLET_CHANGE',
    );
//    debugPrint('test response type: ${result.runtimeType}, data: $result');
    return result.fold(
      (failure) => Left(failure),
      (data) => Right(data),
    );
  }

  Future<List> _getPromiseList() async {
    final result = await requestModel<RequestCodeModel>(
      request: dioApiService.get(
        WalletApi.GET_PROMISE,
        userToken: jwtInterface.token,
      ),
      jsonToModel: RequestCodeModel.jsonToCodeModel,
      tag: 'remote-WALLET_PROMISE',
    );
//    debugPrint('test response type: ${result.runtimeType}, data: $result');
    return result.fold(
      (failure) => [],
      (model) {
        if (model.data.isNotEmpty) {
          try {
            // decode list in json format to string list
            List decoded = JsonUtil.decodeArray(model.data, trim: false);
            MyLogger.print(
                msg: 'wallet platform decoded list: $decoded', tag: tag);
            if (decoded.isNotEmpty) {
              if (decoded.first is String) {
                return decoded.map((e) => e.toString()).toList();
              } else if (decoded.first is Map) {
                List<String> list = decoded.map((e) {
                  Map itemMap = e as Map;
                  return (itemMap.containsKey('name'))
                      ? '${itemMap['name']}'
                      : '';
                }).toList()
                  ..removeWhere((element) => element.isEmpty);
                // debugPrint('wallet platform list: $list');
                return list;
              }
            }
          } on Exception catch (e) {
            MyLogger.error(
                msg: 'wallet platform map error!!', error: e, tag: tag);
          }
        }
        return [];
      },
    );
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> postTransferAll(
    StreamController<String> progressController,
  ) async {
    _postListCancelToken = new CancelToken();
    List platforms = await _getPromiseList();
    if (platforms != null && platforms.isNotEmpty) {
      final result = await Future.microtask(
        () => dioApiService.postList(
          WalletApi.POST_TRANSFER,
          dataList: List.generate(
            platforms.length,
            (index) => {
              'accountcode': jwtInterface.account,
              'plat': {'name': platforms[index]},
            },
          ),
          keyList: platforms,
          stream: progressController,
          userToken: jwtInterface.token,
          cancelToken: _postListCancelToken,
        ),
      ).catchError((e) => null);
      return Right(result);
    } else {
      MyLogger.warn(
          msg: 'cannot retrieve platform list in wallet page!!', tag: tag);
      return Left(Failure.server());
    }
  }

  @override
  Future<Either<Failure, bool>> cancelTransferAll() {
    _postListCancelToken?.cancel();
    _postListCancelToken = null;
    return Future.value(Right(true));
  }
}
