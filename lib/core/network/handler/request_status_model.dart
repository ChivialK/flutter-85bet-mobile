import 'package:flutter_85bet_mobile/utils/json_util.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_status_model.freezed.dart';

@freezed
abstract class RequestStatusModel with _$RequestStatusModel {
  factory RequestStatusModel({
    @required String status,
    @JsonKey(fromJson: JsonUtil.getRawJson, required: false) String msg,
  }) = _RequestStatusModel;

  static RequestStatusModel jsonToStatusModel(Map<String, dynamic> jsonMap) {
//    if (jsonMap.containsKey('msg') &&
//        '${jsonMap['msg']}'.toLowerCase() == 'Repeat token'.toLowerCase())
//      throw TokenException();
    return _$_RequestStatusModel(
      status: jsonMap['status'] as String,
      msg: JsonUtil.getRawJson(jsonMap['msg']),
    );
  }

  @late
  bool get isSuccess => status == 'success';
}

@freezed
abstract class DataRequestResult with _$DataRequestResult {
  const factory DataRequestResult({
    dynamic data,
    RequestStatusModel failedData,
  }) = _DataRequestResult;
}
