// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bankcard_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BankcardModel _$_$_BankcardModelFromJson(Map<String, dynamic> json) {
  return _$_BankcardModel(
    hasCard: json['hasCard'] as bool,
    bankAddress: json['bankaddress'] as String ?? '',
    firstName: json['firstname'] as String ?? '',
    bankAccountNo: json['bankaccountno'] as String ?? '',
    bankProvince: json['bankprovince'] as String ?? '',
    bankCity: json['bankcity'] as String ?? '',
    bankArea: json['bankarea'] as String ?? '',
    bankName: json['bankname'] as String ?? '',
    phoneVerification: json['phone_verification'] as String ?? '',
  );
}

Map<String, dynamic> _$_$_BankcardModelToJson(_$_BankcardModel instance) =>
    <String, dynamic>{
      'hasCard': instance.hasCard,
      'bankaddress': instance.bankAddress,
      'firstname': instance.firstName,
      'bankaccountno': instance.bankAccountNo,
      'bankprovince': instance.bankProvince,
      'bankcity': instance.bankCity,
      'bankarea': instance.bankArea,
      'bankname': instance.bankName,
      'phone_verification': instance.phoneVerification,
    };
