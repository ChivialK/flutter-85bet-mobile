//import 'dart:convert';
//
//import 'package:flutter_85bet_mobile/core/network/handler/request_code_model.dart';
//import 'package:flutter_85bet_mobile/features/subfeatures/store/data/models/store_product_model.dart';
//import 'package:flutter_85bet_mobile/utils/json_util.dart';
//import 'package:flutter_test/flutter_test.dart';
//
//import '../../../../../fixtures/fixture_reader.dart';
//
//void main() {
//  final map = json.decode(fixture('subfeatures/store/product.json'));
//
//  test('test store product model', () {
//    print('\n');
//    RequestCodeModel codeModel = RequestCodeModel.jsonToCodeModel(map);
//    print('code model: $codeModel\n\n');
//    List<StoreProductModel> products = JsonUtil.decodeArrayToModel(
//        codeModel.data,
//        (jsonMap) => StoreProductModel.jsonToStoreProductModel(jsonMap));
//    print('products: $products\n\n');
//  });
//}
