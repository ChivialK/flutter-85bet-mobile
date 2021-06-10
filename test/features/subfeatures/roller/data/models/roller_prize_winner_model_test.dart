import 'dart:convert';

import 'package:flutter_85bet_mobile/core/network/handler/request_code_model.dart';
import 'package:flutter_85bet_mobile/features/routes/subfeatures/roller/data/models/roller_prize_winner_model.dart';
import 'package:flutter_85bet_mobile/utils/json_util.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../fixtures/fixture_reader.dart';

void main() {
  final map = json.decode(fixture('subfeatures/roller/winners.json'));

  test('test winners list model and entity', () {
    RequestCodeModel model = RequestCodeModel.jsonToCodeModel(map);
    print('model: $model\n\n');
    List<RollerPrizeWinnerModel> list = JsonUtil.decodeArrayToModel(model.data,
        (jsonMap) => RollerPrizeWinnerModel.jsonToPrizeWinner(jsonMap));
    print('list: $list\n\n');
    expect(list.first, isA<RollerPrizeWinnerModel>());
    expect(list.first.accCode, equals('jjv*****o'));
  });
}
