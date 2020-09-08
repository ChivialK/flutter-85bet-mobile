import 'package:flutter_85bet_mobile/core/base/table_operator.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'agent_chart_model.freezed.dart';

@freezed
abstract class AgentChartModel with _$AgentChartModel implements TableOperator {
  const factory AgentChartModel({
    String platform,
    List<AgentChartData> dataList,
  }) = _AgentChartModel;
}

extension AgentChartModelExtension on AgentChartModel {
  List<num> get sumEachColumn {
    if (dataList == null || dataList.isEmpty) return [];
    List<num> sumColumn = new List.generate(8, (_) => 0);
    dataList.forEach((element) {
      for (int i = 0; i < 8; i++) {
        var sum = sumColumn[i];
        sum += element[i];
        sumColumn.replaceRange(i, i + 1, [sum]);
      }
    });
    return sumColumn;
  }
}

@freezed
abstract class AgentChartData with _$AgentChartData implements TableOperator {
  const factory AgentChartData({
    num bet,
    num payout,
    @JsonKey(name: 'validbet') num validBet,
    num wager,
    @JsonKey(name: 'totalbet') num totalBet,
    @JsonKey(name: 'totalpayout') num totalPayout,
    @JsonKey(name: 'totalvalidbet') num totalValidBet,
    @JsonKey(name: 'totalwager') num totalWager,
    String key,
  }) = _AgentChartData;

  static AgentChartData jsonToAgentChartData(Map<String, dynamic> jsonMap) {
    return _$_AgentChartData(
      bet: jsonMap['bet'] as num,
      payout: jsonMap['payout'] as num,
      validBet: jsonMap['validbet'] as num,
      wager: jsonMap['wager'] as num,
      totalBet: jsonMap['totalbet'] as num,
      totalPayout: jsonMap['totalpayout'] as num,
      totalValidBet: jsonMap['totalvalidbet'] as num,
      totalWager: jsonMap['totalwager'] as num,
      key: jsonMap['key'] as String,
    );
  }
}
