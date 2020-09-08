import 'package:flutter_85bet_mobile/utils/json_util.dart';
import 'package:flutter_test/flutter_test.dart';

final String jsonListString =
    '[{"id": 4107, "category": "slot","platform": "eg"},{"id": 4108,"category": "slot","platform": "eg"}]';

final String htmlString = '<p>方案A</p>'
    '<table style="border-collapse:collapse;width:100%;height:42px;" border="1"> '
    '<tbody> '
    '<tr style="height:21px;"> '
    '<td style="width:33.3333%;background-color:#e7c080;text-align:center;height:21px;"> <span style="color:#000000;"><strong>存款金额</strong></span></td>'
    '<td style="width:33.3333%;background-color:#e7c080;text-align:center;height:21px;"><span style="color:#000000;"><strong>优惠比例</strong></span></td>'
    '<td style="width:33.3333%;background-color:#e7c080;text-align:center;height:21px;"><span style="color:#000000;"><strong>流水倍数</strong></span></td> </tr>'
    '<tr style="height:21px;"> '
    '<td style="width:33.3333%;text-align:center;height:21px;">10~99</td> '
    '<td style="width:33.3333%;text-align:center;height:21px;">66%</td> '
    '<td style="width:33.3333%;text-align:center;height:21px;">20倍</td>'
    '</tr>'
    '</tbody>'
    '</table>';

void main() {
  test('test json trim decode', () {
    print(JsonUtil.trimJson(jsonListString));
  });

  test('test json array decode to list', () {
    var list = JsonUtil.decodeArray(jsonListString);
    print(list);
    expect(list, isA<List>());
  });

  test('test html trim', () {
//    final trimRegex = RegExp('r"\n|\r\n|\r|\t"');
//    String strBody =
//        """$htmlString""".replaceAll(trimRegex, "").replaceAll('> <', "><");
    String strBody = JsonUtil.trimJson(htmlString);
    print(strBody);
    expect(strBody.contains('table style='), true);
  });
}
