// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'promo_freezed.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
PromoModel _$PromoModelFromJson(Map<String, dynamic> json) {
  return _PromoModel.fromJson(json);
}

class _$PromoModelTearOff {
  const _$PromoModelTearOff();

// ignore: unused_element
  _PromoModel call(
      {@required int id,
      @JsonKey(name: 'post_category_id') int postCategoryId,
      @required String name,
      @required String banner,
      @JsonKey(name: 'banner_mobile') String bannerMobile,
      @JsonKey(name: 'text_content') String textContent,
      @JsonKey(name: 'place_content') String placeContent,
      @JsonKey(name: 'apply_content') String applyContent,
      @JsonKey(name: 'rule_content') String ruleContent,
      @JsonKey(name: 'act_time') String actTime,
      @JsonKey(name: 'only_table') String onlyTable,
      @required String top,
      @required String status,
      @required int sort,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'updated_at') String updatedAt,
      @required String categoryStr}) {
    return _PromoModel(
      id: id,
      postCategoryId: postCategoryId,
      name: name,
      banner: banner,
      bannerMobile: bannerMobile,
      textContent: textContent,
      placeContent: placeContent,
      applyContent: applyContent,
      ruleContent: ruleContent,
      actTime: actTime,
      onlyTable: onlyTable,
      top: top,
      status: status,
      sort: sort,
      createdAt: createdAt,
      updatedAt: updatedAt,
      categoryStr: categoryStr,
    );
  }
}

// ignore: unused_element
const $PromoModel = _$PromoModelTearOff();

mixin _$PromoModel {
  int get id;
  @JsonKey(name: 'post_category_id')
  int get postCategoryId;
  String get name;
  String get banner;
  @JsonKey(name: 'banner_mobile')
  String get bannerMobile;
  @JsonKey(name: 'text_content')
  String get textContent;
  @JsonKey(name: 'place_content')
  String get placeContent;
  @JsonKey(name: 'apply_content')
  String get applyContent;
  @JsonKey(name: 'rule_content')
  String get ruleContent;
  @JsonKey(name: 'act_time')
  String get actTime;
  @JsonKey(name: 'only_table')
  String get onlyTable;
  String get top;
  String get status;
  int get sort;
  @JsonKey(name: 'created_at')
  String get createdAt;
  @JsonKey(name: 'updated_at')
  String get updatedAt;
  String get categoryStr;

  Map<String, dynamic> toJson();
  $PromoModelCopyWith<PromoModel> get copyWith;
}

abstract class $PromoModelCopyWith<$Res> {
  factory $PromoModelCopyWith(
          PromoModel value, $Res Function(PromoModel) then) =
      _$PromoModelCopyWithImpl<$Res>;
  $Res call(
      {int id,
      @JsonKey(name: 'post_category_id') int postCategoryId,
      String name,
      String banner,
      @JsonKey(name: 'banner_mobile') String bannerMobile,
      @JsonKey(name: 'text_content') String textContent,
      @JsonKey(name: 'place_content') String placeContent,
      @JsonKey(name: 'apply_content') String applyContent,
      @JsonKey(name: 'rule_content') String ruleContent,
      @JsonKey(name: 'act_time') String actTime,
      @JsonKey(name: 'only_table') String onlyTable,
      String top,
      String status,
      int sort,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'updated_at') String updatedAt,
      String categoryStr});
}

class _$PromoModelCopyWithImpl<$Res> implements $PromoModelCopyWith<$Res> {
  _$PromoModelCopyWithImpl(this._value, this._then);

  final PromoModel _value;
  // ignore: unused_field
  final $Res Function(PromoModel) _then;

