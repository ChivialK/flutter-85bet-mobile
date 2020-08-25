//import 'dart:convert';
//
//import 'package:flutter_85bet_mobile/core/network/handler/request_code_model.dart';
//import 'package:flutter_85bet_mobile/features/subfeatures/roller/data/models/roller_requirement_current.dart';
//import 'package:flutter_85bet_mobile/features/subfeatures/roller/data/models/roller_requirement_model.dart';
//import 'package:flutter_85bet_mobile/features/subfeatures/roller/data/models/roller_requirement_target.dart';
//import 'package:flutter_85bet_mobile/features/subfeatures/roller/data/models/roller_requirement_type.dart';
//import 'package:flutter_85bet_mobile/utils/json_util.dart';
//import 'package:flutter_test/flutter_test.dart';
//
//import '../../../../../fixtures/fixture_reader.dart';
//
//void main() {
//  final map = json.decode(fixture('subfeatures/roller/requirements.json'));
//  final map1 =
//      json.decode(fixture('subfeatures/roller/requirements_type.json'));
//  final map2 =
//      json.decode(fixture('subfeatures/roller/requirements_target.json'));
//  final map3 =
//      json.decode(fixture('subfeatures/roller/requirements_current.json'));
//
//  test('test roller type map to model list', () {
//    print('\n');
//    print('data map:\n$map1\n');
//    List<RollerRequirementType> types = JsonUtil.decodeMapToModelList(
//      map1,
//      (jsonMap) => RollerRequirementType.jsonToRequirementType(jsonMap),
//      addKey: false,
//    );
//    print('types:\n$types\n\n');
//    expect(types.length, 2);
//  });
//
//  test('test roller target map to model list', () {
//    print('\n');
//    print('data map:\n$map2\n\n');
//    Map<String, List> dataMap = (map2 as Map).map((key, value) => MapEntry(
//        key,
//        JsonUtil.decodeMapToModelList(
//          value,
//          (jsonMap) => RollerRequirementTarget.jsonToRequirementTarget(jsonMap),
//          addKey: false,
//        )));
//    print('targets:\n$dataMap\n\n');
//    expect(dataMap.length, 2);
//    expect(dataMap['1'].length, 4);
//    expect(dataMap['1'].every((element) => element is RollerRequirementTarget),
//        true);
//    expect(dataMap['2'].length, 6);
//    expect(dataMap['2'].every((element) => element is RollerRequirementTarget),
//        true);
//  });
//
//  test('test roller current map to model list', () {
//    print('\n');
//    print('data map:\n$map3\n');
//    List<RollerRequirementCurrent> current = JsonUtil.decodeMapToModelList(
//      map3,
//      (jsonMap) => RollerRequirementCurrent.jsonToRequirementCurrent(jsonMap),
//    );
//    print('current:\n$current\n\n');
//    expect(current.length, 2);
//  });
//
//  test('test roller requirement data extract', () {
//    print('\n');
//    RequestCodeModel codeModel = RequestCodeModel.jsonToCodeModel(map);
//
//    RollerRequirementModel model =
//        RollerRequirementModel.jsonToRequirementModel(codeModel.data);
//    print('roller model: \n');
//    print('type: ${model.types}\n\n');
//    print('target: ${model.targets}\n\n');
//    print('current: ${model.current}\n\n');
//    expect(model.types.length, 2);
//    expect(model.targets.length, 2);
//    expect(
//        model.targets['1']
//            .every((element) => element is RollerRequirementTarget),
//        true);
//    expect(model.current.length, 2);
//  });
//}
