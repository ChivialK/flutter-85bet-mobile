// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'payment_field_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$PaymentFieldStateTearOff {
  const _$PaymentFieldStateTearOff();

// ignore: unused_element
  _PaymentFieldState call(
      {num min,
      num max,
      num amountStep,
      String fieldError,
      bool isValid = false}) {
    return _PaymentFieldState(
      min: min,
      max: max,
      amountStep: amountStep,
      fieldError: fieldError,
      isValid: isValid,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $PaymentFieldState = _$PaymentFieldStateTearOff();

/// @nodoc
mixin _$PaymentFieldState {
  num get min;
  num get max;
  num get amountStep;
  String get fieldError;
  bool get isValid;

  @JsonKey(ignore: true)
  $PaymentFieldStateCopyWith<PaymentFieldState> get copyWith;
}

/// @nodoc
abstract class $PaymentFieldStateCopyWith<$Res> {
  factory $PaymentFieldStateCopyWith(
          PaymentFieldState value, $Res Function(PaymentFieldState) then) =
      _$PaymentFieldStateCopyWithImpl<$Res>;
  $Res call(
      {num min, num max, num amountStep, String fieldError, bool isValid});
}

/// @nodoc
class _$PaymentFieldStateCopyWithImpl<$Res>
    implements $PaymentFieldStateCopyWith<$Res> {
  _$PaymentFieldStateCopyWithImpl(this._value, this._then);

  final PaymentFieldState _value;
  // ignore: unused_field
  final $Res Function(PaymentFieldState) _then;

  @override
  $Res call({
    Object min = freezed,
    Object max = freezed,
    Object amountStep = freezed,
    Object fieldError = freezed,
    Object isValid = freezed,
  }) {
    return _then(_value.copyWith(
      min: min == freezed ? _value.min : min as num,
      max: max == freezed ? _value.max : max as num,
      amountStep: amountStep == freezed ? _value.amountStep : amountStep as num,
      fieldError:
          fieldError == freezed ? _value.fieldError : fieldError as String,
      isValid: isValid == freezed ? _value.isValid : isValid as bool,
    ));
  }
}

/// @nodoc
abstract class _$PaymentFieldStateCopyWith<$Res>
    implements $PaymentFieldStateCopyWith<$Res> {
  factory _$PaymentFieldStateCopyWith(
          _PaymentFieldState value, $Res Function(_PaymentFieldState) then) =
      __$PaymentFieldStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {num min, num max, num amountStep, String fieldError, bool isValid});
}

/// @nodoc
class __$PaymentFieldStateCopyWithImpl<$Res>
    extends _$PaymentFieldStateCopyWithImpl<$Res>
    implements _$PaymentFieldStateCopyWith<$Res> {
  __$PaymentFieldStateCopyWithImpl(
      _PaymentFieldState _value, $Res Function(_PaymentFieldState) _then)
      : super(_value, (v) => _then(v as _PaymentFieldState));

  @override
  _PaymentFieldState get _value => super._value as _PaymentFieldState;

  @override
  $Res call({
    Object min = freezed,
    Object max = freezed,
    Object amountStep = freezed,
    Object fieldError = freezed,
    Object isValid = freezed,
  }) {
    return _then(_PaymentFieldState(
      min: min == freezed ? _value.min : min as num,
      max: max == freezed ? _value.max : max as num,
      amountStep: amountStep == freezed ? _value.amountStep : amountStep as num,
      fieldError:
          fieldError == freezed ? _value.fieldError : fieldError as String,
      isValid: isValid == freezed ? _value.isValid : isValid as bool,
    ));
  }
}

/// @nodoc
class _$_PaymentFieldState implements _PaymentFieldState {
  const _$_PaymentFieldState(
      {this.min,
      this.max,
      this.amountStep,
      this.fieldError,
      this.isValid = false})
      : assert(isValid != null);

  @override
  final num min;
  @override
  final num max;
  @override
  final num amountStep;
  @override
  final String fieldError;
  @JsonKey(defaultValue: false)
  @override
  final bool isValid;

  @override
  String toString() {
    return 'PaymentFieldState(min: $min, max: $max, amountStep: $amountStep, fieldError: $fieldError, isValid: $isValid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PaymentFieldState &&
            (identical(other.min, min) ||
                const DeepCollectionEquality().equals(other.min, min)) &&
            (identical(other.max, max) ||
                const DeepCollectionEquality().equals(other.max, max)) &&
            (identical(other.amountStep, amountStep) ||
                const DeepCollectionEquality()
                    .equals(other.amountStep, amountStep)) &&
            (identical(other.fieldError, fieldError) ||
                const DeepCollectionEquality()
                    .equals(other.fieldError, fieldError)) &&
            (identical(other.isValid, isValid) ||
                const DeepCollectionEquality().equals(other.isValid, isValid)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(min) ^
      const DeepCollectionEquality().hash(max) ^
      const DeepCollectionEquality().hash(amountStep) ^
      const DeepCollectionEquality().hash(fieldError) ^
      const DeepCollectionEquality().hash(isValid);

  @JsonKey(ignore: true)
  @override
  _$PaymentFieldStateCopyWith<_PaymentFieldState> get copyWith =>
      __$PaymentFieldStateCopyWithImpl<_PaymentFieldState>(this, _$identity);
}

abstract class _PaymentFieldState implements PaymentFieldState {
  const factory _PaymentFieldState(
      {num min,
      num max,
      num amountStep,
      String fieldError,
      bool isValid}) = _$_PaymentFieldState;

  @override
  num get min;
  @override
  num get max;
  @override
  num get amountStep;
  @override
  String get fieldError;
  @override
  bool get isValid;
  @override
  @JsonKey(ignore: true)
  _$PaymentFieldStateCopyWith<_PaymentFieldState> get copyWith;
}
