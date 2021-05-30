// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'captcha_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$CaptchaModelTearOff {
  const _$CaptchaModelTearOff();

// ignore: unused_element
  _CaptchaModel call(
      {@JsonKey(name: 'status_code')
          String statusCode,
      @required
          String message,
      @JsonKey(name: 'url', nullable: true, fromJson: decodeCaptchaData)
          CaptchaData data}) {
    return _CaptchaModel(
      statusCode: statusCode,
      message: message,
      data: data,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $CaptchaModel = _$CaptchaModelTearOff();

/// @nodoc
mixin _$CaptchaModel {
  @JsonKey(name: 'status_code')
  String get statusCode;
  String get message;
  @JsonKey(name: 'url', nullable: true, fromJson: decodeCaptchaData)
  CaptchaData get data;

  $CaptchaModelCopyWith<CaptchaModel> get copyWith;
}

/// @nodoc
abstract class $CaptchaModelCopyWith<$Res> {
  factory $CaptchaModelCopyWith(
          CaptchaModel value, $Res Function(CaptchaModel) then) =
      _$CaptchaModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'status_code')
          String statusCode,
      String message,
      @JsonKey(name: 'url', nullable: true, fromJson: decodeCaptchaData)
          CaptchaData data});

  $CaptchaDataCopyWith<$Res> get data;
}

/// @nodoc
class _$CaptchaModelCopyWithImpl<$Res> implements $CaptchaModelCopyWith<$Res> {
  _$CaptchaModelCopyWithImpl(this._value, this._then);

  final CaptchaModel _value;
  // ignore: unused_field
  final $Res Function(CaptchaModel) _then;

  @override
  $Res call({
    Object statusCode = freezed,
    Object message = freezed,
    Object data = freezed,
  }) {
    return _then(_value.copyWith(
      statusCode:
          statusCode == freezed ? _value.statusCode : statusCode as String,
      message: message == freezed ? _value.message : message as String,
      data: data == freezed ? _value.data : data as CaptchaData,
    ));
  }

  @override
  $CaptchaDataCopyWith<$Res> get data {
    if (_value.data == null) {
      return null;
    }
    return $CaptchaDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value));
    });
  }
}

/// @nodoc
abstract class _$CaptchaModelCopyWith<$Res>
    implements $CaptchaModelCopyWith<$Res> {
  factory _$CaptchaModelCopyWith(
          _CaptchaModel value, $Res Function(_CaptchaModel) then) =
      __$CaptchaModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'status_code')
          String statusCode,
      String message,
      @JsonKey(name: 'url', nullable: true, fromJson: decodeCaptchaData)
          CaptchaData data});

  @override
  $CaptchaDataCopyWith<$Res> get data;
}

/// @nodoc
class __$CaptchaModelCopyWithImpl<$Res> extends _$CaptchaModelCopyWithImpl<$Res>
    implements _$CaptchaModelCopyWith<$Res> {
  __$CaptchaModelCopyWithImpl(
      _CaptchaModel _value, $Res Function(_CaptchaModel) _then)
      : super(_value, (v) => _then(v as _CaptchaModel));

  @override
  _CaptchaModel get _value => super._value as _CaptchaModel;

  @override
  $Res call({
    Object statusCode = freezed,
    Object message = freezed,
    Object data = freezed,
  }) {
    return _then(_CaptchaModel(
      statusCode:
          statusCode == freezed ? _value.statusCode : statusCode as String,
      message: message == freezed ? _value.message : message as String,
      data: data == freezed ? _value.data : data as CaptchaData,
    ));
  }
}

/// @nodoc
class _$_CaptchaModel implements _CaptchaModel {
  const _$_CaptchaModel(
      {@JsonKey(name: 'status_code')
          this.statusCode,
      @required
          this.message,
      @JsonKey(name: 'url', nullable: true, fromJson: decodeCaptchaData)
          this.data})
      : assert(message != null);

  @override
  @JsonKey(name: 'status_code')
  final String statusCode;
  @override
  final String message;
  @override
  @JsonKey(name: 'url', nullable: true, fromJson: decodeCaptchaData)
  final CaptchaData data;

