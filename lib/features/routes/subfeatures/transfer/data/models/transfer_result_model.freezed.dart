// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'transfer_result_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$TransferResultModelTearOff {
  const _$TransferResultModelTearOff();

// ignore: unused_element
  _TransferResultModel call(
      {int code,
      String status,
      dynamic data,
      @JsonKey(fromJson: JsonUtil.getRawJson, required: false, defaultValue: '')
          String msg}) {
    return _TransferResultModel(
      code: code,
      status: status,
      data: data,
      msg: msg,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $TransferResultModel = _$TransferResultModelTearOff();

/// @nodoc
mixin _$TransferResultModel {
  int get code;
  String get status;
  dynamic get data;
  @JsonKey(fromJson: JsonUtil.getRawJson, required: false, defaultValue: '')
  String get msg;

  @JsonKey(ignore: true)
  $TransferResultModelCopyWith<TransferResultModel> get copyWith;
}

/// @nodoc
abstract class $TransferResultModelCopyWith<$Res> {
  factory $TransferResultModelCopyWith(
          TransferResultModel value, $Res Function(TransferResultModel) then) =
      _$TransferResultModelCopyWithImpl<$Res>;
  $Res call(
      {int code,
      String status,
      dynamic data,
      @JsonKey(fromJson: JsonUtil.getRawJson, required: false, defaultValue: '')
          String msg});
}

/// @nodoc
class _$TransferResultModelCopyWithImpl<$Res>
    implements $TransferResultModelCopyWith<$Res> {
  _$TransferResultModelCopyWithImpl(this._value, this._then);

  final TransferResultModel _value;
  // ignore: unused_field
  final $Res Function(TransferResultModel) _then;

  @override
  $Res call({
    Object code = freezed,
    Object status = freezed,
    Object data = freezed,
    Object msg = freezed,
  }) {
    return _then(_value.copyWith(
      code: code == freezed ? _value.code : code as int,
      status: status == freezed ? _value.status : status as String,
      data: data == freezed ? _value.data : data as dynamic,
      msg: msg == freezed ? _value.msg : msg as String,
    ));
  }
}

/// @nodoc
abstract class _$TransferResultModelCopyWith<$Res>
    implements $TransferResultModelCopyWith<$Res> {
  factory _$TransferResultModelCopyWith(_TransferResultModel value,
          $Res Function(_TransferResultModel) then) =
      __$TransferResultModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int code,
      String status,
      dynamic data,
      @JsonKey(fromJson: JsonUtil.getRawJson, required: false, defaultValue: '')
          String msg});
}

/// @nodoc
class __$TransferResultModelCopyWithImpl<$Res>
    extends _$TransferResultModelCopyWithImpl<$Res>
    implements _$TransferResultModelCopyWith<$Res> {
  __$TransferResultModelCopyWithImpl(
      _TransferResultModel _value, $Res Function(_TransferResultModel) _then)
      : super(_value, (v) => _then(v as _TransferResultModel));

  @override
  _TransferResultModel get _value => super._value as _TransferResultModel;

  @override
  $Res call({
    Object code = freezed,
    Object status = freezed,
    Object data = freezed,
    Object msg = freezed,
  }) {
    return _then(_TransferResultModel(
      code: code == freezed ? _value.code : code as int,
      status: status == freezed ? _value.status : status as String,
      data: data == freezed ? _value.data : data as dynamic,
      msg: msg == freezed ? _value.msg : msg as String,
    ));
  }
}

/// @nodoc
class _$_TransferResultModel implements _TransferResultModel {
  _$_TransferResultModel(
      {this.code,
      this.status,
      this.data,
      @JsonKey(fromJson: JsonUtil.getRawJson, required: false, defaultValue: '')
          this.msg});

  @override
  final int code;
  @override
  final String status;
  @override
  final dynamic data;
  @override
  @JsonKey(fromJson: JsonUtil.getRawJson, required: false, defaultValue: '')
  final String msg;

  bool _didisSuccess = false;
  bool _isSuccess;

  @override
  bool get isSuccess {
    if (_didisSuccess == false) {
      _didisSuccess = true;
      _isSuccess = (code != null && code == 0) ||
          (status != null && status == 'success');
    }
    return _isSuccess;
  }

  @override
  String toString() {
    return 'TransferResultModel(code: $code, status: $status, data: $data, msg: $msg, isSuccess: $isSuccess)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TransferResultModel &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.msg, msg) ||
                const DeepCollectionEquality().equals(other.msg, msg)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(code) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(msg);

  @JsonKey(ignore: true)
  @override
  _$TransferResultModelCopyWith<_TransferResultModel> get copyWith =>
      __$TransferResultModelCopyWithImpl<_TransferResultModel>(
          this, _$identity);
}

abstract class _TransferResultModel implements TransferResultModel {
  factory _TransferResultModel(
      {int code,
      String status,
      dynamic data,
      @JsonKey(fromJson: JsonUtil.getRawJson, required: false, defaultValue: '')
          String msg}) = _$_TransferResultModel;

  @override
  int get code;
  @override
  String get status;
  @override
  dynamic get data;
  @override
  @JsonKey(fromJson: JsonUtil.getRawJson, required: false, defaultValue: '')
  String get msg;
  @override
  @JsonKey(ignore: true)
  _$TransferResultModelCopyWith<_TransferResultModel> get copyWith;
}
