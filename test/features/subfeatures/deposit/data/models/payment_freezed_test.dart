import 'dart:convert';

import 'package:flutter_85bet_mobile/features/routes/subfeatures/deposit/data/model/payment_type.dart';
import 'package:flutter_85bet_mobile/features/routes/subfeatures/deposit/data/model/payment_type_data.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../fixtures/fixture_reader.dart';

/// IMPORTANT:
/// Need to manually block or change PaymentEnum values that are using
/// localeStr to constant string or test will failed
///
void main() {
  test('test json to model data list', () {
    final map = json.decode(fixture('subfeatures/deposit/payment.json'));
    List<PaymentType> list = decodePaymentTypes(map);
    print('payment types:$list');
    expect(list.first, isA<PaymentTypeLocalData>());
    expect(list.last, isA<PaymentTypeOnlineData>());
  });
}
