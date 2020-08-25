import 'dart:convert';

import 'package:flutter_85bet_mobile/features/home/data/models/game_model.dart';
import 'package:flutter_85bet_mobile/features/home/data/models/game_platform.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final mapList = json.decode(fixture('home/game_recommend.json'));

  test('test decode recommend games', () {
    print('\nmap list:\n$mapList');
    print('\n\n');
    expect(mapList, isA<List>());
    expect(mapList.first, isA<Map>());

    List decodedList = mapList.map((map) {
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
