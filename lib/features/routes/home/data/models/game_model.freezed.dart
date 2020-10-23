// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'game_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$GameModelTearOff {
  const _$GameModelTearOff();

// ignore: unused_element
  _GameModel call(
      {@required int id,
      @required String category,
      @required String platform,
      @JsonKey(name: 'gameid') String gameId,
      @required String cname,
      int favorite = 0,
      int sort = 0}) {
    return _GameModel(
      id: id,
      category: category,
      platform: platform,
      gameId: gameId,
      cname: cname,
      favorite: favorite,
      sort: sort,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $GameModel = _$GameModelTearOff();

/// @nodoc
mixin _$GameModel {
  int get id;
  String get category;
  String get platform;
  @JsonKey(name: 'gameid')
  String get gameId;
  String get cname;
  int get favorite;
  int get sort;

  $GameModelCopyWith<GameModel> get copyWith;
}

/// @nodoc
abstract class $GameModelCopyWith<$Res> {
  factory $GameModelCopyWith(GameModel value, $Res Function(GameModel) then) =
      _$GameModelCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String category,
      String platform,
      @JsonKey(name: 'gameid') String gameId,
      String cname,
      int favorite,
      int sort});
}

/// @nodoc
class _$GameModelCopyWithImpl<$Res> implements $GameModelCopyWith<$Res> {
  _$GameModelCopyWithImpl(this._value, this._then);

  final GameModel _value;
  // ignore: unused_field
  final $Res Function(GameModel) _then;

  @override
  $Res call({
    Object id = freezed,
    Object category = freezed,
    Object platform = freezed,
    Object gameId = freezed,
    Object cname = freezed,
    Object favorite = freezed,
    Object sort = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as int,
      category: category == freezed ? _value.category : category as String,
      platform: platform == freezed ? _value.platform : platform as String,
      gameId: gameId == freezed ? _value.gameId : gameId as String,
      cname: cname == freezed ? _value.cname : cname as String,
      favorite: favorite == freezed ? _value.favorite : favorite as int,
      sort: sort == freezed ? _value.sort : sort as int,
    ));
  }
}

/// @nodoc
abstract class _$GameModelCopyWith<$Res> implements $GameModelCopyWith<$Res> {
  factory _$GameModelCopyWith(
          _GameModel value, $Res Function(_GameModel) then) =
      __$GameModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String category,
      String platform,
      @JsonKey(name: 'gameid') String gameId,
      String cname,
      int favorite,
      int sort});
}

/// @nodoc
class __$GameModelCopyWithImpl<$Res> extends _$GameModelCopyWithImpl<$Res>
    implements _$GameModelCopyWith<$Res> {
  __$GameModelCopyWithImpl(_GameModel _value, $Res Function(_GameModel) _then)
      : super(_value, (v) => _then(v as _GameModel));

  @override
  _GameModel get _value => super._value as _GameModel;

  @override
  $Res call({
    Object id = freezed,
    Object category = freezed,
    Object platform = freezed,
    Object gameId = freezed,
    Object cname = freezed,
    Object favorite = freezed,
    Object sort = freezed,
  }) {
    return _then(_GameModel(
      id: id == freezed ? _value.id : id as int,
      category: category == freezed ? _value.category : category as String,
      platform: platform == freezed ? _value.platform : platform as String,
      gameId: gameId == freezed ? _value.gameId : gameId as String,
      cname: cname == freezed ? _value.cname : cname as String,
      favorite: favorite == freezed ? _value.favorite : favorite as int,
      sort: sort == freezed ? _value.sort : sort as int,
    ));
  }
}

/// @nodoc
class _$_GameModel implements _GameModel {
  const _$_GameModel(
      {@required this.id,
      @required this.category,
      @required this.platform,
      @JsonKey(name: 'gameid') this.gameId,
      @required this.cname,
      this.favorite = 0,
      this.sort = 0})
      : assert(id != null),
        assert(category != null),
        assert(platform != null),
        assert(cname != null),
        assert(favorite != null),
        assert(sort != null);

  @override
  final int id;
  @override
  final String category;
  @override
  final String platform;
  @override
  @JsonKey(name: 'gameid')
  final String gameId;
  @override
  final String cname;
  @JsonKey(defaultValue: 0)
  @override
  final int favorite;
  @JsonKey(defaultValue: 0)
  @override
  final int sort;

  @override
  String toString() {
    return 'GameModel(id: $id, category: $category, platform: $platform, gameId: $gameId, cname: $cname, favorite: $favorite, sort: $sort)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GameModel &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)) &&
            (identical(other.platform, platform) ||
                const DeepCollectionEquality()
                    .equals(other.platform, platform)) &&
            (identical(other.gameId, gameId) ||
                const DeepCollectionEquality().equals(other.gameId, gameId)) &&
            (identical(other.cname, cname) ||
                const DeepCollectionEquality().equals(other.cname, cname)) &&
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
      const DeepCollectionEquality().hash(category) ^
      const DeepCollectionEquality().hash(platform) ^
      const DeepCollectionEquality().hash(gameId) ^
      const DeepCollectionEquality().hash(cname) ^
      const DeepCollectionEquality().hash(favorite) ^
      const DeepCollectionEquality().hash(sort);

  @override
  _$GameModelCopyWith<_GameModel> get copyWith =>
      __$GameModelCopyWithImpl<_GameModel>(this, _$identity);
}

abstract class _GameModel implements GameModel {
  const factory _GameModel(
      {@required int id,
      @required String category,
      @required String platform,
      @JsonKey(name: 'gameid') String gameId,
      @required String cname,
      int favorite,
      int sort}) = _$_GameModel;

  @override
  int get id;
  @override
  String get category;
  @override
  String get platform;
  @override
  @JsonKey(name: 'gameid')
  String get gameId;
  @override
  String get cname;
  @override
  int get favorite;
  @override
  int get sort;
  @override
  _$GameModelCopyWith<_GameModel> get copyWith;
}
