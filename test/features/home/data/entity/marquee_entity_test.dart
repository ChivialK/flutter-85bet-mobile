import 'dart:convert';

import 'package:flutter_85bet_mobile/features/routes/home/data/entity/marquee_entity.dart';
import 'package:flutter_85bet_mobile/features/routes/home/data/models/marquee_model.dart';
import 'package:flutter_85bet_mobile/features/routes/home/data/models/marquee_model_list.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final MarqueeModel marqueeModel = MarqueeModel(
    id: 2,
    content:
        "Dear members, in the current fast payment and WeChat payment maintenance, the company provides bank deposit, Alipay payment, online payment, UnionPay scan code, virtual currency, please refer to the above recharge methods.",
    url: "https://www.baidu.com/",
    createdAt: "2019-04-10",
    updatedAt: "2019-09-24",
    showDate: "0000-00-00",
  );

  final MarqueeModelList marqueeModelList = MarqueeModelList(
    marquees: [marqueeModel],
    speed: 156,
  );

  final MarqueeEntity marqueeEntity = MarqueeEntity(
    id: 2,
    content:
        "Dear members, in the current fast payment and WeChat payment maintenance, the company provides bank deposit, Alipay payment, online payment, UnionPay scan code, virtual currency, please refer to the above recharge methods.",
    url: "https://www.baidu.com/",
  );

  test(
    'should transfer model data into entity data',
    () async {
      final map = json.decode(fixture('home/marquee.json'));
      final model = MarqueeModel.jsonToMarqueeModel(map);
      expect(model, isA<MarqueeModel>());

      final entity = MarqueeEntity(
        id: model.id,
        content: model.content,
        url: model.url,
      );
      expect(entity, marqueeEntity);
      expect(entity is MarqueeEntity, true);
      print("test entity: ${entity.toString()}");
    },
  );

  test('test json to model', () {
    final map = json.decode(fixture('home/marquee_array_test.json'));
    final model = MarqueeModelList.jsonToMarqueeModelList(map);
    expect(model.marquees, marqueeModelList.marquees);
  });
}
