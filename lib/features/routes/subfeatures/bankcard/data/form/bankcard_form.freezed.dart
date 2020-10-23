// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'bankcard_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$BankcardFormTearOff {
  const _$BankcardFormTearOff();

// ignore: unused_element
  _BankcardForm call(
      {@required @JsonKey(name: 'bankname') String owner,
      @required @JsonKey(name: 'bankindex') String bankId,
      @required @JsonKey(name: 'bankaccno') String card,
      @required @JsonKey(name: 'bankaddress') String branch,
      @required @JsonKey(name: 'bankprovince') String province,
      @required @JsonKey(name: 'bankcity') String area}) {
    return _BankcardForm(
      owner: owner,
      bankId: bankId,
      card: card,
      branch: branch,
      province: province,
      area: area,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $BankcardForm = _$BankcardFormTearOff();

/// @nodoc
mixin _$BankcardForm {
  @JsonKey(name: 'bankname')
  String get owner;
  @JsonKey(name: 'bankindex')
  String get bankId;
  @JsonKey(name: 'bankaccno')
  String get card;
  @JsonKey(name: 'bankaddress')
  String get branch;
  @JsonKey(name: 'bankprovince')
  String get province;
  @JsonKey(name: 'bankcity')
  String get area;

  $BankcardFormCopyWith<BankcardForm> get copyWith;
}

/// @nodoc
abstract class $BankcardFormCopyWith<$Res> {
  factory $BankcardFormCopyWith(
          BankcardForm value, $Res Function(BankcardForm) then) =
      _$BankcardFormCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'bankname') String owner,
      @JsonKey(name: 'bankindex') String bankId,
      @JsonKey(name: 'bankaccno') String card,
      @JsonKey(name: 'bankaddress') String branch,
      @JsonKey(name: 'bankprovince') String province,
      @JsonKey(name: 'bankcity') String area});
}

/// @nodoc
class _$BankcardFormCopyWithImpl<$Res> implements $BankcardFormCopyWith<$Res> {
  _$BankcardFormCopyWithImpl(this._value, this._then);

  final BankcardForm _value;
  // ignore: unused_field
  final $Res Function(BankcardForm) _then;

  @override
  $Res call({
    Object owner = freezed,
    Object bankId = freezed,
    Object card = freezed,
    Object branch = freezed,
    Object province = freezed,
    Object area = freezed,
  }) {
    return _then(_value.copyWith(
      owner: owner == freezed ? _value.owner : owner as String,
      bankId: bankId == freezed ? _value.bankId : bankId as String,
      card: card == freezed ? _value.card : card as String,
      branch: branch == freezed ? _value.branch : branch as String,
      province: province == freezed ? _value.province : province as String,
      area: area == freezed ? _value.area : area as String,
    ));
  }
}

/// @nodoc
abstract class _$BankcardFormCopyWith<$Res>
    implements $BankcardFormCopyWith<$Res> {
  factory _$BankcardFormCopyWith(
          _BankcardForm value, $Res Function(_BankcardForm) then) =
      __$BankcardFormCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'bankname') String owner,
      @JsonKey(name: 'bankindex') String bankId,
      @JsonKey(name: 'bankaccno') String card,
      @JsonKey(name: 'bankaddress') String branch,
      @JsonKey(name: 'bankprovince') String province,
      @JsonKey(name: 'bankcity') String area});
}

/// @nodoc
class __$BankcardFormCopyWithImpl<$Res> extends _$BankcardFormCopyWithImpl<$Res>
    implements _$BankcardFormCopyWith<$Res> {
  __$BankcardFormCopyWithImpl(
      _BankcardForm _value, $Res Function(_BankcardForm) _then)
      : super(_value, (v) => _then(v as _BankcardForm));

  @override
  _BankcardForm get _value => super._value as _BankcardForm;

  @override
  $Res call({
    Object owner = freezed,
    Object bankId = freezed,
    Object card = freezed,
    Object branch = freezed,
    Object province = freezed,
    Object area = freezed,
  }) {
    return _then(_BankcardForm(
      owner: owner == freezed ? _value.owner : owner as String,
      bankId: bankId == freezed ? _value.bankId : bankId as String,
      card: card == freezed ? _value.card : card as String,
      branch: branch == freezed ? _value.branch : branch as String,
      province: province == freezed ? _value.province : province as String,
      area: area == freezed ? _value.area : area as String,
    ));
  }
}

