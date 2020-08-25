import 'dart:convert';

import 'package:flutter_85bet_mobile/features/subfeatures/accountcenter/data/entity/center_vip_entity.dart';
import 'package:flutter_85bet_mobile/features/subfeatures/accountcenter/data/models/center_model.dart';
import 'package:flutter_85bet_mobile/features/subfeatures/accountcenter/data/models/center_vip_setting_model.dart';
import 'package:flutter_85bet_mobile/utils/value_util.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../fixtures/fixture_reader.dart';

void main() {
  final map = json.decode(fixture('subfeatures/center/center.json'));

  final mapSetting =
      json.decode(fixture('subfeatures/center/center_vip_setting.json'));

  test('test vip setting item decode step', () {
    print(mapSetting);
    var data = mapSetting['1'];
    print(data);
    print(data.runtimeType);
    var setting = data['setting'];
    print(setting);
    CenterVipSettingItem item =
        CenterVipSettingModel.jsonToCenterVipSettingItem(setting);
    print(item);
  });

  test('test vip setting decode', () {
    CenterModel model = CenterModel.jsonToCenterModel(map);
    print('\n$model\n\n');
    print('${model.vipOption}\n\n');
    print('${model.vipSetting}\n\n');

    print('Level Keys:\n');
    print('${model.vipOption.keys.toList()}\n\n');

    print('Block Titles:\n');
    print('${model.vipOption.values.toList()}\n\n');

    var setting = jsonEncode(model.vipSetting);
    print('Setting:\n');
    print('$setting\n\n');

    Map<String, dynamic> mapped = jsonDecode(setting);
    print('Mapped Setting:\n');
    print('$mapped\n\n');

    List levelRequirement = new List();
    List levelTitles = mapped.values.map((value) {
      var content = jsonDecode(jsonEncode(value));
      print('$content');
      CenterVipSettingItem item =
          CenterVipSettingModel.jsonToCenterVipSettingItem(content['setting']);
      print('-> $item');
      levelRequirement.add(item);
      return content['title'];
    }).toList();

    print('\nLevel Titles:\n');
    print('$levelTitles\n\n');

    print('Level Requirements:\n');
    print('$levelRequirement\n\n');
  });

  test('simplify for decoding', () {
    CenterModel model = CenterModel.jsonToCenterModel(map);
//    String setting = jsonEncode(model.vipSetting);
    List<String> levelTitles = new List();
    Map<String, CenterVipSettingItem> mapped =
        Map<String, CenterVipSettingItem>.from(
            model.vipSetting.map((key, value) {
      levelTitles.add(value['title']);
      return MapEntry(key.toString(),
          CenterVipSettingModel.jsonToCenterVipSettingItem(value['setting']));
    }));

    print('Block Keys:\n');
    List<String> blockKeys =
        new List.from(model.vipOption.keys.map((value) => '$value'));
    print('$blockKeys\n\n');
    expect(blockKeys, isA<List<String>>());

    print('Block Titles:\n');
    List<String> blockTitles =
        new List.from(model.vipOption.values.map((value) => '$value'));
    print('$blockTitles\n\n');
    expect(blockTitles, isA<List<String>>());

    print('Level Titles:\n');
    print('$levelTitles\n\n');

    print('Mapped Setting:\n');
    print('$mapped\n\n');
    expect(mapped, isA<Map<String, CenterVipSettingItem>>());
  });

  test('test vip entity extension', () {
    CenterModel model = CenterModel.jsonToCenterModel(map);
    CenterVipEntity entity = model.wrapVipData;

    print('Block Keys:\n');
    List<String> blockKeys = entity.getBlockKeys;
    print('$blockKeys\n\n');
    expect(blockKeys, isA<List<String>>());

    print('Block Titles:\n');
    List<String> blockTitles = entity.getBlockTitles;
    print('$blockTitles\n\n');
    expect(blockTitles, isA<List<String>>());

    print('Level Titles:\n');
    List<String> levelTitles = entity.getLevelLabels;
    print('$levelTitles\n\n');
    expect(levelTitles, isA<List<String>>());

    print('Level Requirements:\n');
    Map<String, CenterVipSettingItem> levelRequirements =
        entity.getLevelRequirements;
    print('$levelRequirements\n\n');
    expect(levelRequirements, isA<Map<String, CenterVipSettingItem>>());
  });

  test('test vip level sort', () {
    CenterModel model = CenterModel.jsonToCenterModel(map);
    CenterVipEntity entity = model.wrapVipData;

    print('\nLevel Requirements:\n');
    Map<String, CenterVipSettingItem> levelRequirements =
        entity.getLevelRequirements;
    List<String> levelLabels = entity.getLevelLabels;
    List<String> titles = entity.getBlockTitles;
    print('$levelRequirements\n\n');

    List<String> sortedLevelKeys = new List();
    levelRequirements.forEach((key, value) {
      sortedLevelKeys.add(key);
      print('vip level $key requirements: $value');
    });
    sortedLevelKeys.sort((a, b) => a.compareTo(b));

    print('\n');
    for (int i = 0; i < titles.length; i++) {
      /// prepare block data
      String blockKey = entity.getBlockKeys[i];
      print('block: $blockKey');
      List<String> blockLevelLabels = new List.from(levelLabels);
      List<int> blockLevelRequirements =
          new List.generate(sortedLevelKeys.length, (index) {
        CenterVipSettingItem setting =
            levelRequirements[sortedLevelKeys[index]];
        int value = '${setting.toJson()[blockKey]}'.strToInt;
        print('looking for $blockKey in $setting => $value');
        if (value == -1) blockLevelLabels.removeAt(index);
        return value;
      });
      blockLevelRequirements.removeWhere((value) => value == -1);
      print('\n');

      /// combine level list
      List<String> blockLevel = new List();
      for (int i = 0; i < blockLevelRequirements.length; i++) {
        blockLevel.add('${blockLevelLabels[i]}=${blockLevelRequirements[i]}');
      }
      print('block level: $blockLevel');

      /// sort block data
      blockLevel.sort((a, b) {
        int aValue = a.split('=')[1].strToInt;
        int bValue = b.split('=')[1].strToInt;
        print('value a: $aValue, b: $bValue');
        int cp = aValue.compareTo(bValue);
        return cp;
      });

      /// split level list
      blockLevelLabels.clear();
      blockLevelRequirements.clear();
      blockLevel.forEach((level) {
        var split = level.split('=');
        blockLevelRequirements.add(split[1].strToInt);
        blockLevelLabels.add(split[0]);
      });
      print('----------sorted: ${titles[i]}----------');
      print('sorted level: $blockLevel');
      print('sorted level labels: $blockLevelLabels');
      print('sorted level values: $blockLevelRequirements');
      print('--------------------------------------\n\n\n');
    }
  });
}
