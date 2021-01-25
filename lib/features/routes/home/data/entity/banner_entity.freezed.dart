// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'banner_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$BannerEntityTearOff {
  const _$BannerEntityTearOff();

// ignore: unused_element
  _BannerEntity call(
      {@required @HiveField(0) int id,
      @required @HiveField(1) String pic,
      @required @HiveField(2) bool noPromo,
      @required @HiveField(3) String promoUrl,
      @required @HiveField(4) int sort}) {
    return _BannerEntity(
      id: id,
      pic: pic,
      noPromo: noPromo,
      promoUrl: promoUrl,
      sort: sort,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $BannerEntity = _$BannerEntityTearOff();

/// @nodoc
mixin _$BannerEntity {
  @HiveField(0)
  int get id;
  @HiveField(1)
  String get pic;
  @HiveField(2)
  bool get noPromo;
  @HiveField(3)
  String get promoUrl;
  @HiveField(4)
  int get sort;

  @JsonKey(ignore: true)
  $BannerEntityCopyWith<BannerEntity> get copyWith;
}

/// @nodoc
abstract class $BannerEntityCopyWith<$Res> {
  factory $BannerEntityCopyWith(
          BannerEntity value, $Res Function(BannerEntity) then) =
      _$BannerEntityCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String pic,
      @HiveField(2) bool noPromo,
      @HiveField(3) String promoUrl,
      @HiveField(4) int sort});
}

/// @nodoc
class _$BannerEntityCopyWithImpl<$Res> implements $BannerEntityCopyWith<$Res> {
  _$BannerEntityCopyWithImpl(this._value, this._then);

  final BannerEntity _value;
  // ignore: unused_field
  final $Res Function(BannerEntity) _then;

  @override
  $Res call({
    Object id = freezed,
    Object pic = freezed,
    Object noPromo = freezed,
    Object promoUrl = freezed,
    Object sort = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as int,
      pic: pic == freezed ? _value.pic : pic as String,
      noPromo: noPromo == freezed ? _value.noPromo : noPromo as bool,
      promoUrl: promoUrl == freezed ? _value.promoUrl : promoUrl as String,
      sort: sort == freezed ? _value.sort : sort as int,
    ));
  }
}

/// @nodoc
abstract class _$BannerEntityCopyWith<$Res>
    implements $BannerEntityCopyWith<$Res> {
  factory _$BannerEntityCopyWith(
          _BannerEntity value, $Res Function(_BannerEntity) then) =
      __$BannerEntityCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String pic,
      @HiveField(2) bool noPromo,
      @HiveField(3) String promoUrl,
      @HiveField(4) int sort});
}

/// @nodoc
class __$BannerEntityCopyWithImpl<$Res> extends _$BannerEntityCopyWithImpl<$Res>
    implements _$BannerEntityCopyWith<$Res> {
  __$BannerEntityCopyWithImpl(
      _BannerEntity _value, $Res Function(_BannerEntity) _then)
      : super(_value, (v) => _then(v as _BannerEntity));

  @override
  _BannerEntity get _value => super._value as _BannerEntity;

  @override
  $Res call({
    Object id = freezed,
    Object pic = freezed,
    Object noPromo = freezed,
    Object promoUrl = freezed,
    Object sort = freezed,
  }) {
    return _then(_BannerEntity(
      id: id == freezed ? _value.id : id as int,
      pic: pic == freezed ? _value.pic : pic as String,
      noPromo: noPromo == freezed ? _value.noPromo : noPromo as bool,
      promoUrl: promoUrl == freezed ? _value.promoUrl : promoUrl as String,
      sort: sort == freezed ? _value.sort : sort as int,
    ));
  }
}

@HiveType(typeId: 101)
@Implements(DataOperator)

/// @nodoc
class _$_BannerEntity implements _BannerEntity {
  const _$_BannerEntity(
      {@required @HiveField(0) this.id,
      @required @HiveField(1) this.pic,
      @required @HiveField(2) this.noPromo,
      @required @HiveField(3) this.promoUrl,
      @required @HiveField(4) this.sort})
      : assert(id != null),
        assert(pic != null),
        assert(noPromo != null),
        assert(promoUrl != null),
        assert(sort != null);

  @override
  @HiveField(0)
  final int id;
  @override
  @HiveField(1)
  final String pic;
  @override
  @HiveField(2)
  final bool noPromo;
  @override
  @HiveField(3)
  final String promoUrl;
  @override
  @HiveField(4)
  final int sort;

  @override
  String toString() {
    return 'BannerEntity(id: $id, pic: $pic, noPromo: $noPromo, promoUrl: $promoUrl, sort: $sort)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BannerEntity &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.pic, pic) ||
                const DeepCollectionEquality().equals(other.pic, pic)) &&
            (identical(other.noPromo, noPromo) ||
                const DeepCollectionEquality()
                    .equals(other.noPromo, noPromo)) &&
            (identical(other.promoUrl, promoUrl) ||
                const DeepCollectionEquality()
                    .equals(other.promoUrl, promoUrl)) &&
            (identical(other.sort, sort) ||
                const DeepCollectionEquality().equals(other.sort, sort)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(pic) ^
      const DeepCollectionEquality().hash(noPromo) ^
      const DeepCollectionEquality().hash(promoUrl) ^
      const DeepCollectionEquality().hash(sort);

  @JsonKey(ignore: true)
  @override
  _$BannerEntityCopyWith<_BannerEntity> get copyWith =>
      __$BannerEntityCopyWithImpl<_BannerEntity>(this, _$identity);

  @override
  String operator [](String key) {
    return id.toString();
  }
}

abstract class _BannerEntity implements BannerEntity, DataOperator {
  const factory _BannerEntity(
      {@required @HiveField(0) int id,
      @required @HiveField(1) String pic,
      @required @HiveField(2) bool noPromo,
      @required @HiveField(3) String promoUrl,
      @required @HiveField(4) int sort}) = _$_BannerEntity;

  @override
  @HiveField(0)
  int get id;
  @override
  @HiveField(1)
  String get pic;
  @override
  @HiveField(2)
  bool get noPromo;
  @override
  @HiveField(3)
  String get promoUrl;
  @override
  @HiveField(4)
  int get sort;
  @override
  @JsonKey(ignore: true)
  _$BannerEntityCopyWith<_BannerEntity> get copyWith;
}
