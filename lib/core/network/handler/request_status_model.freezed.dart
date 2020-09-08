// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'request_status_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$RequestStatusModelTearOff {
  const _$RequestStatusModelTearOff();

// ignore: unused_element
  _RequestStatusModel call(
      {@required String status,
      @JsonKey(fromJson: JsonUtil.getRawJson, required: false) String msg}) {
    return _RequestStatusModel(
      status: status,
      msg: msg,
    );
  }
}

// ignore: unused_element
const $RequestStatusModel = _$RequestStatusModelTearOff();

mixin _$RequestStatusModel {
  String get status;
  @JsonKey(fromJson: JsonUtil.getRawJson, required: false)
  String get msg;

  $RequestStatusModelCopyWith<RequestStatusModel> get copyWith;
}

abstract class $RequestStatusModelCopyWith<$Res> {
  factory $RequestStatusModelCopyWith(
          RequestStatusModel value, $Res Function(RequestStatusModel) then) =
      _$RequestStatusModelCopyWithImpl<$Res>;
  $Res call(
      {String status,
      @JsonKey(fromJson: JsonUtil.getRawJson, required: false) String msg});
}

class _$RequestStatusModelCopyWithImpl<$Res>
    implements $RequestStatusModelCopyWith<$Res> {
  _$RequestStatusModelCopyWithImpl(this._value, this._then);

  final RequestStatusModel _value;
  // ignore: unused_field
  final $Res Function(RequestStatusModel) _then;

  @override
  $Res call({
    Object status = freezed,
    Object msg = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed ? _value.status : status as String,
      msg: msg == freezed ? _value.msg : msg as String,
    ));
  }
}

abstract class _$RequestStatusModelCopyWith<$Res>
    implements $RequestStatusModelCopyWith<$Res> {
  factory _$RequestStatusModelCopyWith(
          _RequestStatusModel value, $Res Function(_RequestStatusModel) then) =
      __$RequestStatusModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String status,
      @JsonKey(fromJson: JsonUtil.getRawJson, required: false) String msg});
}

class __$RequestStatusModelCopyWithImpl<$Res>
    extends _$RequestStatusModelCopyWithImpl<$Res>
    implements _$RequestStatusModelCopyWith<$Res> {
  __$RequestStatusModelCopyWithImpl(
      _RequestStatusModel _value, $Res Function(_RequestStatusModel) _then)
      : super(_value, (v) => _then(v as _RequestStatusModel));

  @override
  _RequestStatusModel get _value => super._value as _RequestStatusModel;

  @override
  $Res call({
    Object status = freezed,
    Object msg = freezed,
  }) {
    return _then(_RequestStatusModel(
      status: status == freezed ? _value.status : status as String,
      msg: msg == freezed ? _value.msg : msg as String,
    ));
  }
}

class _$_RequestStatusModel implements _RequestStatusModel {
  _$_RequestStatusModel(
      {@required this.status,
      @JsonKey(fromJson: JsonUtil.getRawJson, required: false) this.msg})
      : assert(status != null);

  @override
  final String status;
  @override
  @JsonKey(fromJson: JsonUtil.getRawJson, required: false)
  final String msg;

  bool _didisSuccess = false;
  bool _isSuccess;

  @override
  bool get isSuccess {
    if (_didisSuccess == false) {
      _didisSuccess = true;
      _isSuccess = status == 'success';
    }
    return _isSuccess;
  }

  @override
  String toString() {
    return 'RequestStatusModel(status: $status, msg: $msg, isSuccess: $isSuccess)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RequestStatusModel &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.msg, msg) ||
                const DeepCollectionEquality().equals(other.msg, msg)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(msg);

  @override
  _$RequestStatusModelCopyWith<_RequestStatusModel> get copyWith =>
      __$RequestStatusModelCopyWithImpl<_RequestStatusModel>(this, _$identity);
}

abstract class _RequestStatusModel implements RequestStatusModel {
  factory _RequestStatusModel(
      {@required
          String status,
      @JsonKey(fromJson: JsonUtil.getRawJson, required: false)
          String msg}) = _$_RequestStatusModel;

