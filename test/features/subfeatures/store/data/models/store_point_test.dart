import 'dart:convert';

import 'package:flutter_85bet_mobile/core/network/handler/request_code_model.dart';
import 'package:flutter_85bet_mobile/utils/value_util.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../fixtures/fixture_reader.dart';

void main() {
  final map1 = json.decode(fixture('subfeatures/store/point0.json'));
  final map2 = json.decode(fixture('subfeatures/store/point.json'));
  final map3 = json.decode(fixture('subfeatures/store/point_str.json'));
  final map4 = json.decode(fixture('subfeatures/store/point_error.json'));

  num retrieveValue(dynamic data) {
    var result;
    if (data != null &&
        data.toString().isNotEmpty &&
        (data as Map).containsKey('point')) {
      var value = (data as Map)['point'];
      result = (value is num) ? value : value.toString().strToInt;
    } else {
      result = -1;
    }
    return result;
  }

  test('test store point 0', () {
    print('\n');
    RequestCodeModel model = RequestCodeModel.jsonToCodeModel(map1);
    print('code model: $model\n\n');
    var result = retrieveValue(model.data);
    print('point: $result');
    expect(result, 0);
  });

  test('test store point', () {
    print('\n');
    RequestCodeModel model = RequestCodeModel.jsonToCodeModel(map2);
    print('code model: $model\n\n');
    var result = retrieveValue(model.data);
    print('point: $result');
    expect(result, 10000);
  });

  test('test store point string', () {
    print('\n');
    RequestCodeModel model = RequestCodeModel.jsonToCodeModel(map3);
    print('code model: $model\n\n');
    var result = retrieveValue(model.data);
    print('point: $result');
    expect(result, 100);
  });

  test('test store point error', () {
    print('\n');
    RequestCodeModel model = RequestCodeModel.jsonToCodeModel(map4);
    print('code model: $model\n\n');
    var result = retrieveValue(model.data);
    print('point: $result');
    expect(result, -1);
  });
}
