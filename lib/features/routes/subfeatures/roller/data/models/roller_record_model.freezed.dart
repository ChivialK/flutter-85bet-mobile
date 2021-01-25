// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'roller_record_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$RollerRecordModelTearOff {
  const _$RollerRecordModelTearOff();

// ignore: unused_element
  _RollerRecordModel call(
      {int id,
      @JsonKey(name: 'accountid') int accountId,
      String method,
      @JsonKey(name: 'method_ch') String methodCh,
      String name,
      String detail,
      @JsonKey(name: 'cdate') String date,
      int count}) {
    return _RollerRecordModel(
      id: id,
      accountId: accountId,
      method: method,
      methodCh: methodCh,
      name: name,
      detail: detail,
      date: date,
      count: count,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $RollerRecordModel = _$RollerRecordModelTearOff();

/// @nodoc
mixin _$RollerRecordModel {
  int get id;
  @JsonKey(name: 'accountid')
  int get accountId;
  String get method;
  @JsonKey(name: 'method_ch')
  String get methodCh;
  String get name;
  String get detail;
  @JsonKey(name: 'cdate')
  String get date;
  int get count;

  $RollerRecordModelCopyWith<RollerRecordModel> get copyWith;
}

/// @nodoc
abstract class $RollerRecordModelCopyWith<$Res> {
  factory $RollerRecordModelCopyWith(
          RollerRecordModel value, $Res Function(RollerRecordModel) then) =
      _$RollerRecordModelCopyWithImpl<$Res>;
  $Res call(
      {int id,
      @JsonKey(name: 'accountid') int accountId,
      String method,
      @JsonKey(name: 'method_ch') String methodCh,
      String name,
      String detail,
      @JsonKey(name: 'cdate') String date,
      int count});
}

/// @nodoc
class _$RollerRecordModelCopyWithImpl<$Res>
    implements $RollerRecordModelCopyWith<$Res> {
  _$RollerRecordModelCopyWithImpl(this._value, this._then);

  final RollerRecordModel _value;
  // ignore: unused_field
  final $Res Function(RollerRecordModel) _then;

  @override
  $Res call({
    Object id = freezed,
    Object accountId = freezed,
    Object method = freezed,
    Object methodCh = freezed,
    Object name = freezed,
    Object detail = freezed,
    Object date = freezed,
    Object count = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as int,
      accountId: accountId == freezed ? _value.accountId : accountId as int,
      method: method == freezed ? _value.method : method as String,
      methodCh: methodCh == freezed ? _value.methodCh : methodCh as String,
      name: name == freezed ? _value.name : name as String,
      detail: detail == freezed ? _value.detail : detail as String,
      date: date == freezed ? _value.date : date as String,
      count: count == freezed ? _value.count : count as int,
    ));
  }
}

/// @nodoc
abstract class _$RollerRecordModelCopyWith<$Res>
    implements $RollerRecordModelCopyWith<$Res> {
  factory _$RollerRecordModelCopyWith(
          _RollerRecordModel value, $Res Function(_RollerRecordModel) then) =
      __$RollerRecordModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      @JsonKey(name: 'accountid') int accountId,
      String method,
      @JsonKey(name: 'method_ch') String methodCh,
      String name,
      String detail,
      @JsonKey(name: 'cdate') String date,
      int count});
}

/// @nodoc
class __$RollerRecordModelCopyWithImpl<$Res>
    extends _$RollerRecordModelCopyWithImpl<$Res>
    implements _$RollerRecordModelCopyWith<$Res> {
  __$RollerRecordModelCopyWithImpl(
      _RollerRecordModel _value, $Res Function(_RollerRecordModel) _then)
      : super(_value, (v) => _then(v as _RollerRecordModel));

  @override
  _RollerRecordModel get _value => super._value as _RollerRecordModel;

  @override
  $Res call({
    Object id = freezed,
    Object accountId = freezed,
    Object method = freezed,
    Object methodCh = freezed,
    Object name = freezed,
    Object detail = freezed,
    Object date = freezed,
    Object count = freezed,
  }) {
    return _then(_RollerRecordModel(
      id: id == freezed ? _value.id : id as int,
      accountId: accountId == freezed ? _value.accountId : accountId as int,
      method: method == freezed ? _value.method : method as String,
      methodCh: methodCh == freezed ? _value.methodCh : methodCh as String,
      name: name == freezed ? _value.name : name as String,
      detail: detail == freezed ? _value.detail : detail as String,
      date: date == freezed ? _value.date : date as String,
      count: count == freezed ? _value.count : count as int,
    ));
  }
}

/// @nodoc
class _$_RollerRecordModel implements _RollerRecordModel {
  const _$_RollerRecordModel(
      {this.id,
      @JsonKey(name: 'accountid') this.accountId,
      this.method,
      @JsonKey(name: 'method_ch') this.methodCh,
      this.name,
      this.detail,
      @JsonKey(name: 'cdate') this.date,
      this.count});

  @override
  final int id;
  @override
  @JsonKey(name: 'accountid')
  final int accountId;
  @override
  final String method;
  @override
  @JsonKey(name: 'method_ch')
  final String methodCh;
  @override
  final String name;
  @override
  final String detail;
  @override
  @JsonKey(name: 'cdate')
  final String date;
  @override
  final int count;

  @override
  String toString() {
    return 'RollerRecordModel(id: $id, accountId: $accountId, method: $method, methodCh: $methodCh, name: $name, detail: $detail, date: $date, count: $count)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RollerRecordModel &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.accountId, accountId) ||
                const DeepCollectionEquality()
                    .equals(other.accountId, accountId)) &&
            (identical(other.method, method) ||
                const DeepCollectionEquality().equals(other.method, method)) &&
            (identical(other.methodCh, methodCh) ||
                const DeepCollectionEquality()
                    .equals(other.methodCh, methodCh)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.detail, detail) ||
                const DeepCollectionEquality().equals(other.detail, detail)) &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)) &&
            (identical(other.count, count) ||
                const DeepCollectionEquality().equals(other.count, count)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(accountId) ^
      const DeepCollectionEquality().hash(method) ^
      const DeepCollectionEquality().hash(methodCh) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(detail) ^
      const DeepCollectionEquality().hash(date) ^
      const DeepCollectionEquality().hash(count);

  @override
  _$RollerRecordModelCopyWith<_RollerRecordModel> get copyWith =>
      __$RollerRecordModelCopyWithImpl<_RollerRecordModel>(this, _$identity);
}

abstract class _RollerRecordModel implements RollerRecordModel {
  const factory _RollerRecordModel(
      {int id,
      @JsonKey(name: 'accountid') int accountId,
      String method,
      @JsonKey(name: 'method_ch') String methodCh,
      String name,
      String detail,
      @JsonKey(name: 'cdate') String date,
      int count}) = _$_RollerRecordModel;

  @override
  int get id;
  @override
  @JsonKey(name: 'accountid')
  int get accountId;
  @override
  String get method;
  @override
  @JsonKey(name: 'method_ch')
  String get methodCh;
  @override
  String get name;
  @override
  String get detail;
  @override
  @JsonKey(name: 'cdate')
  String get date;
  @override
  int get count;
  @override
  _$RollerRecordModelCopyWith<_RollerRecordModel> get copyWith;
}
