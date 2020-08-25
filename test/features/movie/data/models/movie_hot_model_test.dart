//import 'dart:convert';
//
//import 'package:flutter_85bet_mobile/features/movie/data/models/movie_hot_model.dart';
//import 'package:flutter_85bet_mobile/utils/json_util.dart';
//import 'package:flutter_test/flutter_test.dart';
//
//import '../../../../fixtures/fixture_reader.dart';
//
//void main() {
//  List mapList = json.decode(fixture('movie/movie_hot.json'));
//
//  test('test movie hot model', () {
//    print('\ndecoded map list: $mapList');
//    print('\n');
//    expect(mapList, isA<List>());
//
//    List<MovieHotModel> modelList = JsonUtil.decodeArrayToModel(
//        mapList, (jsonMap) => MovieHotModel.jsonToModel(jsonMap));
//    print('model list: $modelList');
//    expect(modelList.length, 16);
//    expect(modelList.first.mid, 6374);
//  });
//}
