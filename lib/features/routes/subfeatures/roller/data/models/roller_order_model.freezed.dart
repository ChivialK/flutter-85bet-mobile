// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'roller_order_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$RollerOrderModelTearOff {
  const _$RollerOrderModelTearOff();

// ignore: unused_element
  _RollerOrderModel call(
      {int id,
      @JsonKey(name: 'accountid') int accountId,
      int prize,
      int status,
      @JsonKey(name: 'cdate') String date,
      String name}) {
    return _RollerOrderModel(
      id: id,
      accountId: accountId,
      prize: prize,
      status: status,
      date: date,
      name: name,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $RollerOrderModel = _$RollerOrderModelTearOff();

/// @nodoc
mixin _$RollerOrderModel {
  int get id;
  @JsonKey(name: 'accountid')
  int get accountId;
  int get prize;
  int get status;
  @JsonKey(name: 'cdate')
  String get date;
  String get name;

  $RollerOrderModelCopyWith<RollerOrderModel> get copyWith;
}

/// @nodoc
abstract class $RollerOrderModelCopyWith<$Res> {
  factory $RollerOrderModelCopyWith(
          RollerOrderModel value, $Res Function(RollerOrderModel) then) =
      _$RollerOrderModelCopyWithImpl<$Res>;
  $Res call(
      {int id,
      @JsonKey(name: 'accountid') int accountId,
      int prize,
      int status,
      @JsonKey(name: 'cdate') String date,
      String name});
}

/// @nodoc
class _$RollerOrderModelCopyWithImpl<$Res>
    implements $RollerOrderModelCopyWith<$Res> {
  _$RollerOrderModelCopyWithImpl(this._value, this._then);

  final RollerOrderModel _value;
  // ignore: unused_field
  final $Res Function(RollerOrderModel) _then;

  @override
  $Res call({
    Object id = freezed,
    Object accountId = freezed,
    Object prize = freezed,
    Object status = freezed,
    Object date = freezed,
    Object name = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as int,
      accountId: accountId == freezed ? _value.accountId : accountId as int,
      prize: prize == freezed ? _value.prize : prize as int,
      status: status == freezed ? _value.status : status as int,
      date: date == freezed ? _value.date : date as String,
      name: name == freezed ? _value.name : name as String,
    ));
  }
}

/// @nodoc
abstract class _$RollerOrderModelCopyWith<$Res>
    implements $RollerOrderModelCopyWith<$Res> {
  factory _$RollerOrderModelCopyWith(
          _RollerOrderModel value, $Res Function(_RollerOrderModel) then) =
      __$RollerOrderModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      @JsonKey(name: 'accountid') int accountId,
      int prize,
      int status,
      @JsonKey(name: 'cdate') String date,
      String name});
}

/// @nodoc
class __$RollerOrderModelCopyWithImpl<$Res>
    extends _$RollerOrderModelCopyWithImpl<$Res>
    implements _$RollerOrderModelCopyWith<$Res> {
  __$RollerOrderModelCopyWithImpl(
      _RollerOrderModel _value, $Res Function(_RollerOrderModel) _then)
      : super(_value, (v) => _then(v as _RollerOrderModel));

  @override
  _RollerOrderModel get _value => super._value as _RollerOrderModel;

  @override
  $Res call({
    Object id = freezed,
    Object accountId = freezed,
    Object prize = freezed,
    Object status = freezed,
    Object date = freezed,
    Object name = freezed,
  }) {
    return _then(_RollerOrderModel(
      id: id == freezed ? _value.id : id as int,
      accountId: accountId == freezed ? _value.accountId : accountId as int,
      prize: prize == freezed ? _value.prize : prize as int,
      status: status == freezed ? _value.status : status as int,
      date: date == freezed ? _value.date : date as String,
      name: name == freezed ? _value.name : name as String,
    ));
  }
}

/// @nodoc
class _$_RollerOrderModel implements _RollerOrderModel {
  const _$_RollerOrderModel(
      {this.id,
      @JsonKey(name: 'accountid') this.accountId,
      this.prize,
      this.status,
      @JsonKey(name: 'cdate') this.date,
      this.name});

  @override
  final int id;
  @override
  @JsonKey(name: 'accountid')
  final int accountId;
  @override
  final int prize;
  @override
  final int status;
  @override
  @JsonKey(name: 'cdate')
  final String date;
  @override
  final String name;

  @override
  String toString() {
    return 'RollerOrderModel(id: $id, accountId: $accountId, prize: $prize, status: $status, date: $date, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RollerOrderModel &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.accountId, accountId) ||
                const DeepCollectionEquality()
                    .equals(other.accountId, accountId)) &&
            (identical(other.prize, prize) ||
                const DeepCollectionEquality().equals(other.prize, prize)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(accountId) ^
      const DeepCollectionEquality().hash(prize) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(date) ^
      const DeepCollectionEquality().hash(name);

  @override
  _$RollerOrderModelCopyWith<_RollerOrderModel> get copyWith =>
      __$RollerOrderModelCopyWithImpl<_RollerOrderModel>(this, _$identity);
}

abstract class _RollerOrderModel implements RollerOrderModel {
  const factory _RollerOrderModel(
      {int id,
      @JsonKey(name: 'accountid') int accountId,
      int prize,
      int status,
      @JsonKey(name: 'cdate') String date,
      String name}) = _$_RollerOrderModel;

  @override
  int get id;
  @override
  @JsonKey(name: 'accountid')
  int get accountId;
  @override
  int get prize;
  @override
  int get status;
  @override
  @JsonKey(name: 'cdate')
  String get date;
  @override
  String get name;
  @override
  _$RollerOrderModelCopyWith<_RollerOrderModel> get copyWith;
}
