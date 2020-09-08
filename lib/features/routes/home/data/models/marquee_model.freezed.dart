// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'marquee_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$MarqueeModelTearOff {
  const _$MarqueeModelTearOff();

// ignore: unused_element
  _MarqueeModel call(
      {@required int id,
      @JsonKey(name: 'content_cn') String content,
      @required String url,
      @JsonKey(name: 'created_at', required: true) String createdAt,
      @JsonKey(name: 'updated_at', required: true) String updatedAt,
      @required String showDate}) {
    return _MarqueeModel(
      id: id,
      content: content,
      url: url,
      createdAt: createdAt,
      updatedAt: updatedAt,
      showDate: showDate,
    );
  }
}

// ignore: unused_element
const $MarqueeModel = _$MarqueeModelTearOff();

mixin _$MarqueeModel {
  int get id;
  @JsonKey(name: 'content_cn')
  String get content;
  String get url;
  @JsonKey(name: 'created_at', required: true)
  String get createdAt;
  @JsonKey(name: 'updated_at', required: true)
  String get updatedAt;
  String get showDate;

  $MarqueeModelCopyWith<MarqueeModel> get copyWith;
}

abstract class $MarqueeModelCopyWith<$Res> {
  factory $MarqueeModelCopyWith(
          MarqueeModel value, $Res Function(MarqueeModel) then) =
      _$MarqueeModelCopyWithImpl<$Res>;
  $Res call(
      {int id,
      @JsonKey(name: 'content_cn') String content,
      String url,
      @JsonKey(name: 'created_at', required: true) String createdAt,
      @JsonKey(name: 'updated_at', required: true) String updatedAt,
      String showDate});
}

class _$MarqueeModelCopyWithImpl<$Res> implements $MarqueeModelCopyWith<$Res> {
  _$MarqueeModelCopyWithImpl(this._value, this._then);

  final MarqueeModel _value;
  // ignore: unused_field
  final $Res Function(MarqueeModel) _then;

  @override
  $Res call({
    Object id = freezed,
    Object content = freezed,
    Object url = freezed,
    Object createdAt = freezed,
    Object updatedAt = freezed,
    Object showDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as int,
      content: content == freezed ? _value.content : content as String,
      url: url == freezed ? _value.url : url as String,
      createdAt: createdAt == freezed ? _value.createdAt : createdAt as String,
      updatedAt: updatedAt == freezed ? _value.updatedAt : updatedAt as String,
      showDate: showDate == freezed ? _value.showDate : showDate as String,
    ));
  }
}

abstract class _$MarqueeModelCopyWith<$Res>
    implements $MarqueeModelCopyWith<$Res> {
  factory _$MarqueeModelCopyWith(
          _MarqueeModel value, $Res Function(_MarqueeModel) then) =
      __$MarqueeModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      @JsonKey(name: 'content_cn') String content,
      String url,
      @JsonKey(name: 'created_at', required: true) String createdAt,
      @JsonKey(name: 'updated_at', required: true) String updatedAt,
      String showDate});
}

class __$MarqueeModelCopyWithImpl<$Res> extends _$MarqueeModelCopyWithImpl<$Res>
    implements _$MarqueeModelCopyWith<$Res> {
  __$MarqueeModelCopyWithImpl(
      _MarqueeModel _value, $Res Function(_MarqueeModel) _then)
      : super(_value, (v) => _then(v as _MarqueeModel));

  @override
  _MarqueeModel get _value => super._value as _MarqueeModel;

  @override
  $Res call({
    Object id = freezed,
    Object content = freezed,
    Object url = freezed,
    Object createdAt = freezed,
    Object updatedAt = freezed,
    Object showDate = freezed,
  }) {
    return _then(_MarqueeModel(
      id: id == freezed ? _value.id : id as int,
      content: content == freezed ? _value.content : content as String,
      url: url == freezed ? _value.url : url as String,
      createdAt: createdAt == freezed ? _value.createdAt : createdAt as String,
      updatedAt: updatedAt == freezed ? _value.updatedAt : updatedAt as String,
      showDate: showDate == freezed ? _value.showDate : showDate as String,
    ));
  }
}

class _$_MarqueeModel implements _MarqueeModel {
  const _$_MarqueeModel(
      {@required this.id,
      @JsonKey(name: 'content_cn') this.content,
      @required this.url,
      @JsonKey(name: 'created_at', required: true) this.createdAt,
      @JsonKey(name: 'updated_at', required: true) this.updatedAt,
      @required this.showDate})
      : assert(id != null),
        assert(url != null),
        assert(showDate != null);

  @override
  final int id;
  @override
  @JsonKey(name: 'content_cn')
  final String content;
  @override
  final String url;
  @override
  @JsonKey(name: 'created_at', required: true)
  final String createdAt;
  @override
  @JsonKey(name: 'updated_at', required: true)
  final String updatedAt;
  @override
  final String showDate;

  @override
  String toString() {
    return 'MarqueeModel(id: $id, content: $content, url: $url, createdAt: $createdAt, updatedAt: $updatedAt, showDate: $showDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MarqueeModel &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.content, content) ||
                const DeepCollectionEquality()
                    .equals(other.content, content)) &&
            (identical(other.url, url) ||
                const DeepCollectionEquality().equals(other.url, url)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.updatedAt, updatedAt) ||
                const DeepCollectionEquality()
                    .equals(other.updatedAt, updatedAt)) &&
            (identical(other.showDate, showDate) ||
                const DeepCollectionEquality()
                    .equals(other.showDate, showDate)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(content) ^
      const DeepCollectionEquality().hash(url) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(updatedAt) ^
      const DeepCollectionEquality().hash(showDate);

  @override
  _$MarqueeModelCopyWith<_MarqueeModel> get copyWith =>
      __$MarqueeModelCopyWithImpl<_MarqueeModel>(this, _$identity);
}

abstract class _MarqueeModel implements MarqueeModel {
  const factory _MarqueeModel(
      {@required int id,
      @JsonKey(name: 'content_cn') String content,
      @required String url,
      @JsonKey(name: 'created_at', required: true) String createdAt,
      @JsonKey(name: 'updated_at', required: true) String updatedAt,
      @required String showDate}) = _$_MarqueeModel;

  @override
  int get id;
  @override
  @JsonKey(name: 'content_cn')
  String get content;
  @override
  String get url;
  @override
  @JsonKey(name: 'created_at', required: true)
  String get createdAt;
  @override
  @JsonKey(name: 'updated_at', required: true)
  String get updatedAt;
  @override
  String get showDate;
  @override
  _$MarqueeModelCopyWith<_MarqueeModel> get copyWith;
}
