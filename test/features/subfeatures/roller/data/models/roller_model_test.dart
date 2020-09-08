//import 'dart:convert';
//
//import 'package:flutter_85bet_mobile/core/network/handler/request_code_model.dart';
//import 'package:flutter_85bet_mobile/features/subfeatures/roller/data/entity/roller_data_entity.dart';
//import 'package:flutter_85bet_mobile/features/subfeatures/roller/data/models/roller_prize_model.dart';
//import 'package:flutter_85bet_mobile/utils/json_util.dart';
//import 'package:flutter_test/flutter_test.dart';
//
//import '../../../../../fixtures/fixture_reader.dart';
//
//void main() {
//  final map1 = json.decode(fixture('subfeatures/roller/prize.json'));
//  final map2 = json.decode(fixture('subfeatures/roller/prizes.json'));
//  final map3 = json.decode(fixture('subfeatures/roller/rule.json'));
//
//  test('test roller prize model with single data', () {
//    print('\n');
//    RollerPrizeModel model = RollerPrizeModel.jsonToRollerPrizeModel(map1);
//    print('model: $model\n\n');
//    expect(model.id, 1);
//  });
//
//  test('test roller prize map to models', () {
//    print('\n');
//    RequestCodeModel codeModel = RequestCodeModel.jsonToCodeModel(map2);
//    print('code model: \n$codeModel\n\n');
//    expect(codeModel.data, isA<Map>());
//
//    List prizes = JsonUtil.decodeMapToModelList(
//      codeModel.data,
//      (jsonMap) => RollerPrizeModel.jsonToRollerPrizeModel(jsonMap),
//      addKey: false,
//    );
//    print('prize list: \n$prizes\n\n');
//    expect(prizes.length, 8);
//    expect(prizes.every((element) => element is RollerPrizeModel), true);
//  });
//
//  test('test roller data extract', () {
//    print('\n');
//    RequestCodeModel codeModel1 = RequestCodeModel.jsonToCodeModel(map2);
//    RequestCodeModel codeModel2 = RequestCodeModel.jsonToCodeModel(map3);
//
//    String rule = '${codeModel2.data}';
//    List<RollerPrizeModel> prizes = JsonUtil.decodeMapToModelList(
//      codeModel1.data,
//      (jsonMap) => RollerPrizeModel.jsonToRollerPrizeModel(jsonMap),
//      addKey: false,
//    );
//
//    RollerDataEntity entity = RollerDataEntity(
//      rule: rule,
//      prizes: prizes,
//    );
//    print('roller data: \n');
//    print('rule: ${entity.rule}\n');
//    print('prizes: ${entity.prizes}\n');
//    expect(entity.prizes.length, 8);
//    expect(entity.rule.isNotEmpty, true);
//  });
//}
