//import 'dart:convert';
//
//import 'package:flutter_85bet_mobile/features/movie/data/models/movie_category_model.dart';
//import 'package:flutter_85bet_mobile/utils/json_util.dart';
//import 'package:flutter_test/flutter_test.dart';
//
//import '../../../../fixtures/fixture_reader.dart';
//
//void main() {
//  List mapList = json.decode(fixture('movie/movie_category.json'));
//
//  test('test movie category model', () {
//    print('\ndecoded map list: $mapList');
//    print('\n');
//    expect(mapList, isA<List>());
//
//    List<MovieCategoryModel> modelList = JsonUtil.decodeArrayToModel(
//        mapList, (jsonMap) => MovieCategoryModel.jsonToModel(jsonMap));
//    print('model list: $modelList');
//    expect(modelList.length, 23);
//    expect(modelList.first.tid, 1);
//  });
//}
