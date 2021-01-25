// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'transfer_balance_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
TransferBalanceModel _$TransferBalanceModelFromJson(Map<String, dynamic> json) {
  return _TransferBalanceModel.fromJson(json);
}

/// @nodoc
class _$TransferBalanceModelTearOff {
  const _$TransferBalanceModelTearOff();

// ignore: unused_element
  _TransferBalanceModel call({String balance}) {
    return _TransferBalanceModel(
      balance: balance,
    );
  }

// ignore: unused_element
  TransferBalanceModel fromJson(Map<String, Object> json) {
    return TransferBalanceModel.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $TransferBalanceModel = _$TransferBalanceModelTearOff();

/// @nodoc
mixin _$TransferBalanceModel {
  String get balance;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $TransferBalanceModelCopyWith<TransferBalanceModel> get copyWith;
}

/// @nodoc
abstract class $TransferBalanceModelCopyWith<$Res> {
  factory $TransferBalanceModelCopyWith(TransferBalanceModel value,
          $Res Function(TransferBalanceModel) then) =
      _$TransferBalanceModelCopyWithImpl<$Res>;
  $Res call({String balance});
}

/// @nodoc
class _$TransferBalanceModelCopyWithImpl<$Res>
    implements $TransferBalanceModelCopyWith<$Res> {
  _$TransferBalanceModelCopyWithImpl(this._value, this._then);

  final TransferBalanceModel _value;
  // ignore: unused_field
  final $Res Function(TransferBalanceModel) _then;

  @override
  $Res call({
    Object balance = freezed,
  }) {
    return _then(_value.copyWith(
      balance: balance == freezed ? _value.balance : balance as String,
    ));
  }
}

/// @nodoc
abstract class _$TransferBalanceModelCopyWith<$Res>
    implements $TransferBalanceModelCopyWith<$Res> {
  factory _$TransferBalanceModelCopyWith(_TransferBalanceModel value,
          $Res Function(_TransferBalanceModel) then) =
      __$TransferBalanceModelCopyWithImpl<$Res>;
  @override
  $Res call({String balance});
}

/// @nodoc
class __$TransferBalanceModelCopyWithImpl<$Res>
    extends _$TransferBalanceModelCopyWithImpl<$Res>
    implements _$TransferBalanceModelCopyWith<$Res> {
  __$TransferBalanceModelCopyWithImpl(
      _TransferBalanceModel _value, $Res Function(_TransferBalanceModel) _then)
      : super(_value, (v) => _then(v as _TransferBalanceModel));

  @override
  _TransferBalanceModel get _value => super._value as _TransferBalanceModel;

  @override
  $Res call({
    Object balance = freezed,
  }) {
    return _then(_TransferBalanceModel(
      balance: balance == freezed ? _value.balance : balance as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_TransferBalanceModel implements _TransferBalanceModel {
  const _$_TransferBalanceModel({this.balance});

  factory _$_TransferBalanceModel.fromJson(Map<String, dynamic> json) =>
      _$_$_TransferBalanceModelFromJson(json);

  @override
  final String balance;

  @override
  String toString() {
    return 'TransferBalanceModel(balance: $balance)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TransferBalanceModel &&
            (identical(other.balance, balance) ||
                const DeepCollectionEquality().equals(other.balance, balance)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(balance);

  @JsonKey(ignore: true)
  @override
  _$TransferBalanceModelCopyWith<_TransferBalanceModel> get copyWith =>
      __$TransferBalanceModelCopyWithImpl<_TransferBalanceModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_TransferBalanceModelToJson(this);
  }
}

abstract class _TransferBalanceModel implements TransferBalanceModel {
  const factory _TransferBalanceModel({String balance}) =
      _$_TransferBalanceModel;

  factory _TransferBalanceModel.fromJson(Map<String, dynamic> json) =
      _$_TransferBalanceModel.fromJson;

  @override
  String get balance;
  @override
  @JsonKey(ignore: true)
  _$TransferBalanceModelCopyWith<_TransferBalanceModel> get copyWith;
}
