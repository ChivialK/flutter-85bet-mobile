//import 'dart:convert';
//
//import 'package:flutter_85bet_mobile/core/network/handler/request_code_model.dart';
//import 'package:flutter_85bet_mobile/features/subfeatures/roller/data/models/roller_order_model.dart';
//import 'package:flutter_85bet_mobile/utils/json_util.dart';
//import 'package:flutter_test/flutter_test.dart';
//
//import '../../../../../fixtures/fixture_reader.dart';
//
//void main() {
//  final map = json.decode(fixture('subfeatures/roller/orders.json'));
//
//  test('test roller order map to models', () {
//    print('\n');
//    RequestCodeModel codeModel = RequestCodeModel.jsonToCodeModel(map);
//    print('code model: \n$codeModel\n\n');
//    expect(codeModel.data, isA<List>());
//
//    List orders = JsonUtil.decodeArrayToModel(
//      codeModel.data,
//      (jsonMap) => RollerOrderModel.jsonToOrderModel(jsonMap),
//    );
//    print('order list: \n$orders\n\n');
//    expect(orders.length, 15);
//    expect(orders.every((element) => element is RollerOrderModel), true);
//  });
//}