/// @nodoc
class _$_BankcardForm implements _BankcardForm {
  const _$_BankcardForm(
      {@required @JsonKey(name: 'bankname') this.owner,
      @required @JsonKey(name: 'bankindex') this.bankId,
      @required @JsonKey(name: 'bankaccno') this.card,
      @required @JsonKey(name: 'bankaddress') this.branch,
      @required @JsonKey(name: 'bankprovince') this.province,
      @required @JsonKey(name: 'bankcity') this.area})
      : assert(owner != null),
        assert(bankId != null),
        assert(card != null),
        assert(branch != null),
        assert(province != null),
        assert(area != null);

  @override
  @JsonKey(name: 'bankname')
  final String owner;
  @override
  @JsonKey(name: 'bankindex')
  final String bankId;
  @override
  @JsonKey(name: 'bankaccno')
  final String card;
  @override
  @JsonKey(name: 'bankaddress')
  final String branch;
  @override
  @JsonKey(name: 'bankprovince')
  final String province;
  @override
  @JsonKey(name: 'bankcity')
  final String area;

  @override
  String toString() {
    return 'BankcardForm(owner: $owner, bankId: $bankId, card: $card, branch: $branch, province: $province, area: $area)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BankcardForm &&
            (identical(other.owner, owner) ||
                const DeepCollectionEquality().equals(other.owner, owner)) &&
            (identical(other.bankId, bankId) ||
                const DeepCollectionEquality().equals(other.bankId, bankId)) &&
            (identical(other.card, card) ||
                const DeepCollectionEquality().equals(other.card, card)) &&
            (identical(other.branch, branch) ||
                const DeepCollectionEquality().equals(other.branch, branch)) &&
            (identical(other.province, province) ||
                const DeepCollectionEquality()
                    .equals(other.province, province)) &&
            (identical(other.area, area) ||
                const DeepCollectionEquality().equals(other.area, area)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(owner) ^
      const DeepCollectionEquality().hash(bankId) ^
      const DeepCollectionEquality().hash(card) ^
      const DeepCollectionEquality().hash(branch) ^
      const DeepCollectionEquality().hash(province) ^
      const DeepCollectionEquality().hash(area);

  @override
  _$BankcardFormCopyWith<_BankcardForm> get copyWith =>
      __$BankcardFormCopyWithImpl<_BankcardForm>(this, _$identity);
}

abstract class _BankcardForm implements BankcardForm {
  const factory _BankcardForm(
      {@required @JsonKey(name: 'bankname') String owner,
      @required @JsonKey(name: 'bankindex') String bankId,
      @required @JsonKey(name: 'bankaccno') String card,
      @required @JsonKey(name: 'bankaddress') String branch,
      @required @JsonKey(name: 'bankprovince') String province,
      @required @JsonKey(name: 'bankcity') String area}) = _$_BankcardForm;

  @override
  @JsonKey(name: 'bankname')
  String get owner;
  @override
  @JsonKey(name: 'bankindex')
  String get bankId;
  @override
  @JsonKey(name: 'bankaccno')
  String get card;
  @override
  @JsonKey(name: 'bankaddress')
  String get branch;
  @override
  @JsonKey(name: 'bankprovince')
  String get province;
  @override
  @JsonKey(name: 'bankcity')
  String get area;
  @override
  _$BankcardFormCopyWith<_BankcardForm> get copyWith;
}
