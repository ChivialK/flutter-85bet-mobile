// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'service_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$ServiceModelTearOff {
  const _$ServiceModelTearOff();

// ignore: unused_element
  _ServiceModel call(
      {@JsonKey(name: 'app_pic') String appPic,
      @JsonKey(name: 'app_url') String appUrl,
      String cs,
      String fb,
      String mail,
      String zalo,
      @JsonKey(name: 'zalo_pic') String zaloPic}) {
    return _ServiceModel(
      appPic: appPic,
      appUrl: appUrl,
      cs: cs,
      fb: fb,
      mail: mail,
      zalo: zalo,
      zaloPic: zaloPic,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $ServiceModel = _$ServiceModelTearOff();

/// @nodoc
mixin _$ServiceModel {
  @JsonKey(name: 'app_pic')
  String get appPic;
  @JsonKey(name: 'app_url')
  String get appUrl;
  String get cs;
  String get fb;
  String get mail;
  String get zalo;
  @JsonKey(name: 'zalo_pic')
  String get zaloPic;

  $ServiceModelCopyWith<ServiceModel> get copyWith;
}

/// @nodoc
abstract class $ServiceModelCopyWith<$Res> {
  factory $ServiceModelCopyWith(
          ServiceModel value, $Res Function(ServiceModel) then) =
      _$ServiceModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'app_pic') String appPic,
      @JsonKey(name: 'app_url') String appUrl,
      String cs,
      String fb,
      String mail,
      String zalo,
      @JsonKey(name: 'zalo_pic') String zaloPic});
}

/// @nodoc
class _$ServiceModelCopyWithImpl<$Res> implements $ServiceModelCopyWith<$Res> {
  _$ServiceModelCopyWithImpl(this._value, this._then);

  final ServiceModel _value;
  // ignore: unused_field
  final $Res Function(ServiceModel) _then;

  @override
  $Res call({
    Object appPic = freezed,
    Object appUrl = freezed,
    Object cs = freezed,
    Object fb = freezed,
    Object mail = freezed,
    Object zalo = freezed,
    Object zaloPic = freezed,
  }) {
    return _then(_value.copyWith(
      appPic: appPic == freezed ? _value.appPic : appPic as String,
      appUrl: appUrl == freezed ? _value.appUrl : appUrl as String,
      cs: cs == freezed ? _value.cs : cs as String,
      fb: fb == freezed ? _value.fb : fb as String,
      mail: mail == freezed ? _value.mail : mail as String,
      zalo: zalo == freezed ? _value.zalo : zalo as String,
      zaloPic: zaloPic == freezed ? _value.zaloPic : zaloPic as String,
    ));
  }
}

/// @nodoc
abstract class _$ServiceModelCopyWith<$Res>
    implements $ServiceModelCopyWith<$Res> {
  factory _$ServiceModelCopyWith(
          _ServiceModel value, $Res Function(_ServiceModel) then) =
      __$ServiceModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'app_pic') String appPic,
      @JsonKey(name: 'app_url') String appUrl,
      String cs,
      String fb,
      String mail,
      String zalo,
      @JsonKey(name: 'zalo_pic') String zaloPic});
}

/// @nodoc
class __$ServiceModelCopyWithImpl<$Res> extends _$ServiceModelCopyWithImpl<$Res>
    implements _$ServiceModelCopyWith<$Res> {
  __$ServiceModelCopyWithImpl(
      _ServiceModel _value, $Res Function(_ServiceModel) _then)
      : super(_value, (v) => _then(v as _ServiceModel));

  @override
  _ServiceModel get _value => super._value as _ServiceModel;

  @override
  $Res call({
    Object appPic = freezed,
    Object appUrl = freezed,
    Object cs = freezed,
    Object fb = freezed,
    Object mail = freezed,
    Object zalo = freezed,
    Object zaloPic = freezed,
  }) {
    return _then(_ServiceModel(
      appPic: appPic == freezed ? _value.appPic : appPic as String,
      appUrl: appUrl == freezed ? _value.appUrl : appUrl as String,
      cs: cs == freezed ? _value.cs : cs as String,
      fb: fb == freezed ? _value.fb : fb as String,
      mail: mail == freezed ? _value.mail : mail as String,
      zalo: zalo == freezed ? _value.zalo : zalo as String,
      zaloPic: zaloPic == freezed ? _value.zaloPic : zaloPic as String,
    ));
  }
}

/// @nodoc
class _$_ServiceModel implements _ServiceModel {
  const _$_ServiceModel(
      {@JsonKey(name: 'app_pic') this.appPic,
      @JsonKey(name: 'app_url') this.appUrl,
      this.cs,
      this.fb,
      this.mail,
      this.zalo,
      @JsonKey(name: 'zalo_pic') this.zaloPic});

  @override
  @JsonKey(name: 'app_pic')
  final String appPic;
  @override
  @JsonKey(name: 'app_url')
  final String appUrl;
  @override
  final String cs;
  @override
  final String fb;
  @override
  final String mail;
  @override
  final String zalo;
  @override
  @JsonKey(name: 'zalo_pic')
  final String zaloPic;

  @override
  String toString() {
    return 'ServiceModel(appPic: $appPic, appUrl: $appUrl, cs: $cs, fb: $fb, mail: $mail, zalo: $zalo, zaloPic: $zaloPic)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ServiceModel &&
            (identical(other.appPic, appPic) ||
                const DeepCollectionEquality().equals(other.appPic, appPic)) &&
            (identical(other.appUrl, appUrl) ||
                const DeepCollectionEquality().equals(other.appUrl, appUrl)) &&
            (identical(other.cs, cs) ||
                const DeepCollectionEquality().equals(other.cs, cs)) &&
            (identical(other.fb, fb) ||
                const DeepCollectionEquality().equals(other.fb, fb)) &&
            (identical(other.mail, mail) ||
                const DeepCollectionEquality().equals(other.mail, mail)) &&
            (identical(other.zalo, zalo) ||
                const DeepCollectionEquality().equals(other.zalo, zalo)) &&
            (identical(other.zaloPic, zaloPic) ||
                const DeepCollectionEquality().equals(other.zaloPic, zaloPic)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(appPic) ^
      const DeepCollectionEquality().hash(appUrl) ^
      const DeepCollectionEquality().hash(cs) ^
      const DeepCollectionEquality().hash(fb) ^
      const DeepCollectionEquality().hash(mail) ^
      const DeepCollectionEquality().hash(zalo) ^
      const DeepCollectionEquality().hash(zaloPic);

  @override
  _$ServiceModelCopyWith<_ServiceModel> get copyWith =>
      __$ServiceModelCopyWithImpl<_ServiceModel>(this, _$identity);
}

abstract class _ServiceModel implements ServiceModel {
  const factory _ServiceModel(
      {@JsonKey(name: 'app_pic') String appPic,
      @JsonKey(name: 'app_url') String appUrl,
      String cs,
      String fb,
      String mail,
      String zalo,
      @JsonKey(name: 'zalo_pic') String zaloPic}) = _$_ServiceModel;

  @override
  @JsonKey(name: 'app_pic')
  String get appPic;
  @override
  @JsonKey(name: 'app_url')
  String get appUrl;
  @override
  String get cs;
  @override
  String get fb;
  @override
  String get mail;
  @override
  String get zalo;
  @override
  @JsonKey(name: 'zalo_pic')
  String get zaloPic;
  @override
  _$ServiceModelCopyWith<_ServiceModel> get copyWith;
}
