import 'dart:convert';

import 'package:flutter_85bet_mobile/features/subfeatures/deposit/data/model/payment_type.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../fixtures/fixture_reader.dart';

/// IMPORTANT:
/// Need to manually block or change PaymentEnum values that are using
/// localeStr to constant string or test will failed
///
void main() {
  final map = json.decode(fixture('subfeatures/deposit/payment_vn.json'));

  test('test 85bet payment type to model', () {
    print('payment type raw map: $map');
    print('\ntype keys: ${map.keys}\n');
//    for (var key in map2.keys) {
//      print('\n type key: $key, data: ${map2[key]}');
//    }

    List<PaymentType> types = decodePaymentTypes(map);
    for (var type in types) {
      print('\n type key: ${type.key}, label: ${type.label}, data:\n');
      print('${type.data}\n');
    }
    expect(types.length, 5);
    expect(types.every((element) => element is PaymentType), true);
  });
}
