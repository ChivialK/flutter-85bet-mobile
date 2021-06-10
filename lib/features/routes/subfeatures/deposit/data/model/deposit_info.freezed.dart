// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'deposit_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$DepositInfoTearOff {
  const _$DepositInfoTearOff();

// ignore: unused_element
  _DepositInfo call(
      {@JsonKey(name: 'accountname') String accountName,
      @JsonKey(name: 'bankaccountid') int bankAccountId,
      @JsonKey(name: 'bankaccountname') String bankAccountName,
      @JsonKey(name: 'bankaccountno') String bankAccountNo,
      @JsonKey(name: 'bankcode') String bankCode,
      bool hasBankInfo}) {
    return _DepositInfo(
      accountName: accountName,
      bankAccountId: bankAccountId,
      bankAccountName: bankAccountName,
      bankAccountNo: bankAccountNo,
      bankCode: bankCode,
      hasBankInfo: hasBankInfo,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $DepositInfo = _$DepositInfoTearOff();

/// @nodoc
mixin _$DepositInfo {
  @JsonKey(name: 'accountname')
  String get accountName;
  @JsonKey(name: 'bankaccountid')
  int get bankAccountId;
  @JsonKey(name: 'bankaccountname')
  String get bankAccountName;
  @JsonKey(name: 'bankaccountno')
  String get bankAccountNo;
  @JsonKey(name: 'bankcode')
  String get bankCode;
  bool get hasBankInfo;

  $DepositInfoCopyWith<DepositInfo> get copyWith;
}

/// @nodoc
abstract class $DepositInfoCopyWith<$Res> {
  factory $DepositInfoCopyWith(
          DepositInfo value, $Res Function(DepositInfo) then) =
      _$DepositInfoCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'accountname') String accountName,
      @JsonKey(name: 'bankaccountid') int bankAccountId,
      @JsonKey(name: 'bankaccountname') String bankAccountName,
      @JsonKey(name: 'bankaccountno') String bankAccountNo,
      @JsonKey(name: 'bankcode') String bankCode,
      bool hasBankInfo});
}

/// @nodoc
class _$DepositInfoCopyWithImpl<$Res> implements $DepositInfoCopyWith<$Res> {
  _$DepositInfoCopyWithImpl(this._value, this._then);

  final DepositInfo _value;
  // ignore: unused_field
  final $Res Function(DepositInfo) _then;

  @override
  $Res call({
    Object accountName = freezed,
    Object bankAccountId = freezed,
    Object bankAccountName = freezed,
    Object bankAccountNo = freezed,
    Object bankCode = freezed,
    Object hasBankInfo = freezed,
  }) {
    return _then(_value.copyWith(
      accountName:
          accountName == freezed ? _value.accountName : accountName as String,
      bankAccountId: bankAccountId == freezed
          ? _value.bankAccountId
          : bankAccountId as int,
      bankAccountName: bankAccountName == freezed
          ? _value.bankAccountName
          : bankAccountName as String,
      bankAccountNo: bankAccountNo == freezed
          ? _value.bankAccountNo
          : bankAccountNo as String,
      bankCode: bankCode == freezed ? _value.bankCode : bankCode as String,
      hasBankInfo:
          hasBankInfo == freezed ? _value.hasBankInfo : hasBankInfo as bool,
    ));
  }
}

/// @nodoc
abstract class _$DepositInfoCopyWith<$Res>
    implements $DepositInfoCopyWith<$Res> {
  factory _$DepositInfoCopyWith(
          _DepositInfo value, $Res Function(_DepositInfo) then) =
      __$DepositInfoCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'accountname') String accountName,
      @JsonKey(name: 'bankaccountid') int bankAccountId,
      @JsonKey(name: 'bankaccountname') String bankAccountName,
      @JsonKey(name: 'bankaccountno') String bankAccountNo,
      @JsonKey(name: 'bankcode') String bankCode,
      bool hasBankInfo});
}

