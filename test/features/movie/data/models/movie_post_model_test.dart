//import 'dart:convert';
//
//import 'package:flutter_85bet_mobile/features/movie/data/models/movie_hot_model.dart';
//import 'package:flutter_85bet_mobile/features/movie/data/models/movie_post_model.dart';
//import 'package:flutter_test/flutter_test.dart';
//
//import '../../../../fixtures/fixture_reader.dart';
//
//void main() {
//  Map map = json.decode(fixture('movie/movie_post.json'));
//
//  test('test movie post data', () {
//    print('\ndecoded map: ${map['post']}');
//    print('\n');
//    MoviePostData data = MoviePostData.jsonToModel(map['post']);
//    print('data: $data');
//    expect(data.mid, 8449);
//  });
//
//  test('test movie hot model list decode method', () {
//    List mapList = map['hot'];
//    print('\ndecoded map list: $mapList');
//    print('\n');
//    expect(mapList, isA<List>());
//
//    List<MovieHotModel> modelList = decodeMovieHotModel(mapList);
//    print('model list: $modelList');
//    expect(modelList.length, 16);
//    expect(modelList.first.mid, 9308);
//  });
//
//  test('test movie post model', () {
//    print('\ndecoded map: $map');
//    print('\n');
//    MoviePostModel model = MoviePostModel.jsonToModel(map);
//    print('model: $model');
//    expect(model.post.mid, 8449);
//    expect(model.hotList.length, 16);
//  });
//}
