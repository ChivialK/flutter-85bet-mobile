import 'package:flutter_85bet_mobile/features/home/data/models/game_platform.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final GamePlatformModel platformModel = GamePlatformModel(
    id: 1,
    site: "eg",
    site2: "EG",
    ch: "EG casino",
    category: "casino",
    cid: 1,
    status: "1",
    sort: 1,
    className: "eg-casino",
  );

  final GamePlatformEntity platformEntity = GamePlatformEntity(
    id: 1,
    site: "eg",
    ch: "EG casino",
    category: "casino",
    className: "eg-casino",
  );

  test('test game platform model to entity', () {
    final entity = platformModel.entity;
    expect(entity, platformEntity);
    print("test entity: ${entity.toString()}");
  });
}