/// @nodoc
class __$DepositInfoCopyWithImpl<$Res> extends _$DepositInfoCopyWithImpl<$Res>
    implements _$DepositInfoCopyWith<$Res> {
  __$DepositInfoCopyWithImpl(
      _DepositInfo _value, $Res Function(_DepositInfo) _then)
      : super(_value, (v) => _then(v as _DepositInfo));

  @override
  _DepositInfo get _value => super._value as _DepositInfo;

  @override
  $Res call({
    Object accountName = freezed,
    Object bankAccountId = freezed,
    Object bankAccountName = freezed,
    Object bankAccountNo = freezed,
    Object bankCode = freezed,
    Object hasBankInfo = freezed,
  }) {
    return _then(_DepositInfo(
      accountName:
          accountName == freezed ? _value.accountName : accountName as String,
      bankAccountId: bankAccountId == freezed
          ? _value.bankAccountId
          : bankAccountId as int,
      bankAccountName: bankAccountName == freezed
          ? _value.bankAccountName
          : bankAccountName as String,
      bankAccountNo: bankAccountNo == freezed
          ? _value.bankAccountNo
          : bankAccountNo as String,
      bankCode: bankCode == freezed ? _value.bankCode : bankCode as String,
      hasBankInfo:
          hasBankInfo == freezed ? _value.hasBankInfo : hasBankInfo as bool,
    ));
  }
}

/// @nodoc
class _$_DepositInfo implements _DepositInfo {
  const _$_DepositInfo(
      {@JsonKey(name: 'accountname') this.accountName,
      @JsonKey(name: 'bankaccountid') this.bankAccountId,
      @JsonKey(name: 'bankaccountname') this.bankAccountName,
      @JsonKey(name: 'bankaccountno') this.bankAccountNo,
      @JsonKey(name: 'bankcode') this.bankCode,
      this.hasBankInfo});

  @override
  @JsonKey(name: 'accountname')
  final String accountName;
  @override
  @JsonKey(name: 'bankaccountid')
  final int bankAccountId;
  @override
  @JsonKey(name: 'bankaccountname')
  final String bankAccountName;
  @override
  @JsonKey(name: 'bankaccountno')
  final String bankAccountNo;
  @override
  @JsonKey(name: 'bankcode')
  final String bankCode;
  @override
  final bool hasBankInfo;

  @override
  String toString() {
    return 'DepositInfo(accountName: $accountName, bankAccountId: $bankAccountId, bankAccountName: $bankAccountName, bankAccountNo: $bankAccountNo, bankCode: $bankCode, hasBankInfo: $hasBankInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DepositInfo &&
            (identical(other.accountName, accountName) ||
                const DeepCollectionEquality()
                    .equals(other.accountName, accountName)) &&
            (identical(other.bankAccountId, bankAccountId) ||
                const DeepCollectionEquality()
                    .equals(other.bankAccountId, bankAccountId)) &&
            (identical(other.bankAccountName, bankAccountName) ||
                const DeepCollectionEquality()
                    .equals(other.bankAccountName, bankAccountName)) &&
            (identical(other.bankAccountNo, bankAccountNo) ||
                const DeepCollectionEquality()
                    .equals(other.bankAccountNo, bankAccountNo)) &&
            (identical(other.bankCode, bankCode) ||
                const DeepCollectionEquality()
                    .equals(other.bankCode, bankCode)) &&
            (identical(other.hasBankInfo, hasBankInfo) ||
                const DeepCollectionEquality()
                    .equals(other.hasBankInfo, hasBankInfo)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(accountName) ^
      const DeepCollectionEquality().hash(bankAccountId) ^
      const DeepCollectionEquality().hash(bankAccountName) ^
      const DeepCollectionEquality().hash(bankAccountNo) ^
      const DeepCollectionEquality().hash(bankCode) ^
      const DeepCollectionEquality().hash(hasBankInfo);

  @override
  _$DepositInfoCopyWith<_DepositInfo> get copyWith =>
      __$DepositInfoCopyWithImpl<_DepositInfo>(this, _$identity);
}

abstract class _DepositInfo implements DepositInfo {
  const factory _DepositInfo(
      {@JsonKey(name: 'accountname') String accountName,
      @JsonKey(name: 'bankaccountid') int bankAccountId,
      @JsonKey(name: 'bankaccountname') String bankAccountName,
      @JsonKey(name: 'bankaccountno') String bankAccountNo,
      @JsonKey(name: 'bankcode') String bankCode,
      bool hasBankInfo}) = _$_DepositInfo;

  @override
  @JsonKey(name: 'accountname')
  String get accountName;
  @override
  @JsonKey(name: 'bankaccountid')
  int get bankAccountId;
  @override
  @JsonKey(name: 'bankaccountname')
  String get bankAccountName;
  @override
  @JsonKey(name: 'bankaccountno')
  String get bankAccountNo;
  @override
  @JsonKey(name: 'bankcode')
  String get bankCode;
  @override
  bool get hasBankInfo;
  @override
  _$DepositInfoCopyWith<_DepositInfo> get copyWith;
}
