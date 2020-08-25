// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'game_category_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$GameCategoryModelTearOff {
  const _$GameCategoryModelTearOff();

// ignore: unused_element
  _GameCategoryModel call(
      {@required @HiveField(0) String ch,
      @required @HiveField(1) String type,
      GameCategory info}) {
    return _GameCategoryModel(
      ch: ch,
      type: type,
      info: info,
    );
  }
}

// ignore: unused_element
const $GameCategoryModel = _$GameCategoryModelTearOff();

mixin _$GameCategoryModel {
  @HiveField(0)
  String get ch;
  @HiveField(1)
  String get type;
  GameCategory get info;

  $GameCategoryModelCopyWith<GameCategoryModel> get copyWith;
}

abstract class $GameCategoryModelCopyWith<$Res> {
  factory $GameCategoryModelCopyWith(
          GameCategoryModel value, $Res Function(GameCategoryModel) then) =
      _$GameCategoryModelCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) String ch, @HiveField(1) String type, GameCategory info});
}

class _$GameCategoryModelCopyWithImpl<$Res>
    implements $GameCategoryModelCopyWith<$Res> {
  _$GameCategoryModelCopyWithImpl(this._value, this._then);

  final GameCategoryModel _value;
  // ignore: unused_field
  final $Res Function(GameCategoryModel) _then;

  @override
  $Res call({
    Object ch = freezed,
    Object type = freezed,
    Object info = freezed,
  }) {
    return _then(_value.copyWith(
      ch: ch == freezed ? _value.ch : ch as String,
      type: type == freezed ? _value.type : type as String,
      info: info == freezed ? _value.info : info as GameCategory,
    ));
  }
}

abstract class _$GameCategoryModelCopyWith<$Res>
    implements $GameCategoryModelCopyWith<$Res> {
  factory _$GameCategoryModelCopyWith(
          _GameCategoryModel value, $Res Function(_GameCategoryModel) then) =
      __$GameCategoryModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) String ch, @HiveField(1) String type, GameCategory info});
}

class __$GameCategoryModelCopyWithImpl<$Res>
    extends _$GameCategoryModelCopyWithImpl<$Res>
    implements _$GameCategoryModelCopyWith<$Res> {
  __$GameCategoryModelCopyWithImpl(
      _GameCategoryModel _value, $Res Function(_GameCategoryModel) _then)
      : super(_value, (v) => _then(v as _GameCategoryModel));

  @override
  _GameCategoryModel get _value => super._value as _GameCategoryModel;

  @override
  $Res call({
    Object ch = freezed,
    Object type = freezed,
    Object info = freezed,
  }) {
    return _then(_GameCategoryModel(
      ch: ch == freezed ? _value.ch : ch as String,
      type: type == freezed ? _value.type : type as String,
      info: info == freezed ? _value.info : info as GameCategory,
    ));
  }
}

@HiveType(typeId: 103)
@Implements(DataOperator)
class _$_GameCategoryModel implements _GameCategoryModel {
  const _$_GameCategoryModel(
      {@required @HiveField(0) this.ch,
      @required @HiveField(1) this.type,
      this.info})
      : assert(ch != null),
        assert(type != null);

  @override
  @HiveField(0)
  final String ch;
  @override
  @HiveField(1)
  final String type;
  @override
  final GameCategory info;

  @override
  String toString() {
    return 'GameCategoryModel(ch: $ch, type: $type, info: $info)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GameCategoryModel &&
            (identical(other.ch, ch) ||
                const DeepCollectionEquality().equals(other.ch, ch)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.info, info) ||
                const DeepCollectionEquality().equals(other.info, info)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(ch) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(info);

  @override
  _$GameCategoryModelCopyWith<_GameCategoryModel> get copyWith =>
      __$GameCategoryModelCopyWithImpl<_GameCategoryModel>(this, _$identity);

  @override
  String operator [](String key) {
    return type.toString();
  }
}

abstract class _GameCategoryModel implements GameCategoryModel, DataOperator {
  const factory _GameCategoryModel(
      {@required @HiveField(0) String ch,
      @required @HiveField(1) String type,
      GameCategory info}) = _$_GameCategoryModel;

  @override
  @HiveField(0)
  String get ch;
  @override
  @HiveField(1)
  String get type;
  @override
  GameCategory get info;
  @override
  _$GameCategoryModelCopyWith<_GameCategoryModel> get copyWith;
}
