// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'request_code_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$RequestCodeModelTearOff {
  const _$RequestCodeModelTearOff();

// ignore: unused_element
  _RequestCodeModel call({int code, dynamic data, String msg}) {
    return _RequestCodeModel(
      code: code,
      data: data,
      msg: msg,
    );
  }
}

// ignore: unused_element
const $RequestCodeModel = _$RequestCodeModelTearOff();

mixin _$RequestCodeModel {
  int get code;
  dynamic get data;
  String get msg;

  $RequestCodeModelCopyWith<RequestCodeModel> get copyWith;
}

abstract class $RequestCodeModelCopyWith<$Res> {
  factory $RequestCodeModelCopyWith(
          RequestCodeModel value, $Res Function(RequestCodeModel) then) =
      _$RequestCodeModelCopyWithImpl<$Res>;
  $Res call({int code, dynamic data, String msg});
}

class _$RequestCodeModelCopyWithImpl<$Res>
    implements $RequestCodeModelCopyWith<$Res> {
  _$RequestCodeModelCopyWithImpl(this._value, this._then);

  final RequestCodeModel _value;
  // ignore: unused_field
  final $Res Function(RequestCodeModel) _then;

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

abstract class _$RequestCodeModelCopyWith<$Res>
    implements $RequestCodeModelCopyWith<$Res> {
  factory _$RequestCodeModelCopyWith(
          _RequestCodeModel value, $Res Function(_RequestCodeModel) then) =
      __$RequestCodeModelCopyWithImpl<$Res>;
  @override
  $Res call({int code, dynamic data, String msg});
}

class __$RequestCodeModelCopyWithImpl<$Res>
    extends _$RequestCodeModelCopyWithImpl<$Res>
    implements _$RequestCodeModelCopyWith<$Res> {
  __$RequestCodeModelCopyWithImpl(
      _RequestCodeModel _value, $Res Function(_RequestCodeModel) _then)
      : super(_value, (v) => _then(v as _RequestCodeModel));

  @override
  _RequestCodeModel get _value => super._value as _RequestCodeModel;

  @override
  $Res call({
    Object code = freezed,
    Object data = freezed,
    Object msg = freezed,
  }) {
    return _then(_RequestCodeModel(
      code: code == freezed ? _value.code : code as int,
      data: data == freezed ? _value.data : data as dynamic,
      msg: msg == freezed ? _value.msg : msg as String,
    ));
  }
}

class _$_RequestCodeModel implements _RequestCodeModel {
  _$_RequestCodeModel({this.code, this.data, this.msg});

  @override
  final int code;
  @override
  final dynamic data;
  @override
  final String msg;

  bool _didisSuccess = false;
  bool _isSuccess;

  @override
  bool get isSuccess {
    if (_didisSuccess == false) {
      _didisSuccess = true;
      _isSuccess = code == 0;
    }
    return _isSuccess;
  }

  @override
  String toString() {
    return 'RequestCodeModel(code: $code, data: $data, msg: $msg, isSuccess: $isSuccess)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RequestCodeModel &&
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
  _$RequestCodeModelCopyWith<_RequestCodeModel> get copyWith =>
      __$RequestCodeModelCopyWithImpl<_RequestCodeModel>(this, _$identity);
}

abstract class _RequestCodeModel implements RequestCodeModel {
  factory _RequestCodeModel({int code, dynamic data, String msg}) =
      _$_RequestCodeModel;

  @override
  int get code;
  @override
  dynamic get data;
  @override
  String get msg;
  @override
  _$RequestCodeModelCopyWith<_RequestCodeModel> get copyWith;
}
