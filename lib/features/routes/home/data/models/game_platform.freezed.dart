// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'game_platform.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$GamePlatformTearOff {
  const _$GamePlatformTearOff();

// ignore: unused_element
  GamePlatformModel model(
      {@required
          int id,
      @JsonKey(name: 'class', fromJson: decodePlatformClassName)
          String className,
      @JsonKey(fromJson: decodePlatformChName)
          String ch,
      int cid,
      @required
          String site,
      String site2,
      @JsonKey(name: 'type', required: true)
          String category,
      int sort,
      String status,
      String favorite = '0'}) {
    return GamePlatformModel(
      id: id,
      className: className,
      ch: ch,
      cid: cid,
      site: site,
      site2: site2,
      category: category,
      sort: sort,
      status: status,
      favorite: favorite,
    );
  }

// ignore: unused_element
  GamePlatformEntity entity(
      {@required
      @HiveField(0)
          int id,
      @HiveField(1)
      @JsonKey(name: 'class', fromJson: decodePlatformClassName)
          String className,
      @HiveField(2)
      @JsonKey(fromJson: decodePlatformChName)
          String ch,
      @required
      @HiveField(3)
          String site,
      @HiveField(4)
      @JsonKey(name: 'type', required: true)
          String category,
      String favorite = '0'}) {
    return GamePlatformEntity(
      id: id,
      className: className,
      ch: ch,
      site: site,
      category: category,
      favorite: favorite,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $GamePlatform = _$GamePlatformTearOff();

/// @nodoc
mixin _$GamePlatform {
  int get id;
  @JsonKey(name: 'class', fromJson: decodePlatformClassName)
  String get className;
  @JsonKey(fromJson: decodePlatformChName)
  String get ch;
  String get site;
  @JsonKey(name: 'type', required: true)
  String get category;
  String get favorite;

  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result model(
            int id,
            @JsonKey(name: 'class', fromJson: decodePlatformClassName)
                String className,
            @JsonKey(fromJson: decodePlatformChName)
                String ch,
            int cid,
            String site,
            String site2,
            @JsonKey(name: 'type', required: true)
                String category,
            int sort,
            String status,
            String favorite),
    @required
        Result entity(
            @HiveField(0)
                int id,
            @HiveField(1)
            @JsonKey(name: 'class', fromJson: decodePlatformClassName)
                String className,
            @HiveField(2)
            @JsonKey(fromJson: decodePlatformChName)
                String ch,
            @HiveField(3)
                String site,
            @HiveField(4)
            @JsonKey(name: 'type', required: true)
                String category,
            String favorite),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result model(
        int id,
        @JsonKey(name: 'class', fromJson: decodePlatformClassName)
            String className,
        @JsonKey(fromJson: decodePlatformChName)
            String ch,
        int cid,
        String site,
        String site2,
        @JsonKey(name: 'type', required: true)
            String category,
        int sort,
        String status,
        String favorite),
    Result entity(
        @HiveField(0)
            int id,
        @HiveField(1)
        @JsonKey(name: 'class', fromJson: decodePlatformClassName)
            String className,
        @HiveField(2)
        @JsonKey(fromJson: decodePlatformChName)
            String ch,
        @HiveField(3)
            String site,
        @HiveField(4)
        @JsonKey(name: 'type', required: true)
            String category,
        String favorite),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result model(GamePlatformModel value),
    @required Result entity(GamePlatformEntity value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result model(GamePlatformModel value),
    Result entity(GamePlatformEntity value),
    @required Result orElse(),
  });

  $GamePlatformCopyWith<GamePlatform> get copyWith;
}

/// @nodoc
abstract class $GamePlatformCopyWith<$Res> {
  factory $GamePlatformCopyWith(
          GamePlatform value, $Res Function(GamePlatform) then) =
      _$GamePlatformCopyWithImpl<$Res>;
  $Res call(
      {int id,
      @JsonKey(name: 'class', fromJson: decodePlatformClassName)
          String className,
      @JsonKey(fromJson: decodePlatformChName)
          String ch,
      String site,
      @JsonKey(name: 'type', required: true)
          String category,
      String favorite});
}

/// @nodoc
class _$GamePlatformCopyWithImpl<$Res> implements $GamePlatformCopyWith<$Res> {
  _$GamePlatformCopyWithImpl(this._value, this._then);

  final GamePlatform _value;
  // ignore: unused_field
  final $Res Function(GamePlatform) _then;

  @override
  $Res call({
    Object id = freezed,
    Object className = freezed,
    Object ch = freezed,
    Object site = freezed,
    Object category = freezed,
    Object favorite = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as int,
      className: className == freezed ? _value.className : className as String,
      ch: ch == freezed ? _value.ch : ch as String,
      site: site == freezed ? _value.site : site as String,
      category: category == freezed ? _value.category : category as String,
      favorite: favorite == freezed ? _value.favorite : favorite as String,
    ));
  }
}