  @override
  String get status;
  @override
  @JsonKey(fromJson: JsonUtil.getRawJson, required: false)
  String get msg;
  @override
  _$RequestStatusModelCopyWith<_RequestStatusModel> get copyWith;
}

class _$DataRequestResultTearOff {
  const _$DataRequestResultTearOff();

// ignore: unused_element
  _DataRequestResult call({dynamic data, RequestStatusModel failedData}) {
    return _DataRequestResult(
      data: data,
      failedData: failedData,
    );
  }
}

// ignore: unused_element
const $DataRequestResult = _$DataRequestResultTearOff();

mixin _$DataRequestResult {
  dynamic get data;
  RequestStatusModel get failedData;

  $DataRequestResultCopyWith<DataRequestResult> get copyWith;
}

abstract class $DataRequestResultCopyWith<$Res> {
  factory $DataRequestResultCopyWith(
          DataRequestResult value, $Res Function(DataRequestResult) then) =
      _$DataRequestResultCopyWithImpl<$Res>;
  $Res call({dynamic data, RequestStatusModel failedData});

  $RequestStatusModelCopyWith<$Res> get failedData;
}

class _$DataRequestResultCopyWithImpl<$Res>
    implements $DataRequestResultCopyWith<$Res> {
  _$DataRequestResultCopyWithImpl(this._value, this._then);

  final DataRequestResult _value;
  // ignore: unused_field
  final $Res Function(DataRequestResult) _then;

  @override
  $Res call({
    Object data = freezed,
    Object failedData = freezed,
  }) {
    return _then(_value.copyWith(
      data: data == freezed ? _value.data : data as dynamic,
      failedData: failedData == freezed
          ? _value.failedData
          : failedData as RequestStatusModel,
    ));
  }

  @override
  $RequestStatusModelCopyWith<$Res> get failedData {
    if (_value.failedData == null) {
      return null;
    }
    return $RequestStatusModelCopyWith<$Res>(_value.failedData, (value) {
      return _then(_value.copyWith(failedData: value));
    });
  }
}

abstract class _$DataRequestResultCopyWith<$Res>
    implements $DataRequestResultCopyWith<$Res> {
  factory _$DataRequestResultCopyWith(
          _DataRequestResult value, $Res Function(_DataRequestResult) then) =
      __$DataRequestResultCopyWithImpl<$Res>;
  @override
  $Res call({dynamic data, RequestStatusModel failedData});

  @override
  $RequestStatusModelCopyWith<$Res> get failedData;
}

class __$DataRequestResultCopyWithImpl<$Res>
    extends _$DataRequestResultCopyWithImpl<$Res>
    implements _$DataRequestResultCopyWith<$Res> {
  __$DataRequestResultCopyWithImpl(
      _DataRequestResult _value, $Res Function(_DataRequestResult) _then)
      : super(_value, (v) => _then(v as _DataRequestResult));

  @override
  _DataRequestResult get _value => super._value as _DataRequestResult;

  @override
  $Res call({
    Object data = freezed,
    Object failedData = freezed,
  }) {
    return _then(_DataRequestResult(
      data: data == freezed ? _value.data : data as dynamic,
      failedData: failedData == freezed
          ? _value.failedData
          : failedData as RequestStatusModel,
    ));
  }
}

class _$_DataRequestResult implements _DataRequestResult {
  const _$_DataRequestResult({this.data, this.failedData});

  @override
  final dynamic data;
  @override
  final RequestStatusModel failedData;

  @override
  String toString() {
    return 'DataRequestResult(data: $data, failedData: $failedData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DataRequestResult &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.failedData, failedData) ||
                const DeepCollectionEquality()
                    .equals(other.failedData, failedData)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(failedData);

  @override
  _$DataRequestResultCopyWith<_DataRequestResult> get copyWith =>
      __$DataRequestResultCopyWithImpl<_DataRequestResult>(this, _$identity);
}

abstract class _DataRequestResult implements DataRequestResult {
  const factory _DataRequestResult(
      {dynamic data, RequestStatusModel failedData}) = _$_DataRequestResult;

  @override
  dynamic get data;
  @override
  RequestStatusModel get failedData;
  @override
  _$DataRequestResultCopyWith<_DataRequestResult> get copyWith;
}
