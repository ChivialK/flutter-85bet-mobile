import 'package:flutter_test/flutter_test.dart';

void main() {
  test('test currency format', () {
    String value1 = '100';
    expect(format(value1), '100');
    String value2 = '1000';
    expect(format(value2), '1,000');
    String value3 = '10000';
    expect(format(value3), '10,000');
    String value4 = '100000';
    expect(format(value4), '100,000');
    String value5 = '1000000';
    expect(format(value5), '1,000,000');
    String value6 = '10000000';
    expect(format(value6), '10,000,000');
  });

  test('test decimal currency format', () {
    String value1 = '100.12';
    expect(format(value1), '100.12');
    String value2 = '1000.00';
    expect(format(value2), '1,000.00');
    String value3 = '10000.123';
    expect(format(value3), '10,000.123');
    String value5 = '1000000.123';
    expect(format(value5), '1,000,000.123');
  });
}

String format(String str) {
  if (str.length <= 3) return str;
  print('formatting: $str');
  String needFormatStr =
      (str.contains('.')) ? str.substring(0, str.indexOf('.')) : str;
  String decimalStr = (str.contains('.'))
      ? str.substring(str.indexOf('.'))
      : ''
          '';

  StringBuffer newStr = new StringBuffer();
  int start = needFormatStr.length % 3;
  if (start == 0) start = 3;
//  print('start: $start');
  int need = ((needFormatStr.length - 1) / 3).floor();
//  print('need: $need');
  for (int i = 0; i <= need; i++) {
    int end = i * 3 + start;
    if (end > needFormatStr.length) end = needFormatStr.length;
    var sub = (i == 0)
        ? needFormatStr.substring(0, start)
        : needFormatStr.substring(start + (i - 1) * 3, end);
    newStr.write(sub);
    if (i < need) newStr.write(',');
//    print('write: $sub');
  }

  newStr.write(decimalStr);
  print(newStr);
  return newStr.toString();
}