/// @nodoc
abstract class $GamePlatformModelCopyWith<$Res>
    implements $GamePlatformCopyWith<$Res> {
  factory $GamePlatformModelCopyWith(
          GamePlatformModel value, $Res Function(GamePlatformModel) then) =
      _$GamePlatformModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      @JsonKey(name: 'class', fromJson: decodePlatformClassName)
          String className,
      @JsonKey(fromJson: decodePlatformChName)
          String ch,
      int cid,
      String site,
      String site2,
      @JsonKey(name: 'type', required: true)
          String category,
      int sort,
      String status,
      String favorite});
}

/// @nodoc
class _$GamePlatformModelCopyWithImpl<$Res>
    extends _$GamePlatformCopyWithImpl<$Res>
    implements $GamePlatformModelCopyWith<$Res> {
  _$GamePlatformModelCopyWithImpl(
      GamePlatformModel _value, $Res Function(GamePlatformModel) _then)
      : super(_value, (v) => _then(v as GamePlatformModel));

  @override
  GamePlatformModel get _value => super._value as GamePlatformModel;

  @override
  $Res call({
    Object id = freezed,
    Object className = freezed,
    Object ch = freezed,
    Object cid = freezed,
    Object site = freezed,
    Object site2 = freezed,
    Object category = freezed,
    Object sort = freezed,
    Object status = freezed,
    Object favorite = freezed,
  }) {
    return _then(GamePlatformModel(
      id: id == freezed ? _value.id : id as int,
      className: className == freezed ? _value.className : className as String,
      ch: ch == freezed ? _value.ch : ch as String,
      cid: cid == freezed ? _value.cid : cid as int,
      site: site == freezed ? _value.site : site as String,
      site2: site2 == freezed ? _value.site2 : site2 as String,
      category: category == freezed ? _value.category : category as String,
      sort: sort == freezed ? _value.sort : sort as int,
      status: status == freezed ? _value.status : status as String,
      favorite: favorite == freezed ? _value.favorite : favorite as String,
    ));
  }
}

/// @nodoc
class _$GamePlatformModel implements GamePlatformModel {
  const _$GamePlatformModel(
      {@required this.id,
      @JsonKey(name: 'class', fromJson: decodePlatformClassName) this.className,
      @JsonKey(fromJson: decodePlatformChName) this.ch,
      this.cid,
      @required this.site,
      this.site2,
      @JsonKey(name: 'type', required: true) this.category,
      this.sort,
      this.status,
      this.favorite = '0'})
      : assert(id != null),
        assert(site != null),
        assert(favorite != null);

  @override
  final int id;
  @override
  @JsonKey(name: 'class', fromJson: decodePlatformClassName)
  final String className;
  @override
  @JsonKey(fromJson: decodePlatformChName)
  final String ch;
  @override
  final int cid;
  @override
  final String site;
  @override
  final String site2;
  @override
  @JsonKey(name: 'type', required: true)
  final String category;
  @override
  final int sort;
  @override
  final String status;
  @JsonKey(defaultValue: '0')
  @override
  final String favorite;

