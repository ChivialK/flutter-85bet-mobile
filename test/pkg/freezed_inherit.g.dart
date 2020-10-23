// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'freezed_inherit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FreezedParentData _$_$FreezedParentDataFromJson(Map<String, dynamic> json) {
  return _$FreezedParentData(
    account: json['account'] as String,
    credit: json['credit'] as String,
  );
}

Map<String, dynamic> _$_$FreezedParentDataToJson(
        _$FreezedParentData instance) =>
    <String, dynamic>{
      'account': instance.account,
      'credit': instance.credit,
    };

_$FreezedChildData _$_$FreezedChildDataFromJson(Map<String, dynamic> json) {
  return _$FreezedChildData(
    account: json['account'] as String,
    credit: json['credit'] as String,
    status: json['status'] as String,
  );
}

Map<String, dynamic> _$_$FreezedChildDataToJson(_$FreezedChildData instance) =>
    <String, dynamic>{
      'account': instance.account,
      'credit': instance.credit,
      'status': instance.status,
    };