  @override
  $Res call({
    Object id = freezed,
    Object postCategoryId = freezed,
    Object name = freezed,
    Object banner = freezed,
    Object bannerMobile = freezed,
    Object textContent = freezed,
    Object placeContent = freezed,
    Object applyContent = freezed,
    Object ruleContent = freezed,
    Object actTime = freezed,
    Object onlyTable = freezed,
    Object top = freezed,
    Object status = freezed,
    Object sort = freezed,
    Object createdAt = freezed,
    Object updatedAt = freezed,
    Object categoryStr = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as int,
      postCategoryId: postCategoryId == freezed
          ? _value.postCategoryId
          : postCategoryId as int,
      name: name == freezed ? _value.name : name as String,
      banner: banner == freezed ? _value.banner : banner as String,
      bannerMobile: bannerMobile == freezed
          ? _value.bannerMobile
          : bannerMobile as String,
      textContent:
          textContent == freezed ? _value.textContent : textContent as String,
      placeContent: placeContent == freezed
          ? _value.placeContent
          : placeContent as String,
      applyContent: applyContent == freezed
          ? _value.applyContent
          : applyContent as String,
      ruleContent:
          ruleContent == freezed ? _value.ruleContent : ruleContent as String,
      actTime: actTime == freezed ? _value.actTime : actTime as String,
      onlyTable: onlyTable == freezed ? _value.onlyTable : onlyTable as String,
      top: top == freezed ? _value.top : top as String,
      status: status == freezed ? _value.status : status as String,
      sort: sort == freezed ? _value.sort : sort as int,
      createdAt: createdAt == freezed ? _value.createdAt : createdAt as String,
      updatedAt: updatedAt == freezed ? _value.updatedAt : updatedAt as String,
      categoryStr:
          categoryStr == freezed ? _value.categoryStr : categoryStr as String,
    ));
  }
}

abstract class _$PromoModelCopyWith<$Res> implements $PromoModelCopyWith<$Res> {
  factory _$PromoModelCopyWith(
          _PromoModel value, $Res Function(_PromoModel) then) =
      __$PromoModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      @JsonKey(name: 'post_category_id') int postCategoryId,
      String name,
      String banner,
      @JsonKey(name: 'banner_mobile') String bannerMobile,
      @JsonKey(name: 'text_content') String textContent,
      @JsonKey(name: 'place_content') String placeContent,
      @JsonKey(name: 'apply_content') String applyContent,
      @JsonKey(name: 'rule_content') String ruleContent,
      @JsonKey(name: 'act_time') String actTime,
      @JsonKey(name: 'only_table') String onlyTable,
      String top,
      String status,
      int sort,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'updated_at') String updatedAt,
      String categoryStr});
}

class __$PromoModelCopyWithImpl<$Res> extends _$PromoModelCopyWithImpl<$Res>
    implements _$PromoModelCopyWith<$Res> {
  __$PromoModelCopyWithImpl(
      _PromoModel _value, $Res Function(_PromoModel) _then)
      : super(_value, (v) => _then(v as _PromoModel));

  @override
  _PromoModel get _value => super._value as _PromoModel;

  @override
  $Res call({
    Object id = freezed,
    Object postCategoryId = freezed,
    Object name = freezed,
    Object banner = freezed,
    Object bannerMobile = freezed,
    Object textContent = freezed,
    Object placeContent = freezed,
    Object applyContent = freezed,
    Object ruleContent = freezed,
    Object actTime = freezed,
    Object onlyTable = freezed,
    Object top = freezed,
    Object status = freezed,
    Object sort = freezed,
    Object createdAt = freezed,
    Object updatedAt = freezed,
    Object categoryStr = freezed,
  }) {
    return _then(_PromoModel(
      id: id == freezed ? _value.id : id as int,
      postCategoryId: postCategoryId == freezed
          ? _value.postCategoryId
          : postCategoryId as int,
      name: name == freezed ? _value.name : name as String,
      banner: banner == freezed ? _value.banner : banner as String,
      bannerMobile: bannerMobile == freezed
          ? _value.bannerMobile
          : bannerMobile as String,
      textContent:
          textContent == freezed ? _value.textContent : textContent as String,
      placeContent: placeContent == freezed
          ? _value.placeContent
          : placeContent as String,
      applyContent: applyContent == freezed
          ? _value.applyContent
          : applyContent as String,
      ruleContent:
          ruleContent == freezed ? _value.ruleContent : ruleContent as String,
      actTime: actTime == freezed ? _value.actTime : actTime as String,
      onlyTable: onlyTable == freezed ? _value.onlyTable : onlyTable as String,
      top: top == freezed ? _value.top : top as String,
      status: status == freezed ? _value.status : status as String,
      sort: sort == freezed ? _value.sort : sort as int,
      createdAt: createdAt == freezed ? _value.createdAt : createdAt as String,
      updatedAt: updatedAt == freezed ? _value.updatedAt : updatedAt as String,
      categoryStr:
          categoryStr == freezed ? _value.categoryStr : categoryStr as String,
    ));
  }
}

