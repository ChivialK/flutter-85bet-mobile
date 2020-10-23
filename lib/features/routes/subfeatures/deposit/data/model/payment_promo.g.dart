// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_promo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentPromoTypeJson _$_$PaymentPromoTypeJsonFromJson(
    Map<String, dynamic> json) {
  return _$PaymentPromoTypeJson(
    local: json['1'] ?? '',
    other: json['2'] ?? '',
  );
}

Map<String, dynamic> _$_$PaymentPromoTypeJsonToJson(
        _$PaymentPromoTypeJson instance) =>
    <String, dynamic>{
      '1': instance.local,
      '2': instance.other,
    };

_$PaymentPromoData _$_$PaymentPromoDataFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['promoid', 'promodesc']);
  return _$PaymentPromoData(
    promoId: json['promoid'] as int,
    promoDesc: json['promodesc'] as String ?? '?',
  );
}

Map<String, dynamic> _$_$PaymentPromoDataToJson(_$PaymentPromoData instance) =>
    <String, dynamic>{
      'promoid': instance.promoId,
      'promodesc': instance.promoDesc,
    };
