import 'dart:convert';

import 'package:flutter_85bet_mobile/features/routes/home/data/models/game_category_model.dart';
import 'package:flutter_85bet_mobile/features/routes/home/data/models/game_platform.dart';
import 'package:flutter_85bet_mobile/features/routes/home/data/models/game_types.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final map = json.decode(fixture('home/game_types.json'));

  final GameCategoryModel categoryModel =
      GameCategoryModel(type: "casino", ch: "真人");

  final GamePlatformModel platformModel = GamePlatformModel(
    id: 53,
    site: "eg",
    site2: "EG",
    ch: "EG casino",
    category: "casino",
    cid: 1,
    status: "1",
    sort: 1,
    className: "eg-casino",
  );

  test('test model list data decode', () {
    print('\nmap:\n$map');
    print('\n\n');
    final model = GameTypes.jsonToGameTypes(map);
    print('decoded model:\n$model\n');
    expect(model.categories.length, 7);
    expect(model.categories.first, categoryModel);
    expect(model.platforms.first, platformModel);
  });
}
