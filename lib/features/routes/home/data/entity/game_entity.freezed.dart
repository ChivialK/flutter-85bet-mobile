// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'game_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$GameEntityTearOff {
  const _$GameEntityTearOff();

// ignore: unused_element
  _GameEntity call(
      {@required int id,
      String cname = '??',
      String ename = '??',
      @JsonKey(fromJson: decodeGameUrl, required: true) String gameUrl,
      int favorite = 0,
      int sort = 0}) {
    return _GameEntity(
      id: id,
      cname: cname,
      ename: ename,
      gameUrl: gameUrl,
      favorite: favorite,
      sort: sort,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $GameEntity = _$GameEntityTearOff();

/// @nodoc
mixin _$GameEntity {
  int get id;
  String get cname;
  String get ename;
  @JsonKey(fromJson: decodeGameUrl, required: true)
  String get gameUrl;
  int get favorite;
  int get sort;

  $GameEntityCopyWith<GameEntity> get copyWith;
}

/// @nodoc
abstract class $GameEntityCopyWith<$Res> {
  factory $GameEntityCopyWith(
          GameEntity value, $Res Function(GameEntity) then) =
      _$GameEntityCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String cname,
      String ename,
      @JsonKey(fromJson: decodeGameUrl, required: true) String gameUrl,
      int favorite,
      int sort});
}

/// @nodoc
class _$GameEntityCopyWithImpl<$Res> implements $GameEntityCopyWith<$Res> {
  _$GameEntityCopyWithImpl(this._value, this._then);

  final GameEntity _value;
  // ignore: unused_field
  final $Res Function(GameEntity) _then;

  @override
  $Res call({
    Object id = freezed,
    Object cname = freezed,
    Object ename = freezed,
    Object gameUrl = freezed,
    Object favorite = freezed,
    Object sort = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as int,
      cname: cname == freezed ? _value.cname : cname as String,
      ename: ename == freezed ? _value.ename : ename as String,
      gameUrl: gameUrl == freezed ? _value.gameUrl : gameUrl as String,
      favorite: favorite == freezed ? _value.favorite : favorite as int,
      sort: sort == freezed ? _value.sort : sort as int,
    ));
  }
}

/// @nodoc
abstract class _$GameEntityCopyWith<$Res> implements $GameEntityCopyWith<$Res> {
  factory _$GameEntityCopyWith(
          _GameEntity value, $Res Function(_GameEntity) then) =
      __$GameEntityCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String cname,
      String ename,
      @JsonKey(fromJson: decodeGameUrl, required: true) String gameUrl,
      int favorite,
      int sort});
}

/// @nodoc
class __$GameEntityCopyWithImpl<$Res> extends _$GameEntityCopyWithImpl<$Res>
    implements _$GameEntityCopyWith<$Res> {
  __$GameEntityCopyWithImpl(
      _GameEntity _value, $Res Function(_GameEntity) _then)
      : super(_value, (v) => _then(v as _GameEntity));

  @override
  _GameEntity get _value => super._value as _GameEntity;

  @override
  $Res call({
    Object id = freezed,
    Object cname = freezed,
    Object ename = freezed,
    Object gameUrl = freezed,
    Object favorite = freezed,
    Object sort = freezed,
  }) {
    return _then(_GameEntity(
      id: id == freezed ? _value.id : id as int,
      cname: cname == freezed ? _value.cname : cname as String,
      ename: ename == freezed ? _value.ename : ename as String,
      gameUrl: gameUrl == freezed ? _value.gameUrl : gameUrl as String,
      favorite: favorite == freezed ? _value.favorite : favorite as int,
      sort: sort == freezed ? _value.sort : sort as int,
    ));
  }
}

/// @nodoc
class _$_GameEntity implements _GameEntity {
  const _$_GameEntity(
      {@required this.id,
      this.cname = '??',
      this.ename = '??',
      @JsonKey(fromJson: decodeGameUrl, required: true) this.gameUrl,
      this.favorite = 0,
      this.sort = 0})
      : assert(id != null),
        assert(cname != null),
        assert(ename != null),
        assert(favorite != null),
        assert(sort != null);

  @override
  final int id;
  @JsonKey(defaultValue: '??')
  @override
  final String cname;
  @JsonKey(defaultValue: '??')
  @override
  final String ename;
  @override
  @JsonKey(fromJson: decodeGameUrl, required: true)
  final String gameUrl;
  @JsonKey(defaultValue: 0)
  @override
  final int favorite;
  @JsonKey(defaultValue: 0)
  @override
  final int sort;

  @override
  String toString() {
    return 'GameEntity(id: $id, cname: $cname, ename: $ename, gameUrl: $gameUrl, favorite: $favorite, sort: $sort)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GameEntity &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.cname, cname) ||
                const DeepCollectionEquality().equals(other.cname, cname)) &&
            (identical(other.ename, ename) ||
                const DeepCollectionEquality().equals(other.ename, ename)) &&
            (identical(other.gameUrl, gameUrl) ||
                const DeepCollectionEquality()
                    .equals(other.gameUrl, gameUrl)) &&
            (identical(other.favorite, favorite) ||
                const DeepCollectionEquality()
                    .equals(other.favorite, favorite)) &&
            (identical(other.sort, sort) ||
                const DeepCollectionEquality().equals(other.sort, sort)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(cname) ^
      const DeepCollectionEquality().hash(ename) ^
      const DeepCollectionEquality().hash(gameUrl) ^
      const DeepCollectionEquality().hash(favorite) ^
      const DeepCollectionEquality().hash(sort);

  @override
  _$GameEntityCopyWith<_GameEntity> get copyWith =>
      __$GameEntityCopyWithImpl<_GameEntity>(this, _$identity);
}

abstract class _GameEntity implements GameEntity {
  const factory _GameEntity(
      {@required int id,
      String cname,
      String ename,
      @JsonKey(fromJson: decodeGameUrl, required: true) String gameUrl,
      int favorite,
      int sort}) = _$_GameEntity;

  @override
  int get id;
  @override
  String get cname;
  @override
  String get ename;
  @override
  @JsonKey(fromJson: decodeGameUrl, required: true)
  String get gameUrl;
  @override
  int get favorite;
  @override
  int get sort;
  @override
  _$GameEntityCopyWith<_GameEntity> get copyWith;
}
