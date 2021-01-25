// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'deposit_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$DepositDataFormTearOff {
  const _$DepositDataFormTearOff();

// ignore: unused_element
  _DepositDataForm call(
      {@required int methodId,
      int bankId = -1,
      @required int bankIndex,
      String amount = '-1',
      String gateway = '1',
      int localBank = -1,
      String localBankCard = '',
      String transactionCode = ''}) {
    return _DepositDataForm(
      methodId: methodId,
      bankId: bankId,
      bankIndex: bankIndex,
      amount: amount,
      gateway: gateway,
      localBank: localBank,
      localBankCard: localBankCard,
      transactionCode: transactionCode,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $DepositDataForm = _$DepositDataFormTearOff();

/// @nodoc
mixin _$DepositDataForm {
  int get methodId;
  int get bankId;
  int get bankIndex;
  String get amount;
  String get gateway;
  int get localBank;
  String get localBankCard;
  String get transactionCode;

  $DepositDataFormCopyWith<DepositDataForm> get copyWith;
}

/// @nodoc
abstract class $DepositDataFormCopyWith<$Res> {
  factory $DepositDataFormCopyWith(
          DepositDataForm value, $Res Function(DepositDataForm) then) =
      _$DepositDataFormCopyWithImpl<$Res>;
  $Res call(
      {int methodId,
      int bankId,
      int bankIndex,
      String amount,
      String gateway,
      int localBank,
      String localBankCard,
      String transactionCode});
}

/// @nodoc
class _$DepositDataFormCopyWithImpl<$Res>
    implements $DepositDataFormCopyWith<$Res> {
  _$DepositDataFormCopyWithImpl(this._value, this._then);

  final DepositDataForm _value;
  // ignore: unused_field
  final $Res Function(DepositDataForm) _then;

  @override
  $Res call({
    Object methodId = freezed,
    Object bankId = freezed,
    Object bankIndex = freezed,
    Object amount = freezed,
    Object gateway = freezed,
    Object localBank = freezed,
    Object localBankCard = freezed,
    Object transactionCode = freezed,
  }) {
    return _then(_value.copyWith(
      methodId: methodId == freezed ? _value.methodId : methodId as int,
      bankId: bankId == freezed ? _value.bankId : bankId as int,
      bankIndex: bankIndex == freezed ? _value.bankIndex : bankIndex as int,
      amount: amount == freezed ? _value.amount : amount as String,
      gateway: gateway == freezed ? _value.gateway : gateway as String,
      localBank: localBank == freezed ? _value.localBank : localBank as int,
      localBankCard: localBankCard == freezed
          ? _value.localBankCard
          : localBankCard as String,
      transactionCode: transactionCode == freezed
          ? _value.transactionCode
          : transactionCode as String,
    ));
  }
}

/// @nodoc
abstract class _$DepositDataFormCopyWith<$Res>
    implements $DepositDataFormCopyWith<$Res> {
  factory _$DepositDataFormCopyWith(
          _DepositDataForm value, $Res Function(_DepositDataForm) then) =
      __$DepositDataFormCopyWithImpl<$Res>;
  @override
  $Res call(
      {int methodId,
      int bankId,
      int bankIndex,
      String amount,
      String gateway,
      int localBank,
      String localBankCard,
      String transactionCode});
}

/// @nodoc
class __$DepositDataFormCopyWithImpl<$Res>
    extends _$DepositDataFormCopyWithImpl<$Res>
    implements _$DepositDataFormCopyWith<$Res> {
  __$DepositDataFormCopyWithImpl(
      _DepositDataForm _value, $Res Function(_DepositDataForm) _then)
      : super(_value, (v) => _then(v as _DepositDataForm));

  @override
  _DepositDataForm get _value => super._value as _DepositDataForm;

  @override
  $Res call({
    Object methodId = freezed,
    Object bankId = freezed,
    Object bankIndex = freezed,
    Object amount = freezed,
    Object gateway = freezed,
    Object localBank = freezed,
    Object localBankCard = freezed,
    Object transactionCode = freezed,
  }) {
    return _then(_DepositDataForm(
      methodId: methodId == freezed ? _value.methodId : methodId as int,
      bankId: bankId == freezed ? _value.bankId : bankId as int,
      bankIndex: bankIndex == freezed ? _value.bankIndex : bankIndex as int,
      amount: amount == freezed ? _value.amount : amount as String,
      gateway: gateway == freezed ? _value.gateway : gateway as String,
      localBank: localBank == freezed ? _value.localBank : localBank as int,
      localBankCard: localBankCard == freezed
          ? _value.localBankCard
          : localBankCard as String,
      transactionCode: transactionCode == freezed
          ? _value.transactionCode
          : transactionCode as String,
    ));
  }
}

/// @nodoc
class _$_DepositDataForm implements _DepositDataForm {
  const _$_DepositDataForm(
      {@required this.methodId,
      this.bankId = -1,
      @required this.bankIndex,
      this.amount = '-1',
      this.gateway = '1',
      this.localBank = -1,
      this.localBankCard = '',
      this.transactionCode = ''})
      : assert(methodId != null),
        assert(bankId != null),
        assert(bankIndex != null),
        assert(amount != null),
        assert(gateway != null),
        assert(localBank != null),
        assert(localBankCard != null),
        assert(transactionCode != null);

  @override
  final int methodId;
  @JsonKey(defaultValue: -1)
  @override
  final int bankId;
  @override
  final int bankIndex;
  @JsonKey(defaultValue: '-1')
  @override
  final String amount;
  @JsonKey(defaultValue: '1')
  @override
  final String gateway;
  @JsonKey(defaultValue: -1)
  @override
  final int localBank;
  @JsonKey(defaultValue: '')
  @override
  final String localBankCard;
  @JsonKey(defaultValue: '')
  @override
  final String transactionCode;

  @override
  String toString() {
    return 'DepositDataForm(methodId: $methodId, bankId: $bankId, bankIndex: $bankIndex, amount: $amount, gateway: $gateway, localBank: $localBank, localBankCard: $localBankCard, transactionCode: $transactionCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DepositDataForm &&
            (identical(other.methodId, methodId) ||
                const DeepCollectionEquality()
                    .equals(other.methodId, methodId)) &&
            (identical(other.bankId, bankId) ||
                const DeepCollectionEquality().equals(other.bankId, bankId)) &&
            (identical(other.bankIndex, bankIndex) ||
                const DeepCollectionEquality()
                    .equals(other.bankIndex, bankIndex)) &&
            (identical(other.amount, amount) ||
                const DeepCollectionEquality().equals(other.amount, amount)) &&
            (identical(other.gateway, gateway) ||
                const DeepCollectionEquality()
                    .equals(other.gateway, gateway)) &&
            (identical(other.localBank, localBank) ||
                const DeepCollectionEquality()
                    .equals(other.localBank, localBank)) &&
            (identical(other.localBankCard, localBankCard) ||
                const DeepCollectionEquality()
                    .equals(other.localBankCard, localBankCard)) &&
            (identical(other.transactionCode, transactionCode) ||
                const DeepCollectionEquality()
                    .equals(other.transactionCode, transactionCode)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(methodId) ^
      const DeepCollectionEquality().hash(bankId) ^
      const DeepCollectionEquality().hash(bankIndex) ^
      const DeepCollectionEquality().hash(amount) ^
      const DeepCollectionEquality().hash(gateway) ^
      const DeepCollectionEquality().hash(localBank) ^
      const DeepCollectionEquality().hash(localBankCard) ^
      const DeepCollectionEquality().hash(transactionCode);

  @override
  _$DepositDataFormCopyWith<_DepositDataForm> get copyWith =>
      __$DepositDataFormCopyWithImpl<_DepositDataForm>(this, _$identity);
}

abstract class _DepositDataForm implements DepositDataForm {
  const factory _DepositDataForm(
      {@required int methodId,
      int bankId,
      @required int bankIndex,
      String amount,
      String gateway,
      int localBank,
      String localBankCard,
      String transactionCode}) = _$_DepositDataForm;

  @override
  int get methodId;
  @override
  int get bankId;
  @override
  int get bankIndex;
  @override
  String get amount;
  @override
  String get gateway;
  @override
  int get localBank;
  @override
  String get localBankCard;
  @override
  String get transactionCode;
  @override
  _$DepositDataFormCopyWith<_DepositDataForm> get copyWith;
}
