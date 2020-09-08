import 'dart:convert';

import 'package:flutter_85bet_mobile/features/routes/home/data/entity/game_entity.dart';
import 'package:flutter_85bet_mobile/features/routes/home/data/models/game_model.dart';
import 'package:flutter_85bet_mobile/utils/json_util.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final map = json.decode(fixture('home/game.json'));
  final rawJson = fixture('home/game_array.json');

  final GameModel gameModel = GameModel(
      id: 4107,
      category: "slot",
      platform: "eg",
      gameId: "candy",
      cname: "糖果世界");

  final GameEntity gameEntity =
      GameEntity(id: 4107, gameUrl: "eg/slot/candy", cname: "糖果世界");

  test('test decode single game model', () {
    print('\nmap:\n$map');
    print('\n\n');
    final model = GameModel.jsonToGameModel(map);
    print('decoded model:\n$model\n');
    expect(model, isA<GameModel>());
    expect(model.id, 4107);
    expect(model, equals(gameModel));

    final entity = model.entity;
    print('model entity:\n$entity\n');
    expect(entity, equals(gameEntity));
  });

  test('test model list data decode', () {
    print('\nraw:\n$rawJson');
    print('\n\n');
    final dataList = JsonUtil.decodeArrayToModel(
      rawJson,
      (jsonMap) => GameModel.jsonToGameModel(jsonMap),
    );
    print('decoded list:\n$dataList\n');
    expect(dataList.length, 11);
    expect(dataList.first, gameModel);
    expect(dataList.every((element) => element is GameModel), true);
  });
}
