// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'center_vip_setting_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
CenterVipSettingModel _$CenterVipSettingModelFromJson(
    Map<String, dynamic> json) {
  switch (json['runtimeType'] as String) {
    case 'model':
      return CenterVipSetting.fromJson(json);
    case 'content':
      return CenterVipSettingItem.fromJson(json);

    default:
      throw FallThroughError();
  }
}

class _$CenterVipSettingModelTearOff {
  const _$CenterVipSettingModelTearOff();

// ignore: unused_element
  CenterVipSetting model(
      {@JsonKey(name: 'setting', fromJson: CenterVipSettingModel.jsonToCenterVipSettingItem)
          CenterVipSettingItem item,
      String title}) {
    return CenterVipSetting(
      item: item,
      title: title,
    );
  }

// ignore: unused_element
  CenterVipSettingItem content(
      {String allgame,
      String slotgame,
      String casinogame,
      String sportgame,
      String fishgame,
      String lotterygame,
      String cardgame}) {
    return CenterVipSettingItem(
      allgame: allgame,
      slotgame: slotgame,
      casinogame: casinogame,
      sportgame: sportgame,
      fishgame: fishgame,
      lotterygame: lotterygame,
      cardgame: cardgame,
    );
  }
}

// ignore: unused_element
const $CenterVipSettingModel = _$CenterVipSettingModelTearOff();

mixin _$CenterVipSettingModel {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result model(
            @JsonKey(name: 'setting', fromJson: CenterVipSettingModel.jsonToCenterVipSettingItem)
                CenterVipSettingItem item,
            String title),
    @required
        Result content(
            String allgame,
            String slotgame,
            String casinogame,
            String sportgame,
            String fishgame,
            String lotterygame,
            String cardgame),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result model(
        @JsonKey(name: 'setting', fromJson: CenterVipSettingModel.jsonToCenterVipSettingItem)
            CenterVipSettingItem item,
        String title),
    Result content(String allgame, String slotgame, String casinogame,
        String sportgame, String fishgame, String lotterygame, String cardgame),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result model(CenterVipSetting value),
    @required Result content(CenterVipSettingItem value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result model(CenterVipSetting value),
    Result content(CenterVipSettingItem value),
    @required Result orElse(),
  });
  Map<String, dynamic> toJson();
}

abstract class $CenterVipSettingModelCopyWith<$Res> {
  factory $CenterVipSettingModelCopyWith(CenterVipSettingModel value,
          $Res Function(CenterVipSettingModel) then) =
      _$CenterVipSettingModelCopyWithImpl<$Res>;
}

class _$CenterVipSettingModelCopyWithImpl<$Res>
    implements $CenterVipSettingModelCopyWith<$Res> {
  _$CenterVipSettingModelCopyWithImpl(this._value, this._then);

  final CenterVipSettingModel _value;
  // ignore: unused_field
  final $Res Function(CenterVipSettingModel) _then;
}

abstract class $CenterVipSettingCopyWith<$Res> {
  factory $CenterVipSettingCopyWith(
          CenterVipSetting value, $Res Function(CenterVipSetting) then) =
      _$CenterVipSettingCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'setting', fromJson: CenterVipSettingModel.jsonToCenterVipSettingItem)
          CenterVipSettingItem item,
      String title});
}

class _$CenterVipSettingCopyWithImpl<$Res>
    extends _$CenterVipSettingModelCopyWithImpl<$Res>
    implements $CenterVipSettingCopyWith<$Res> {
  _$CenterVipSettingCopyWithImpl(
      CenterVipSetting _value, $Res Function(CenterVipSetting) _then)
      : super(_value, (v) => _then(v as CenterVipSetting));

  @override
  CenterVipSetting get _value => super._value as CenterVipSetting;

  @override
  $Res call({
    Object item = freezed,
    Object title = freezed,
  }) {
    return _then(CenterVipSetting(
      item: item == freezed ? _value.item : item as CenterVipSettingItem,
      title: title == freezed ? _value.title : title as String,
    ));
  }
}

@JsonSerializable()
class _$CenterVipSetting implements CenterVipSetting {
  const _$CenterVipSetting(
      {@JsonKey(name: 'setting', fromJson: CenterVipSettingModel.jsonToCenterVipSettingItem)
          this.item,
      this.title});

  factory _$CenterVipSetting.fromJson(Map<String, dynamic> json) =>
      _$_$CenterVipSettingFromJson(json);