  @override
  String toString() {
    return 'CaptchaModel(statusCode: $statusCode, message: $message, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CaptchaModel &&
            (identical(other.statusCode, statusCode) ||
                const DeepCollectionEquality()
                    .equals(other.statusCode, statusCode)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(statusCode) ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(data);

  @override
  _$CaptchaModelCopyWith<_CaptchaModel> get copyWith =>
      __$CaptchaModelCopyWithImpl<_CaptchaModel>(this, _$identity);
}

abstract class _CaptchaModel implements CaptchaModel {
  const factory _CaptchaModel(
      {@JsonKey(name: 'status_code')
          String statusCode,
      @required
          String message,
      @JsonKey(name: 'url', nullable: true, fromJson: decodeCaptchaData)
          CaptchaData data}) = _$_CaptchaModel;

  @override
  @JsonKey(name: 'status_code')
  String get statusCode;
  @override
  String get message;
  @override
  @JsonKey(name: 'url', nullable: true, fromJson: decodeCaptchaData)
  CaptchaData get data;
  @override
  _$CaptchaModelCopyWith<_CaptchaModel> get copyWith;
}

/// @nodoc
class _$CaptchaDataTearOff {
  const _$CaptchaDataTearOff();

// ignore: unused_element
  _CaptchaData call(
      {@required String key,
      @required Uint8List img,
      @required bool sensitive}) {
    return _CaptchaData(
      key: key,
      img: img,
      sensitive: sensitive,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $CaptchaData = _$CaptchaDataTearOff();

/// @nodoc
mixin _$CaptchaData {
  String get key;
  Uint8List get img;
  bool get sensitive;

  $CaptchaDataCopyWith<CaptchaData> get copyWith;
}

/// @nodoc
abstract class $CaptchaDataCopyWith<$Res> {
  factory $CaptchaDataCopyWith(
          CaptchaData value, $Res Function(CaptchaData) then) =
      _$CaptchaDataCopyWithImpl<$Res>;
  $Res call({String key, Uint8List img, bool sensitive});
}

/// @nodoc
class _$CaptchaDataCopyWithImpl<$Res> implements $CaptchaDataCopyWith<$Res> {
  _$CaptchaDataCopyWithImpl(this._value, this._then);

  final CaptchaData _value;
  // ignore: unused_field
  final $Res Function(CaptchaData) _then;

  @override
  $Res call({
    Object key = freezed,
    Object img = freezed,
    Object sensitive = freezed,
  }) {
    return _then(_value.copyWith(
      key: key == freezed ? _value.key : key as String,
      img: img == freezed ? _value.img : img as Uint8List,
      sensitive: sensitive == freezed ? _value.sensitive : sensitive as bool,
    ));
  }
}

/// @nodoc
abstract class _$CaptchaDataCopyWith<$Res>
    implements $CaptchaDataCopyWith<$Res> {
  factory _$CaptchaDataCopyWith(
          _CaptchaData value, $Res Function(_CaptchaData) then) =
      __$CaptchaDataCopyWithImpl<$Res>;
  @override
  $Res call({String key, Uint8List img, bool sensitive});
}

/// @nodoc
class __$CaptchaDataCopyWithImpl<$Res> extends _$CaptchaDataCopyWithImpl<$Res>
    implements _$CaptchaDataCopyWith<$Res> {
  __$CaptchaDataCopyWithImpl(
      _CaptchaData _value, $Res Function(_CaptchaData) _then)
      : super(_value, (v) => _then(v as _CaptchaData));

  @override
  _CaptchaData get _value => super._value as _CaptchaData;

  @override
  $Res call({
    Object key = freezed,
    Object img = freezed,
    Object sensitive = freezed,
  }) {
    return _then(_CaptchaData(
      key: key == freezed ? _value.key : key as String,
      img: img == freezed ? _value.img : img as Uint8List,
      sensitive: sensitive == freezed ? _value.sensitive : sensitive as bool,
    ));
  }
}

/// @nodoc
class _$_CaptchaData implements _CaptchaData {
  const _$_CaptchaData(
      {@required this.key, @required this.img, @required this.sensitive})
      : assert(key != null),
        assert(img != null),
        assert(sensitive != null);

  @override
  final String key;
  @override
  final Uint8List img;
  @override
  final bool sensitive;

  @override
  String toString() {
    return 'CaptchaData(key: $key, img: $img, sensitive: $sensitive)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CaptchaData &&
            (identical(other.key, key) ||
                const DeepCollectionEquality().equals(other.key, key)) &&
            (identical(other.img, img) ||
                const DeepCollectionEquality().equals(other.img, img)) &&
            (identical(other.sensitive, sensitive) ||
                const DeepCollectionEquality()
                    .equals(other.sensitive, sensitive)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(key) ^
      const DeepCollectionEquality().hash(img) ^
      const DeepCollectionEquality().hash(sensitive);

  @override
  _$CaptchaDataCopyWith<_CaptchaData> get copyWith =>
      __$CaptchaDataCopyWithImpl<_CaptchaData>(this, _$identity);
}

abstract class _CaptchaData implements CaptchaData {
  const factory _CaptchaData(
      {@required String key,
      @required Uint8List img,
      @required bool sensitive}) = _$_CaptchaData;

  @override
  String get key;
  @override
  Uint8List get img;
  @override
  bool get sensitive;
  @override
  _$CaptchaDataCopyWith<_CaptchaData> get copyWith;
}
