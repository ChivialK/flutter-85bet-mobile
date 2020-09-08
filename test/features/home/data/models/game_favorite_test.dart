import 'dart:convert';

import 'package:flutter_85bet_mobile/features/routes/home/data/models/game_model.dart';
import 'package:flutter_85bet_mobile/features/routes/home/data/models/game_platform.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final map = json.decode(fixture('home/favorite.json'));

  test('test decode favorite platforms/games', () {
    print('\nmap list:\n$map');
    print('\n\n');
    expect(map, isA<Map>());

    List dataList = new List();
    (map as Map).forEach((key, value) {
      print('$key data is List: ${value is List}');
      dataList.addAll(value);
    });
    print('\ndata list: $dataList');

    List decodedList = dataList.map((map) {
      print('mapping:$map\n');
      if (map.containsKey('platform')) {
        return GameModel.jsonToGameModel(map).entity;
      } else if (map.containsKey('site')) {
        try {
          return GamePlatform.jsonToGamePlatformEntity(map);
        } on MissingRequiredKeysException catch (e) {
          print('Exception: ${e.message}');
        }
      } else
        return '';
    }).toList();
    decodedList.removeWhere((element) => element == '');
    print('\ndecoded list:\n$decodedList');
  });
}