  @override
  String toString() {
    return 'GamePlatform.model(id: $id, className: $className, ch: $ch, cid: $cid, site: $site, site2: $site2, category: $category, sort: $sort, status: $status, favorite: $favorite)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GamePlatformModel &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.className, className) ||
                const DeepCollectionEquality()
                    .equals(other.className, className)) &&
            (identical(other.ch, ch) ||
                const DeepCollectionEquality().equals(other.ch, ch)) &&
            (identical(other.cid, cid) ||
                const DeepCollectionEquality().equals(other.cid, cid)) &&
            (identical(other.site, site) ||
                const DeepCollectionEquality().equals(other.site, site)) &&
            (identical(other.site2, site2) ||
                const DeepCollectionEquality().equals(other.site2, site2)) &&
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)) &&
            (identical(other.sort, sort) ||
                const DeepCollectionEquality().equals(other.sort, sort)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.favorite, favorite) ||
                const DeepCollectionEquality()
                    .equals(other.favorite, favorite)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(className) ^
      const DeepCollectionEquality().hash(ch) ^
      const DeepCollectionEquality().hash(cid) ^
      const DeepCollectionEquality().hash(site) ^
      const DeepCollectionEquality().hash(site2) ^
      const DeepCollectionEquality().hash(category) ^
      const DeepCollectionEquality().hash(sort) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(favorite);

  @override
  $GamePlatformModelCopyWith<GamePlatformModel> get copyWith =>
      _$GamePlatformModelCopyWithImpl<GamePlatformModel>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result model(
            int id,
            @JsonKey(name: 'class', fromJson: decodePlatformClassName)
                String className,
            @JsonKey(fromJson: decodePlatformChName)
                String ch,
            int cid,
            String site,
            String site2,
            @JsonKey(name: 'type', required: true)
                String category,
            int sort,
            String status,
            String favorite),
    @required
        Result entity(
            @HiveField(0)
                int id,
            @HiveField(1)
            @JsonKey(name: 'class', fromJson: decodePlatformClassName)
                String className,
            @HiveField(2)
            @JsonKey(fromJson: decodePlatformChName)
                String ch,
            @HiveField(3)
                String site,
            @HiveField(4)
            @JsonKey(name: 'type', required: true)
                String category,
            String favorite),
  }) {
    assert(model != null);
    assert(entity != null);
    return model(
        id, className, ch, cid, site, site2, category, sort, status, favorite);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result model(
        int id,
        @JsonKey(name: 'class', fromJson: decodePlatformClassName)
            String className,
        @JsonKey(fromJson: decodePlatformChName)
            String ch,
        int cid,
        String site,
        String site2,
        @JsonKey(name: 'type', required: true)
            String category,
        int sort,
        String status,
        String favorite),
    Result entity(
        @HiveField(0)
            int id,
        @HiveField(1)
        @JsonKey(name: 'class', fromJson: decodePlatformClassName)
            String className,
        @HiveField(2)
        @JsonKey(fromJson: decodePlatformChName)
            String ch,
        @HiveField(3)
            String site,
        @HiveField(4)
        @JsonKey(name: 'type', required: true)
            String category,
        String favorite),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (model != null) {
      return model(id, className, ch, cid, site, site2, category, sort, status,
          favorite);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result model(GamePlatformModel value),
    @required Result entity(GamePlatformEntity value),
  }) {
    assert(model != null);
    assert(entity != null);
    return model(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result model(GamePlatformModel value),
    Result entity(GamePlatformEntity value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (model != null) {
      return model(this);
    }
    return orElse();
  }
}

abstract class GamePlatformModel implements GamePlatform {
  const factory GamePlatformModel(
      {@required
          int id,
      @JsonKey(name: 'class', fromJson: decodePlatformClassName)
          String className,
      @JsonKey(fromJson: decodePlatformChName)
          String ch,
      int cid,
      @required
          String site,
      String site2,
      @JsonKey(name: 'type', required: true)
          String category,
      int sort,
      String status,
      String favorite}) = _$GamePlatformModel;

  @override
  int get id;
  @override
  @JsonKey(name: 'class', fromJson: decodePlatformClassName)
  String get className;
  @override
  @JsonKey(fromJson: decodePlatformChName)
  String get ch;
  int get cid;
  @override
  String get site;
  String get site2;
  @override
  @JsonKey(name: 'type', required: true)
  String get category;
  int get sort;
  String get status;
  @override
  String get favorite;
  @override
  $GamePlatformModelCopyWith<GamePlatformModel> get copyWith;
}

/// @nodoc
abstract class $GamePlatformEntityCopyWith<$Res>
    implements $GamePlatformCopyWith<$Res> {
  factory $GamePlatformEntityCopyWith(
          GamePlatformEntity value, $Res Function(GamePlatformEntity) then) =
      _$GamePlatformEntityCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0)
          int id,
      @HiveField(1)
      @JsonKey(name: 'class', fromJson: decodePlatformClassName)
          String className,
      @HiveField(2)
      @JsonKey(fromJson: decodePlatformChName)
          String ch,
      @HiveField(3)
          String site,
      @HiveField(4)
      @JsonKey(name: 'type', required: true)
          String category,
      String favorite});
}

