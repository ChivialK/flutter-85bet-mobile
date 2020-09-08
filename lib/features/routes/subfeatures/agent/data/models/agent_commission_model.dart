import 'package:freezed_annotation/freezed_annotation.dart';

part 'agent_commission_model.freezed.dart';

@freezed
abstract class AgentCommissionModel with _$AgentCommissionModel {
  const factory AgentCommissionModel({
    String direct,
    String fee,
    @JsonKey(name: 'platform_fee') String platformFee,
    String summary,
    String team,
    @JsonKey(name: 'validbet') String validBet,
    @JsonKey(name: 'winlose') String winLose,
    dynamic key,
  }) = _AgentCommissionModel;

  static AgentCommissionModel jsonToAgentCommissionModel(
      Map<String, dynamic> jsonMap) {
    return _$_AgentCommissionModel(
      direct: jsonMap['direct'] as String,
      fee: jsonMap['fee'] as String,
      platformFee: jsonMap['platform_fee'] as String,
      summary: jsonMap['summary'] as String,
      team: jsonMap['team'] as String,
      validBet: jsonMap['validbet'] as String,
      winLose: jsonMap['winlose'] as String,
      key: jsonMap['key'],
    );
  }
}
