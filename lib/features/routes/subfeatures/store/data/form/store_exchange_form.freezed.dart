// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'store_exchange_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$StoreExchangeFormTearOff {
  const _$StoreExchangeFormTearOff();

// ignore: unused_element
  _StoreExchangeForm call(
      {@JsonKey(name: 'productid') int productId,
      String name,
      String phone,
      @JsonKey(name: 'code') String postCode,
      String province,
      String city,
      String area,
      String address}) {
    return _StoreExchangeForm(
      productId: productId,
      name: name,
      phone: phone,
      postCode: postCode,
      province: province,
      city: city,
      area: area,
      address: address,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $StoreExchangeForm = _$StoreExchangeFormTearOff();

/// @nodoc
mixin _$StoreExchangeForm {
  @JsonKey(name: 'productid')
  int get productId;
  String get name;
  String get phone;
  @JsonKey(name: 'code')
  String get postCode;
  String get province;
  String get city;
  String get area;
  String get address;

  $StoreExchangeFormCopyWith<StoreExchangeForm> get copyWith;
}

/// @nodoc
abstract class $StoreExchangeFormCopyWith<$Res> {
  factory $StoreExchangeFormCopyWith(
          StoreExchangeForm value, $Res Function(StoreExchangeForm) then) =
      _$StoreExchangeFormCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'productid') int productId,
      String name,
      String phone,
      @JsonKey(name: 'code') String postCode,
      String province,
      String city,
      String area,
      String address});
}

/// @nodoc
class _$StoreExchangeFormCopyWithImpl<$Res>
    implements $StoreExchangeFormCopyWith<$Res> {
  _$StoreExchangeFormCopyWithImpl(this._value, this._then);

  final StoreExchangeForm _value;
  // ignore: unused_field
  final $Res Function(StoreExchangeForm) _then;

  @override
  $Res call({
    Object productId = freezed,
    Object name = freezed,
    Object phone = freezed,
    Object postCode = freezed,
    Object province = freezed,
    Object city = freezed,
    Object area = freezed,
    Object address = freezed,
  }) {
    return _then(_value.copyWith(
      productId: productId == freezed ? _value.productId : productId as int,
      name: name == freezed ? _value.name : name as String,
      phone: phone == freezed ? _value.phone : phone as String,
      postCode: postCode == freezed ? _value.postCode : postCode as String,
      province: province == freezed ? _value.province : province as String,
      city: city == freezed ? _value.city : city as String,
      area: area == freezed ? _value.area : area as String,
      address: address == freezed ? _value.address : address as String,
    ));
  }
}

/// @nodoc
abstract class _$StoreExchangeFormCopyWith<$Res>
    implements $StoreExchangeFormCopyWith<$Res> {
  factory _$StoreExchangeFormCopyWith(
          _StoreExchangeForm value, $Res Function(_StoreExchangeForm) then) =
      __$StoreExchangeFormCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'productid') int productId,
      String name,
      String phone,
      @JsonKey(name: 'code') String postCode,
      String province,
      String city,
      String area,
      String address});
}

/// @nodoc
class __$StoreExchangeFormCopyWithImpl<$Res>
    extends _$StoreExchangeFormCopyWithImpl<$Res>
    implements _$StoreExchangeFormCopyWith<$Res> {
  __$StoreExchangeFormCopyWithImpl(
      _StoreExchangeForm _value, $Res Function(_StoreExchangeForm) _then)
      : super(_value, (v) => _then(v as _StoreExchangeForm));

  @override
  _StoreExchangeForm get _value => super._value as _StoreExchangeForm;

  @override
  $Res call({
    Object productId = freezed,
    Object name = freezed,
    Object phone = freezed,
    Object postCode = freezed,
    Object province = freezed,
    Object city = freezed,
    Object area = freezed,
    Object address = freezed,
  }) {
    return _then(_StoreExchangeForm(
      productId: productId == freezed ? _value.productId : productId as int,
      name: name == freezed ? _value.name : name as String,
      phone: phone == freezed ? _value.phone : phone as String,
      postCode: postCode == freezed ? _value.postCode : postCode as String,
      province: province == freezed ? _value.province : province as String,
      city: city == freezed ? _value.city : city as String,
      area: area == freezed ? _value.area : area as String,
      address: address == freezed ? _value.address : address as String,
    ));
  }
}

/// @nodoc
class _$_StoreExchangeForm implements _StoreExchangeForm {
  const _$_StoreExchangeForm(
      {@JsonKey(name: 'productid') this.productId,
      this.name,
      this.phone,
      @JsonKey(name: 'code') this.postCode,
      this.province,
      this.city,
      this.area,
      this.address});

  @override
  @JsonKey(name: 'productid')
  final int productId;
  @override
  final String name;
  @override
  final String phone;
  @override
  @JsonKey(name: 'code')
  final String postCode;
  @override
  final String province;
  @override
  final String city;
  @override
  final String area;
  @override
  final String address;

  @override
  String toString() {
    return 'StoreExchangeForm(productId: $productId, name: $name, phone: $phone, postCode: $postCode, province: $province, city: $city, area: $area, address: $address)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _StoreExchangeForm &&
            (identical(other.productId, productId) ||
                const DeepCollectionEquality()
                    .equals(other.productId, productId)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.phone, phone) ||
                const DeepCollectionEquality().equals(other.phone, phone)) &&
            (identical(other.postCode, postCode) ||
                const DeepCollectionEquality()
                    .equals(other.postCode, postCode)) &&
            (identical(other.province, province) ||
                const DeepCollectionEquality()
                    .equals(other.province, province)) &&
            (identical(other.city, city) ||
                const DeepCollectionEquality().equals(other.city, city)) &&
            (identical(other.area, area) ||
                const DeepCollectionEquality().equals(other.area, area)) &&
            (identical(other.address, address) ||
                const DeepCollectionEquality().equals(other.address, address)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(productId) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(phone) ^
      const DeepCollectionEquality().hash(postCode) ^
      const DeepCollectionEquality().hash(province) ^
      const DeepCollectionEquality().hash(city) ^
      const DeepCollectionEquality().hash(area) ^
      const DeepCollectionEquality().hash(address);

  @override
  _$StoreExchangeFormCopyWith<_StoreExchangeForm> get copyWith =>
      __$StoreExchangeFormCopyWithImpl<_StoreExchangeForm>(this, _$identity);
}

abstract class _StoreExchangeForm implements StoreExchangeForm {
  const factory _StoreExchangeForm(
      {@JsonKey(name: 'productid') int productId,
      String name,
      String phone,
      @JsonKey(name: 'code') String postCode,
      String province,
      String city,
      String area,
      String address}) = _$_StoreExchangeForm;

  @override
  @JsonKey(name: 'productid')
  int get productId;
  @override
  String get name;
  @override
  String get phone;
  @override
  @JsonKey(name: 'code')
  String get postCode;
  @override
  String get province;
  @override
  String get city;
  @override
  String get area;
  @override
  String get address;
  @override
  _$StoreExchangeFormCopyWith<_StoreExchangeForm> get copyWith;
}
