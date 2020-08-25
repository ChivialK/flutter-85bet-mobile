import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';

void main() {
  final List<String> names = [
    'SB365体育',
    'EG电子',
    'AG真人',
    'KG棋牌',
    'JDB捕鱼',
    'CQ9电子'
  ];

  final chineseRegex = RegExp(
      "[\u4e00-\u9fa5]|[\u3105-\u3129]|[\u02CA]|[\u02CB]|[\u02C7]|[\u02C9]");

  test('test char to unicode', () {
    String str = '一';
    print('${str.codeUnits}');
    print('${str.runes}');
    print('${utf8.encode(str)}');
    print(covertStringToUnicode(str));

    String eng = 'a';
    print('${eng.codeUnits}');
    print('${eng.runes}');
    print('${utf8.encode(eng)}');
    print(covertStringToUnicode(eng));
  });

  test('test chinese char length check', () {
    names.forEach((element) {
      print('$element\nencoded: ${utf8.encode(element)}');
      print('codes: ${element.codeUnits}\n');
      int ch = 0;
      int en = 0;
      for (var value in element.codeUnits) {
//        print('decode value $value -> ${String.fromCharCode(value)}');
        if (chineseRegex.hasMatch(String.fromCharCode(value)))
          ch += 1;
        else
          en += 1;
      }
      print('ch=$ch, en=$en');
      print('\n');
    });
  });
}

String covertStringToUnicode(String content) {
  String regex = "\\u";
  int offset = content.indexOf(regex) + regex.length;
  while (offset > -1 + regex.length) {
    int limit = offset + 4;
    String str = content.substring(offset, limit);
    if (str != null && str.isNotEmpty) {
      String code = String.fromCharCode(int.parse(str, radix: 16));
      content = content.replaceFirst(str, code, offset);
    }
    offset = content.indexOf(regex, limit) + regex.length;
  }
  return content.replaceAll(regex, "");
}
