import 'dart:async' show StreamController;

import 'package:flutter_85bet_mobile/core/repository_export.dart';
import 'package:flutter_85bet_mobile/features/member/data/repository/member_jwt_interface.dart';
import 'package:flutter_85bet_mobile/utils/json_util.dart';
import 'package:meta/meta.dart' show required;

import '../models/wallet_model.dart';

class WalletApi {
  static const String POST_WALLET = "api/walletbalance";
  static const String POST_CHANGE = "api/changewallet";
  static const String GET_PROMISE = "api/allBlancePromise";
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
}

class WalletRepositoryImpl implements WalletRepository {
  final DioApiService dioApiService;
  final MemberJwtInterface jwtInterface;
  final tag = 'WalletRepository';
  bool jwtChecked = false;

  WalletRepositoryImpl(
      {@required this.dioApiService, @required this.jwtInterface}) {
    Future.value(jwtInterface.checkJwt('/'))
        .then((value) => jwtChecked = value.isSuccess);
  }

  @override
  Future<Either<Failure, WalletModel>> getWallet() async {
    if (!jwtChecked) {
      await jwtInterface
          .checkJwt(WalletApi.JWT_CHECK_HREF)
          .then((value) => jwtChecked = value.isSuccess);
    }
    if (jwtChecked) {
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
        (model) => (model.auto != '-1') ? Right(model) : Left(Failure.token()),
      );
    } else {
      MyLogger.warn(msg: 'user token is not valid', tag: tag);
      return Right(WalletModel(auto: '-1'));
    }
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
    final result = await requestDataString(
      request: dioApiService.get(
        WalletApi.GET_PROMISE,
        userToken: jwtInterface.token,
      ),
      allowJsonString: true,
      tag: 'remote-WALLET_PROMISE',
    );
//    debugPrint('test response type: ${result.runtimeType}, data: $result');
    return result.fold(
      (failure) => [],
      (data) {
        if (data.isNotEmpty) {
          try {
            // decode list in json format to string list
            List decoded = JsonUtil.decodeArray(data, trim: false);
            MyLogger.print(msg: 'bankcard decoded list: $decoded', tag: tag);
            return decoded;
          } on Exception catch (e) {
            MyLogger.error(msg: 'bankcard map error!!', error: e, tag: tag);
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
    List platforms = await _getPromiseList();
    if (platforms != null && platforms.isNotEmpty) {
      final result = await Future.microtask(
        () => dioApiService.postList(
          WalletApi.POST_TRANSFER,
          dataList: List.generate(
            platforms.length,
            (index) => {
              'accountcode': jwtInterface.account,
              'plat': platforms[index],
            },
          ),
          keyList: platforms,
          stream: progressController,
          userToken: jwtInterface.token,
        ),
      ).catchError((e) => null);
      return Right(result);
    } else {
      MyLogger.warn(
          msg: 'cannot retrieve platform list in wallet page!!', tag: tag);
      return Left(Failure.server());
    }
  }
}
