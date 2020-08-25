import 'dart:convert';

import 'package:flutter_85bet_mobile/features/subfeatures/agent/data/models/agent_ad_model.dart';
import 'package:flutter_85bet_mobile/utils/json_util.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../fixtures/fixture_reader.dart';

void main() {
  List mapList = json.decode(fixture('subfeatures/agent/agent_ad.json'));
  List mapList2 = json.decode(fixture('subfeatures/agent/agent_merge_ad.json'));

  test('test agent ad model', () {
    print('decoded map: $mapList');
    print('\n\n');
    List<AgentAdModel> modelList = JsonUtil.decodeArrayToModel(
        mapList, (jsonMap) => AgentAdModel.jsonToAgentAdModel(jsonMap));
    print('decoded to model: $modelList');
    print('\n\n');
    expect(modelList.length, 2);
  });

  test('test agent merge ad model', () {
    print('decoded map: $mapList2');
    print('\n\n');
    List<AgentAdModel> modelList = JsonUtil.decodeArrayToModel(
        mapList2, (jsonMap) => AgentAdModel.jsonToAgentAdModel(jsonMap));
    print('decoded to model: $modelList');
    print('\n\n');
    expect(modelList.length, 5);
  });
}
