import 'dart:convert';

import 'package:flutter_85bet_mobile/features/home/data/models/marquee_model.dart';
import 'package:flutter_85bet_mobile/features/home/data/models/marquee_model_list.dart';
import 'package:flutter_85bet_mobile/utils/json_util.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final map = json.decode(fixture('home/marquee.json'));
  final arrayMap = json.decode(fixture('home/marquee_array.json'));

  final MarqueeModel marqueeModel = MarqueeModel(
    id: 2,
    content:
        "Dear members, in the current fast payment and WeChat payment maintenance, the company provides bank deposit, Alipay payment, online payment, UnionPay scan code, virtual currency, please refer to the above recharge methods.",
    url: "https://www.baidu.com/",
    createdAt: "2019-04-10",
    updatedAt: "2020-06-04",
    showDate: "2019-01-17",
  );

  test('test decode single marquee model', () {
    print('\nmap:\n$map');
    print('\n\n');
    final model = MarqueeModel.jsonToMarqueeModel(map);
    print('decoded model:\n$model\n');
    expect(model.id, 2);
    expect(model, equals(marqueeModel));
  });

  test('test decode marquee list', () {
    print('\nmap:\n$arrayMap');
    print('\n\n');
    MarqueeModelList model = JsonUtil.decodeToModel(
      arrayMap,
      (jsonMap) => MarqueeModelList.jsonToMarqueeModelList(jsonMap),
    );
    print('decoded model:\n$model\n');
    expect(model.marquees.length, 4);
    expect(model.speed, 156);
    expect(model.marquees.first, equals(marqueeModel));
    expect(model.marquees.every((element) => element is MarqueeModel), true);
  });
}
