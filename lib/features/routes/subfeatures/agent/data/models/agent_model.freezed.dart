// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'agent_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$AgentModelTearOff {
  const _$AgentModelTearOff();

// ignore: unused_element
  _AgentModel call(
      {int code,
      List<dynamic> descendant,
      String qrcode,
      String upline,
      String url}) {
    return _AgentModel(
      code: code,
      descendant: descendant,
      qrcode: qrcode,
      upline: upline,
      url: url,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $AgentModel = _$AgentModelTearOff();

/// @nodoc
mixin _$AgentModel {
  int get code;
  List<dynamic> get descendant;
  String get qrcode;
  String get upline;
  String get url;

  $AgentModelCopyWith<AgentModel> get copyWith;
}

/// @nodoc
abstract class $AgentModelCopyWith<$Res> {
  factory $AgentModelCopyWith(
          AgentModel value, $Res Function(AgentModel) then) =
      _$AgentModelCopyWithImpl<$Res>;
  $Res call(
      {int code,
      List<dynamic> descendant,
      String qrcode,
      String upline,
      String url});
}

/// @nodoc
class _$AgentModelCopyWithImpl<$Res> implements $AgentModelCopyWith<$Res> {
  _$AgentModelCopyWithImpl(this._value, this._then);

  final AgentModel _value;
  // ignore: unused_field
  final $Res Function(AgentModel) _then;

  @override
  $Res call({
    Object code = freezed,
    Object descendant = freezed,
    Object qrcode = freezed,
    Object upline = freezed,
    Object url = freezed,
  }) {
    return _then(_value.copyWith(
      code: code == freezed ? _value.code : code as int,
      descendant: descendant == freezed
          ? _value.descendant
          : descendant as List<dynamic>,
      qrcode: qrcode == freezed ? _value.qrcode : qrcode as String,
      upline: upline == freezed ? _value.upline : upline as String,
      url: url == freezed ? _value.url : url as String,
    ));
  }
}

/// @nodoc
abstract class _$AgentModelCopyWith<$Res> implements $AgentModelCopyWith<$Res> {
  factory _$AgentModelCopyWith(
          _AgentModel value, $Res Function(_AgentModel) then) =
      __$AgentModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int code,
      List<dynamic> descendant,
      String qrcode,
      String upline,
      String url});
}

/// @nodoc
class __$AgentModelCopyWithImpl<$Res> extends _$AgentModelCopyWithImpl<$Res>
    implements _$AgentModelCopyWith<$Res> {
  __$AgentModelCopyWithImpl(
      _AgentModel _value, $Res Function(_AgentModel) _then)
      : super(_value, (v) => _then(v as _AgentModel));

  @override
  _AgentModel get _value => super._value as _AgentModel;

  @override
  $Res call({
    Object code = freezed,
    Object descendant = freezed,
    Object qrcode = freezed,
    Object upline = freezed,
    Object url = freezed,
  }) {
    return _then(_AgentModel(
      code: code == freezed ? _value.code : code as int,
      descendant: descendant == freezed
          ? _value.descendant
          : descendant as List<dynamic>,
      qrcode: qrcode == freezed ? _value.qrcode : qrcode as String,
      upline: upline == freezed ? _value.upline : upline as String,
      url: url == freezed ? _value.url : url as String,
    ));
  }
}

/// @nodoc
class _$_AgentModel implements _AgentModel {
  const _$_AgentModel(
      {this.code, this.descendant, this.qrcode, this.upline, this.url});

  @override
  final int code;
  @override
  final List<dynamic> descendant;
  @override
  final String qrcode;
  @override
  final String upline;
  @override
  final String url;

  @override
  String toString() {
    return 'AgentModel(code: $code, descendant: $descendant, qrcode: $qrcode, upline: $upline, url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AgentModel &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)) &&
            (identical(other.descendant, descendant) ||
                const DeepCollectionEquality()
                    .equals(other.descendant, descendant)) &&
            (identical(other.qrcode, qrcode) ||
                const DeepCollectionEquality().equals(other.qrcode, qrcode)) &&
            (identical(other.upline, upline) ||
                const DeepCollectionEquality().equals(other.upline, upline)) &&
            (identical(other.url, url) ||
                const DeepCollectionEquality().equals(other.url, url)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(code) ^
      const DeepCollectionEquality().hash(descendant) ^
      const DeepCollectionEquality().hash(qrcode) ^
      const DeepCollectionEquality().hash(upline) ^
      const DeepCollectionEquality().hash(url);

  @override
  _$AgentModelCopyWith<_AgentModel> get copyWith =>
      __$AgentModelCopyWithImpl<_AgentModel>(this, _$identity);
}

abstract class _AgentModel implements AgentModel {
  const factory _AgentModel(
      {int code,
      List<dynamic> descendant,
      String qrcode,
      String upline,
      String url}) = _$_AgentModel;

  @override
  int get code;
  @override
  List<dynamic> get descendant;
  @override
  String get qrcode;
  @override
  String get upline;
  @override
  String get url;
  @override
  _$AgentModelCopyWith<_AgentModel> get copyWith;
}
