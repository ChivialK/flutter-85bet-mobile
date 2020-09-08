// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deposit_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

// ignore: non_constant_identifier_names
_$_DepositResult _$_$_DepositResultFromJson(Map<String, dynamic> json) {
  return _$_DepositResult(
    ss: json['ss'] as bool,
    url: json['url'] as String,
    msg: json['msg'] as String ?? '',
    code: json['code'] as int,
    ledger: json['ledgerindex'] as int ?? -1,
  );
}

// ignore: non_constant_identifier_names
Map<String, dynamic> _$_$_DepositResultToJson(_$_DepositResult instance) =>
    <String, dynamic>{
      'ss': instance.ss,
      'url': instance.url,
      'msg': instance.msg,
      'code': instance.code,
      'ledgerindex': instance.ledger,
    };
