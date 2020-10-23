// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'deals_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$DealsFormTearOff {
  const _$DealsFormTearOff();

// ignore: unused_element
  _DealsForm call({int page, int time, int type, int status}) {
    return _DealsForm(
      page: page,
      time: time,
      type: type,
      status: status,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $DealsForm = _$DealsFormTearOff();

/// @nodoc
mixin _$DealsForm {
  int get page;
  int get time;
  int get type;
  int get status;

  $DealsFormCopyWith<DealsForm> get copyWith;
}

/// @nodoc
abstract class $DealsFormCopyWith<$Res> {
  factory $DealsFormCopyWith(DealsForm value, $Res Function(DealsForm) then) =
      _$DealsFormCopyWithImpl<$Res>;
  $Res call({int page, int time, int type, int status});
}

/// @nodoc
class _$DealsFormCopyWithImpl<$Res> implements $DealsFormCopyWith<$Res> {
  _$DealsFormCopyWithImpl(this._value, this._then);

  final DealsForm _value;
  // ignore: unused_field
  final $Res Function(DealsForm) _then;

  @override
  $Res call({
    Object page = freezed,
    Object time = freezed,
    Object type = freezed,
    Object status = freezed,
  }) {
    return _then(_value.copyWith(
      page: page == freezed ? _value.page : page as int,
      time: time == freezed ? _value.time : time as int,
      type: type == freezed ? _value.type : type as int,
      status: status == freezed ? _value.status : status as int,
    ));
  }
}

/// @nodoc
abstract class _$DealsFormCopyWith<$Res> implements $DealsFormCopyWith<$Res> {
  factory _$DealsFormCopyWith(
          _DealsForm value, $Res Function(_DealsForm) then) =
      __$DealsFormCopyWithImpl<$Res>;
  @override
  $Res call({int page, int time, int type, int status});
}

/// @nodoc
class __$DealsFormCopyWithImpl<$Res> extends _$DealsFormCopyWithImpl<$Res>
    implements _$DealsFormCopyWith<$Res> {
  __$DealsFormCopyWithImpl(_DealsForm _value, $Res Function(_DealsForm) _then)
      : super(_value, (v) => _then(v as _DealsForm));

  @override
  _DealsForm get _value => super._value as _DealsForm;

  @override
  $Res call({
    Object page = freezed,
    Object time = freezed,
    Object type = freezed,
    Object status = freezed,
  }) {
    return _then(_DealsForm(
      page: page == freezed ? _value.page : page as int,
      time: time == freezed ? _value.time : time as int,
      type: type == freezed ? _value.type : type as int,
      status: status == freezed ? _value.status : status as int,
    ));
  }
}

/// @nodoc
class _$_DealsForm implements _DealsForm {
  const _$_DealsForm({this.page, this.time, this.type, this.status});

  @override
  final int page;
  @override
  final int time;
  @override
  final int type;
  @override
  final int status;

  @override
  String toString() {
    return 'DealsForm(page: $page, time: $time, type: $type, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DealsForm &&
            (identical(other.page, page) ||
                const DeepCollectionEquality().equals(other.page, page)) &&
            (identical(other.time, time) ||
                const DeepCollectionEquality().equals(other.time, time)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(page) ^
      const DeepCollectionEquality().hash(time) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(status);

  @override
  _$DealsFormCopyWith<_DealsForm> get copyWith =>
      __$DealsFormCopyWithImpl<_DealsForm>(this, _$identity);
}

abstract class _DealsForm implements DealsForm {
  const factory _DealsForm({int page, int time, int type, int status}) =
      _$_DealsForm;

  @override
  int get page;
  @override
  int get time;
  @override
  int get type;
  @override
  int get status;
  @override
  _$DealsFormCopyWith<_DealsForm> get copyWith;
}
