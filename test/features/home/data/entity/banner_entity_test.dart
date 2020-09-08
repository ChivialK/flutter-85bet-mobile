import 'dart:convert';

import 'package:flutter_85bet_mobile/features/routes/home/data/entity/banner_entity.dart';
import 'package:flutter_85bet_mobile/features/routes/home/data/models/banner_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final BannerEntity bannerInfo = BannerEntity(
    id: 1,
    pic: "images/banner/mobile/291.jpg",
    noPromo: true,
    promoUrl: "456456456",
    sort: 8,
  );

  test(
    'should transfer model data into info data',
    () async {
      final map = json.decode(fixture('home/banner.json'));
      final model = BannerModel.jsonToBannerModel(map);
      expect(model, isA<BannerModel>());

      final info = BannerEntity(
          id: model.id,
          pic: model.picMobile,
          noPromo: model.urlBlank,
          promoUrl: model.mobileUrl,
          sort: model.sort);
      expect(info, bannerInfo);
      print("test info: ${info.toString()}");
    },
  );
}
