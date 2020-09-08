import 'dart:convert';

import 'package:flutter_85bet_mobile/features/routes/subfeatures/agent/data/models/agent_chart_model.dart';
import 'package:flutter_85bet_mobile/utils/json_util.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../fixtures/fixture_reader.dart';

void main() {
  Map<String, dynamic> map =
      json.decode(fixture('subfeatures/agent/agent_chart.json'));

  test('test agent chart model', () {
    print('decoded map: $map');
    print('\n\n');

    List<AgentChartModel> modelList = new List();
    map.forEach((key, value) {
      print('key: $key');
      print('value type: ${value.runtimeType}');
      print('value: $value');
      List<AgentChartData> list = JsonUtil.decodeMapToModelList(
          value, (jsonMap) => AgentChartData.jsonToAgentChartData(jsonMap));
      print('value to list: $list');
      print('\n\n');
      modelList.add(AgentChartModel(
        platform: key,
        dataList: list,
      ));
    });

    print('decoded to chart model:\n');
    print(modelList);
    expect(modelList.length, 2);
    print('\n\n');

    // count total
    List<num> lastRow = new List.generate(8, (_) => 0);
    modelList.first.dataList.forEach((element) {
      for (int i = 0; i < 8; i++) {
        var sum = lastRow[i];
        print('lastRow $i = $sum');
        sum += element[i];
        print('lastRow $i + ${element[i]}');
        lastRow.replaceRange(i, i + 1, [sum]);
        print('lastRow = $lastRow');
      }
      print('\n\n');
    });

    // test count total function
    expect(modelList.first.sumEachColumn, equals(lastRow));
  });
}
