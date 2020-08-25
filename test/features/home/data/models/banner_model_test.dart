import 'dart:convert';

import 'package:flutter_85bet_mobile/features/home/data/models/banner_model.dart';
import 'package:flutter_85bet_mobile/utils/json_util.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

final BannerModel bannerModel = BannerModel(
    id: 1,
    type: "image/jpeg",
    title: "23456781",
    url: "456456",
    urlBlank: true,
    mobileUrl: "456456456",
    pic: "images/banner/pc/292.jpg",
    picMobile: "images/banner/mobile/291.jpg",
    startTime: "2019-07-17 00:00:00",
    endTime: "2029-07-11 09:39:00",
    status: true,
    sort: 8);

void main() {
  final map = json.decode(fixture('home/banner.json'));
  final rawArray = fixture('home/banner_array.json');

  test('test decode single banner model', () {
    print('\nmap:\n$map');
    print('\n\n');
    final model = BannerModel.jsonToBannerModel(map);
    print('decoded model:\n$model\n');
    expect(model.id, 1);
    expect(model, equals(bannerModel));
  });

  test('test decode banner model list', () {
    print('\narray:\n$rawArray');
    print('\n\n');
    List<dynamic> list = JsonUtil.decodeArray(rawArray, trim: false);
    final modelList =
        list.map((model) => BannerModel.jsonToBannerModel(model)).toList();
    print('decoded model list:\n$modelList\n');
    expect(modelList.length, 3);
    expect(modelList.last, equals(bannerModel));
    expect(modelList.every((element) => element is BannerModel), true);
  });
}