/// @nodoc
class _$GamePlatformEntityCopyWithImpl<$Res>
    extends _$GamePlatformCopyWithImpl<$Res>
    implements $GamePlatformEntityCopyWith<$Res> {
  _$GamePlatformEntityCopyWithImpl(
      GamePlatformEntity _value, $Res Function(GamePlatformEntity) _then)
      : super(_value, (v) => _then(v as GamePlatformEntity));

  @override
  GamePlatformEntity get _value => super._value as GamePlatformEntity;

  @override
  $Res call({
    Object id = freezed,
    Object className = freezed,
    Object ch = freezed,
    Object site = freezed,
    Object category = freezed,
    Object favorite = freezed,
  }) {
    return _then(GamePlatformEntity(
      id: id == freezed ? _value.id : id as int,
      className: className == freezed ? _value.className : className as String,
      ch: ch == freezed ? _value.ch : ch as String,
      site: site == freezed ? _value.site : site as String,
      category: category == freezed ? _value.category : category as String,
      favorite: favorite == freezed ? _value.favorite : favorite as String,
    ));
  }
}

@HiveType(typeId: 104)
@Implements(DataOperator)

/// @nodoc
class _$GamePlatformEntity implements GamePlatformEntity {
  const _$GamePlatformEntity(
      {@required
      @HiveField(0)
          this.id,
      @HiveField(1)
      @JsonKey(name: 'class', fromJson: decodePlatformClassName)
          this.className,
      @HiveField(2)
      @JsonKey(fromJson: decodePlatformChName)
          this.ch,
      @required
      @HiveField(3)
          this.site,
      @HiveField(4)
      @JsonKey(name: 'type', required: true)
          this.category,
      this.favorite = '0'})
      : assert(id != null),
        assert(site != null),
        assert(favorite != null);

  @override
  @HiveField(0)
  final int id;
  @override
  @HiveField(1)
  @JsonKey(name: 'class', fromJson: decodePlatformClassName)
  final String className;
  @override
  @HiveField(2)
  @JsonKey(fromJson: decodePlatformChName)
  final String ch;
  @override
  @HiveField(3)
  final String site;
  @override
  @HiveField(4)
  @JsonKey(name: 'type', required: true)
  final String category;
  @JsonKey(defaultValue: '0')
  @override
  final String favorite;

