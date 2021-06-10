import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_85bet_mobile/mylogger.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart' show required;

part 'captcha_model.freezed.dart';

@freezed
abstract class CaptchaModel with _$CaptchaModel {
  const factory CaptchaModel({
    @JsonKey(name: 'status_code') String statusCode,
    @required String message,
    @JsonKey(name: 'url', nullable: true, fromJson: decodeCaptchaData)
        CaptchaData data,
  }) = _CaptchaModel;

  static CaptchaModel parseJson(Map<String, dynamic> jsonMap) =>
      _$_CaptchaModel(
        statusCode: '${jsonMap['status_code']}',
        message: '${jsonMap['message']}',
        data: decodeCaptchaData(jsonMap['url']),
      );
}

@freezed
abstract class CaptchaData with _$CaptchaData {
  const factory CaptchaData({
    @required String key,
    @required Uint8List img,
    @required bool sensitive,
  }) = _CaptchaData;
}

CaptchaData decodeCaptchaData(dynamic json) {
  if (json != null && json is Map<String, dynamic>) {
    try {
      return CaptchaData(
        key: '${json['key']}',
        img: base64.decode(json['img'].split(',').last),
        sensitive: json['sensitive'] ?? null,
      );
    } catch (e) {
      MyLogger.error(msg: 'decode captcha data has exception: $e');
    }
  }
  return null;
}
