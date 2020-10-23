// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'bet_record_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$BetRecordFormTearOff {
  const _$BetRecordFormTearOff();

// ignore: unused_element
  _BetRecordForm call(
      {@required int categoryId,
      @required String platform,
      @required int page,
      @required BetRecordTimeEnum time,
      String startTime,
      String endTime}) {
    return _BetRecordForm(
      categoryId: categoryId,
      platform: platform,
      page: page,
      time: time,
      startTime: startTime,
      endTime: endTime,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $BetRecordForm = _$BetRecordFormTearOff();

/// @nodoc
mixin _$BetRecordForm {
  int get categoryId;
  String get platform;
  int get page;
  BetRecordTimeEnum get time;
  String get startTime;
  String get endTime;

  $BetRecordFormCopyWith<BetRecordForm> get copyWith;
}

/// @nodoc
abstract class $BetRecordFormCopyWith<$Res> {
  factory $BetRecordFormCopyWith(
          BetRecordForm value, $Res Function(BetRecordForm) then) =
      _$BetRecordFormCopyWithImpl<$Res>;
  $Res call(
      {int categoryId,
      String platform,
      int page,
      BetRecordTimeEnum time,
      String startTime,
      String endTime});
}

/// @nodoc
class _$BetRecordFormCopyWithImpl<$Res>
    implements $BetRecordFormCopyWith<$Res> {
  _$BetRecordFormCopyWithImpl(this._value, this._then);

  final BetRecordForm _value;
  // ignore: unused_field
  final $Res Function(BetRecordForm) _then;

  @override
  $Res call({
    Object categoryId = freezed,
    Object platform = freezed,
    Object page = freezed,
    Object time = freezed,
    Object startTime = freezed,
    Object endTime = freezed,
  }) {
    return _then(_value.copyWith(
      categoryId: categoryId == freezed ? _value.categoryId : categoryId as int,
      platform: platform == freezed ? _value.platform : platform as String,
      page: page == freezed ? _value.page : page as int,
      time: time == freezed ? _value.time : time as BetRecordTimeEnum,
      startTime: startTime == freezed ? _value.startTime : startTime as String,
      endTime: endTime == freezed ? _value.endTime : endTime as String,
    ));
  }
}

/// @nodoc
abstract class _$BetRecordFormCopyWith<$Res>
    implements $BetRecordFormCopyWith<$Res> {
  factory _$BetRecordFormCopyWith(
          _BetRecordForm value, $Res Function(_BetRecordForm) then) =
      __$BetRecordFormCopyWithImpl<$Res>;
  @override
  $Res call(
      {int categoryId,
      String platform,
      int page,
      BetRecordTimeEnum time,
      String startTime,
      String endTime});
}

/// @nodoc
class __$BetRecordFormCopyWithImpl<$Res>
    extends _$BetRecordFormCopyWithImpl<$Res>
    implements _$BetRecordFormCopyWith<$Res> {
  __$BetRecordFormCopyWithImpl(
      _BetRecordForm _value, $Res Function(_BetRecordForm) _then)
      : super(_value, (v) => _then(v as _BetRecordForm));

  @override
  _BetRecordForm get _value => super._value as _BetRecordForm;

  @override
  $Res call({
    Object categoryId = freezed,
    Object platform = freezed,
    Object page = freezed,
    Object time = freezed,
    Object startTime = freezed,
    Object endTime = freezed,
  }) {
    return _then(_BetRecordForm(
      categoryId: categoryId == freezed ? _value.categoryId : categoryId as int,
      platform: platform == freezed ? _value.platform : platform as String,
      page: page == freezed ? _value.page : page as int,
      time: time == freezed ? _value.time : time as BetRecordTimeEnum,
      startTime: startTime == freezed ? _value.startTime : startTime as String,
      endTime: endTime == freezed ? _value.endTime : endTime as String,
    ));
  }
}

/// @nodoc
class _$_BetRecordForm implements _BetRecordForm {
  const _$_BetRecordForm(
      {@required this.categoryId,
      @required this.platform,
      @required this.page,
      @required this.time,
      this.startTime,
      this.endTime})
      : assert(categoryId != null),
        assert(platform != null),
        assert(page != null),
        assert(time != null);

  @override
  final int categoryId;
  @override
  final String platform;
  @override
  final int page;
  @override
  final BetRecordTimeEnum time;
  @override
  final String startTime;
  @override
  final String endTime;

  @override
  String toString() {
    return 'BetRecordForm(categoryId: $categoryId, platform: $platform, page: $page, time: $time, startTime: $startTime, endTime: $endTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BetRecordForm &&
            (identical(other.categoryId, categoryId) ||
                const DeepCollectionEquality()
                    .equals(other.categoryId, categoryId)) &&
            (identical(other.platform, platform) ||
                const DeepCollectionEquality()
                    .equals(other.platform, platform)) &&
            (identical(other.page, page) ||
                const DeepCollectionEquality().equals(other.page, page)) &&
            (identical(other.time, time) ||
                const DeepCollectionEquality().equals(other.time, time)) &&
            (identical(other.startTime, startTime) ||
                const DeepCollectionEquality()
                    .equals(other.startTime, startTime)) &&
            (identical(other.endTime, endTime) ||
                const DeepCollectionEquality().equals(other.endTime, endTime)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(categoryId) ^
      const DeepCollectionEquality().hash(platform) ^
      const DeepCollectionEquality().hash(page) ^
      const DeepCollectionEquality().hash(time) ^
      const DeepCollectionEquality().hash(startTime) ^
      const DeepCollectionEquality().hash(endTime);

  @override
  _$BetRecordFormCopyWith<_BetRecordForm> get copyWith =>
      __$BetRecordFormCopyWithImpl<_BetRecordForm>(this, _$identity);
}

abstract class _BetRecordForm implements BetRecordForm {
  const factory _BetRecordForm(
      {@required int categoryId,
      @required String platform,
      @required int page,
      @required BetRecordTimeEnum time,
      String startTime,
      String endTime}) = _$_BetRecordForm;

  @override
  int get categoryId;
  @override
  String get platform;
  @override
  int get page;
  @override
  BetRecordTimeEnum get time;
  @override
  String get startTime;
  @override
  String get endTime;
  @override
  _$BetRecordFormCopyWith<_BetRecordForm> get copyWith;
}
