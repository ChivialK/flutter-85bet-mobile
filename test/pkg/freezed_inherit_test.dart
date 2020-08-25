import 'package:flutter_test/flutter_test.dart';

import 'freezed_inherit.dart';

void main() {
  test('test freezed parent class [inherit] concept', () {
    var parent = FreezedParent(account: 'user', credit: '100');
    var child =
        FreezedParent.child(account: 'user', credit: '100', status: 'success');

    FreezedParent transform(String status, FreezedParent p) {
      return FreezedParent.child(
          account: p.account, credit: p.credit, status: status);
    }

    print(parent);
    print(child);
    print(transform('copy', parent));
  });

  test('test freezed parent class [json]', () {
    final formJson1 = {
      "account": "user1",
      "credit": "123",
    };
    final formJson2 = {
      "account": "user1",
      "credit": "123",
      "status": "from",
    };

    formJson1['runtimeType'] = 'default';
    formJson2['runtimeType'] = 'child';

    var parent = FreezedParent.fromJson(formJson1);
    var child = FreezedParent.fromJson(formJson2);
    print('data: $parent, type: ${parent.runtimeType}');
    print('data: $child, type: ${child.runtimeType}');

    expect(parent == child, false);
    expect(parent, isA<FreezedParent>());
    expect(parent, isA<FreezedParentData>());
    expect(child, isA<FreezedParent>());
    expect(child, isA<FreezedChildData>());
  });

  test('test freezed parent class [method]', () {
    var parent = FreezedParent(account: 'user1', credit: '100');
    var child = FreezedParent.child(account: 'user2', credit: '100');
    expect(parent['id'] == child['id'], false);
  });
}
