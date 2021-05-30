// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'roller_requirement_current.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$RollerRequirementCurrentTearOff {
  const _$RollerRequirementCurrentTearOff();

// ignore: unused_element
  _RollerRequirementCurrent call({int day, int week, int month, dynamic key}) {
    return _RollerRequirementCurrent(
      day: day,
      week: week,
      month: month,
      key: key,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $RollerRequirementCurrent = _$RollerRequirementCurrentTearOff();

/// @nodoc
mixin _$RollerRequirementCurrent {
  int get day;
  int get week;
  int get month;
  dynamic get key;

  $RollerRequirementCurrentCopyWith<RollerRequirementCurrent> get copyWith;
}

/// @nodoc
abstract class $RollerRequirementCurrentCopyWith<$Res> {
  factory $RollerRequirementCurrentCopyWith(RollerRequirementCurrent value,
          $Res Function(RollerRequirementCurrent) then) =
      _$RollerRequirementCurrentCopyWithImpl<$Res>;
  $Res call({int day, int week, int month, dynamic key});
}

/// @nodoc
class _$RollerRequirementCurrentCopyWithImpl<$Res>
    implements $RollerRequirementCurrentCopyWith<$Res> {
  _$RollerRequirementCurrentCopyWithImpl(this._value, this._then);

  final RollerRequirementCurrent _value;
  // ignore: unused_field
  final $Res Function(RollerRequirementCurrent) _then;

  @override
  $Res call({
    Object day = freezed,
    Object week = freezed,
    Object month = freezed,
    Object key = freezed,
  }) {
    return _then(_value.copyWith(
      day: day == freezed ? _value.day : day as int,
      week: week == freezed ? _value.week : week as int,
      month: month == freezed ? _value.month : month as int,
      key: key == freezed ? _value.key : key as dynamic,
    ));
  }
}

/// @nodoc
abstract class _$RollerRequirementCurrentCopyWith<$Res>
    implements $RollerRequirementCurrentCopyWith<$Res> {
  factory _$RollerRequirementCurrentCopyWith(_RollerRequirementCurrent value,
          $Res Function(_RollerRequirementCurrent) then) =
      __$RollerRequirementCurrentCopyWithImpl<$Res>;
  @override
  $Res call({int day, int week, int month, dynamic key});
}

/// @nodoc
class __$RollerRequirementCurrentCopyWithImpl<$Res>
    extends _$RollerRequirementCurrentCopyWithImpl<$Res>
    implements _$RollerRequirementCurrentCopyWith<$Res> {
  __$RollerRequirementCurrentCopyWithImpl(_RollerRequirementCurrent _value,
      $Res Function(_RollerRequirementCurrent) _then)
      : super(_value, (v) => _then(v as _RollerRequirementCurrent));

  @override
  _RollerRequirementCurrent get _value =>
      super._value as _RollerRequirementCurrent;

  @override
  $Res call({
    Object day = freezed,
    Object week = freezed,
    Object month = freezed,
    Object key = freezed,
  }) {
    return _then(_RollerRequirementCurrent(
      day: day == freezed ? _value.day : day as int,
      week: week == freezed ? _value.week : week as int,
      month: month == freezed ? _value.month : month as int,
      key: key == freezed ? _value.key : key as dynamic,
    ));
  }
}

/// @nodoc
class _$_RollerRequirementCurrent implements _RollerRequirementCurrent {
  const _$_RollerRequirementCurrent(
      {this.day, this.week, this.month, this.key});

  @override
  final int day;
  @override
  final int week;
  @override
  final int month;
  @override
  final dynamic key;

  @override
  String toString() {
    return 'RollerRequirementCurrent(day: $day, week: $week, month: $month, key: $key)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RollerRequirementCurrent &&
            (identical(other.day, day) ||
                const DeepCollectionEquality().equals(other.day, day)) &&
            (identical(other.week, week) ||
                const DeepCollectionEquality().equals(other.week, week)) &&
            (identical(other.month, month) ||
                const DeepCollectionEquality().equals(other.month, month)) &&
            (identical(other.key, key) ||
                const DeepCollectionEquality().equals(other.key, key)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(day) ^
      const DeepCollectionEquality().hash(week) ^
      const DeepCollectionEquality().hash(month) ^
      const DeepCollectionEquality().hash(key);

  @override
  _$RollerRequirementCurrentCopyWith<_RollerRequirementCurrent> get copyWith =>
      __$RollerRequirementCurrentCopyWithImpl<_RollerRequirementCurrent>(
          this, _$identity);
}

abstract class _RollerRequirementCurrent implements RollerRequirementCurrent {
  const factory _RollerRequirementCurrent(
      {int day,
      int week,
      int month,
      dynamic key}) = _$_RollerRequirementCurrent;

  @override
  int get day;
  @override
  int get week;
  @override
  int get month;
  @override
  dynamic get key;
  @override
  _$RollerRequirementCurrentCopyWith<_RollerRequirementCurrent> get copyWith;
}
