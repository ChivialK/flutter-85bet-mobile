// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_type_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentTypeOnlineData _$_$PaymentTypeOnlineDataFromJson(
    Map<String, dynamic> json) {
  return _$PaymentTypeOnlineData(
    amount: json['amount'] as String,
    amountOption:
        (json['amountoption'] as List)?.map((e) => e as String)?.toList(),
    amountType: json['amounttype'] as int,
    bankAccountId: json['bankaccountid'] as int,
    gateway: json['gateway'].toString(),
    max: json['max'] as int,
    min: json['min'] as int,
    payment: json['payment'] as int,
    pgIndex: json['pgindex'] as int,
    sb: (json['sb'] as List)?.map((e) => e as int)?.toList(),
    type: json['type'] as String,
    key: json['key'],
  );
}

Map<String, dynamic> _$_$PaymentTypeOnlineDataToJson(
        _$PaymentTypeOnlineData instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'amountoption': instance.amountOption,
      'amounttype': instance.amountType,
      'bankaccountid': instance.bankAccountId,
      'gateway': instance.gateway,
      'max': instance.max,
      'min': instance.min,
      'payment': instance.payment,
      'pgindex': instance.pgIndex,
      'sb': instance.sb,
      'type': instance.type,
      'key': instance.key,
    };

_$PaymentTypeLocalData _$_$PaymentTypeLocalDataFromJson(
    Map<String, dynamic> json) {
  return _$PaymentTypeLocalData(
    bankAccountId: json['bankaccountid'] as int,
    bankAccountNo: json['bankaccountno'] as String,
    bankCode: json['bankcode'] as String,
    bankIndex: json['bankindex'] as int,
    max: JsonUtil.getRawJson(json['max']),
    min: JsonUtil.getRawJson(json['min']),
    payment: (json.containsKey('payment')) ? '${json['payment']}' : null,
    type: json['type'] as String,
    key: json['key'],
  );
}

Map<String, dynamic> _$_$PaymentTypeLocalDataToJson(
        _$PaymentTypeLocalData instance) =>
    <String, dynamic>{
      'bankaccountid': instance.bankAccountId,
      'bankaccountno': instance.bankAccountNo,
      'bankcode': instance.bankCode,
      'bankindex': instance.bankIndex,
      'max': instance.max,
      'min': instance.min,
      'payment': instance.payment,
      'type': instance.type,
      'key': instance.key,
    };
