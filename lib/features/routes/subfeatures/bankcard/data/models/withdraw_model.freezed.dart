// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'withdraw_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$WithdrawModelTearOff {
  const _$WithdrawModelTearOff();

// ignore: unused_element
  _WithdrawModel call({int code, dynamic data, String msg}) {
    return _WithdrawModel(
      code: code,
      data: data,
      msg: msg,
    );
  }
}

// ignore: unused_element
const $WithdrawModel = _$WithdrawModelTearOff();

mixin _$WithdrawModel {
  int get code;
  dynamic get data;
  String get msg;

  $WithdrawModelCopyWith<WithdrawModel> get copyWith;
}

abstract class $WithdrawModelCopyWith<$Res> {
  factory $WithdrawModelCopyWith(
          WithdrawModel value, $Res Function(WithdrawModel) then) =
      _$WithdrawModelCopyWithImpl<$Res>;
  $Res call({int code, dynamic data, String msg});
}

class _$WithdrawModelCopyWithImpl<$Res>
    implements $WithdrawModelCopyWith<$Res> {
  _$WithdrawModelCopyWithImpl(this._value, this._then);

  final WithdrawModel _value;
  // ignore: unused_field
  final $Res Function(WithdrawModel) _then;

  @override
  $Res call({
    Object code = freezed,
    Object data = freezed,
    Object msg = freezed,
  }) {
    return _then(_value.copyWith(
      code: code == freezed ? _value.code : code as int,
      data: data == freezed ? _value.data : data as dynamic,
      msg: msg == freezed ? _value.msg : msg as String,
    ));
  }
}

abstract class _$WithdrawModelCopyWith<$Res>
    implements $WithdrawModelCopyWith<$Res> {
  factory _$WithdrawModelCopyWith(
          _WithdrawModel value, $Res Function(_WithdrawModel) then) =
      __$WithdrawModelCopyWithImpl<$Res>;
  @override
  $Res call({int code, dynamic data, String msg});
}

class __$WithdrawModelCopyWithImpl<$Res>
    extends _$WithdrawModelCopyWithImpl<$Res>
    implements _$WithdrawModelCopyWith<$Res> {
  __$WithdrawModelCopyWithImpl(
      _WithdrawModel _value, $Res Function(_WithdrawModel) _then)
      : super(_value, (v) => _then(v as _WithdrawModel));

  @override
  _WithdrawModel get _value => super._value as _WithdrawModel;

  @override
  $Res call({
    Object code = freezed,
    Object data = freezed,
    Object msg = freezed,
  }) {
    return _then(_WithdrawModel(
      code: code == freezed ? _value.code : code as int,
      data: data == freezed ? _value.data : data as dynamic,
      msg: msg == freezed ? _value.msg : msg as String,
    ));
  }
}

class _$_WithdrawModel implements _WithdrawModel {
  const _$_WithdrawModel({this.code, this.data, this.msg});

  @override
  final int code;
  @override
  final dynamic data;
  @override
  final String msg;

  @override
  String toString() {
    return 'WithdrawModel(code: $code, data: $data, msg: $msg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _WithdrawModel &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)) &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.msg, msg) ||
                const DeepCollectionEquality().equals(other.msg, msg)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(code) ^
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(msg);

  @override
  _$WithdrawModelCopyWith<_WithdrawModel> get copyWith =>
      __$WithdrawModelCopyWithImpl<_WithdrawModel>(this, _$identity);
}

abstract class _WithdrawModel implements WithdrawModel {
  const factory _WithdrawModel({int code, dynamic data, String msg}) =
      _$_WithdrawModel;

  @override
  int get code;
  @override
  dynamic get data;
  @override
  String get msg;
  @override
  _$WithdrawModelCopyWith<_WithdrawModel> get copyWith;
}
