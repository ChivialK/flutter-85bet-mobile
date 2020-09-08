// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'bet_record_type_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$BetRecordTypeModelTearOff {
  const _$BetRecordTypeModelTearOff();

// ignore: unused_element
  _BetRecordTypeModel call(
      {@JsonKey(name: 'id')
          int categoryId,
      @Deprecated('use label getter instead')
      @JsonKey(name: 'ch')
          String categoryName,
      @JsonKey(name: 'type')
          String categoryType,
      Map<String, dynamic> platformMap}) {
    return _BetRecordTypeModel(
      categoryId: categoryId,
      categoryName: categoryName,
      categoryType: categoryType,
      platformMap: platformMap,
    );
  }
}

// ignore: unused_element
const $BetRecordTypeModel = _$BetRecordTypeModelTearOff();

mixin _$BetRecordTypeModel {
  @JsonKey(name: 'id')
  int get categoryId;
  @Deprecated('use label getter instead')
  @JsonKey(name: 'ch')
  String get categoryName;
  @JsonKey(name: 'type')
  String get categoryType;
  Map<String, dynamic> get platformMap;

  $BetRecordTypeModelCopyWith<BetRecordTypeModel> get copyWith;
}

abstract class $BetRecordTypeModelCopyWith<$Res> {
  factory $BetRecordTypeModelCopyWith(
          BetRecordTypeModel value, $Res Function(BetRecordTypeModel) then) =
      _$BetRecordTypeModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'id')
          int categoryId,
      @Deprecated('use label getter instead')
      @JsonKey(name: 'ch')
          String categoryName,
      @JsonKey(name: 'type')
          String categoryType,
      Map<String, dynamic> platformMap});
}

class _$BetRecordTypeModelCopyWithImpl<$Res>
    implements $BetRecordTypeModelCopyWith<$Res> {
  _$BetRecordTypeModelCopyWithImpl(this._value, this._then);

  final BetRecordTypeModel _value;
  // ignore: unused_field
  final $Res Function(BetRecordTypeModel) _then;

  @override
  $Res call({
    Object categoryId = freezed,
    Object categoryName = freezed,
    Object categoryType = freezed,
    Object platformMap = freezed,
  }) {
    return _then(_value.copyWith(
      categoryId: categoryId == freezed ? _value.categoryId : categoryId as int,
      categoryName: categoryName == freezed
          ? _value.categoryName
          : categoryName as String,
      categoryType: categoryType == freezed
          ? _value.categoryType
          : categoryType as String,
      platformMap: platformMap == freezed
          ? _value.platformMap
          : platformMap as Map<String, dynamic>,
    ));
  }
}

abstract class _$BetRecordTypeModelCopyWith<$Res>
    implements $BetRecordTypeModelCopyWith<$Res> {
  factory _$BetRecordTypeModelCopyWith(
          _BetRecordTypeModel value, $Res Function(_BetRecordTypeModel) then) =
      __$BetRecordTypeModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'id')
          int categoryId,
      @Deprecated('use label getter instead')
      @JsonKey(name: 'ch')
          String categoryName,
      @JsonKey(name: 'type')
          String categoryType,
      Map<String, dynamic> platformMap});
}

class __$BetRecordTypeModelCopyWithImpl<$Res>
    extends _$BetRecordTypeModelCopyWithImpl<$Res>
    implements _$BetRecordTypeModelCopyWith<$Res> {
  __$BetRecordTypeModelCopyWithImpl(
      _BetRecordTypeModel _value, $Res Function(_BetRecordTypeModel) _then)
      : super(_value, (v) => _then(v as _BetRecordTypeModel));

  @override
  _BetRecordTypeModel get _value => super._value as _BetRecordTypeModel;

  @override
  $Res call({
    Object categoryId = freezed,
    Object categoryName = freezed,
    Object categoryType = freezed,
    Object platformMap = freezed,
  }) {
    return _then(_BetRecordTypeModel(
      categoryId: categoryId == freezed ? _value.categoryId : categoryId as int,
      categoryName: categoryName == freezed
          ? _value.categoryName
          : categoryName as String,
      categoryType: categoryType == freezed
          ? _value.categoryType
          : categoryType as String,
      platformMap: platformMap == freezed
          ? _value.platformMap
          : platformMap as Map<String, dynamic>,
    ));
  }
}

class _$_BetRecordTypeModel implements _BetRecordTypeModel {
  const _$_BetRecordTypeModel(
      {@JsonKey(name: 'id')
          this.categoryId,
      @Deprecated('use label getter instead')
      @JsonKey(name: 'ch')
          this.categoryName,
      @JsonKey(name: 'type')
          this.categoryType,
      this.platformMap});

  @override
  @JsonKey(name: 'id')
  final int categoryId;
  @override
  @Deprecated('use label getter instead')
  @JsonKey(name: 'ch')
  final String categoryName;
  @override
  @JsonKey(name: 'type')
  final String categoryType;
  @override
  final Map<String, dynamic> platformMap;

  @override
  String toString() {
    return 'BetRecordTypeModel(categoryId: $categoryId, categoryName: $categoryName, categoryType: $categoryType, platformMap: $platformMap)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BetRecordTypeModel &&
            (identical(other.categoryId, categoryId) ||
                const DeepCollectionEquality()
                    .equals(other.categoryId, categoryId)) &&
            (identical(other.categoryName, categoryName) ||
                const DeepCollectionEquality()
                    .equals(other.categoryName, categoryName)) &&
            (identical(other.categoryType, categoryType) ||
                const DeepCollectionEquality()
                    .equals(other.categoryType, categoryType)) &&
            (identical(other.platformMap, platformMap) ||
                const DeepCollectionEquality()
                    .equals(other.platformMap, platformMap)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(categoryId) ^
      const DeepCollectionEquality().hash(categoryName) ^
      const DeepCollectionEquality().hash(categoryType) ^
      const DeepCollectionEquality().hash(platformMap);

  @override
  _$BetRecordTypeModelCopyWith<_BetRecordTypeModel> get copyWith =>
      __$BetRecordTypeModelCopyWithImpl<_BetRecordTypeModel>(this, _$identity);
}

abstract class _BetRecordTypeModel implements BetRecordTypeModel {
  const factory _BetRecordTypeModel(
      {@JsonKey(name: 'id')
          int categoryId,
      @Deprecated('use label getter instead')
      @JsonKey(name: 'ch')
          String categoryName,
      @JsonKey(name: 'type')
          String categoryType,
      Map<String, dynamic> platformMap}) = _$_BetRecordTypeModel;

  @override
  @JsonKey(name: 'id')
  int get categoryId;
  @override
  @Deprecated('use label getter instead')
  @JsonKey(name: 'ch')
  String get categoryName;
  @override
  @JsonKey(name: 'type')
  String get categoryType;
  @override
  Map<String, dynamic> get platformMap;
  @override
  _$BetRecordTypeModelCopyWith<_BetRecordTypeModel> get copyWith;
}
