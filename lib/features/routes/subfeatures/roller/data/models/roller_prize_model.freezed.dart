// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'roller_prize_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$RollerPrizeModelTearOff {
  const _$RollerPrizeModelTearOff();

// ignore: unused_element
  _RollerPrizeModel call(
      {int id,
      String prize,
      @JsonKey(name: 'img') String imgUrl,
      int pic,
      @JsonKey(name: 'alert') String alertPicUrl,
      @JsonKey(name: 'alert_pic') int alertPic}) {
    return _RollerPrizeModel(
      id: id,
      prize: prize,
      imgUrl: imgUrl,
      pic: pic,
      alertPicUrl: alertPicUrl,
      alertPic: alertPic,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $RollerPrizeModel = _$RollerPrizeModelTearOff();

/// @nodoc
mixin _$RollerPrizeModel {
  int get id;
  String get prize;
  @JsonKey(name: 'img')
  String get imgUrl;
  int get pic;
  @JsonKey(name: 'alert')
  String get alertPicUrl;
  @JsonKey(name: 'alert_pic')
  int get alertPic;

  $RollerPrizeModelCopyWith<RollerPrizeModel> get copyWith;
}

/// @nodoc
abstract class $RollerPrizeModelCopyWith<$Res> {
  factory $RollerPrizeModelCopyWith(
          RollerPrizeModel value, $Res Function(RollerPrizeModel) then) =
      _$RollerPrizeModelCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String prize,
      @JsonKey(name: 'img') String imgUrl,
      int pic,
      @JsonKey(name: 'alert') String alertPicUrl,
      @JsonKey(name: 'alert_pic') int alertPic});
}

/// @nodoc
class _$RollerPrizeModelCopyWithImpl<$Res>
    implements $RollerPrizeModelCopyWith<$Res> {
  _$RollerPrizeModelCopyWithImpl(this._value, this._then);

  final RollerPrizeModel _value;
  // ignore: unused_field
  final $Res Function(RollerPrizeModel) _then;

  @override
  $Res call({
    Object id = freezed,
    Object prize = freezed,
    Object imgUrl = freezed,
    Object pic = freezed,
    Object alertPicUrl = freezed,
    Object alertPic = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as int,
      prize: prize == freezed ? _value.prize : prize as String,
      imgUrl: imgUrl == freezed ? _value.imgUrl : imgUrl as String,
      pic: pic == freezed ? _value.pic : pic as int,
      alertPicUrl:
          alertPicUrl == freezed ? _value.alertPicUrl : alertPicUrl as String,
      alertPic: alertPic == freezed ? _value.alertPic : alertPic as int,
    ));
  }
}

/// @nodoc
abstract class _$RollerPrizeModelCopyWith<$Res>
    implements $RollerPrizeModelCopyWith<$Res> {
  factory _$RollerPrizeModelCopyWith(
          _RollerPrizeModel value, $Res Function(_RollerPrizeModel) then) =
      __$RollerPrizeModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String prize,
      @JsonKey(name: 'img') String imgUrl,
      int pic,
      @JsonKey(name: 'alert') String alertPicUrl,
      @JsonKey(name: 'alert_pic') int alertPic});
}

/// @nodoc
class __$RollerPrizeModelCopyWithImpl<$Res>
    extends _$RollerPrizeModelCopyWithImpl<$Res>
    implements _$RollerPrizeModelCopyWith<$Res> {
  __$RollerPrizeModelCopyWithImpl(
      _RollerPrizeModel _value, $Res Function(_RollerPrizeModel) _then)
      : super(_value, (v) => _then(v as _RollerPrizeModel));

  @override
  _RollerPrizeModel get _value => super._value as _RollerPrizeModel;

  @override
  $Res call({
    Object id = freezed,
    Object prize = freezed,
    Object imgUrl = freezed,
    Object pic = freezed,
    Object alertPicUrl = freezed,
    Object alertPic = freezed,
  }) {
    return _then(_RollerPrizeModel(
      id: id == freezed ? _value.id : id as int,
      prize: prize == freezed ? _value.prize : prize as String,
      imgUrl: imgUrl == freezed ? _value.imgUrl : imgUrl as String,
      pic: pic == freezed ? _value.pic : pic as int,
      alertPicUrl:
          alertPicUrl == freezed ? _value.alertPicUrl : alertPicUrl as String,
      alertPic: alertPic == freezed ? _value.alertPic : alertPic as int,
    ));
  }
}

/// @nodoc
class _$_RollerPrizeModel implements _RollerPrizeModel {
  const _$_RollerPrizeModel(
      {this.id,
      this.prize,
      @JsonKey(name: 'img') this.imgUrl,
      this.pic,
      @JsonKey(name: 'alert') this.alertPicUrl,
      @JsonKey(name: 'alert_pic') this.alertPic});

  @override
  final int id;
  @override
  final String prize;
  @override
  @JsonKey(name: 'img')
  final String imgUrl;
  @override
  final int pic;
  @override
  @JsonKey(name: 'alert')
  final String alertPicUrl;
  @override
  @JsonKey(name: 'alert_pic')
  final int alertPic;

  @override
  String toString() {
    return 'RollerPrizeModel(id: $id, prize: $prize, imgUrl: $imgUrl, pic: $pic, alertPicUrl: $alertPicUrl, alertPic: $alertPic)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RollerPrizeModel &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.prize, prize) ||
                const DeepCollectionEquality().equals(other.prize, prize)) &&
            (identical(other.imgUrl, imgUrl) ||
                const DeepCollectionEquality().equals(other.imgUrl, imgUrl)) &&
            (identical(other.pic, pic) ||
                const DeepCollectionEquality().equals(other.pic, pic)) &&
            (identical(other.alertPicUrl, alertPicUrl) ||
                const DeepCollectionEquality()
                    .equals(other.alertPicUrl, alertPicUrl)) &&
            (identical(other.alertPic, alertPic) ||
                const DeepCollectionEquality()
                    .equals(other.alertPic, alertPic)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(prize) ^
      const DeepCollectionEquality().hash(imgUrl) ^
      const DeepCollectionEquality().hash(pic) ^
      const DeepCollectionEquality().hash(alertPicUrl) ^
      const DeepCollectionEquality().hash(alertPic);

  @override
  _$RollerPrizeModelCopyWith<_RollerPrizeModel> get copyWith =>
      __$RollerPrizeModelCopyWithImpl<_RollerPrizeModel>(this, _$identity);
}

abstract class _RollerPrizeModel implements RollerPrizeModel {
  const factory _RollerPrizeModel(
      {int id,
      String prize,
      @JsonKey(name: 'img') String imgUrl,
      int pic,
      @JsonKey(name: 'alert') String alertPicUrl,
      @JsonKey(name: 'alert_pic') int alertPic}) = _$_RollerPrizeModel;

  @override
  int get id;
  @override
  String get prize;
  @override
  @JsonKey(name: 'img')
  String get imgUrl;
  @override
  int get pic;
  @override
  @JsonKey(name: 'alert')
  String get alertPicUrl;
  @override
  @JsonKey(name: 'alert_pic')
  int get alertPic;
  @override
  _$RollerPrizeModelCopyWith<_RollerPrizeModel> get copyWith;
}
