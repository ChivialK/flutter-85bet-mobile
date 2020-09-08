import 'dart:convert';

import 'package:flutter_85bet_mobile/features/user/data/entity/user_entity.dart';
import 'package:flutter_85bet_mobile/features/user/data/models/user_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  var jsonStr =
      '{"accountcode":"user","creditlimit":"100.0000","status":"success","vip":1,"vip_name":"\u666e\u901a\u4f1a\u5458"}';
  test('test data class', () {
    UserEntity entity = UserEntity(account: 'user', credit: '100.0000', vip: 1);
    UserModel model = UserModel(
        account: 'user',
        credit: '100.0000',
        status: 'success',
        vip: 1,
        vipName: '普通会员');

    print(entity);
    print(model);
    print('model to entity: ${model.entity}');
    print('-------------------');
    print(UserModel.jsonToUserModel(jsonDecode(jsonStr)));

    expect(entity == model.entity, true);
  });
}
