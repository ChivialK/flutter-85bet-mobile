import 'package:flutter_85bet_mobile/utils/datetime_format.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('test datetime format', () {
    var datetime = DateTime.now();
    print(datetime);
    var strDatetime = datetime.toDatetimeString;
    print(strDatetime);
    var strDate = datetime.toDateString;
    print(strDate);
    var strDateStart = datetime.toDateStartString;
    print(strDateStart);
  });

  test('test specific date to datetime', () {
    var specificDate = DateTime(2011, 1, 1).toDateStartString;
    print(specificDate);
    expect(specificDate, '2011-01-01 00:00:00');
  });

  test('test string to datetime', () {
    var strDatetime = '2020-02-13 00:00:00';
    print(strDatetime.toDatetime());
    var strDatetime2 = '2020-02-13';
    print(strDatetime2.toDatetime());
  });

  test('test datetime to date', () {
    var strDatetime = '2020-02-13 00:00:00';
    print(strDatetime.toDatetime().toDateString);
  });

  test('test datetime day passed', () {
    var datetime = DateTime.now();
    print(datetime);
    var subDate = datetime.subtract(new Duration(days: 1));
    print(subDate);
    expect(subDate.isDayPassed(), true);
  });

  test('test datetime hours passed', () {
    var datetime = DateTime.now();
    print(datetime);
    var oldDatetime = datetime.subtract(new Duration(hours: 3));
    print(oldDatetime);
    expect(oldDatetime.isAfterHours(1), true);
    expect(oldDatetime.isAfterHours(3), true);
    expect(oldDatetime.isAfterHours(4), false);
  });

  test('test datetime hours passed 2', () {
    var datetime = DateTime.now();
    print(datetime);
    var oldDatetime = datetime.subtract(new Duration(hours: 3));
    print(oldDatetime);
    print(oldDatetime.countHoursPassed());
    expect(oldDatetime.countHoursPassed(), 3);
  });
}
