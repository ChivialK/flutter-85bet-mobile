import 'package:flutter_test/flutter_test.dart';

class TestData {
  final int id;
  final int top;
  final int sort;

  TestData(this.id, this.top, this.sort);

  @override
  String toString() {
    return 'id:$id, top:$top, sort:$sort';
  }
}

void main() {
  var data1 = TestData(1, 1, 32);
  var data2 = TestData(2, 1, 34);
  var data3 = TestData(3, 1, 28);
  var data4 = TestData(4, 0, 30);
  var data5 = TestData(5, 0, 36);
  var data6 = TestData(6, 2, 40);
  var data7 = TestData(7, 0, 29);

  var dataList = [data1, data2, data3, data4, data5, data6, data7];

  test('test data sort', () {
    var sortedTop2 = dataList.where((value) => value.top == 2).toList();
    sortedTop2.sort((a, b) => a.sort.compareTo(b.sort));
    print(sortedTop2);
    var sortedTop1 = dataList.where((value) => value.top == 1).toList();
    sortedTop1.sort((a, b) => a.sort.compareTo(b.sort));
    print(sortedTop1);
    var sortedOther = dataList.where((value) => value.top == 0).toList();
    sortedOther.sort((a, b) => a.sort.compareTo(b.sort));
    print(sortedOther);
    print('---------------------------');
    List<TestData> sorted2 = List.from(dataList);
    sorted2.sort((a, b) => a.sort.compareTo(b.sort));
    sorted2.sort((b, a) => a.top.compareTo(b.top));
    print(sorted2);
  });
}
