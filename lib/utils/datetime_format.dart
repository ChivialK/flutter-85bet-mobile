import 'package:flutter_85bet_mobile/core/mobx_store_export.dart';
import 'package:intl/intl.dart';

final DateFormat _datetimeFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
final DateFormat _dateFormat = DateFormat("yyyy-MM-dd");
final DateFormat _dateStartFormat = DateFormat("yyyy-MM-dd 00:00:00");
final DateFormat _dateEndFormat = DateFormat("yyyy-MM-dd 23:59:59");

/// Get [DateTime.now] as String
String getDateTime() => DateTime.now().toDatetimeString;
String getDateString() => DateTime.now().toDateString;

List<String> getDayRange({int beforeDays = 0}) {
  DateTime dayTime = DateTime.now().subtract(Duration(days: beforeDays));
  debugPrint('$beforeDays days before: $dayTime');
  debugPrint('range: ${dayTime.toDateString} - ${dayTime.toDateString}');
  return [dayTime.toDateString, dayTime.toDateString];
}

List<String> getMonthRange() {
  DateTime now = DateTime.now();
  int year = now.year;
  int month = now.month;
  debugPrint('getMonthRange year=$year month=$month');
  DateTime thisMonthStart = (month < 10)
      ? DateTime.parse('${year}0${month}01')
      : DateTime.parse('$year${month}01');
  DateTime thisMonthEnd = ((month < 12)
      ? (month < 9)
          ? DateTime.parse('${year}0${month + 1}01')
          : DateTime.parse('$year${month + 1}01')
      : DateTime.parse('${year + 1}0101'))
    ..subtract(Duration(days: 1));
  debugPrint('month range: $thisMonthStart - $thisMonthEnd');
  return [thisMonthStart.toDateString, thisMonthEnd.toDateString];
}

List<String> getWideRange() {
  DateTime start = DateTime.parse('20000101');
  DateTime end = DateTime.now();
  debugPrint('wide time range: $start - $end');
  return [start.toDateString, end.toDateString];
}

/// return true if current time is between [start] and [end] time
bool checkDateRange(String start, String end) {
  if (start == null || start.isEmpty || end == null || end.isEmpty)
    return false;
  try {
    DateTime now = DateTime.now();
    DateTime startTime = start.toDatetime();
    DateTime endTime = end.toDatetime();
    return (startTime == endTime) ||
        (startTime.isBefore(now) &&
            endTime.isBefore(now) &&
            startTime.isBefore(endTime));
  } on Exception {
    return false;
  }
}

/// Return true if current time is after [expireDate]
bool hasExpired(String expireDate) {
  DateTime now = DateTime.now().toDateString.toDatetime();
  DateTime dateTime = expireDate.toDatetime();
  return now.isAfter(dateTime);
}

/// Return true if current time is same as [date]
bool isSameDay(String date) {
  DateTime now = DateTime.now().toDateString.toDatetime();
  DateTime compareDate = date.toDatetime();
  return compareDate.compareTo(now) == 0;
}

extension DateTimeStringExtensions on String {
  /// Format [date] string back to [DateTime]
  DateTime toDatetime() {
    if (contains('.'))
      return _datetimeFormat.parse(this);
    else
      return _datetimeFormat.parse('$this 00:00:00');
  }
}

extension DateTimeExtensions on DateTime {
  /// Format [DateTime] to [String]
  String get toDatetimeString => _datetimeFormat.format(this);

  String get toDateString => _dateFormat.format(this);

  String get toDateStartString => _dateStartFormat.format(this);

  String get toDateEndString => _dateEndFormat.format(this);

  /// check if the [DateTime] has at least passed [hours] and the time is before [DateTime.now]
  /// Usage example:
  /// data updated on 02-01 20:00:00
  /// now is 02-02 00:00:00
  /// the update required interval is 3 hrs
  /// so, the time now is 4 hours after old date + 3 hr, which will return true.
  bool isAfterHours(int hours) =>
      DateTime.now().isAfter(this.add(Duration(hours: hours)));

  bool isAfterSeconds(int seconds) =>
      DateTime.now().isAfter(this.add(Duration(seconds: seconds)));

  bool isDayPassed() => this.day < DateTime.now().day;

  int countHoursPassed() => DateTime.now().difference(this).inHours;
}
