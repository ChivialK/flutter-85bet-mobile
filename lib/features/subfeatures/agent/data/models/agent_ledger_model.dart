import 'package:flutter_85bet_mobile/core/base/table_operator.dart';
import 'package:flutter_85bet_mobile/utils/json_util.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'agent_ledger_model.freezed.dart';

@freezed
abstract class AgentLedgerModel
    with _$AgentLedgerModel
    implements TableOperator {
  const factory AgentLedgerModel({
    @JsonKey(name: 'current_page') int currentPage,
    @JsonKey(name: 'last_page') int lastPage,
    @JsonKey(name: 'per_page') int perPage,
    int from,
    int to,
    int total,
    @JsonKey(name: 'next_page_url') String nextPageUrl,
    @JsonKey(name: 'prev_page_url') String prevPageUrl,
    @JsonKey(fromJson: decodeAgentLedgerData) List<AgentLedgerData> data,
  }) = _AgentLedgerModel;

  static AgentLedgerModel jsonToAgentLedgerModel(Map<String, dynamic> jsonMap) {
    return _$_AgentLedgerModel(
      currentPage: jsonMap['current_page'] as int,
      lastPage: jsonMap['last_page'] as int,
      perPage: jsonMap['per_page'] as int,
      from: jsonMap['from'] as int,
      to: jsonMap['to'] as int,
      total: jsonMap['total'] as int,
      nextPageUrl: jsonMap['next_page_url'] as String,
      prevPageUrl: jsonMap['prev_page_url'] as String,
      data: decodeAgentLedgerData(jsonMap['data']),
    );
  }
}

extension AgentLedgerModelExtension on AgentLedgerModel {
  List<num> get sumEachColumn {
    if (data == null || data.isEmpty) return [];
    List<num> sumColumn = new List.generate(4, (_) => 0);
    data.forEach((element) {
      for (int i = 0; i < 4; i++) {
        var sum = sumColumn[i];
        sum += element[i];
        sumColumn.replaceRange(i, i + 1, [sum]);
      }
    });
    return sumColumn;
  }
}

List<AgentLedgerData> decodeAgentLedgerData(dynamic str) =>
    JsonUtil.decodeArrayToModel(
      str,
      (jsonMap) => AgentLedgerData.jsonToAgentLedgerData(jsonMap),
      tag: 'AgentLedgerData',
    );

@freezed
abstract class AgentLedgerData with _$AgentLedgerData implements TableOperator {
  const factory AgentLedgerData({
    @JsonKey(name: 'Deposit') num deposit,
    @JsonKey(name: 'Preferential') num preferential,
    @JsonKey(name: 'Rolling') num rolling,
    @JsonKey(name: 'Withdraw') num withdraw,
    @JsonKey(name: 'accountcode') String account,
  }) = _AgentLedgerData;

  static AgentLedgerData jsonToAgentLedgerData(Map<String, dynamic> jsonMap) {
    return _$_AgentLedgerData(
      deposit: jsonMap['Deposit'] as num,
      preferential: jsonMap['Preferential'] as num,
      rolling: jsonMap['Rolling'] as num,
      withdraw: jsonMap['Withdraw'] as num,
      account: jsonMap['accountcode'] as String,
    );
  }
}
