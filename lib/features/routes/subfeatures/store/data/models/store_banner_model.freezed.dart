// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'store_banner_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$StoreBannerModelTearOff {
  const _$StoreBannerModelTearOff();

// ignore: unused_element
  _StoreBannerModel call(
      {String title, String pic, @JsonKey(name: 'end_time') String expire}) {
    return _StoreBannerModel(
      title: title,
      pic: pic,
      expire: expire,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $StoreBannerModel = _$StoreBannerModelTearOff();

/// @nodoc
mixin _$StoreBannerModel {
  String get title;
  String get pic;
  @JsonKey(name: 'end_time')
  String get expire;

  @JsonKey(ignore: true)
  $StoreBannerModelCopyWith<StoreBannerModel> get copyWith;
}

/// @nodoc
abstract class $StoreBannerModelCopyWith<$Res> {
  factory $StoreBannerModelCopyWith(
          StoreBannerModel value, $Res Function(StoreBannerModel) then) =
      _$StoreBannerModelCopyWithImpl<$Res>;
  $Res call(
      {String title, String pic, @JsonKey(name: 'end_time') String expire});
}

/// @nodoc
class _$StoreBannerModelCopyWithImpl<$Res>
    implements $StoreBannerModelCopyWith<$Res> {
  _$StoreBannerModelCopyWithImpl(this._value, this._then);

  final StoreBannerModel _value;
  // ignore: unused_field
  final $Res Function(StoreBannerModel) _then;

  @override
  $Res call({
    Object title = freezed,
    Object pic = freezed,
    Object expire = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed ? _value.title : title as String,
      pic: pic == freezed ? _value.pic : pic as String,
      expire: expire == freezed ? _value.expire : expire as String,
    ));
  }
}

/// @nodoc
abstract class _$StoreBannerModelCopyWith<$Res>
    implements $StoreBannerModelCopyWith<$Res> {
  factory _$StoreBannerModelCopyWith(
          _StoreBannerModel value, $Res Function(_StoreBannerModel) then) =
      __$StoreBannerModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String title, String pic, @JsonKey(name: 'end_time') String expire});
}

/// @nodoc
class __$StoreBannerModelCopyWithImpl<$Res>
    extends _$StoreBannerModelCopyWithImpl<$Res>
    implements _$StoreBannerModelCopyWith<$Res> {
  __$StoreBannerModelCopyWithImpl(
      _StoreBannerModel _value, $Res Function(_StoreBannerModel) _then)
      : super(_value, (v) => _then(v as _StoreBannerModel));

  @override
  _StoreBannerModel get _value => super._value as _StoreBannerModel;

  @override
  $Res call({
    Object title = freezed,
    Object pic = freezed,
    Object expire = freezed,
  }) {
    return _then(_StoreBannerModel(
      title: title == freezed ? _value.title : title as String,
      pic: pic == freezed ? _value.pic : pic as String,
      expire: expire == freezed ? _value.expire : expire as String,
    ));
  }
}

/// @nodoc
class _$_StoreBannerModel implements _StoreBannerModel {
  const _$_StoreBannerModel(
      {this.title, this.pic, @JsonKey(name: 'end_time') this.expire});

  @override
  final String title;
  @override
  final String pic;
  @override
  @JsonKey(name: 'end_time')
  final String expire;

  @override
  String toString() {
    return 'StoreBannerModel(title: $title, pic: $pic, expire: $expire)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _StoreBannerModel &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.pic, pic) ||
                const DeepCollectionEquality().equals(other.pic, pic)) &&
            (identical(other.expire, expire) ||
                const DeepCollectionEquality().equals(other.expire, expire)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(pic) ^
      const DeepCollectionEquality().hash(expire);

  @JsonKey(ignore: true)
  @override
  _$StoreBannerModelCopyWith<_StoreBannerModel> get copyWith =>
      __$StoreBannerModelCopyWithImpl<_StoreBannerModel>(this, _$identity);
}

abstract class _StoreBannerModel implements StoreBannerModel {
  const factory _StoreBannerModel(
      {String title,
      String pic,
      @JsonKey(name: 'end_time') String expire}) = _$_StoreBannerModel;

  @override
  String get title;
  @override
  String get pic;
  @override
  @JsonKey(name: 'end_time')
  String get expire;
  @override
  @JsonKey(ignore: true)
  _$StoreBannerModelCopyWith<_StoreBannerModel> get copyWith;
}
