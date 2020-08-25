//import 'dart:convert';
//
//import 'package:flutter_85bet_mobile/features/movie/data/models/movie_model.dart';
//import 'package:flutter_85bet_mobile/utils/json_util.dart';
//import 'package:flutter_test/flutter_test.dart';
//
//import '../../../../fixtures/fixture_reader.dart';
//
//void main() {
//  List mapList = json.decode(fixture('movie/movie_list.json'));
//
//  test('test movie list model', () {
//    print('\ndecoded map list: $mapList');
//    print('\n');
//    expect(mapList, isA<List>());
//
//    List<MovieModel> modelList = JsonUtil.decodeArrayToModel(
//        mapList, (jsonMap) => MovieModel.jsonToModel(jsonMap));
//    print('model list: $modelList');
//    expect(modelList.length, 16);
//    expect(modelList.first.mid, 5632);
//  });
//}
