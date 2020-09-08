import 'package:flutter_85bet_mobile/core/network/handler/request_status_model.dart';
import 'package:flutter_85bet_mobile/utils/json_util.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  var statusNum = '{"status":"success", "msg":1234}';
  var statusStr = '{"status":"failed", "msg":"wrong password"}';

  test('test json to status class', () {
    var modelInt = JsonUtil.decodeToModel(
        statusNum, (jsonMap) => RequestStatusModel.jsonToStatusModel(jsonMap));
    expect(modelInt.msg, '1234');
    expect(modelInt.msg, isA<String>());
    var modelStr = JsonUtil.decodeToModel(
        statusStr, (jsonMap) => RequestStatusModel.jsonToStatusModel(jsonMap));
    expect(modelStr, isA<RequestStatusModel>());
  });
}