@JsonSerializable()
class _$_PromoModel implements _PromoModel {
  const _$_PromoModel(
      {@required this.id,
      @JsonKey(name: 'post_category_id') this.postCategoryId,
      @required this.name,
      @required this.banner,
      @JsonKey(name: 'banner_mobile') this.bannerMobile,
      @JsonKey(name: 'text_content') this.textContent,
      @JsonKey(name: 'place_content') this.placeContent,
      @JsonKey(name: 'apply_content') this.applyContent,
      @JsonKey(name: 'rule_content') this.ruleContent,
      @JsonKey(name: 'act_time') this.actTime,
      @JsonKey(name: 'only_table') this.onlyTable,
      @required this.top,
      @required this.status,
      @required this.sort,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt,
      @required this.categoryStr})
      : assert(id != null),
        assert(name != null),
        assert(banner != null),
        assert(top != null),
        assert(status != null),
        assert(sort != null),
        assert(categoryStr != null);

  factory _$_PromoModel.fromJson(Map<String, dynamic> json) =>
      _$_$_PromoModelFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'post_category_id')
  final int postCategoryId;
  @override
  final String name;
  @override
  final String banner;
  @override
  @JsonKey(name: 'banner_mobile')
  final String bannerMobile;
  @override
  @JsonKey(name: 'text_content')
  final String textContent;
  @override
  @JsonKey(name: 'place_content')
  final String placeContent;
  @override
  @JsonKey(name: 'apply_content')
  final String applyContent;
  @override
  @JsonKey(name: 'rule_content')
  final String ruleContent;
  @override
  @JsonKey(name: 'act_time')
  final String actTime;
  @override
  @JsonKey(name: 'only_table')
  final String onlyTable;
  @override
  final String top;
  @override
  final String status;
  @override
  final int sort;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String updatedAt;
  @override
  final String categoryStr;

  @override
  String toString() {
    return 'PromoModel(id: $id, postCategoryId: $postCategoryId, name: $name, banner: $banner, bannerMobile: $bannerMobile, textContent: $textContent, placeContent: $placeContent, applyContent: $applyContent, ruleContent: $ruleContent, actTime: $actTime, onlyTable: $onlyTable, top: $top, status: $status, sort: $sort, createdAt: $createdAt, updatedAt: $updatedAt, categoryStr: $categoryStr)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PromoModel &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.postCategoryId, postCategoryId) ||
                const DeepCollectionEquality()
                    .equals(other.postCategoryId, postCategoryId)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.banner, banner) ||
                const DeepCollectionEquality().equals(other.banner, banner)) &&
            (identical(other.bannerMobile, bannerMobile) ||
                const DeepCollectionEquality()
                    .equals(other.bannerMobile, bannerMobile)) &&
            (identical(other.textContent, textContent) ||
                const DeepCollectionEquality()
                    .equals(other.textContent, textContent)) &&
            (identical(other.placeContent, placeContent) ||
                const DeepCollectionEquality()
                    .equals(other.placeContent, placeContent)) &&
            (identical(other.applyContent, applyContent) ||
                const DeepCollectionEquality()
                    .equals(other.applyContent, applyContent)) &&
            (identical(other.ruleContent, ruleContent) ||
                const DeepCollectionEquality()
                    .equals(other.ruleContent, ruleContent)) &&
            (identical(other.actTime, actTime) ||
                const DeepCollectionEquality()
                    .equals(other.actTime, actTime)) &&
            (identical(other.onlyTable, onlyTable) ||
                const DeepCollectionEquality()
                    .equals(other.onlyTable, onlyTable)) &&
            (identical(other.top, top) ||
                const DeepCollectionEquality().equals(other.top, top)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.sort, sort) ||
                const DeepCollectionEquality().equals(other.sort, sort)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.updatedAt, updatedAt) ||
                const DeepCollectionEquality()
                    .equals(other.updatedAt, updatedAt)) &&
            (identical(other.categoryStr, categoryStr) ||
                const DeepCollectionEquality()
                    .equals(other.categoryStr, categoryStr)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(postCategoryId) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(banner) ^
      const DeepCollectionEquality().hash(bannerMobile) ^
      const DeepCollectionEquality().hash(textContent) ^
      const DeepCollectionEquality().hash(placeContent) ^
      const DeepCollectionEquality().hash(applyContent) ^
      const DeepCollectionEquality().hash(ruleContent) ^
      const DeepCollectionEquality().hash(actTime) ^
      const DeepCollectionEquality().hash(onlyTable) ^
      const DeepCollectionEquality().hash(top) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(sort) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(updatedAt) ^
      const DeepCollectionEquality().hash(categoryStr);

  @override
  _$PromoModelCopyWith<_PromoModel> get copyWith =>
      __$PromoModelCopyWithImpl<_PromoModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PromoModelToJson(this);
  }
}

