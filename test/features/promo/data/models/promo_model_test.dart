import 'package:flutter_85bet_mobile/features/promo/data/models/promo_freezed.dart';
import 'package:flutter_85bet_mobile/utils/json_util.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final jsonStr = fixture('promo/promo.json');

  List<PromoEntity> transformPromoModels(List<PromoModel> data) {
    final list = data.map((model) {
      return model.entity;
    }).toList();
    return list;
  }

  test('test decode promo data', () {
//    print('\nmap: $jsonStr');
    print('\n\n');
    List<PromoModel> models = JsonUtil.decodeArrayToModel(
      jsonStr,
      (jsonMap) => PromoModel.jsonToPromoModel(jsonMap),
    );
    print('decoded models:\n$models');
    print('\n\n');
    expect(models.length, 2);
  });

  test('test transform promo model to entity', () {
    print('\n\n');
    List<PromoModel> models = JsonUtil.decodeArrayToModel(
      jsonStr,
      (jsonMap) => PromoModel.jsonToPromoModel(jsonMap),
    );

    List<PromoEntity> entities = transformPromoModels(models);
    print('entity list:\n$entities');
    print('\n\n');

    expect(entities.length, 2);
    expect(entities[0].id, 102);
  });
}
