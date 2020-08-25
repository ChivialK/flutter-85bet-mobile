import 'dart:convert';

import 'package:flutter_85bet_mobile/features/subfeatures/viplevel/data/models/vip_level_model.dart';
import 'package:flutter_85bet_mobile/utils/json_util.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../fixtures/fixture_reader.dart';

void main() {
  final map = json.decode(fixture('subfeatures/viplevel/level.json'));
  final map1 = json.decode(fixture('subfeatures/viplevel/level_one.json'));

  test('test vip level model', () {
    print('\n');
    print('map:\n$map\n\n');
    VipLevelModel model = JsonUtil.decodeToModel(
      map,
      (jsonMap) => VipLevelModel.jsonToVipLevelModel(jsonMap),
    );
    print('model:\n$model\n\n');
    expect(model.levels.length, 6);
    expect(model.options.length, 19);
    expect(model.rules.length, model.options.length);
  });

  test('print vip level one', () {
    print('\n');
    print('map:\n$map1\n\n');
    VipLevelModel model = JsonUtil.decodeToModel(
      map1,
      (jsonMap) => VipLevelModel.jsonToVipLevelModel(jsonMap),
    );
    print('model:\n$model\n\n');
    expect(model.levels.length, 1);
    expect(model.options.length, 19);
    expect(model.rules.length, model.options.length);
  });

  test('test vip levels to model list', () {
    print('\n');
    print('map:\n$map\n\n');
    List<VipLevelName> levels = JsonUtil.decodeMapToModelList(
      map['level'],
      (jsonMap) => VipLevelName.jsonToVipLevelName(jsonMap),
    );
    print('levels:\n$levels\n\n');
    expect(levels.length, 6);
  });

  test('test vip options to model list', () {
    print('\n');
    print('map:\n$map\n\n');
    List<VipLevelOption> options = JsonUtil.decodeMapToModelList(
      map['option'],
      (jsonMap) => VipLevelOption.jsonToVipLevelOption(jsonMap),
    );
    print('options:\n$options\n\n');
    expect(options.length, 19);
  });
}