abstract class _PromoModel implements PromoModel {
  const factory _PromoModel(
      {@required int id,
      @JsonKey(name: 'post_category_id') int postCategoryId,
      @required String name,
      @required String banner,
      @JsonKey(name: 'banner_mobile') String bannerMobile,
      @JsonKey(name: 'text_content') String textContent,
      @JsonKey(name: 'place_content') String placeContent,
      @JsonKey(name: 'apply_content') String applyContent,
      @JsonKey(name: 'rule_content') String ruleContent,
      @JsonKey(name: 'act_time') String actTime,
      @JsonKey(name: 'only_table') String onlyTable,
      @required String top,
      @required String status,
      @required int sort,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'updated_at') String updatedAt,
      @required String categoryStr}) = _$_PromoModel;

  factory _PromoModel.fromJson(Map<String, dynamic> json) =
      _$_PromoModel.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'post_category_id')
  int get postCategoryId;
  @override
  String get name;
  @override
  String get banner;
  @override
  @JsonKey(name: 'banner_mobile')
  String get bannerMobile;
  @override
  @JsonKey(name: 'text_content')
  String get textContent;
  @override
  @JsonKey(name: 'place_content')
  String get placeContent;
  @override
  @JsonKey(name: 'apply_content')
  String get applyContent;
  @override
  @JsonKey(name: 'rule_content')
  String get ruleContent;
  @override
  @JsonKey(name: 'act_time')
  String get actTime;
  @override
  @JsonKey(name: 'only_table')
  String get onlyTable;
  @override
  String get top;
  @override
  String get status;
  @override
  int get sort;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String get updatedAt;
  @override
  String get categoryStr;
  @override
  _$PromoModelCopyWith<_PromoModel> get copyWith;
}

class _$PromoEntityTearOff {
  const _$PromoEntityTearOff();

// ignore: unused_element
  _PromoEntity call(
      {@required @HiveField(0) int id,
      @required @HiveField(1) String name,
      @required @HiveField(2) String bannerMobile,
      @required @HiveField(3) String textContent,
      @required @HiveField(4) String placeContent,
      @required @HiveField(5) String applyContent,
      @required @HiveField(6) String ruleContent,
      @required @HiveField(7) String top,
      @required @HiveField(8) int sort,
      @required @HiveField(9) int postCategoryId,
      @required @HiveField(10) String categoryStr,
      @required @HiveField(11) String status}) {
    return _PromoEntity(
      id: id,
      name: name,
      bannerMobile: bannerMobile,
      textContent: textContent,
      placeContent: placeContent,
      applyContent: applyContent,
      ruleContent: ruleContent,
      top: top,
      sort: sort,
      postCategoryId: postCategoryId,
      categoryStr: categoryStr,
      status: status,
    );
  }
}

// ignore: unused_element
const $PromoEntity = _$PromoEntityTearOff();

mixin _$PromoEntity {
  @HiveField(0)
  int get id;
  @HiveField(1)
  String get name;
  @HiveField(2)
  String get bannerMobile;
  @HiveField(3)
  String get textContent;
  @HiveField(4)
  String get placeContent;
  @HiveField(5)
  String get applyContent;
  @HiveField(6)
  String get ruleContent;
  @HiveField(7)
  String get top;
  @HiveField(8)
  int get sort;
  @HiveField(9)
  int get postCategoryId;
  @HiveField(10)
  String get categoryStr;
  @HiveField(11)
  String get status;

  $PromoEntityCopyWith<PromoEntity> get copyWith;
}

abstract class $PromoEntityCopyWith<$Res> {
  factory $PromoEntityCopyWith(
          PromoEntity value, $Res Function(PromoEntity) then) =
      _$PromoEntityCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String name,
      @HiveField(2) String bannerMobile,
      @HiveField(3) String textContent,
      @HiveField(4) String placeContent,
      @HiveField(5) String applyContent,
      @HiveField(6) String ruleContent,
      @HiveField(7) String top,
      @HiveField(8) int sort,
      @HiveField(9) int postCategoryId,
      @HiveField(10) String categoryStr,
      @HiveField(11) String status});
}

class _$PromoEntityCopyWithImpl<$Res> implements $PromoEntityCopyWith<$Res> {
  _$PromoEntityCopyWithImpl(this._value, this._then);

