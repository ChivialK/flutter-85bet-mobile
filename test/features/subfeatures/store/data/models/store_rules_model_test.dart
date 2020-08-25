//import 'dart:convert';
//
//import 'package:flutter_85bet_mobile/core/network/handler/request_code_model.dart';
//import 'package:flutter_85bet_mobile/features/subfeatures/store/data/models/store_rules_model.dart';
//import 'package:flutter_85bet_mobile/utils/json_util.dart';
//import 'package:flutter_test/flutter_test.dart';
//
//import '../../../../../fixtures/fixture_reader.dart';
//
//void main() {
//  final ruleMap = json.decode(fixture('subfeatures/store/rules.json'));
//  final dollarMap = json.decode(fixture('subfeatures/store/dollar.json'));
//
//  test('test store rules model', () {
//    print('\n');
//    RequestCodeModel codeModel = RequestCodeModel.jsonToCodeModel(ruleMap);
//    print('code model: $codeModel\n\n');
//    List<StoreRuleData> rules = JsonUtil.decodeArrayToModel(codeModel.data,
//        (jsonMap) => StoreRuleData.jsonToStoreRuleData(jsonMap));
//    print('rules: $rules\n\n');
//  });
//
//  test('test store dollar model', () {
//    print('\n');
//    RequestCodeModel codeModel = RequestCodeModel.jsonToCodeModel(dollarMap);
//    print('code model: $codeModel\n\n');
//    List<StorePlatformDollar> dollar = JsonUtil.decodeArrayToModel(
//        codeModel.data,
//        (jsonMap) => StorePlatformDollar.jsonToStorePlatformDollar(jsonMap));
//    print('platforms: $dollar\n\n');
//  });
//}
