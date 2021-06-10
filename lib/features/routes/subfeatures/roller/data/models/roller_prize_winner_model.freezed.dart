// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'roller_prize_winner_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$RollerPrizeWinnerModelTearOff {
  const _$RollerPrizeWinnerModelTearOff();

// ignore: unused_element
  _RollerPrizeWinnerModel call({String title, String accCode, String cdate}) {
    return _RollerPrizeWinnerModel(
      title: title,
      accCode: accCode,
      cdate: cdate,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $RollerPrizeWinnerModel = _$RollerPrizeWinnerModelTearOff();

/// @nodoc
mixin _$RollerPrizeWinnerModel {
  String get title;
  String get accCode;
  String get cdate;

  $RollerPrizeWinnerModelCopyWith<RollerPrizeWinnerModel> get copyWith;
}

/// @nodoc
abstract class $RollerPrizeWinnerModelCopyWith<$Res> {
  factory $RollerPrizeWinnerModelCopyWith(RollerPrizeWinnerModel value,
          $Res Function(RollerPrizeWinnerModel) then) =
      _$RollerPrizeWinnerModelCopyWithImpl<$Res>;
  $Res call({String title, String accCode, String cdate});
}

/// @nodoc
class _$RollerPrizeWinnerModelCopyWithImpl<$Res>
    implements $RollerPrizeWinnerModelCopyWith<$Res> {
  _$RollerPrizeWinnerModelCopyWithImpl(this._value, this._then);

  final RollerPrizeWinnerModel _value;
  // ignore: unused_field
  final $Res Function(RollerPrizeWinnerModel) _then;

  @override
  $Res call({
    Object title = freezed,
    Object accCode = freezed,
    Object cdate = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed ? _value.title : title as String,
      accCode: accCode == freezed ? _value.accCode : accCode as String,
      cdate: cdate == freezed ? _value.cdate : cdate as String,
    ));
  }
}

/// @nodoc
abstract class _$RollerPrizeWinnerModelCopyWith<$Res>
    implements $RollerPrizeWinnerModelCopyWith<$Res> {
  factory _$RollerPrizeWinnerModelCopyWith(_RollerPrizeWinnerModel value,
          $Res Function(_RollerPrizeWinnerModel) then) =
      __$RollerPrizeWinnerModelCopyWithImpl<$Res>;
  @override
  $Res call({String title, String accCode, String cdate});
}

/// @nodoc
class __$RollerPrizeWinnerModelCopyWithImpl<$Res>
    extends _$RollerPrizeWinnerModelCopyWithImpl<$Res>
    implements _$RollerPrizeWinnerModelCopyWith<$Res> {
  __$RollerPrizeWinnerModelCopyWithImpl(_RollerPrizeWinnerModel _value,
      $Res Function(_RollerPrizeWinnerModel) _then)
      : super(_value, (v) => _then(v as _RollerPrizeWinnerModel));

  @override
  _RollerPrizeWinnerModel get _value => super._value as _RollerPrizeWinnerModel;

  @override
  $Res call({
    Object title = freezed,
    Object accCode = freezed,
    Object cdate = freezed,
  }) {
    return _then(_RollerPrizeWinnerModel(
      title: title == freezed ? _value.title : title as String,
      accCode: accCode == freezed ? _value.accCode : accCode as String,
      cdate: cdate == freezed ? _value.cdate : cdate as String,
    ));
  }
}

/// @nodoc
class _$_RollerPrizeWinnerModel implements _RollerPrizeWinnerModel {
  const _$_RollerPrizeWinnerModel({this.title, this.accCode, this.cdate});

  @override
  final String title;
  @override
  final String accCode;
  @override
  final String cdate;

  @override
  String toString() {
    return 'RollerPrizeWinnerModel(title: $title, accCode: $accCode, cdate: $cdate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RollerPrizeWinnerModel &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.accCode, accCode) ||
                const DeepCollectionEquality()
                    .equals(other.accCode, accCode)) &&
            (identical(other.cdate, cdate) ||
                const DeepCollectionEquality().equals(other.cdate, cdate)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(accCode) ^
      const DeepCollectionEquality().hash(cdate);

  @override
  _$RollerPrizeWinnerModelCopyWith<_RollerPrizeWinnerModel> get copyWith =>
      __$RollerPrizeWinnerModelCopyWithImpl<_RollerPrizeWinnerModel>(
          this, _$identity);
}

abstract class _RollerPrizeWinnerModel implements RollerPrizeWinnerModel {
  const factory _RollerPrizeWinnerModel(
      {String title, String accCode, String cdate}) = _$_RollerPrizeWinnerModel;

  @override
  String get title;
  @override
  String get accCode;
  @override
  String get cdate;
  @override
  _$RollerPrizeWinnerModelCopyWith<_RollerPrizeWinnerModel> get copyWith;
}
