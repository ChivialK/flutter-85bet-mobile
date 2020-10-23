// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'withdraw_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$WithdrawFormTearOff {
  const _$WithdrawFormTearOff();

// ignore: unused_element
  _WithdrawForm call(
      {@required String amount,
      @required String password,
      @required String type}) {
    return _WithdrawForm(
      amount: amount,
      password: password,
      type: type,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $WithdrawForm = _$WithdrawFormTearOff();

/// @nodoc
mixin _$WithdrawForm {
  String get amount;
  String get password;
  String get type;

  $WithdrawFormCopyWith<WithdrawForm> get copyWith;
}

/// @nodoc
abstract class $WithdrawFormCopyWith<$Res> {
  factory $WithdrawFormCopyWith(
          WithdrawForm value, $Res Function(WithdrawForm) then) =
      _$WithdrawFormCopyWithImpl<$Res>;
  $Res call({String amount, String password, String type});
}

/// @nodoc
class _$WithdrawFormCopyWithImpl<$Res> implements $WithdrawFormCopyWith<$Res> {
  _$WithdrawFormCopyWithImpl(this._value, this._then);

  final WithdrawForm _value;
  // ignore: unused_field
  final $Res Function(WithdrawForm) _then;

  @override
  $Res call({
    Object amount = freezed,
    Object password = freezed,
    Object type = freezed,
  }) {
    return _then(_value.copyWith(
      amount: amount == freezed ? _value.amount : amount as String,
      password: password == freezed ? _value.password : password as String,
      type: type == freezed ? _value.type : type as String,
    ));
  }
}

/// @nodoc
abstract class _$WithdrawFormCopyWith<$Res>
    implements $WithdrawFormCopyWith<$Res> {
  factory _$WithdrawFormCopyWith(
          _WithdrawForm value, $Res Function(_WithdrawForm) then) =
      __$WithdrawFormCopyWithImpl<$Res>;
  @override
  $Res call({String amount, String password, String type});
}

/// @nodoc
class __$WithdrawFormCopyWithImpl<$Res> extends _$WithdrawFormCopyWithImpl<$Res>
    implements _$WithdrawFormCopyWith<$Res> {
  __$WithdrawFormCopyWithImpl(
      _WithdrawForm _value, $Res Function(_WithdrawForm) _then)
      : super(_value, (v) => _then(v as _WithdrawForm));

  @override
  _WithdrawForm get _value => super._value as _WithdrawForm;

  @override
  $Res call({
    Object amount = freezed,
    Object password = freezed,
    Object type = freezed,
  }) {
    return _then(_WithdrawForm(
      amount: amount == freezed ? _value.amount : amount as String,
      password: password == freezed ? _value.password : password as String,
      type: type == freezed ? _value.type : type as String,
    ));
  }
}

/// @nodoc
class _$_WithdrawForm implements _WithdrawForm {
  const _$_WithdrawForm(
      {@required this.amount, @required this.password, @required this.type})
      : assert(amount != null),
        assert(password != null),
        assert(type != null);

  @override
  final String amount;
  @override
  final String password;
  @override
  final String type;

  @override
  String toString() {
    return 'WithdrawForm(amount: $amount, password: $password, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _WithdrawForm &&
            (identical(other.amount, amount) ||
                const DeepCollectionEquality().equals(other.amount, amount)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(amount) ^
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(type);

  @override
  _$WithdrawFormCopyWith<_WithdrawForm> get copyWith =>
      __$WithdrawFormCopyWithImpl<_WithdrawForm>(this, _$identity);
}

abstract class _WithdrawForm implements WithdrawForm {
  const factory _WithdrawForm(
      {@required String amount,
      @required String password,
      @required String type}) = _$_WithdrawForm;

  @override
  String get amount;
  @override
  String get password;
  @override
  String get type;
  @override
  _$WithdrawFormCopyWith<_WithdrawForm> get copyWith;
}
