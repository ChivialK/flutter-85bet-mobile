// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'bet_record_time_enum.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$BetRecordTimeTearOff {
  const _$BetRecordTimeTearOff();

// ignore: unused_element
  _BetRecordTime call({int index, String label}) {
    return _BetRecordTime(
      index: index,
      label: label,
    );
  }
}

// ignore: unused_element
const $BetRecordTime = _$BetRecordTimeTearOff();

mixin _$BetRecordTime {
  int get index;
  String get label;

  $BetRecordTimeCopyWith<BetRecordTime> get copyWith;
}

abstract class $BetRecordTimeCopyWith<$Res> {
  factory $BetRecordTimeCopyWith(
          BetRecordTime value, $Res Function(BetRecordTime) then) =
      _$BetRecordTimeCopyWithImpl<$Res>;
  $Res call({int index, String label});
}

class _$BetRecordTimeCopyWithImpl<$Res>
    implements $BetRecordTimeCopyWith<$Res> {
  _$BetRecordTimeCopyWithImpl(this._value, this._then);

  final BetRecordTime _value;
  // ignore: unused_field
  final $Res Function(BetRecordTime) _then;

  @override
  $Res call({
    Object index = freezed,
    Object label = freezed,
  }) {
    return _then(_value.copyWith(
      index: index == freezed ? _value.index : index as int,
      label: label == freezed ? _value.label : label as String,
    ));
  }
}

abstract class _$BetRecordTimeCopyWith<$Res>
    implements $BetRecordTimeCopyWith<$Res> {
  factory _$BetRecordTimeCopyWith(
          _BetRecordTime value, $Res Function(_BetRecordTime) then) =
      __$BetRecordTimeCopyWithImpl<$Res>;
  @override
  $Res call({int index, String label});
}

class __$BetRecordTimeCopyWithImpl<$Res>
    extends _$BetRecordTimeCopyWithImpl<$Res>
    implements _$BetRecordTimeCopyWith<$Res> {
  __$BetRecordTimeCopyWithImpl(
      _BetRecordTime _value, $Res Function(_BetRecordTime) _then)
      : super(_value, (v) => _then(v as _BetRecordTime));

  @override
  _BetRecordTime get _value => super._value as _BetRecordTime;

  @override
  $Res call({
    Object index = freezed,
    Object label = freezed,
  }) {
    return _then(_BetRecordTime(
      index: index == freezed ? _value.index : index as int,
      label: label == freezed ? _value.label : label as String,
    ));
  }
}

class _$_BetRecordTime implements _BetRecordTime {
  const _$_BetRecordTime({this.index, this.label});

  @override
  final int index;
  @override
  final String label;

  @override
  String toString() {
    return 'BetRecordTime(index: $index, label: $label)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BetRecordTime &&
            (identical(other.index, index) ||
                const DeepCollectionEquality().equals(other.index, index)) &&
            (identical(other.label, label) ||
                const DeepCollectionEquality().equals(other.label, label)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(index) ^
      const DeepCollectionEquality().hash(label);

  @override
  _$BetRecordTimeCopyWith<_BetRecordTime> get copyWith =>
      __$BetRecordTimeCopyWithImpl<_BetRecordTime>(this, _$identity);
}

abstract class _BetRecordTime implements BetRecordTime {
  const factory _BetRecordTime({int index, String label}) = _$_BetRecordTime;

  @override
  int get index;
  @override
  String get label;
  @override
  _$BetRecordTimeCopyWith<_BetRecordTime> get copyWith;
}
