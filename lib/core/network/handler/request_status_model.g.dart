// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

// ignore: non_constant_identifier_names
_$_RequestStatusModel _$_$_RequestStatusModelFromJson(
    Map<String, dynamic> json) {
  return _$_RequestStatusModel(
    status: json['status'] as String,
    msg: JsonUtil.getRawJson(json['msg']),
  );
}

// ignore: non_constant_identifier_names
Map<String, dynamic> _$_$_RequestStatusModelToJson(
        _$_RequestStatusModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
    };
