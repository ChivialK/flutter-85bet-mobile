import 'dart:convert';

import 'package:flutter_85bet_mobile/core/network/handler/request_code_model.dart';
import 'package:flutter_85bet_mobile/features/subfeatures/agent/data/models/agent_ledger_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../fixtures/fixture_reader.dart';

void main() {
  Map<String, dynamic> map =
      json.decode(fixture('subfeatures/agent/agent_ledger.json'));

  test('test agent ledger model', () {
    print('decoded map: $map');
    print('\n\n');

    RequestCodeModel codeModel = RequestCodeModel.jsonToCodeModel(map);
    print('map to model: $codeModel');
    print('\n\n');

    AgentLedgerModel ledgerModel;
    if (codeModel.data is Map)
      ledgerModel = AgentLedgerModel.jsonToAgentLedgerModel(codeModel.data);
    else
      ledgerModel =
          AgentLedgerModel.jsonToAgentLedgerModel(jsonDecode(codeModel.data));
    print('decoded to ledger model:\n');
    print(ledgerModel.data);
    expect(ledgerModel.data.length, 1);
    print('\n\n');

    //count total
    List<num> lastRow = new List.generate(4, (_) => 0);
    ledgerModel.data.forEach((element) {
      for (int i = 0; i < 4; i++) {
        var sum = lastRow[i];
        print('lastRow $i = $sum');
        sum += element[i];
        print('lastRow $i + ${element[i]}');
        lastRow.replaceRange(i, i + 1, [sum]);
        print('lastRow = $lastRow');
      }
      print('\n\n');
    });

    // test count total function
    expect(ledgerModel.sumEachColumn, equals(lastRow));
  });
}
