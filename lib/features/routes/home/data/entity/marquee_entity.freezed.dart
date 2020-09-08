// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'marquee_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$MarqueeEntityTearOff {
  const _$MarqueeEntityTearOff();

// ignore: unused_element
  _MarqueeEntity call(
      {@required @HiveField(0) int id,
      @required @HiveField(1) String content,
      @required @HiveField(2) String url}) {
    return _MarqueeEntity(
      id: id,
      content: content,
      url: url,
    );
  }
}

// ignore: unused_element
const $MarqueeEntity = _$MarqueeEntityTearOff();

mixin _$MarqueeEntity {
  @HiveField(0)
  int get id;
  @HiveField(1)
  String get content;
  @HiveField(2)
  String get url;

  $MarqueeEntityCopyWith<MarqueeEntity> get copyWith;
}

abstract class $MarqueeEntityCopyWith<$Res> {
  factory $MarqueeEntityCopyWith(
          MarqueeEntity value, $Res Function(MarqueeEntity) then) =
      _$MarqueeEntityCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String content,
      @HiveField(2) String url});
}

class _$MarqueeEntityCopyWithImpl<$Res>
    implements $MarqueeEntityCopyWith<$Res> {
  _$MarqueeEntityCopyWithImpl(this._value, this._then);

  final MarqueeEntity _value;
  // ignore: unused_field
  final $Res Function(MarqueeEntity) _then;

  @override
  $Res call({
    Object id = freezed,
    Object content = freezed,
    Object url = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as int,
      content: content == freezed ? _value.content : content as String,
      url: url == freezed ? _value.url : url as String,
    ));
  }
}

abstract class _$MarqueeEntityCopyWith<$Res>
    implements $MarqueeEntityCopyWith<$Res> {
  factory _$MarqueeEntityCopyWith(
          _MarqueeEntity value, $Res Function(_MarqueeEntity) then) =
      __$MarqueeEntityCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String content,
      @HiveField(2) String url});
}

class __$MarqueeEntityCopyWithImpl<$Res>
    extends _$MarqueeEntityCopyWithImpl<$Res>
    implements _$MarqueeEntityCopyWith<$Res> {
  __$MarqueeEntityCopyWithImpl(
      _MarqueeEntity _value, $Res Function(_MarqueeEntity) _then)
      : super(_value, (v) => _then(v as _MarqueeEntity));

  @override
  _MarqueeEntity get _value => super._value as _MarqueeEntity;

  @override
  $Res call({
    Object id = freezed,
    Object content = freezed,
    Object url = freezed,
  }) {
    return _then(_MarqueeEntity(
      id: id == freezed ? _value.id : id as int,
      content: content == freezed ? _value.content : content as String,
      url: url == freezed ? _value.url : url as String,
    ));
  }
}

@HiveType(typeId: 102)
@Implements(DataOperator)
class _$_MarqueeEntity implements _MarqueeEntity {
  const _$_MarqueeEntity(
      {@required @HiveField(0) this.id,
      @required @HiveField(1) this.content,
      @required @HiveField(2) this.url})
      : assert(id != null),
        assert(content != null),
        assert(url != null);

  @override
  @HiveField(0)
  final int id;
  @override
  @HiveField(1)
  final String content;
  @override
  @HiveField(2)
  final String url;

  @override
  String toString() {
    return 'MarqueeEntity(id: $id, content: $content, url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MarqueeEntity &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.content, content) ||
                const DeepCollectionEquality()
                    .equals(other.content, content)) &&
            (identical(other.url, url) ||
                const DeepCollectionEquality().equals(other.url, url)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(content) ^
      const DeepCollectionEquality().hash(url);

  @override
  _$MarqueeEntityCopyWith<_MarqueeEntity> get copyWith =>
      __$MarqueeEntityCopyWithImpl<_MarqueeEntity>(this, _$identity);

  @override
  String operator [](String key) {
    return id.toString();
  }
}

abstract class _MarqueeEntity implements MarqueeEntity, DataOperator {
  const factory _MarqueeEntity(
      {@required @HiveField(0) int id,
      @required @HiveField(1) String content,
      @required @HiveField(2) String url}) = _$_MarqueeEntity;

  @override
  @HiveField(0)
  int get id;
  @override
  @HiveField(1)
  String get content;
  @override
  @HiveField(2)
  String get url;
  @override
  _$MarqueeEntityCopyWith<_MarqueeEntity> get copyWith;
}
