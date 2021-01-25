// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'deposit_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$DepositResultTearOff {
  const _$DepositResultTearOff();

// ignore: unused_element
  _DepositResult call(
      {@nullable bool ss,
      @nullable String url,
      String msg = '',
      int code,
      @JsonKey(name: 'ledgerindex', defaultValue: -1) int ledger}) {
    return _DepositResult(
      ss: ss,
      url: url,
      msg: msg,
      code: code,
      ledger: ledger,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $DepositResult = _$DepositResultTearOff();

/// @nodoc
mixin _$DepositResult {
  @nullable
  bool get ss;
  @nullable
  String get url;
  String get msg;
  int get code;
  @JsonKey(name: 'ledgerindex', defaultValue: -1)
  int get ledger;

  @JsonKey(ignore: true)
  $DepositResultCopyWith<DepositResult> get copyWith;
}

/// @nodoc
abstract class $DepositResultCopyWith<$Res> {
  factory $DepositResultCopyWith(
          DepositResult value, $Res Function(DepositResult) then) =
      _$DepositResultCopyWithImpl<$Res>;
  $Res call(
      {@nullable bool ss,
      @nullable String url,
      String msg,
      int code,
      @JsonKey(name: 'ledgerindex', defaultValue: -1) int ledger});
}

/// @nodoc
class _$DepositResultCopyWithImpl<$Res>
    implements $DepositResultCopyWith<$Res> {
  _$DepositResultCopyWithImpl(this._value, this._then);

  final DepositResult _value;
  // ignore: unused_field
  final $Res Function(DepositResult) _then;

  @override
  $Res call({
    Object ss = freezed,
    Object url = freezed,
    Object msg = freezed,
    Object code = freezed,
    Object ledger = freezed,
  }) {
    return _then(_value.copyWith(
      ss: ss == freezed ? _value.ss : ss as bool,
      url: url == freezed ? _value.url : url as String,
      msg: msg == freezed ? _value.msg : msg as String,
      code: code == freezed ? _value.code : code as int,
      ledger: ledger == freezed ? _value.ledger : ledger as int,
    ));
  }
}

/// @nodoc
abstract class _$DepositResultCopyWith<$Res>
    implements $DepositResultCopyWith<$Res> {
  factory _$DepositResultCopyWith(
          _DepositResult value, $Res Function(_DepositResult) then) =
      __$DepositResultCopyWithImpl<$Res>;
  @override
  $Res call(
      {@nullable bool ss,
      @nullable String url,
      String msg,
      int code,
      @JsonKey(name: 'ledgerindex', defaultValue: -1) int ledger});
}

/// @nodoc
class __$DepositResultCopyWithImpl<$Res>
    extends _$DepositResultCopyWithImpl<$Res>
    implements _$DepositResultCopyWith<$Res> {
  __$DepositResultCopyWithImpl(
      _DepositResult _value, $Res Function(_DepositResult) _then)
      : super(_value, (v) => _then(v as _DepositResult));

  @override
  _DepositResult get _value => super._value as _DepositResult;

  @override
  $Res call({
    Object ss = freezed,
    Object url = freezed,
    Object msg = freezed,
    Object code = freezed,
    Object ledger = freezed,
  }) {
    return _then(_DepositResult(
      ss: ss == freezed ? _value.ss : ss as bool,
      url: url == freezed ? _value.url : url as String,
      msg: msg == freezed ? _value.msg : msg as String,
      code: code == freezed ? _value.code : code as int,
      ledger: ledger == freezed ? _value.ledger : ledger as int,
    ));
  }
}

/// @nodoc
class _$_DepositResult implements _DepositResult {
  const _$_DepositResult(
      {@nullable this.ss,
      @nullable this.url,
      this.msg = '',
      this.code,
      @JsonKey(name: 'ledgerindex', defaultValue: -1) this.ledger})
      : assert(msg != null);

  @override
  @nullable
  final bool ss;
  @override
  @nullable
  final String url;
  @JsonKey(defaultValue: '')
  @override
  final String msg;
  @override
  final int code;
  @override
  @JsonKey(name: 'ledgerindex', defaultValue: -1)
  final int ledger;

  @override
  String toString() {
    return 'DepositResult(ss: $ss, url: $url, msg: $msg, code: $code, ledger: $ledger)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DepositResult &&
            (identical(other.ss, ss) ||
                const DeepCollectionEquality().equals(other.ss, ss)) &&
            (identical(other.url, url) ||
                const DeepCollectionEquality().equals(other.url, url)) &&
            (identical(other.msg, msg) ||
                const DeepCollectionEquality().equals(other.msg, msg)) &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)) &&
            (identical(other.ledger, ledger) ||
                const DeepCollectionEquality().equals(other.ledger, ledger)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(ss) ^
      const DeepCollectionEquality().hash(url) ^
      const DeepCollectionEquality().hash(msg) ^
      const DeepCollectionEquality().hash(code) ^
      const DeepCollectionEquality().hash(ledger);

  @JsonKey(ignore: true)
  @override
  _$DepositResultCopyWith<_DepositResult> get copyWith =>
      __$DepositResultCopyWithImpl<_DepositResult>(this, _$identity);
}

abstract class _DepositResult implements DepositResult {
  const factory _DepositResult(
          {@nullable bool ss,
          @nullable String url,
          String msg,
          int code,
          @JsonKey(name: 'ledgerindex', defaultValue: -1) int ledger}) =
      _$_DepositResult;

  @override
  @nullable
  bool get ss;
  @override
  @nullable
  String get url;
  @override
  String get msg;
  @override
  int get code;
  @override
  @JsonKey(name: 'ledgerindex', defaultValue: -1)
  int get ledger;
  @override
  @JsonKey(ignore: true)
  _$DepositResultCopyWith<_DepositResult> get copyWith;
}
