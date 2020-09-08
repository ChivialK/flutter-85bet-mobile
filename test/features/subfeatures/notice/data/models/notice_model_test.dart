import 'dart:convert';

import 'package:flutter_85bet_mobile/features/routes/subfeatures/notice/data/models/notice_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../fixtures/fixture_reader.dart';

void main() {
  final map = json.decode(fixture('subfeatures/notice/notice.json'));

  test('test notice model and entity', () {
    NoticeModel model = NoticeModel.jsonToNoticeModel(map);
    print('model: $model\n\n');
    print('model maintenance: ${model.data.maintenanceList}\n\n');
    print('model marquee: ${model.data.marqueeList}');
    expect(model.data.maintenanceList.length, equals(1));
    expect(model.data.marqueeList.length, equals(4));
  });
}
