import 'package:flutter_85bet_mobile/utils/json_util.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transfer_result_model.freezed.dart';

@freezed
abstract class TransferResultModel with _$TransferResultModel {
  factory TransferResultModel({
    int code,
    String status,
    dynamic data,
    @JsonKey(fromJson: JsonUtil.getRawJson, required: false, defaultValue: '')
        String msg,
  }) = _TransferResultModel;

  static TransferResultModel jsonToModel(Map<String, dynamic> jsonMap) =>
      _$_TransferResultModel(
        code: jsonMap['code'] as int,
        status: jsonMap['status'] as String,
        data: jsonMap['data'],
        msg: '${jsonMap['msg']}',
      );

  @late
  bool get isSuccess =>
      (code != null && code == 0) || (status != null && status == 'success');
}