  final PromoEntity _value;
  // ignore: unused_field
  final $Res Function(PromoEntity) _then;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object bannerMobile = freezed,
    Object textContent = freezed,
    Object placeContent = freezed,
    Object applyContent = freezed,
    Object ruleContent = freezed,
    Object top = freezed,
    Object sort = freezed,
    Object postCategoryId = freezed,
    Object categoryStr = freezed,
    Object status = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as int,
      name: name == freezed ? _value.name : name as String,
      bannerMobile: bannerMobile == freezed
          ? _value.bannerMobile
          : bannerMobile as String,
      textContent:
          textContent == freezed ? _value.textContent : textContent as String,
      placeContent: placeContent == freezed
          ? _value.placeContent
          : placeContent as String,
      applyContent: applyContent == freezed
          ? _value.applyContent
          : applyContent as String,
      ruleContent:
          ruleContent == freezed ? _value.ruleContent : ruleContent as String,
      top: top == freezed ? _value.top : top as String,
      sort: sort == freezed ? _value.sort : sort as int,
      postCategoryId: postCategoryId == freezed
          ? _value.postCategoryId
          : postCategoryId as int,
      categoryStr:
          categoryStr == freezed ? _value.categoryStr : categoryStr as String,
      status: status == freezed ? _value.status : status as String,
    ));
  }
}

abstract class _$PromoEntityCopyWith<$Res>
    implements $PromoEntityCopyWith<$Res> {
  factory _$PromoEntityCopyWith(
          _PromoEntity value, $Res Function(_PromoEntity) then) =
      __$PromoEntityCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String name,
      @HiveField(2) String bannerMobile,
      @HiveField(3) String textContent,
      @HiveField(4) String placeContent,
      @HiveField(5) String applyContent,
      @HiveField(6) String ruleContent,
      @HiveField(7) String top,
      @HiveField(8) int sort,
      @HiveField(9) int postCategoryId,
      @HiveField(10) String categoryStr,
      @HiveField(11) String status});
}

class __$PromoEntityCopyWithImpl<$Res> extends _$PromoEntityCopyWithImpl<$Res>
    implements _$PromoEntityCopyWith<$Res> {
  __$PromoEntityCopyWithImpl(
      _PromoEntity _value, $Res Function(_PromoEntity) _then)
      : super(_value, (v) => _then(v as _PromoEntity));

  @override
  _PromoEntity get _value => super._value as _PromoEntity;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object bannerMobile = freezed,
    Object textContent = freezed,
    Object placeContent = freezed,
    Object applyContent = freezed,
    Object ruleContent = freezed,
    Object top = freezed,
    Object sort = freezed,
    Object postCategoryId = freezed,
    Object categoryStr = freezed,
    Object status = freezed,
  }) {
    return _then(_PromoEntity(
      id: id == freezed ? _value.id : id as int,
      name: name == freezed ? _value.name : name as String,
      bannerMobile: bannerMobile == freezed
          ? _value.bannerMobile
          : bannerMobile as String,
      textContent:
          textContent == freezed ? _value.textContent : textContent as String,
      placeContent: placeContent == freezed
          ? _value.placeContent
          : placeContent as String,
      applyContent: applyContent == freezed
          ? _value.applyContent
          : applyContent as String,
      ruleContent:
          ruleContent == freezed ? _value.ruleContent : ruleContent as String,
      top: top == freezed ? _value.top : top as String,
      sort: sort == freezed ? _value.sort : sort as int,
      postCategoryId: postCategoryId == freezed
          ? _value.postCategoryId
          : postCategoryId as int,
      categoryStr:
          categoryStr == freezed ? _value.categoryStr : categoryStr as String,
      status: status == freezed ? _value.status : status as String,
    ));
  }
}

@HiveType(typeId: 201)
class _$_PromoEntity implements _PromoEntity {
  const _$_PromoEntity(
      {@required @HiveField(0) this.id,
      @required @HiveField(1) this.name,
      @required @HiveField(2) this.bannerMobile,
      @required @HiveField(3) this.textContent,
      @required @HiveField(4) this.placeContent,
      @required @HiveField(5) this.applyContent,
      @required @HiveField(6) this.ruleContent,
      @required @HiveField(7) this.top,
      @required @HiveField(8) this.sort,
      @required @HiveField(9) this.postCategoryId,
      @required @HiveField(10) this.categoryStr,
      @required @HiveField(11) this.status})
      : assert(id != null),
        assert(name != null),
        assert(bannerMobile != null),
        assert(textContent != null),
        assert(placeContent != null),
        assert(applyContent != null),
        assert(ruleContent != null),
        assert(top != null),
        assert(sort != null),
        assert(postCategoryId != null),
        assert(categoryStr != null),
        assert(status != null);

