import 'dart:convert';

import 'package:flutter_85bet_mobile/features/subfeatures/deposit/data/model/payment_promo.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../fixtures/fixture_reader.dart';

void main() {
  test('test json to model', () {
    final map = json.decode(fixture('deposit/promo.json'));
    print(map.keys);
    final model = PaymentPromo.fromJson(map);
    print(model);
    expect(model, isA<PaymentPromoTypeJson>());
  });

  test('test json to model data list', () {
    final map = json.decode(fixture('deposit/promo.json'));
    PaymentPromoTypeJson model = PaymentPromo.fromJson(map);
    print(json.encode(model.local));
    var localMap = json.decode(json.encode(model.local));
    print('${localMap.keys}, runtimetype: ${localMap.runtimeType}');

    var data = localMap.keys.map((k) {
      print('parsing: ${localMap[k]}');
      return PaymentPromo.fromJson(localMap[k]);
    }).toList();
    print(data);
    expect(data.first, isA<PaymentPromoData>());
  });

  test('test model to data list extension', () {
    final map = json.decode(fixture('deposit/promo.json'));
    PaymentPromoTypeJson model = PaymentPromo.fromJson(map);

    final list = model.getDataList(true);
    print(list);
    expect(list.first, isA<PaymentPromoData>());
    expect(list.length, equals(3));

    final list2 = model.getDataList(false);
    print(list2);
    expect(list2.first, isA<PaymentPromoData>());
    expect(list2.length, equals(2));
  });
}
