// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'mobile_verify_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
MobileVerifyForm _$MobileVerifyFormFromJson(Map<String, dynamic> json) {
  return _MobileVerifyForm.fromJson(json);
}

/// @nodoc
class _$MobileVerifyFormTearOff {
  const _$MobileVerifyFormTearOff();

// ignore: unused_element
  _MobileVerifyForm call({@required String mobile, String uuid}) {
    return _MobileVerifyForm(
      mobile: mobile,
      uuid: uuid,
    );
  }

// ignore: unused_element
  MobileVerifyForm fromJson(Map<String, Object> json) {
    return MobileVerifyForm.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $MobileVerifyForm = _$MobileVerifyFormTearOff();

/// @nodoc
mixin _$MobileVerifyForm {
  String get mobile;
  String get uuid;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $MobileVerifyFormCopyWith<MobileVerifyForm> get copyWith;
}

/// @nodoc
abstract class $MobileVerifyFormCopyWith<$Res> {
  factory $MobileVerifyFormCopyWith(
          MobileVerifyForm value, $Res Function(MobileVerifyForm) then) =
      _$MobileVerifyFormCopyWithImpl<$Res>;
  $Res call({String mobile, String uuid});
}

/// @nodoc
class _$MobileVerifyFormCopyWithImpl<$Res>
    implements $MobileVerifyFormCopyWith<$Res> {
  _$MobileVerifyFormCopyWithImpl(this._value, this._then);

  final MobileVerifyForm _value;
  // ignore: unused_field
  final $Res Function(MobileVerifyForm) _then;

  @override
  $Res call({
    Object mobile = freezed,
    Object uuid = freezed,
  }) {
    return _then(_value.copyWith(
      mobile: mobile == freezed ? _value.mobile : mobile as String,
      uuid: uuid == freezed ? _value.uuid : uuid as String,
    ));
  }
}

/// @nodoc
abstract class _$MobileVerifyFormCopyWith<$Res>
    implements $MobileVerifyFormCopyWith<$Res> {
  factory _$MobileVerifyFormCopyWith(
          _MobileVerifyForm value, $Res Function(_MobileVerifyForm) then) =
      __$MobileVerifyFormCopyWithImpl<$Res>;
  @override
  $Res call({String mobile, String uuid});
}

/// @nodoc
class __$MobileVerifyFormCopyWithImpl<$Res>
    extends _$MobileVerifyFormCopyWithImpl<$Res>
    implements _$MobileVerifyFormCopyWith<$Res> {
  __$MobileVerifyFormCopyWithImpl(
      _MobileVerifyForm _value, $Res Function(_MobileVerifyForm) _then)
      : super(_value, (v) => _then(v as _MobileVerifyForm));

  @override
  _MobileVerifyForm get _value => super._value as _MobileVerifyForm;

  @override
  $Res call({
    Object mobile = freezed,
    Object uuid = freezed,
  }) {
    return _then(_MobileVerifyForm(
      mobile: mobile == freezed ? _value.mobile : mobile as String,
      uuid: uuid == freezed ? _value.uuid : uuid as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_MobileVerifyForm implements _MobileVerifyForm {
  const _$_MobileVerifyForm({@required this.mobile, this.uuid})
      : assert(mobile != null);

  factory _$_MobileVerifyForm.fromJson(Map<String, dynamic> json) =>
      _$_$_MobileVerifyFormFromJson(json);

  @override
  final String mobile;
  @override
  final String uuid;

  @override
  String toString() {
    return 'MobileVerifyForm(mobile: $mobile, uuid: $uuid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MobileVerifyForm &&
            (identical(other.mobile, mobile) ||
                const DeepCollectionEquality().equals(other.mobile, mobile)) &&
            (identical(other.uuid, uuid) ||
                const DeepCollectionEquality().equals(other.uuid, uuid)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(mobile) ^
      const DeepCollectionEquality().hash(uuid);

  @JsonKey(ignore: true)
  @override
  _$MobileVerifyFormCopyWith<_MobileVerifyForm> get copyWith =>
      __$MobileVerifyFormCopyWithImpl<_MobileVerifyForm>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_MobileVerifyFormToJson(this);
  }
}

abstract class _MobileVerifyForm implements MobileVerifyForm {
  const factory _MobileVerifyForm({@required String mobile, String uuid}) =
      _$_MobileVerifyForm;

  factory _MobileVerifyForm.fromJson(Map<String, dynamic> json) =
      _$_MobileVerifyForm.fromJson;

  @override
  String get mobile;
  @override
  String get uuid;
  @override
  @JsonKey(ignore: true)
  _$MobileVerifyFormCopyWith<_MobileVerifyForm> get copyWith;
}
