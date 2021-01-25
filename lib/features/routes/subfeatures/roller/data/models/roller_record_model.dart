import 'package:freezed_annotation/freezed_annotation.dart';

part 'roller_record_model.freezed.dart';

@freezed
abstract class RollerRecordModel with _$RollerRecordModel {
  const factory RollerRecordModel({
    int id,
    @JsonKey(name: 'accountid') int accountId,
    String method,
    @JsonKey(name: 'method_ch') String methodCh,
    String name,
    String detail,
    @JsonKey(name: 'cdate') String date,
    int count,
  }) = _RollerRecordModel;

  static RollerRecordModel jsonToRecordModel(Map<String, dynamic> jsonMap) =>
      _$_RollerRecordModel(
        id: jsonMap['id'] as int,
        accountId: jsonMap['accountid'] as int,
        method: jsonMap['method'] as String,
        methodCh: jsonMap['method_ch'] as String,
        name: jsonMap['name'] as String,
        detail: jsonMap['detail'] as String,
        date: jsonMap['cdate'] as String,
        count: jsonMap['count'] as int,
      );
}
