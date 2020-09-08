import 'dart:convert';

import 'package:flutter_85bet_mobile/utils/value_util.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final map = json.decode(fixture('subfeatures/deposit/banks.json'));

  test('test sort bank by name', () {
    Map<int, String> bankMap = map.map<int, String>((key, value) {
      return MapEntry<int, String>(
          (key is int) ? key : '$key'.strToInt, '$value');
    });
    print('bank map: $bankMap\n\n');
    List<String> sortedValues = bankMap.values.toList()..sort();
    print('bank values sorted: $sortedValues\n\n');
    List<int> sortedKeys = sortedValues
        .map((value) => bankMap.entries
            .singleWhere((element) => element.value == value)
            .key)
        .toList();
    print('bank keys sorted: $sortedKeys\n\n');
  });
}
