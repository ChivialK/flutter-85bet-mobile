import 'dart:convert';

import 'package:flutter_85bet_mobile/core/network/dio_api_service.dart';
import 'package:flutter_85bet_mobile/core/network/handler/request_code_model.dart';
import 'package:flutter_85bet_mobile/core/repository_export.dart';
import 'package:flutter_85bet_mobile/features/member/data/repository/member_jwt_interface.dart';
import 'package:flutter_85bet_mobile/features/subfeatures/transactions/data/enum/transaction_date_enum.dart';
import 'package:flutter_85bet_mobile/utils/datetime_format.dart';
import 'package:flutter_85bet_mobile/utils/json_util.dart';
import 'package:meta/meta.dart' show required;

import '../enum/agent_chart_time_enum.dart';
import '../enum/agent_chart_type_enum.dart';
import '../models/agent_ad_model.dart';
import '../models/agent_chart_model.dart';
import '../models/agent_commission_model.dart';
import '../models/agent_ledger_model.dart';
import '../models/agent_model.dart';

class AgentApi {
  static const String GET_AGENT = "api/getAgentDetail";
  static const String POST_AGENT_CODE = "api/addAgentStatus";
  static const String POST_REPORT = "api/getAgentReport";
  static const String POST_COMMISSION = "api/getCommission";
  static const String POST_LEDGER = "api/getDownLedger";
  static const String POST_ADS = "api/getAds";
  static const String POST_MERGE_ADS = "api/getMergeAds";
  static const String POST_MERGE = "api/mergeAds";
}

abstract class AgentRepository {
  Future<Either<Failure, AgentModel>> getAgentDetail();
  Future<Either<Failure, AgentModel>> postAgentStatus();
  Future<Either<Failure, List<AgentChartModel>>> getReport({
    @required AgentChartTime time,
    @required AgentChartType type,
  });
  Future<Either<Failure, List<AgentCommissionModel>>> getCommission();
  Future<Either<Failure, AgentLedgerModel>> getLedger({
    @required String agent,
    @required int page,
    @required TransactionDateSelected dateSelected,
  });
  Future<Either<Failure, List<AgentAdModel>>> getAds();
  Future<Either<Failure, List<AgentAdModel>>> getMergeAds();
  Future<Either<Failure, RequestCodeModel>> postAgentAd(int id);
}

class AgentRepositoryImpl implements AgentRepository {
  final DioApiService dioApiService;
  final MemberJwtInterface jwtInterface;
  final tag = 'AgentRepository';

  AgentRepositoryImpl(
      {@required this.dioApiService, @required this.jwtInterface}) {
    Future.sync(() => jwtInterface.checkJwt('/'));
  }

  @override
  Future<Either<Failure, AgentModel>> getAgentDetail() async {
    final result = await requestModel<AgentModel>(
      request: dioApiService.get(
        AgentApi.GET_AGENT,
        userToken: jwtInterface.token,
      ),
      jsonToModel: AgentModel.jsonToAgentModel,
      tag: 'remote-AGENT',
    );
//    debugPrint('test response type: ${result.runtimeType}, data: $result');
    return result.fold(
      (failure) => Left(failure),
      (model) => Right(model),
    );
  }

  @override
  Future<Either<Failure, AgentModel>> postAgentStatus() async {
    return await requestDataString(
      request: dioApiService.post(
        AgentApi.POST_AGENT_CODE,
        userToken: jwtInterface.token,
      ),
      tag: 'remote-AGENT_STATUS',
    ).then((_) async => await getAgentDetail());
  }

  @override
  Future<Either<Failure, List<AgentChartModel>>> getReport({
    AgentChartTime time,
    AgentChartType type,
  }) async {
    final result = await requestDataString(
      request: dioApiService.post(
        AgentApi.POST_REPORT,
        userToken: jwtInterface.token,
        data: {'searchType': type.value, 'time': time.value},
      ),
      allowJsonString: true,
      tag: 'remote-REPORT',
    );
//    debugPrint('test response type: ${result.runtimeType}, data: $result');
    return result.fold(
      (failure) => Left(failure),
      (data) {
        if (data == '[]') return Right([]);
        List<AgentChartModel> modelList = new List();
        Map<String, dynamic> map = jsonDecode(data);
        map.forEach((key, value) {
          List<AgentChartData> list = JsonUtil.decodeMapToModelList(
              value, (jsonMap) => AgentChartData.jsonToAgentChartData(jsonMap));
          modelList.add(AgentChartModel(
            platform: key,
            dataList: list,
          ));
        });
//        debugPrint('agent report model: $modelList');
        return Right(modelList);
      },
    );
  }

