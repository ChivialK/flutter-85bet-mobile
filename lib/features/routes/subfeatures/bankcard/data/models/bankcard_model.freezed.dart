// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'bankcard_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
BankcardModel _$BankcardModelFromJson(Map<String, dynamic> json) {
  return _BankcardModel.fromJson(json);
}

/// @nodoc
class _$BankcardModelTearOff {
  const _$BankcardModelTearOff();

// ignore: unused_element
  _BankcardModel call(
      {@nullable bool hasCard,
      @JsonKey(name: 'bankaddress', defaultValue: '') String bankAddress,
      @JsonKey(name: 'firstname', defaultValue: '') String firstName,
      @JsonKey(name: 'bankaccountno', defaultValue: '') String bankAccountNo,
      @JsonKey(name: 'bankprovince', defaultValue: '') String bankProvince,
      @JsonKey(name: 'bankcity', defaultValue: '') String bankCity,
      @JsonKey(name: 'bankarea', defaultValue: '') String bankArea,
      @JsonKey(name: 'bankname', defaultValue: '') String bankName}) {
    return _BankcardModel(
      hasCard: hasCard,
      bankAddress: bankAddress,
      firstName: firstName,
      bankAccountNo: bankAccountNo,
      bankProvince: bankProvince,
      bankCity: bankCity,
      bankArea: bankArea,
      bankName: bankName,
    );
  }

// ignore: unused_element
  BankcardModel fromJson(Map<String, Object> json) {
    return BankcardModel.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $BankcardModel = _$BankcardModelTearOff();

/// @nodoc
mixin _$BankcardModel {
  @nullable
  bool get hasCard;
  @JsonKey(name: 'bankaddress', defaultValue: '')
  String get bankAddress;
  @JsonKey(name: 'firstname', defaultValue: '')
  String get firstName;
  @JsonKey(name: 'bankaccountno', defaultValue: '')
  String get bankAccountNo;
  @JsonKey(name: 'bankprovince', defaultValue: '')
  String get bankProvince;
  @JsonKey(name: 'bankcity', defaultValue: '')
  String get bankCity;
  @JsonKey(name: 'bankarea', defaultValue: '')
  String get bankArea;
  @JsonKey(name: 'bankname', defaultValue: '')
  String get bankName;

  Map<String, dynamic> toJson();
  $BankcardModelCopyWith<BankcardModel> get copyWith;
}

/// @nodoc
abstract class $BankcardModelCopyWith<$Res> {
  factory $BankcardModelCopyWith(
          BankcardModel value, $Res Function(BankcardModel) then) =
      _$BankcardModelCopyWithImpl<$Res>;
  $Res call(
      {@nullable bool hasCard,
      @JsonKey(name: 'bankaddress', defaultValue: '') String bankAddress,
      @JsonKey(name: 'firstname', defaultValue: '') String firstName,
      @JsonKey(name: 'bankaccountno', defaultValue: '') String bankAccountNo,
      @JsonKey(name: 'bankprovince', defaultValue: '') String bankProvince,
      @JsonKey(name: 'bankcity', defaultValue: '') String bankCity,
      @JsonKey(name: 'bankarea', defaultValue: '') String bankArea,
      @JsonKey(name: 'bankname', defaultValue: '') String bankName});
}

/// @nodoc
class _$BankcardModelCopyWithImpl<$Res>
    implements $BankcardModelCopyWith<$Res> {
  _$BankcardModelCopyWithImpl(this._value, this._then);

  final BankcardModel _value;
  // ignore: unused_field
  final $Res Function(BankcardModel) _then;

  @override
  $Res call({
    Object hasCard = freezed,
    Object bankAddress = freezed,
    Object firstName = freezed,
    Object bankAccountNo = freezed,
    Object bankProvince = freezed,
    Object bankCity = freezed,
    Object bankArea = freezed,
    Object bankName = freezed,
  }) {
    return _then(_value.copyWith(
      hasCard: hasCard == freezed ? _value.hasCard : hasCard as bool,
      bankAddress:
          bankAddress == freezed ? _value.bankAddress : bankAddress as String,
      firstName: firstName == freezed ? _value.firstName : firstName as String,
      bankAccountNo: bankAccountNo == freezed
          ? _value.bankAccountNo
          : bankAccountNo as String,
      bankProvince: bankProvince == freezed
          ? _value.bankProvince
          : bankProvince as String,
      bankCity: bankCity == freezed ? _value.bankCity : bankCity as String,
      bankArea: bankArea == freezed ? _value.bankArea : bankArea as String,
      bankName: bankName == freezed ? _value.bankName : bankName as String,
    ));
  }
}

/// @nodoc
abstract class _$BankcardModelCopyWith<$Res>
    implements $BankcardModelCopyWith<$Res> {
  factory _$BankcardModelCopyWith(
          _BankcardModel value, $Res Function(_BankcardModel) then) =
      __$BankcardModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@nullable bool hasCard,
      @JsonKey(name: 'bankaddress', defaultValue: '') String bankAddress,
      @JsonKey(name: 'firstname', defaultValue: '') String firstName,
      @JsonKey(name: 'bankaccountno', defaultValue: '') String bankAccountNo,
      @JsonKey(name: 'bankprovince', defaultValue: '') String bankProvince,
      @JsonKey(name: 'bankcity', defaultValue: '') String bankCity,
      @JsonKey(name: 'bankarea', defaultValue: '') String bankArea,
      @JsonKey(name: 'bankname', defaultValue: '') String bankName});
}

