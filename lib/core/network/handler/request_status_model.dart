import 'package:flutter_85bet_mobile/utils/json_util.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_status_model.freezed.dart';
part 'request_status_model.g.dart';

@freezed
abstract class RequestStatusModel with _$RequestStatusModel {
  factory RequestStatusModel({
    @required String status,
    @JsonKey(fromJson: JsonUtil.getRawJson, required: false) String msg,
  }) = _RequestStatusModel;

  factory RequestStatusModel.fromJson(Map<String, dynamic> json) =>
      _$RequestStatusModelFromJson(json);

  static RequestStatusModel jsonToStatusModel(Map<String, dynamic> jsonMap) =>
      RequestStatusModel.fromJson(jsonMap);

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
