import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';

void main() {
  List<int> intList = [2, 4, 16, 22, 28, 43, 46];

  test('test list encode', () {
    String json = jsonEncode(intList);
    print(json);
  });

  test('test list encode', () {
    Map<String, dynamic> jsonMap = new Map<String, dynamic>();
    for (int i = 0; i < intList.length; i++) {
      jsonMap['$i'] = intList[i] as dynamic;
    }
    print(jsonMap);
    expect(jsonMap, isA<Map<String, dynamic>>());
    expect(jsonMap.length, intList.length);
  });
}
