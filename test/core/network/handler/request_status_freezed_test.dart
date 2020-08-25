import 'dart:convert';

import 'package:flutter_85bet_mobile/core/network/handler/request_status_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  var statusNum = '{"status":"success", "msg":1234}';
  var statusStr = '{"status":"failed", "msg":"wrong password"}';

  test('test json to status class', () {
    var modelInt = RequestStatusModel.fromJson(json.decode(statusNum));
    expect(modelInt.msg, '1234');
    expect(modelInt.msg, isA<String>());
    var modelStr = RequestStatusModel.fromJson(json.decode(statusStr));
    expect(modelStr, isA<RequestStatusModel>());
  });
}
