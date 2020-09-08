import 'package:flutter_85bet_mobile/core/base/data_operator.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meta/meta.dart' show required;

class TestEntity implements DataOperator {
  final int id;
  final String desc;

  TestEntity({
    @required this.id,
    @required this.desc,
  });

  @override
  String operator [](String key) {
    switch (key) {
      case 'id':
        return id.toString();
      case 'desc':
        return desc.toString();
      default:
        return '';
    }
  }
}

void main() {
  TestEntity testEntity1 = TestEntity(id: 0, desc: 'entity 1');
  TestEntity testEntity2 = TestEntity(id: 1, desc: 'entity 2');
  TestEntity testEntity3 = TestEntity(id: 2, desc: 'entity 2');

  test('test data operator', () {
    expect(testEntity1['id'], '0');
  });

  test('test data operator equal', () {
    var id1 = testEntity1['id'];
    var id2 = testEntity2['id'];
    expect(id1 != id2, true);

    var desc1 = testEntity2['desc'];
    var desc2 = testEntity3['desc'];
    expect(desc1 == desc2, true);
  });
}