/// @nodoc
class __$BankcardModelCopyWithImpl<$Res>
    extends _$BankcardModelCopyWithImpl<$Res>
    implements _$BankcardModelCopyWith<$Res> {
  __$BankcardModelCopyWithImpl(
      _BankcardModel _value, $Res Function(_BankcardModel) _then)
      : super(_value, (v) => _then(v as _BankcardModel));

  @override
  _BankcardModel get _value => super._value as _BankcardModel;

  @override
  $Res call({
    Object hasCard = freezed,
    Object bankAddress = freezed,
    Object firstName = freezed,
    Object bankAccountNo = freezed,
    Object bankProvince = freezed,
    Object bankCity = freezed,
    Object bankArea = freezed,
    Object bankName = freezed,
  }) {
    return _then(_BankcardModel(
      hasCard: hasCard == freezed ? _value.hasCard : hasCard as bool,
      bankAddress:
          bankAddress == freezed ? _value.bankAddress : bankAddress as String,
      firstName: firstName == freezed ? _value.firstName : firstName as String,
      bankAccountNo: bankAccountNo == freezed
          ? _value.bankAccountNo
          : bankAccountNo as String,
      bankProvince: bankProvince == freezed
          ? _value.bankProvince
          : bankProvince as String,
      bankCity: bankCity == freezed ? _value.bankCity : bankCity as String,
      bankArea: bankArea == freezed ? _value.bankArea : bankArea as String,
      bankName: bankName == freezed ? _value.bankName : bankName as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_BankcardModel implements _BankcardModel {
  const _$_BankcardModel(
      {@nullable this.hasCard,
      @JsonKey(name: 'bankaddress', defaultValue: '') this.bankAddress,
      @JsonKey(name: 'firstname', defaultValue: '') this.firstName,
      @JsonKey(name: 'bankaccountno', defaultValue: '') this.bankAccountNo,
      @JsonKey(name: 'bankprovince', defaultValue: '') this.bankProvince,
      @JsonKey(name: 'bankcity', defaultValue: '') this.bankCity,
      @JsonKey(name: 'bankarea', defaultValue: '') this.bankArea,
      @JsonKey(name: 'bankname', defaultValue: '') this.bankName});

  factory _$_BankcardModel.fromJson(Map<String, dynamic> json) =>
      _$_$_BankcardModelFromJson(json);

  @override
  @nullable
  final bool hasCard;
  @override
  @JsonKey(name: 'bankaddress', defaultValue: '')
  final String bankAddress;
  @override
  @JsonKey(name: 'firstname', defaultValue: '')
  final String firstName;
  @override
  @JsonKey(name: 'bankaccountno', defaultValue: '')
  final String bankAccountNo;
  @override
  @JsonKey(name: 'bankprovince', defaultValue: '')
  final String bankProvince;
  @override
  @JsonKey(name: 'bankcity', defaultValue: '')
  final String bankCity;
  @override
  @JsonKey(name: 'bankarea', defaultValue: '')
  final String bankArea;
  @override
  @JsonKey(name: 'bankname', defaultValue: '')
  final String bankName;

  @override
  String toString() {
    return 'BankcardModel(hasCard: $hasCard, bankAddress: $bankAddress, firstName: $firstName, bankAccountNo: $bankAccountNo, bankProvince: $bankProvince, bankCity: $bankCity, bankArea: $bankArea, bankName: $bankName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BankcardModel &&
            (identical(other.hasCard, hasCard) ||
                const DeepCollectionEquality()
                    .equals(other.hasCard, hasCard)) &&
            (identical(other.bankAddress, bankAddress) ||
                const DeepCollectionEquality()
                    .equals(other.bankAddress, bankAddress)) &&
            (identical(other.firstName, firstName) ||
                const DeepCollectionEquality()
                    .equals(other.firstName, firstName)) &&
            (identical(other.bankAccountNo, bankAccountNo) ||
                const DeepCollectionEquality()
                    .equals(other.bankAccountNo, bankAccountNo)) &&
            (identical(other.bankProvince, bankProvince) ||
                const DeepCollectionEquality()
                    .equals(other.bankProvince, bankProvince)) &&
            (identical(other.bankCity, bankCity) ||
                const DeepCollectionEquality()
                    .equals(other.bankCity, bankCity)) &&
            (identical(other.bankArea, bankArea) ||
                const DeepCollectionEquality()
                    .equals(other.bankArea, bankArea)) &&
            (identical(other.bankName, bankName) ||
                const DeepCollectionEquality()
                    .equals(other.bankName, bankName)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(hasCard) ^
      const DeepCollectionEquality().hash(bankAddress) ^
      const DeepCollectionEquality().hash(firstName) ^
      const DeepCollectionEquality().hash(bankAccountNo) ^
      const DeepCollectionEquality().hash(bankProvince) ^
      const DeepCollectionEquality().hash(bankCity) ^
      const DeepCollectionEquality().hash(bankArea) ^
      const DeepCollectionEquality().hash(bankName);

  @override
  _$BankcardModelCopyWith<_BankcardModel> get copyWith =>
      __$BankcardModelCopyWithImpl<_BankcardModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_BankcardModelToJson(this);
  }
}

abstract class _BankcardModel implements BankcardModel {
  const factory _BankcardModel(
      {@nullable
          bool hasCard,
      @JsonKey(name: 'bankaddress', defaultValue: '')
          String bankAddress,
      @JsonKey(name: 'firstname', defaultValue: '')
          String firstName,
      @JsonKey(name: 'bankaccountno', defaultValue: '')
          String bankAccountNo,
      @JsonKey(name: 'bankprovince', defaultValue: '')
          String bankProvince,
      @JsonKey(name: 'bankcity', defaultValue: '')
          String bankCity,
      @JsonKey(name: 'bankarea', defaultValue: '')
          String bankArea,
      @JsonKey(name: 'bankname', defaultValue: '')
          String bankName}) = _$_BankcardModel;

  factory _BankcardModel.fromJson(Map<String, dynamic> json) =
      _$_BankcardModel.fromJson;

  @override
  @nullable
  bool get hasCard;
  @override
  @JsonKey(name: 'bankaddress', defaultValue: '')
  String get bankAddress;
  @override
  @JsonKey(name: 'firstname', defaultValue: '')
  String get firstName;
  @override
  @JsonKey(name: 'bankaccountno', defaultValue: '')
  String get bankAccountNo;
  @override
  @JsonKey(name: 'bankprovince', defaultValue: '')
  String get bankProvince;
  @override
  @JsonKey(name: 'bankcity', defaultValue: '')
  String get bankCity;
  @override
  @JsonKey(name: 'bankarea', defaultValue: '')
  String get bankArea;
  @override
  @JsonKey(name: 'bankname', defaultValue: '')
  String get bankName;
  @override
  _$BankcardModelCopyWith<_BankcardModel> get copyWith;
}
