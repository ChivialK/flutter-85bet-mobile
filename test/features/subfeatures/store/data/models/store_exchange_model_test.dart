//import 'dart:convert';
//
//import 'package:flutter_85bet_mobile/core/network/handler/request_code_model.dart';
//import 'package:flutter_85bet_mobile/features/subfeatures/store/data/form/store_exchange_history_form.dart';
//import 'package:flutter_85bet_mobile/features/subfeatures/store/data/models/store_exchange_model.dart';
//import 'package:flutter_85bet_mobile/utils/json_util.dart';
//import 'package:flutter_test/flutter_test.dart';
//
//import '../../../../../fixtures/fixture_reader.dart';
//
//void main() {
//  final map = json.decode(fixture('subfeatures/store/exchange.json'));
//
//  test('test store exchange model', () {
//    print('\n');
//    RequestCodeModel codeModel = RequestCodeModel.jsonToCodeModel(map);
//    print('code model: $codeModel\n\n');
//    print('data: ${codeModel.data}\n\n');
//    StoreExchangeModel model = JsonUtil.decodeToModel<StoreExchangeModel>(
//      codeModel.data,
//      (jsonMap) => StoreExchangeModel.jsonToStoreExchangeModel(jsonMap),
//    );
//    print('exchange model: $model\n\n');
//  });
//
//  test('test store exchange init form', () {
//    var initForm = StoreExchangeHistoryInit();
//    print('\ninit form: $initForm');
//    expect(initForm is StoreExchangeHistoryForm, true);
//    expect(initForm is StoreExchangeHistoryQuery, false);
//    expect(initForm.toJson()['page'], 1);
//  });
//
//  test('test store exchange default query form', () {
//    var queryForm = StoreExchangeHistoryQuery();
//    print('\ndefault query form: $queryForm');
//    expect(queryForm is StoreExchangeHistoryForm, true);
//    expect(queryForm is StoreExchangeHistoryInit, false);
//    var queryJson = queryForm.toJson();
//    print('\ndefault query form json: $queryJson');
//    expect(queryJson['page'], 1);
//    expect(queryJson['per_page'], '5');
//  });
//
//  test('test store exchange query form', () {
//    var queryForm =
//        StoreExchangeHistoryQuery(page: 2, perPage: 15, search: '30');
//    print('\ndefault query form: $queryForm');
//    expect(queryForm is StoreExchangeHistoryForm, true);
//    expect(queryForm is StoreExchangeHistoryInit, false);
//    var queryJson = queryForm.toJson();
//    print('\ndefault query form json: $queryJson');
//    expect(queryJson['page'], 2);
//    expect(queryJson['per_page'], '15');
//    expect(queryJson['msg'], '30');
//  });
//}
