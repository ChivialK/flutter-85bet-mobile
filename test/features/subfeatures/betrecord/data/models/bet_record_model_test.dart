import 'dart:convert';

import 'package:flutter_85bet_mobile/features/routes/subfeatures/betrecord/data/models/bet_record_model.dart';
import 'package:flutter_85bet_mobile/utils/json_util.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../fixtures/fixture_reader.dart';

void main() {
  final map = json.decode(fixture('subfeatures/betrecord/bet_record.json'));
  final mapNoData =
      json.decode(fixture('subfeatures/betrecord/bet_record_no_data.json'));
  final mapAllPlatform =
      json.decode(fixture('subfeatures/betrecord/bet_record_all.json'));

  test('test normal bet record model', () {
    BetRecordModel model = BetRecordModel.jsonToBetRecordModel(map);
    print('\n\nmodel: $model');
  });

  test('test no data bet record model', () {
    BetRecordModel model = BetRecordModel.jsonToBetRecordModel(mapNoData);
    print('\n\nmodel: $model');
    print('\nsum: ${model.getSum}');
    expect(model.hasNoData, true);
  });

  test('test all platform bet record model', () {
    var list = JsonUtil.decodeMapToModelList(
        mapAllPlatform['data'],
        (jsonMap) =>
            BetRecordDataAllPlatform.jsonToBetRecordDataAllPlatform(jsonMap));
    print('\ndata list: $list');
    expect(list.length, 17);
  });
}
