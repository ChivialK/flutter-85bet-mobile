//import 'dart:convert';
//
//import 'package:flutter_85bet_mobile/core/network/handler/request_code_model.dart';
//import 'package:flutter_85bet_mobile/features/subfeatures/roller/data/models/roller_record_model.dart';
//import 'package:flutter_85bet_mobile/utils/json_util.dart';
//import 'package:flutter_test/flutter_test.dart';
//
//import '../../../../../fixtures/fixture_reader.dart';
//
//void main() {
//  final map = json.decode(fixture('subfeatures/roller/records.json'));
//
//  test('test roller record map to models', () {
//    print('\n');
//    RequestCodeModel codeModel = RequestCodeModel.jsonToCodeModel(map);
//    print('code model: \n$codeModel\n\n');
//    expect(codeModel.data, isA<List>());
//
//    List records = JsonUtil.decodeArrayToModel(
//      codeModel.data,
//      (jsonMap) => RollerRecordModel.jsonToRecordModel(jsonMap),
//    );
//    print('order list: \n$records\n\n');
//    expect(records.length, 15);
//    expect(records.every((element) => element is RollerRecordModel), true);
//  });
//}
