// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'transfer_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$TransferFormTearOff {
  const _$TransferFormTearOff();

// ignore: unused_element
  _TransferForm call(
      {@required String amount, @required String from, @required String to}) {
    return _TransferForm(
      amount: amount,
      from: from,
      to: to,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $TransferForm = _$TransferFormTearOff();

/// @nodoc
mixin _$TransferForm {
  String get amount;
  String get from;
  String get to;

  @JsonKey(ignore: true)
  $TransferFormCopyWith<TransferForm> get copyWith;
}

/// @nodoc
abstract class $TransferFormCopyWith<$Res> {
  factory $TransferFormCopyWith(
          TransferForm value, $Res Function(TransferForm) then) =
      _$TransferFormCopyWithImpl<$Res>;
  $Res call({String amount, String from, String to});
}

/// @nodoc
class _$TransferFormCopyWithImpl<$Res> implements $TransferFormCopyWith<$Res> {
  _$TransferFormCopyWithImpl(this._value, this._then);

  final TransferForm _value;
  // ignore: unused_field
  final $Res Function(TransferForm) _then;

  @override
  $Res call({
    Object amount = freezed,
    Object from = freezed,
    Object to = freezed,
  }) {
    return _then(_value.copyWith(
      amount: amount == freezed ? _value.amount : amount as String,
      from: from == freezed ? _value.from : from as String,
      to: to == freezed ? _value.to : to as String,
    ));
  }
}

/// @nodoc
abstract class _$TransferFormCopyWith<$Res>
    implements $TransferFormCopyWith<$Res> {
  factory _$TransferFormCopyWith(
          _TransferForm value, $Res Function(_TransferForm) then) =
      __$TransferFormCopyWithImpl<$Res>;
  @override
  $Res call({String amount, String from, String to});
}

/// @nodoc
class __$TransferFormCopyWithImpl<$Res> extends _$TransferFormCopyWithImpl<$Res>
    implements _$TransferFormCopyWith<$Res> {
  __$TransferFormCopyWithImpl(
      _TransferForm _value, $Res Function(_TransferForm) _then)
      : super(_value, (v) => _then(v as _TransferForm));

  @override
  _TransferForm get _value => super._value as _TransferForm;

  @override
  $Res call({
    Object amount = freezed,
    Object from = freezed,
    Object to = freezed,
  }) {
    return _then(_TransferForm(
      amount: amount == freezed ? _value.amount : amount as String,
      from: from == freezed ? _value.from : from as String,
      to: to == freezed ? _value.to : to as String,
    ));
  }
}

/// @nodoc
class _$_TransferForm implements _TransferForm {
  const _$_TransferForm(
      {@required this.amount, @required this.from, @required this.to})
      : assert(amount != null),
        assert(from != null),
        assert(to != null);

  @override
  final String amount;
  @override
  final String from;
  @override
  final String to;

  @override
  String toString() {
    return 'TransferForm(amount: $amount, from: $from, to: $to)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TransferForm &&
            (identical(other.amount, amount) ||
                const DeepCollectionEquality().equals(other.amount, amount)) &&
            (identical(other.from, from) ||
                const DeepCollectionEquality().equals(other.from, from)) &&
            (identical(other.to, to) ||
                const DeepCollectionEquality().equals(other.to, to)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(amount) ^
      const DeepCollectionEquality().hash(from) ^
      const DeepCollectionEquality().hash(to);

  @JsonKey(ignore: true)
  @override
  _$TransferFormCopyWith<_TransferForm> get copyWith =>
      __$TransferFormCopyWithImpl<_TransferForm>(this, _$identity);
}

abstract class _TransferForm implements TransferForm {
  const factory _TransferForm(
      {@required String amount,
      @required String from,
      @required String to}) = _$_TransferForm;

  @override
  String get amount;
  @override
  String get from;
  @override
  String get to;
  @override
  @JsonKey(ignore: true)
  _$TransferFormCopyWith<_TransferForm> get copyWith;
}
