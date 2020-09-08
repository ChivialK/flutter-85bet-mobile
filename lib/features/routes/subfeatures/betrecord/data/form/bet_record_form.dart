import 'package:freezed_annotation/freezed_annotation.dart';

import '../enum/bet_record_time_enum.dart';

part 'bet_record_form.freezed.dart';

@freezed
abstract class BetRecordForm with _$BetRecordForm {
  const factory BetRecordForm({
    @required int categoryId,
    @required String platform,
    @required int page,
    @required BetRecordTimeEnum time,
    String startTime,
    String endTime,
  }) = _BetRecordForm;
}

extension BetRecordFormExtension on BetRecordForm {
  Map<String, dynamic> get toJson => {
        'platform': platform,
        'page': page,
        'time': time.value,
        'starttime': (startTime == null) ? '0000-00-00' : startTime,
        'endtime': (endTime == null) ? '0000-00-00' : endTime,
      };

  bool get isGetAllPlatform => platform.toLowerCase() == 'all';
}
