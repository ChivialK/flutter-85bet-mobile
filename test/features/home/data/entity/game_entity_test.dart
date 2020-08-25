import 'dart:convert';

import 'package:flutter_85bet_mobile/features/home/data/entity/game_entity.dart';
import 'package:flutter_85bet_mobile/features/home/data/models/game_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final GameEntity gameEntity = GameEntity(
    id: 4107,
    gameUrl: "eg/slot/candy",
    cname: "糖果世界",
  );

  final String gameJson =
      '{"id": 4107, "category": "slot", "platform": "eg", "gameid": "candy", "cname": "糖果世界"}';

  test('test model data to entity data', () {
    final model = GameModel.jsonToGameModel(json.decode(gameJson));
    expect(model, isA<GameModel>());
    print("test model: $model");

    expect(model.entity, isA<GameEntity>());
    expect(model.entity, gameEntity);
    print("test entity: ${model.entity}");
  });

  test('test entity to json', () {
    Map<String, dynamic> test(GameEntity entity) {
      final Map<String, dynamic> data = new Map<String, dynamic>();
      final info = entity.gameUrl.split('/');
      print('split url: $info');
      data['category'] = info[0];
      data['cname'] = entity.cname;
      data['gameid'] = info[2];
      data['id'] = entity.id;
      data['platform'] = info[1];
      print('to json: $data');
      return data;
    }

    print('------------method in test------------');
    final mapJson = json.decode(gameJson);
    print('decoded from json string: $mapJson');
    final mapEntity1 = test(gameEntity);
    print('test mapped: $mapEntity1');
    print('------------method in class------------');
    final mapEntity2 = gameEntity.toJson();
    print('ext mapped: $mapEntity2');
    final mapEntity3 = gameEntity.toJson();
    print('override mapped: $mapEntity3');
    expect(mapEntity2, equals(mapJson));
  });
}
