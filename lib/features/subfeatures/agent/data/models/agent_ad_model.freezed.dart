// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'agent_ad_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$AgentAdModelTearOff {
  const _$AgentAdModelTearOff();

// ignore: unused_element
  _AgentAdModel call({int id, String pic, String content, String status}) {
    return _AgentAdModel(
      id: id,
      pic: pic,
      content: content,
      status: status,
    );
  }
}

// ignore: unused_element
const $AgentAdModel = _$AgentAdModelTearOff();

mixin _$AgentAdModel {
  int get id;
  String get pic;
  String get content;
  String get status;

  $AgentAdModelCopyWith<AgentAdModel> get copyWith;
}

abstract class $AgentAdModelCopyWith<$Res> {
  factory $AgentAdModelCopyWith(
          AgentAdModel value, $Res Function(AgentAdModel) then) =
      _$AgentAdModelCopyWithImpl<$Res>;
  $Res call({int id, String pic, String content, String status});
}

class _$AgentAdModelCopyWithImpl<$Res> implements $AgentAdModelCopyWith<$Res> {
  _$AgentAdModelCopyWithImpl(this._value, this._then);

  final AgentAdModel _value;
  // ignore: unused_field
  final $Res Function(AgentAdModel) _then;

  @override
  $Res call({
    Object id = freezed,
    Object pic = freezed,
    Object content = freezed,
    Object status = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as int,
      pic: pic == freezed ? _value.pic : pic as String,
      content: content == freezed ? _value.content : content as String,
      status: status == freezed ? _value.status : status as String,
    ));
  }
}

abstract class _$AgentAdModelCopyWith<$Res>
    implements $AgentAdModelCopyWith<$Res> {
  factory _$AgentAdModelCopyWith(
          _AgentAdModel value, $Res Function(_AgentAdModel) then) =
      __$AgentAdModelCopyWithImpl<$Res>;
  @override
  $Res call({int id, String pic, String content, String status});
}

class __$AgentAdModelCopyWithImpl<$Res> extends _$AgentAdModelCopyWithImpl<$Res>
    implements _$AgentAdModelCopyWith<$Res> {
  __$AgentAdModelCopyWithImpl(
      _AgentAdModel _value, $Res Function(_AgentAdModel) _then)
      : super(_value, (v) => _then(v as _AgentAdModel));

  @override
  _AgentAdModel get _value => super._value as _AgentAdModel;

  @override
  $Res call({
    Object id = freezed,
    Object pic = freezed,
    Object content = freezed,
    Object status = freezed,
  }) {
    return _then(_AgentAdModel(
      id: id == freezed ? _value.id : id as int,
      pic: pic == freezed ? _value.pic : pic as String,
      content: content == freezed ? _value.content : content as String,
      status: status == freezed ? _value.status : status as String,
    ));
  }
}

class _$_AgentAdModel implements _AgentAdModel {
  const _$_AgentAdModel({this.id, this.pic, this.content, this.status});

  @override
  final int id;
  @override
  final String pic;
  @override
  final String content;
  @override
  final String status;

  @override
  String toString() {
    return 'AgentAdModel(id: $id, pic: $pic, content: $content, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AgentAdModel &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.pic, pic) ||
                const DeepCollectionEquality().equals(other.pic, pic)) &&
            (identical(other.content, content) ||
                const DeepCollectionEquality()
                    .equals(other.content, content)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(pic) ^
      const DeepCollectionEquality().hash(content) ^
      const DeepCollectionEquality().hash(status);

  @override
  _$AgentAdModelCopyWith<_AgentAdModel> get copyWith =>
      __$AgentAdModelCopyWithImpl<_AgentAdModel>(this, _$identity);
}

abstract class _AgentAdModel implements AgentAdModel {
  const factory _AgentAdModel(
      {int id, String pic, String content, String status}) = _$_AgentAdModel;

  @override
  int get id;
  @override
  String get pic;
  @override
  String get content;
  @override
  String get status;
  @override
  _$AgentAdModelCopyWith<_AgentAdModel> get copyWith;
}
