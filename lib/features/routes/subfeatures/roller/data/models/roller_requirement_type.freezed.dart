// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'roller_requirement_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$RollerRequirementTypeTearOff {
  const _$RollerRequirementTypeTearOff();

// ignore: unused_element
  _RollerRequirementType call(
      {int id,
      String name,
      String ch,
      String status,
      @JsonKey(name: 'updated_at') String date}) {
    return _RollerRequirementType(
      id: id,
      name: name,
      ch: ch,
      status: status,
      date: date,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $RollerRequirementType = _$RollerRequirementTypeTearOff();

/// @nodoc
mixin _$RollerRequirementType {
  int get id;
  String get name;
  String get ch;
  String get status;
  @JsonKey(name: 'updated_at')
  String get date;

  $RollerRequirementTypeCopyWith<RollerRequirementType> get copyWith;
}

/// @nodoc
abstract class $RollerRequirementTypeCopyWith<$Res> {
  factory $RollerRequirementTypeCopyWith(RollerRequirementType value,
          $Res Function(RollerRequirementType) then) =
      _$RollerRequirementTypeCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String name,
      String ch,
      String status,
      @JsonKey(name: 'updated_at') String date});
}

/// @nodoc
class _$RollerRequirementTypeCopyWithImpl<$Res>
    implements $RollerRequirementTypeCopyWith<$Res> {
  _$RollerRequirementTypeCopyWithImpl(this._value, this._then);

  final RollerRequirementType _value;
  // ignore: unused_field
  final $Res Function(RollerRequirementType) _then;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object ch = freezed,
    Object status = freezed,
    Object date = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as int,
      name: name == freezed ? _value.name : name as String,
      ch: ch == freezed ? _value.ch : ch as String,
      status: status == freezed ? _value.status : status as String,
      date: date == freezed ? _value.date : date as String,
    ));
  }
}

/// @nodoc
abstract class _$RollerRequirementTypeCopyWith<$Res>
    implements $RollerRequirementTypeCopyWith<$Res> {
  factory _$RollerRequirementTypeCopyWith(_RollerRequirementType value,
          $Res Function(_RollerRequirementType) then) =
      __$RollerRequirementTypeCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String name,
      String ch,
      String status,
      @JsonKey(name: 'updated_at') String date});
}

/// @nodoc
class __$RollerRequirementTypeCopyWithImpl<$Res>
    extends _$RollerRequirementTypeCopyWithImpl<$Res>
    implements _$RollerRequirementTypeCopyWith<$Res> {
  __$RollerRequirementTypeCopyWithImpl(_RollerRequirementType _value,
      $Res Function(_RollerRequirementType) _then)
      : super(_value, (v) => _then(v as _RollerRequirementType));

  @override
  _RollerRequirementType get _value => super._value as _RollerRequirementType;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object ch = freezed,
    Object status = freezed,
    Object date = freezed,
  }) {
    return _then(_RollerRequirementType(
      id: id == freezed ? _value.id : id as int,
      name: name == freezed ? _value.name : name as String,
      ch: ch == freezed ? _value.ch : ch as String,
      status: status == freezed ? _value.status : status as String,
      date: date == freezed ? _value.date : date as String,
    ));
  }
}

/// @nodoc
class _$_RollerRequirementType implements _RollerRequirementType {
  const _$_RollerRequirementType(
      {this.id,
      this.name,
      this.ch,
      this.status,
      @JsonKey(name: 'updated_at') this.date});

  @override
  final int id;
  @override
  final String name;
  @override
  final String ch;
  @override
  final String status;
  @override
  @JsonKey(name: 'updated_at')
  final String date;

  @override
  String toString() {
    return 'RollerRequirementType(id: $id, name: $name, ch: $ch, status: $status, date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RollerRequirementType &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.ch, ch) ||
                const DeepCollectionEquality().equals(other.ch, ch)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(ch) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(date);

  @override
  _$RollerRequirementTypeCopyWith<_RollerRequirementType> get copyWith =>
      __$RollerRequirementTypeCopyWithImpl<_RollerRequirementType>(
          this, _$identity);
}

abstract class _RollerRequirementType implements RollerRequirementType {
  const factory _RollerRequirementType(
      {int id,
      String name,
      String ch,
      String status,
      @JsonKey(name: 'updated_at') String date}) = _$_RollerRequirementType;

  @override
  int get id;
  @override
  String get name;
  @override
  String get ch;
  @override
  String get status;
  @override
  @JsonKey(name: 'updated_at')
  String get date;
  @override
  _$RollerRequirementTypeCopyWith<_RollerRequirementType> get copyWith;
}