  @override
  Future<Either<Failure, List<AgentCommissionModel>>> getCommission() async {
    final result = await requestModelList<AgentCommissionModel>(
      request: dioApiService.post(
        AgentApi.POST_COMMISSION,
        userToken: jwtInterface.token,
      ),
      jsonToModel: AgentCommissionModel.jsonToAgentCommissionModel,
      tag: 'remote-COMMISSION',
    );
//    debugPrint('test response type: ${result.runtimeType}, data: $result');
    return result.fold(
      (failure) => Left(failure),
      (list) => Right(list),
    );
  }

  @override
  Future<Either<Failure, AgentLedgerModel>> getLedger({
    @required String agent,
    @required int page,
    @required TransactionDateSelected dateSelected,
  }) async {
    DateTime now = DateTime.now();
    String endDate = now.toDateString;
    String startDate;
    switch (dateSelected) {
      case TransactionDateSelected.all:
        startDate = DateTime(2011, 1, 1).toDateString;
        break;
      case TransactionDateSelected.today:
        startDate = now.toDateString;
        break;
      case TransactionDateSelected.yesterday:
        startDate = now.subtract(Duration(days: 1)).toDateString;
        break;
      case TransactionDateSelected.month:
        var lastMonth = now.subtract(Duration(days: 30));
        startDate =
            DateTime(lastMonth.year, lastMonth.month, now.day).toDateString;
        break;
    }
    final result = await requestModel<RequestCodeModel>(
      request: dioApiService.post(
        AgentApi.POST_LEDGER,
        param: {'page': page},
        data: {
          'accountcode': agent,
          'endtime': endDate,
          'starttime': startDate,
        },
        userToken: jwtInterface.token,
      ),
      jsonToModel: RequestCodeModel.jsonToCodeModel,
      tag: 'remote-AGENT_LEDGER',
    );
//    debugPrint('test response type: ${result.runtimeType}, data: $result');
    return result.fold(
      (failure) => Left(failure),
      (model) {
        var dataStr = (model.data != null) ? model.data.toString() : '';
        if (dataStr.isEmpty || dataStr == '[]') {
          return Right(AgentLedgerModel(data: []));
        } else {
          try {
            if (model.data is Map)
              return Right(AgentLedgerModel.jsonToAgentLedgerModel(model.data));
            else
              return Right(AgentLedgerModel.jsonToAgentLedgerModel(
                  jsonDecode(model.data)));
          } catch (e) {
            MyLogger.error(msg: 'ledger model has exception: $e', tag: tag);
            return Left(Failure.jsonFormat());
          }
        }
      },
    );
  }

  @override
  Future<Either<Failure, List<AgentAdModel>>> getAds() async {
    final result = await requestModelList<AgentAdModel>(
      request: dioApiService.post(
        AgentApi.POST_ADS,
        userToken: jwtInterface.token,
      ),
      jsonToModel: AgentAdModel.jsonToAgentAdModel,
      tag: 'remote-AGENT_ADS',
    );
//    debugPrint('test response type: ${result.runtimeType}, data: $result');
    return result.fold(
      (failure) => Left(failure),
      (list) => Right(list),
    );
  }

  @override
  Future<Either<Failure, List<AgentAdModel>>> getMergeAds() async {
    final result = await requestModelList<AgentAdModel>(
      request: dioApiService.post(
        AgentApi.POST_MERGE_ADS,
        userToken: jwtInterface.token,
      ),
      jsonToModel: AgentAdModel.jsonToAgentAdModel,
      tag: 'remote-AGENT_MERGE',
    );
//    debugPrint('test response type: ${result.runtimeType}, data: $result');
    return result.fold(
      (failure) => Left(failure),
      (list) => Right(list),
    );
  }

  @override
  Future<Either<Failure, RequestCodeModel>> postAgentAd(int id) async {
    final result = await requestModel<RequestCodeModel>(
      request: dioApiService.post(
        AgentApi.POST_MERGE,
        data: {'adsId': id},
        userToken: jwtInterface.token,
      ),
      jsonToModel: RequestCodeModel.jsonToCodeModel,
      tag: 'remote-AGENT_MERGE_AD',
    );
//    debugPrint('test response type: ${result.runtimeType}, data: $result');
    return result.fold(
      (failure) => Left(failure),
      (model) => Right(model),
    );
  }
}
