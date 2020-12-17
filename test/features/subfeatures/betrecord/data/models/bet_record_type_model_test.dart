import 'dart:convert';

import 'package:flutter_85bet_mobile/features/routes/subfeatures/betrecord/data/models/bet_record_type_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../fixtures/fixture_reader.dart';

void main() {
  List mapList =
      json.decode(fixture('subfeatures/betrecord/bet_record_category.json'));
  Map<String, dynamic> mapList2 =
      json.decode(fixture('subfeatures/betrecord/bet_record_platform.json'));

  test('test agent ad model', () {
    print('decoded map1: $mapList');
    print('\n');
    print('decoded map2: $mapList2');
    print('\n\n');

    List<BetRecordTypeModel> modelList = new List();
    mapList.forEach((value) {
      print('category data: $value');
      BetRecordTypeModel model = BetRecordTypeModel.jsonToBetRecordType(value);
      print('platform data: ${mapList2[model.categoryId.toString()]}');
      modelList.add(
          model.copyWith(platformMap: mapList2[model.categoryId.toString()]));
    });
    print('\n\n');
    print('model list: $modelList');
  });
}