  @override
  @HiveField(0)
  final int id;
  @override
  @HiveField(1)
  final String name;
  @override
  @HiveField(2)
  final String bannerMobile;
  @override
  @HiveField(3)
  final String textContent;
  @override
  @HiveField(4)
  final String placeContent;
  @override
  @HiveField(5)
  final String applyContent;
  @override
  @HiveField(6)
  final String ruleContent;
  @override
  @HiveField(7)
  final String top;
  @override
  @HiveField(8)
  final int sort;
  @override
  @HiveField(9)
  final int postCategoryId;
  @override
  @HiveField(10)
  final String categoryStr;
  @override
  @HiveField(11)
  final String status;

  @override
  String toString() {
    return 'PromoEntity(id: $id, name: $name, bannerMobile: $bannerMobile, textContent: $textContent, placeContent: $placeContent, applyContent: $applyContent, ruleContent: $ruleContent, top: $top, sort: $sort, postCategoryId: $postCategoryId, categoryStr: $categoryStr, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PromoEntity &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.bannerMobile, bannerMobile) ||
                const DeepCollectionEquality()
                    .equals(other.bannerMobile, bannerMobile)) &&
            (identical(other.textContent, textContent) ||
                const DeepCollectionEquality()
                    .equals(other.textContent, textContent)) &&
            (identical(other.placeContent, placeContent) ||
                const DeepCollectionEquality()
                    .equals(other.placeContent, placeContent)) &&
            (identical(other.applyContent, applyContent) ||
                const DeepCollectionEquality()
                    .equals(other.applyContent, applyContent)) &&
            (identical(other.ruleContent, ruleContent) ||
                const DeepCollectionEquality()
                    .equals(other.ruleContent, ruleContent)) &&
            (identical(other.top, top) ||
                const DeepCollectionEquality().equals(other.top, top)) &&
            (identical(other.sort, sort) ||
                const DeepCollectionEquality().equals(other.sort, sort)) &&
            (identical(other.postCategoryId, postCategoryId) ||
                const DeepCollectionEquality()
                    .equals(other.postCategoryId, postCategoryId)) &&
            (identical(other.categoryStr, categoryStr) ||
                const DeepCollectionEquality()
                    .equals(other.categoryStr, categoryStr)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(bannerMobile) ^
      const DeepCollectionEquality().hash(textContent) ^
      const DeepCollectionEquality().hash(placeContent) ^
      const DeepCollectionEquality().hash(applyContent) ^
      const DeepCollectionEquality().hash(ruleContent) ^
      const DeepCollectionEquality().hash(top) ^
      const DeepCollectionEquality().hash(sort) ^
      const DeepCollectionEquality().hash(postCategoryId) ^
      const DeepCollectionEquality().hash(categoryStr) ^
      const DeepCollectionEquality().hash(status);

  @override
  _$PromoEntityCopyWith<_PromoEntity> get copyWith =>
      __$PromoEntityCopyWithImpl<_PromoEntity>(this, _$identity);
}

abstract class _PromoEntity implements PromoEntity {
  const factory _PromoEntity(
      {@required @HiveField(0) int id,
      @required @HiveField(1) String name,
      @required @HiveField(2) String bannerMobile,
      @required @HiveField(3) String textContent,
      @required @HiveField(4) String placeContent,
      @required @HiveField(5) String applyContent,
      @required @HiveField(6) String ruleContent,
      @required @HiveField(7) String top,
      @required @HiveField(8) int sort,
      @required @HiveField(9) int postCategoryId,
      @required @HiveField(10) String categoryStr,
      @required @HiveField(11) String status}) = _$_PromoEntity;

  @override
  @HiveField(0)
  int get id;
  @override
  @HiveField(1)
  String get name;
  @override
  @HiveField(2)
  String get bannerMobile;
  @override
  @HiveField(3)
  String get textContent;
  @override
  @HiveField(4)
  String get placeContent;
  @override
  @HiveField(5)
  String get applyContent;
  @override
  @HiveField(6)
  String get ruleContent;
  @override
  @HiveField(7)
  String get top;
  @override
  @HiveField(8)
  int get sort;
  @override
  @HiveField(9)
  int get postCategoryId;
  @override
  @HiveField(10)
  String get categoryStr;
  @override
  @HiveField(11)
  String get status;
  @override
  _$PromoEntityCopyWith<_PromoEntity> get copyWith;
}
