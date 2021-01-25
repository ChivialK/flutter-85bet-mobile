// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'game_types.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$GameTypesTearOff {
  const _$GameTypesTearOff();

// ignore: unused_element
  _GameTypes call(
      {@JsonKey(name: 'category', fromJson: decodeGameCategoryModel)
          List<GameCategoryModel> categories,
      @JsonKey(name: 'list', fromJson: decodeGamePlatformModel)
          List<GamePlatform> platforms}) {
    return _GameTypes(
      categories: categories,
      platforms: platforms,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $GameTypes = _$GameTypesTearOff();

/// @nodoc
mixin _$GameTypes {
  @JsonKey(name: 'category', fromJson: decodeGameCategoryModel)
  List<GameCategoryModel> get categories;
  @JsonKey(name: 'list', fromJson: decodeGamePlatformModel)
  List<GamePlatform> get platforms;

  @JsonKey(ignore: true)
  $GameTypesCopyWith<GameTypes> get copyWith;
}

/// @nodoc
abstract class $GameTypesCopyWith<$Res> {
  factory $GameTypesCopyWith(GameTypes value, $Res Function(GameTypes) then) =
      _$GameTypesCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'category', fromJson: decodeGameCategoryModel)
          List<GameCategoryModel> categories,
      @JsonKey(name: 'list', fromJson: decodeGamePlatformModel)
          List<GamePlatform> platforms});
}

/// @nodoc
class _$GameTypesCopyWithImpl<$Res> implements $GameTypesCopyWith<$Res> {
  _$GameTypesCopyWithImpl(this._value, this._then);

  final GameTypes _value;
  // ignore: unused_field
  final $Res Function(GameTypes) _then;

  @override
  $Res call({
    Object categories = freezed,
    Object platforms = freezed,
  }) {
    return _then(_value.copyWith(
      categories: categories == freezed
          ? _value.categories
          : categories as List<GameCategoryModel>,
      platforms: platforms == freezed
          ? _value.platforms
          : platforms as List<GamePlatform>,
    ));
  }
}

/// @nodoc
abstract class _$GameTypesCopyWith<$Res> implements $GameTypesCopyWith<$Res> {
  factory _$GameTypesCopyWith(
          _GameTypes value, $Res Function(_GameTypes) then) =
      __$GameTypesCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'category', fromJson: decodeGameCategoryModel)
          List<GameCategoryModel> categories,
      @JsonKey(name: 'list', fromJson: decodeGamePlatformModel)
          List<GamePlatform> platforms});
}

/// @nodoc
class __$GameTypesCopyWithImpl<$Res> extends _$GameTypesCopyWithImpl<$Res>
    implements _$GameTypesCopyWith<$Res> {
  __$GameTypesCopyWithImpl(_GameTypes _value, $Res Function(_GameTypes) _then)
      : super(_value, (v) => _then(v as _GameTypes));

  @override
  _GameTypes get _value => super._value as _GameTypes;

  @override
  $Res call({
    Object categories = freezed,
    Object platforms = freezed,
  }) {
    return _then(_GameTypes(
      categories: categories == freezed
          ? _value.categories
          : categories as List<GameCategoryModel>,
      platforms: platforms == freezed
          ? _value.platforms
          : platforms as List<GamePlatform>,
    ));
  }
}

/// @nodoc
class _$_GameTypes implements _GameTypes {
  const _$_GameTypes(
      {@JsonKey(name: 'category', fromJson: decodeGameCategoryModel)
          this.categories,
      @JsonKey(name: 'list', fromJson: decodeGamePlatformModel)
          this.platforms});

  @override
  @JsonKey(name: 'category', fromJson: decodeGameCategoryModel)
  final List<GameCategoryModel> categories;
  @override
  @JsonKey(name: 'list', fromJson: decodeGamePlatformModel)
  final List<GamePlatform> platforms;

  @override
  String toString() {
    return 'GameTypes(categories: $categories, platforms: $platforms)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GameTypes &&
            (identical(other.categories, categories) ||
                const DeepCollectionEquality()
                    .equals(other.categories, categories)) &&
            (identical(other.platforms, platforms) ||
                const DeepCollectionEquality()
                    .equals(other.platforms, platforms)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(categories) ^
      const DeepCollectionEquality().hash(platforms);

  @JsonKey(ignore: true)
  @override
  _$GameTypesCopyWith<_GameTypes> get copyWith =>
      __$GameTypesCopyWithImpl<_GameTypes>(this, _$identity);
}

abstract class _GameTypes implements GameTypes {
  const factory _GameTypes(
      {@JsonKey(name: 'category', fromJson: decodeGameCategoryModel)
          List<GameCategoryModel> categories,
      @JsonKey(name: 'list', fromJson: decodeGamePlatformModel)
          List<GamePlatform> platforms}) = _$_GameTypes;

  @override
  @JsonKey(name: 'category', fromJson: decodeGameCategoryModel)
  List<GameCategoryModel> get categories;
  @override
  @JsonKey(name: 'list', fromJson: decodeGamePlatformModel)
  List<GamePlatform> get platforms;
  @override
  @JsonKey(ignore: true)
  _$GameTypesCopyWith<_GameTypes> get copyWith;
}