  @override
  String toString() {
    return 'GamePlatform.entity(id: $id, className: $className, ch: $ch, site: $site, category: $category, favorite: $favorite)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GamePlatformEntity &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.className, className) ||
                const DeepCollectionEquality()
                    .equals(other.className, className)) &&
            (identical(other.ch, ch) ||
                const DeepCollectionEquality().equals(other.ch, ch)) &&
            (identical(other.site, site) ||
                const DeepCollectionEquality().equals(other.site, site)) &&
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)) &&
            (identical(other.favorite, favorite) ||
                const DeepCollectionEquality()
                    .equals(other.favorite, favorite)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(className) ^
      const DeepCollectionEquality().hash(ch) ^
      const DeepCollectionEquality().hash(site) ^
      const DeepCollectionEquality().hash(category) ^
      const DeepCollectionEquality().hash(favorite);

  @override
  $GamePlatformEntityCopyWith<GamePlatformEntity> get copyWith =>
      _$GamePlatformEntityCopyWithImpl<GamePlatformEntity>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result model(
            int id,
            @JsonKey(name: 'class', fromJson: decodePlatformClassName)
                String className,
            @JsonKey(fromJson: decodePlatformChName)
                String ch,
            int cid,
            String site,
            String site2,
            @JsonKey(name: 'type', required: true)
                String category,
            int sort,
            String status,
            String favorite),
    @required
        Result entity(
            @HiveField(0)
                int id,
            @HiveField(1)
            @JsonKey(name: 'class', fromJson: decodePlatformClassName)
                String className,
            @HiveField(2)
            @JsonKey(fromJson: decodePlatformChName)
                String ch,
            @HiveField(3)
                String site,
            @HiveField(4)
            @JsonKey(name: 'type', required: true)
                String category,
            String favorite),
  }) {
    assert(model != null);
    assert(entity != null);
    return entity(id, className, ch, site, category, favorite);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result model(
        int id,
        @JsonKey(name: 'class', fromJson: decodePlatformClassName)
            String className,
        @JsonKey(fromJson: decodePlatformChName)
            String ch,
        int cid,
        String site,
        String site2,
        @JsonKey(name: 'type', required: true)
            String category,
        int sort,
        String status,
        String favorite),
    Result entity(
        @HiveField(0)
            int id,
        @HiveField(1)
        @JsonKey(name: 'class', fromJson: decodePlatformClassName)
            String className,
        @HiveField(2)
        @JsonKey(fromJson: decodePlatformChName)
            String ch,
        @HiveField(3)
            String site,
        @HiveField(4)
        @JsonKey(name: 'type', required: true)
            String category,
        String favorite),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (entity != null) {
      return entity(id, className, ch, site, category, favorite);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result model(GamePlatformModel value),
    @required Result entity(GamePlatformEntity value),
  }) {
    assert(model != null);
    assert(entity != null);
    return entity(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result model(GamePlatformModel value),
    Result entity(GamePlatformEntity value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (entity != null) {
      return entity(this);
    }
    return orElse();
  }

  @override
  String operator [](String key) {
    return className.toString();
  }
}

abstract class GamePlatformEntity implements GamePlatform, DataOperator {
  const factory GamePlatformEntity(
      {@required
      @HiveField(0)
          int id,
      @HiveField(1)
      @JsonKey(name: 'class', fromJson: decodePlatformClassName)
          String className,
      @HiveField(2)
      @JsonKey(fromJson: decodePlatformChName)
          String ch,
      @required
      @HiveField(3)
          String site,
      @HiveField(4)
      @JsonKey(name: 'type', required: true)
          String category,
      String favorite}) = _$GamePlatformEntity;

  @override
  @HiveField(0)
  int get id;
  @override
  @HiveField(1)
  @JsonKey(name: 'class', fromJson: decodePlatformClassName)
  String get className;
  @override
  @HiveField(2)
  @JsonKey(fromJson: decodePlatformChName)
  String get ch;
  @override
  @HiveField(3)
  String get site;
  @override
  @HiveField(4)
  @JsonKey(name: 'type', required: true)
  String get category;
  @override
  String get favorite;
  @override
  $GamePlatformEntityCopyWith<GamePlatformEntity> get copyWith;
}
