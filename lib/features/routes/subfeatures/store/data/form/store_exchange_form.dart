import 'package:freezed_annotation/freezed_annotation.dart';

part 'store_exchange_form.freezed.dart';

@freezed
abstract class StoreExchangeForm with _$StoreExchangeForm {
  const factory StoreExchangeForm({
    @JsonKey(name: 'productid') int productId,
    String name,
    String phone,
    @JsonKey(name: 'code') String postCode,
    String province,
    String city,
    String area,
    String address,
  }) = _StoreExchangeForm;
}

extension StoreExchangeFormExtension on StoreExchangeForm {
  Map<String, dynamic> get toJson => <String, dynamic>{
        'productid': this.productId,
        'name': this.name,
        'phone': this.phone,
        'code': this.postCode,
        'province': this.province,
        'city': this.city,
        'area': this.area,
        'address': this.address,
      };

  bool get isValid =>
      this.productId != null &&
      (name != null && name.isNotEmpty) &&
      (phone != null && phone.isNotEmpty) &&
      (postCode != null && postCode.isNotEmpty) &&
      (province != null && province.isNotEmpty) &&
      (city != null && city.isNotEmpty) &&
      (address != null && address.isNotEmpty);
}