  @override
  @JsonKey(
      name: 'setting',
      fromJson: CenterVipSettingModel.jsonToCenterVipSettingItem)
  final CenterVipSettingItem item;
  @override
  final String title;

  @override
  String toString() {
    return 'CenterVipSettingModel.model(item: $item, title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CenterVipSetting &&
            (identical(other.item, item) ||
                const DeepCollectionEquality().equals(other.item, item)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(item) ^
      const DeepCollectionEquality().hash(title);

  @override
  $CenterVipSettingCopyWith<CenterVipSetting> get copyWith =>
      _$CenterVipSettingCopyWithImpl<CenterVipSetting>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result model(
            @JsonKey(name: 'setting', fromJson: CenterVipSettingModel.jsonToCenterVipSettingItem)
                CenterVipSettingItem item,
            String title),
    @required
        Result content(
            String allgame,
            String slotgame,
            String casinogame,
            String sportgame,
            String fishgame,
            String lotterygame,
            String cardgame),
  }) {
    assert(model != null);
    assert(content != null);
    return model(item, title);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result model(
        @JsonKey(name: 'setting', fromJson: CenterVipSettingModel.jsonToCenterVipSettingItem)
            CenterVipSettingItem item,
        String title),
    Result content(String allgame, String slotgame, String casinogame,
        String sportgame, String fishgame, String lotterygame, String cardgame),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (model != null) {
      return model(item, title);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result model(CenterVipSetting value),
    @required Result content(CenterVipSettingItem value),
  }) {
    assert(model != null);
    assert(content != null);
    return model(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result model(CenterVipSetting value),
    Result content(CenterVipSettingItem value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (model != null) {
      return model(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$CenterVipSettingToJson(this)..['runtimeType'] = 'model';
  }
}

abstract class CenterVipSetting implements CenterVipSettingModel {
  const factory CenterVipSetting(
      {@JsonKey(name: 'setting', fromJson: CenterVipSettingModel.jsonToCenterVipSettingItem)
          CenterVipSettingItem item,
      String title}) = _$CenterVipSetting;

  factory CenterVipSetting.fromJson(Map<String, dynamic> json) =
      _$CenterVipSetting.fromJson;

  @JsonKey(
      name: 'setting',
      fromJson: CenterVipSettingModel.jsonToCenterVipSettingItem)
  CenterVipSettingItem get item;
  String get title;
  $CenterVipSettingCopyWith<CenterVipSetting> get copyWith;
}

abstract class $CenterVipSettingItemCopyWith<$Res> {
  factory $CenterVipSettingItemCopyWith(CenterVipSettingItem value,
          $Res Function(CenterVipSettingItem) then) =
      _$CenterVipSettingItemCopyWithImpl<$Res>;
  $Res call(
      {String allgame,
      String slotgame,
      String casinogame,
      String sportgame,
      String fishgame,
      String lotterygame,
      String cardgame});
}

class _$CenterVipSettingItemCopyWithImpl<$Res>
    extends _$CenterVipSettingModelCopyWithImpl<$Res>
    implements $CenterVipSettingItemCopyWith<$Res> {
  _$CenterVipSettingItemCopyWithImpl(
      CenterVipSettingItem _value, $Res Function(CenterVipSettingItem) _then)
      : super(_value, (v) => _then(v as CenterVipSettingItem));

  @override
  CenterVipSettingItem get _value => super._value as CenterVipSettingItem;

  @override
  $Res call({
    Object allgame = freezed,
    Object slotgame = freezed,
    Object casinogame = freezed,
    Object sportgame = freezed,
    Object fishgame = freezed,
    Object lotterygame = freezed,
    Object cardgame = freezed,
  }) {
    return _then(CenterVipSettingItem(
      allgame: allgame == freezed ? _value.allgame : allgame as String,
      slotgame: slotgame == freezed ? _value.slotgame : slotgame as String,
      casinogame:
          casinogame == freezed ? _value.casinogame : casinogame as String,
      sportgame: sportgame == freezed ? _value.sportgame : sportgame as String,
      fishgame: fishgame == freezed ? _value.fishgame : fishgame as String,
      lotterygame:
          lotterygame == freezed ? _value.lotterygame : lotterygame as String,
      cardgame: cardgame == freezed ? _value.cardgame : cardgame as String,
    ));
  }
}

@JsonSerializable()
class _$CenterVipSettingItem implements CenterVipSettingItem {
  const _$CenterVipSettingItem(
      {this.allgame,
      this.slotgame,
      this.casinogame,
      this.sportgame,
      this.fishgame,
      this.lotterygame,
      this.cardgame});

  factory _$CenterVipSettingItem.fromJson(Map<String, dynamic> json) =>
      _$_$CenterVipSettingItemFromJson(json);

  @override
  final String allgame;
  @override
  final String slotgame;
  @override
  final String casinogame;
  @override
  final String sportgame;
  @override
  final String fishgame;
  @override
  final String lotterygame;
  @override
  final String cardgame;

  @override
  String toString() {
    return 'CenterVipSettingModel.content(allgame: $allgame, slotgame: $slotgame, casinogame: $casinogame, sportgame: $sportgame, fishgame: $fishgame, lotterygame: $lotterygame, cardgame: $cardgame)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CenterVipSettingItem &&
            (identical(other.allgame, allgame) ||
                const DeepCollectionEquality()
                    .equals(other.allgame, allgame)) &&
            (identical(other.slotgame, slotgame) ||
                const DeepCollectionEquality()
                    .equals(other.slotgame, slotgame)) &&
            (identical(other.casinogame, casinogame) ||
                const DeepCollectionEquality()
                    .equals(other.casinogame, casinogame)) &&
            (identical(other.sportgame, sportgame) ||
                const DeepCollectionEquality()
                    .equals(other.sportgame, sportgame)) &&
            (identical(other.fishgame, fishgame) ||
                const DeepCollectionEquality()
                    .equals(other.fishgame, fishgame)) &&
            (identical(other.lotterygame, lotterygame) ||
                const DeepCollectionEquality()
                    .equals(other.lotterygame, lotterygame)) &&
            (identical(other.cardgame, cardgame) ||
                const DeepCollectionEquality()
                    .equals(other.cardgame, cardgame)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(allgame) ^
      const DeepCollectionEquality().hash(slotgame) ^
      const DeepCollectionEquality().hash(casinogame) ^
      const DeepCollectionEquality().hash(sportgame) ^
      const DeepCollectionEquality().hash(fishgame) ^
      const DeepCollectionEquality().hash(lotterygame) ^
      const DeepCollectionEquality().hash(cardgame);

  @override
  $CenterVipSettingItemCopyWith<CenterVipSettingItem> get copyWith =>
      _$CenterVipSettingItemCopyWithImpl<CenterVipSettingItem>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result model(
            @JsonKey(name: 'setting', fromJson: CenterVipSettingModel.jsonToCenterVipSettingItem)
                CenterVipSettingItem item,
            String title),
    @required
        Result content(
            String allgame,
            String slotgame,
            String casinogame,
            String sportgame,
            String fishgame,
            String lotterygame,
            String cardgame),
  }) {
    assert(model != null);
    assert(content != null);
    return content(allgame, slotgame, casinogame, sportgame, fishgame,
        lotterygame, cardgame);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result model(
        @JsonKey(name: 'setting', fromJson: CenterVipSettingModel.jsonToCenterVipSettingItem)
            CenterVipSettingItem item,
        String title),
    Result content(String allgame, String slotgame, String casinogame,
        String sportgame, String fishgame, String lotterygame, String cardgame),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (content != null) {
      return content(allgame, slotgame, casinogame, sportgame, fishgame,
          lotterygame, cardgame);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result model(CenterVipSetting value),
    @required Result content(CenterVipSettingItem value),
  }) {
    assert(model != null);
    assert(content != null);
    return content(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result model(CenterVipSetting value),
    Result content(CenterVipSettingItem value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (content != null) {
      return content(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$CenterVipSettingItemToJson(this)..['runtimeType'] = 'content';
  }
}

abstract class CenterVipSettingItem implements CenterVipSettingModel {
  const factory CenterVipSettingItem(
      {String allgame,
      String slotgame,
      String casinogame,
      String sportgame,
      String fishgame,
      String lotterygame,
      String cardgame}) = _$CenterVipSettingItem;

  factory CenterVipSettingItem.fromJson(Map<String, dynamic> json) =
      _$CenterVipSettingItem.fromJson;

  String get allgame;
  String get slotgame;
  String get casinogame;
  String get sportgame;
  String get fishgame;
  String get lotterygame;
  String get cardgame;
  $CenterVipSettingItemCopyWith<CenterVipSettingItem> get copyWith;
}
