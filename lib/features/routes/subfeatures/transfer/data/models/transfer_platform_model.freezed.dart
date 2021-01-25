// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'transfer_platform_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
TransferPlatformModel _$TransferPlatformModelFromJson(
    Map<String, dynamic> json) {
  return _TransferPlatformModel.fromJson(json);
}

/// @nodoc
class _$TransferPlatformModelTearOff {
  const _$TransferPlatformModelTearOff();

// ignore: unused_element
  _TransferPlatformModel call(
      {String site, @JsonKey(name: 'site_name') String name}) {
    return _TransferPlatformModel(
      site: site,
      name: name,
    );
  }

// ignore: unused_element
  TransferPlatformModel fromJson(Map<String, Object> json) {
    return TransferPlatformModel.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $TransferPlatformModel = _$TransferPlatformModelTearOff();

/// @nodoc
mixin _$TransferPlatformModel {
  String get site;
  @JsonKey(name: 'site_name')
  String get name;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $TransferPlatformModelCopyWith<TransferPlatformModel> get copyWith;
}

/// @nodoc
abstract class $TransferPlatformModelCopyWith<$Res> {
  factory $TransferPlatformModelCopyWith(TransferPlatformModel value,
          $Res Function(TransferPlatformModel) then) =
      _$TransferPlatformModelCopyWithImpl<$Res>;
  $Res call({String site, @JsonKey(name: 'site_name') String name});
}

/// @nodoc
class _$TransferPlatformModelCopyWithImpl<$Res>
    implements $TransferPlatformModelCopyWith<$Res> {
  _$TransferPlatformModelCopyWithImpl(this._value, this._then);

  final TransferPlatformModel _value;
  // ignore: unused_field
  final $Res Function(TransferPlatformModel) _then;

  @override
  $Res call({
    Object site = freezed,
    Object name = freezed,
  }) {
    return _then(_value.copyWith(
      site: site == freezed ? _value.site : site as String,
      name: name == freezed ? _value.name : name as String,
    ));
  }
}

/// @nodoc
abstract class _$TransferPlatformModelCopyWith<$Res>
    implements $TransferPlatformModelCopyWith<$Res> {
  factory _$TransferPlatformModelCopyWith(_TransferPlatformModel value,
          $Res Function(_TransferPlatformModel) then) =
      __$TransferPlatformModelCopyWithImpl<$Res>;
  @override
  $Res call({String site, @JsonKey(name: 'site_name') String name});
}

/// @nodoc
class __$TransferPlatformModelCopyWithImpl<$Res>
    extends _$TransferPlatformModelCopyWithImpl<$Res>
    implements _$TransferPlatformModelCopyWith<$Res> {
  __$TransferPlatformModelCopyWithImpl(_TransferPlatformModel _value,
      $Res Function(_TransferPlatformModel) _then)
      : super(_value, (v) => _then(v as _TransferPlatformModel));

  @override
  _TransferPlatformModel get _value => super._value as _TransferPlatformModel;

  @override
  $Res call({
    Object site = freezed,
    Object name = freezed,
  }) {
    return _then(_TransferPlatformModel(
      site: site == freezed ? _value.site : site as String,
      name: name == freezed ? _value.name : name as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_TransferPlatformModel implements _TransferPlatformModel {
  const _$_TransferPlatformModel(
      {this.site, @JsonKey(name: 'site_name') this.name});

  factory _$_TransferPlatformModel.fromJson(Map<String, dynamic> json) =>
      _$_$_TransferPlatformModelFromJson(json);

  @override
  final String site;
  @override
  @JsonKey(name: 'site_name')
  final String name;

  @override
  String toString() {
    return 'TransferPlatformModel(site: $site, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TransferPlatformModel &&
            (identical(other.site, site) ||
                const DeepCollectionEquality().equals(other.site, site)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(site) ^
      const DeepCollectionEquality().hash(name);

  @JsonKey(ignore: true)
  @override
  _$TransferPlatformModelCopyWith<_TransferPlatformModel> get copyWith =>
      __$TransferPlatformModelCopyWithImpl<_TransferPlatformModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_TransferPlatformModelToJson(this);
  }
}

abstract class _TransferPlatformModel implements TransferPlatformModel {
  const factory _TransferPlatformModel(
      {String site,
      @JsonKey(name: 'site_name') String name}) = _$_TransferPlatformModel;

  factory _TransferPlatformModel.fromJson(Map<String, dynamic> json) =
      _$_TransferPlatformModel.fromJson;

  @override
  String get site;
  @override
  @JsonKey(name: 'site_name')
  String get name;
  @override
  @JsonKey(ignore: true)
  _$TransferPlatformModelCopyWith<_TransferPlatformModel> get copyWith;
}

/// @nodoc
class _$TransferPlatformListTearOff {
  const _$TransferPlatformListTearOff();

// ignore: unused_element
  _TransferPlatformList call({List<TransferPlatformModel> list}) {
    return _TransferPlatformList(
      list: list,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $TransferPlatformList = _$TransferPlatformListTearOff();

/// @nodoc
mixin _$TransferPlatformList {
  List<TransferPlatformModel> get list;

  @JsonKey(ignore: true)
  $TransferPlatformListCopyWith<TransferPlatformList> get copyWith;
}

/// @nodoc
abstract class $TransferPlatformListCopyWith<$Res> {
  factory $TransferPlatformListCopyWith(TransferPlatformList value,
          $Res Function(TransferPlatformList) then) =
      _$TransferPlatformListCopyWithImpl<$Res>;
  $Res call({List<TransferPlatformModel> list});
}

/// @nodoc
class _$TransferPlatformListCopyWithImpl<$Res>
    implements $TransferPlatformListCopyWith<$Res> {
  _$TransferPlatformListCopyWithImpl(this._value, this._then);

  final TransferPlatformList _value;
  // ignore: unused_field
  final $Res Function(TransferPlatformList) _then;

  @override
  $Res call({
    Object list = freezed,
  }) {
    return _then(_value.copyWith(
      list: list == freezed ? _value.list : list as List<TransferPlatformModel>,
    ));
  }
}

/// @nodoc
abstract class _$TransferPlatformListCopyWith<$Res>
    implements $TransferPlatformListCopyWith<$Res> {
  factory _$TransferPlatformListCopyWith(_TransferPlatformList value,
          $Res Function(_TransferPlatformList) then) =
      __$TransferPlatformListCopyWithImpl<$Res>;
  @override
  $Res call({List<TransferPlatformModel> list});
}

/// @nodoc
class __$TransferPlatformListCopyWithImpl<$Res>
    extends _$TransferPlatformListCopyWithImpl<$Res>
    implements _$TransferPlatformListCopyWith<$Res> {
  __$TransferPlatformListCopyWithImpl(
      _TransferPlatformList _value, $Res Function(_TransferPlatformList) _then)
      : super(_value, (v) => _then(v as _TransferPlatformList));

  @override
  _TransferPlatformList get _value => super._value as _TransferPlatformList;

  @override
  $Res call({
    Object list = freezed,
  }) {
    return _then(_TransferPlatformList(
      list: list == freezed ? _value.list : list as List<TransferPlatformModel>,
    ));
  }
}

/// @nodoc
class _$_TransferPlatformList implements _TransferPlatformList {
  const _$_TransferPlatformList({this.list});

  @override
  final List<TransferPlatformModel> list;

  @override
  String toString() {
    return 'TransferPlatformList(list: $list)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TransferPlatformList &&
            (identical(other.list, list) ||
                const DeepCollectionEquality().equals(other.list, list)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(list);

  @JsonKey(ignore: true)
  @override
  _$TransferPlatformListCopyWith<_TransferPlatformList> get copyWith =>
      __$TransferPlatformListCopyWithImpl<_TransferPlatformList>(
          this, _$identity);
}

abstract class _TransferPlatformList implements TransferPlatformList {
  const factory _TransferPlatformList({List<TransferPlatformModel> list}) =
      _$_TransferPlatformList;

  @override
  List<TransferPlatformModel> get list;
  @override
  @JsonKey(ignore: true)
  _$TransferPlatformListCopyWith<_TransferPlatformList> get copyWith;
}
