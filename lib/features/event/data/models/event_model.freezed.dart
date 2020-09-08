// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'event_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$EventModelTearOff {
  const _$EventModelTearOff();

// ignore: unused_element
  _EventModel call(
      {@JsonKey(name: '0') EventData eventData,
      EventSignData signData,
      bool hasData = true}) {
    return _EventModel(
      eventData: eventData,
      signData: signData,
      hasData: hasData,
    );
  }
}

// ignore: unused_element
const $EventModel = _$EventModelTearOff();

mixin _$EventModel {
  @JsonKey(name: '0')
  EventData get eventData;
  EventSignData get signData;
  bool get hasData;

  $EventModelCopyWith<EventModel> get copyWith;
}

abstract class $EventModelCopyWith<$Res> {
  factory $EventModelCopyWith(
          EventModel value, $Res Function(EventModel) then) =
      _$EventModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: '0') EventData eventData,
      EventSignData signData,
      bool hasData});

  $EventDataCopyWith<$Res> get eventData;
  $EventSignDataCopyWith<$Res> get signData;
}

class _$EventModelCopyWithImpl<$Res> implements $EventModelCopyWith<$Res> {
  _$EventModelCopyWithImpl(this._value, this._then);

  final EventModel _value;
  // ignore: unused_field
  final $Res Function(EventModel) _then;

  @override
  $Res call({
    Object eventData = freezed,
    Object signData = freezed,
    Object hasData = freezed,
  }) {
    return _then(_value.copyWith(
      eventData:
          eventData == freezed ? _value.eventData : eventData as EventData,
      signData:
          signData == freezed ? _value.signData : signData as EventSignData,
      hasData: hasData == freezed ? _value.hasData : hasData as bool,
    ));
  }

  @override
  $EventDataCopyWith<$Res> get eventData {
    if (_value.eventData == null) {
      return null;
    }
    return $EventDataCopyWith<$Res>(_value.eventData, (value) {
      return _then(_value.copyWith(eventData: value));
    });
  }

  @override
  $EventSignDataCopyWith<$Res> get signData {
    if (_value.signData == null) {
      return null;
    }
    return $EventSignDataCopyWith<$Res>(_value.signData, (value) {
      return _then(_value.copyWith(signData: value));
    });
  }
}

abstract class _$EventModelCopyWith<$Res> implements $EventModelCopyWith<$Res> {
  factory _$EventModelCopyWith(
          _EventModel value, $Res Function(_EventModel) then) =
      __$EventModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: '0') EventData eventData,
      EventSignData signData,
      bool hasData});

  @override
  $EventDataCopyWith<$Res> get eventData;
  @override
  $EventSignDataCopyWith<$Res> get signData;
}

class __$EventModelCopyWithImpl<$Res> extends _$EventModelCopyWithImpl<$Res>
    implements _$EventModelCopyWith<$Res> {
  __$EventModelCopyWithImpl(
      _EventModel _value, $Res Function(_EventModel) _then)
      : super(_value, (v) => _then(v as _EventModel));

  @override
  _EventModel get _value => super._value as _EventModel;

  @override
  $Res call({
    Object eventData = freezed,
    Object signData = freezed,
    Object hasData = freezed,
  }) {
    return _then(_EventModel(
      eventData:
          eventData == freezed ? _value.eventData : eventData as EventData,
      signData:
          signData == freezed ? _value.signData : signData as EventSignData,
      hasData: hasData == freezed ? _value.hasData : hasData as bool,
    ));
  }
}

class _$_EventModel implements _EventModel {
  const _$_EventModel(
      {@JsonKey(name: '0') this.eventData, this.signData, this.hasData = true})
      : assert(hasData != null);

  @override
  @JsonKey(name: '0')
  final EventData eventData;
  @override
  final EventSignData signData;
  @JsonKey(defaultValue: true)
  @override
  final bool hasData;

  @override
  String toString() {
    return 'EventModel(eventData: $eventData, signData: $signData, hasData: $hasData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _EventModel &&
            (identical(other.eventData, eventData) ||
                const DeepCollectionEquality()
                    .equals(other.eventData, eventData)) &&
            (identical(other.signData, signData) ||
                const DeepCollectionEquality()
                    .equals(other.signData, signData)) &&
            (identical(other.hasData, hasData) ||
                const DeepCollectionEquality().equals(other.hasData, hasData)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(eventData) ^
      const DeepCollectionEquality().hash(signData) ^
      const DeepCollectionEquality().hash(hasData);

  @override
  _$EventModelCopyWith<_EventModel> get copyWith =>
      __$EventModelCopyWithImpl<_EventModel>(this, _$identity);
}

abstract class _EventModel implements EventModel {
  const factory _EventModel(
      {@JsonKey(name: '0') EventData eventData,
      EventSignData signData,
      bool hasData}) = _$_EventModel;

  @override
  @JsonKey(name: '0')
  EventData get eventData;
  @override
  EventSignData get signData;
  @override
  bool get hasData;
  @override
  _$EventModelCopyWith<_EventModel> get copyWith;
}

class _$EventDataTearOff {
  const _$EventDataTearOff();

// ignore: unused_element
  _EventData call(
      {@JsonKey(name: 'continue') String signContinually,
      @JsonKey(name: 'dateend') String dateEnd,
      @JsonKey(name: 'datestart') String dateStart,
      int id,
      @JsonKey(name: 'joinmember') String joinMember,
      String memberLevel,
      String pic,
      @JsonKey(name: 'pic_mobile') int picMobile,
      int prize,
      @JsonKey(name: 'signtimes') int signTimes,
      String status,
      int times,
      String title}) {
    return _EventData(
      signContinually: signContinually,
      dateEnd: dateEnd,
      dateStart: dateStart,
      id: id,
      joinMember: joinMember,
      memberLevel: memberLevel,
      pic: pic,
      picMobile: picMobile,
      prize: prize,
      signTimes: signTimes,
      status: status,
      times: times,
      title: title,
    );
  }
}

// ignore: unused_element
const $EventData = _$EventDataTearOff();

mixin _$EventData {
  @JsonKey(name: 'continue')
  String get signContinually;
  @JsonKey(name: 'dateend')
  String get dateEnd;
  @JsonKey(name: 'datestart')
  String get dateStart;
  int get id;
  @JsonKey(name: 'joinmember')
  String get joinMember;
  String get memberLevel;
  String get pic;
  @JsonKey(name: 'pic_mobile')
  int get picMobile;
  int get prize;
  @JsonKey(name: 'signtimes')
  int get signTimes;
  String get status;
  int get times;
  String get title;

  $EventDataCopyWith<EventData> get copyWith;
}

abstract class $EventDataCopyWith<$Res> {
  factory $EventDataCopyWith(EventData value, $Res Function(EventData) then) =
      _$EventDataCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'continue') String signContinually,
      @JsonKey(name: 'dateend') String dateEnd,
      @JsonKey(name: 'datestart') String dateStart,
      int id,
      @JsonKey(name: 'joinmember') String joinMember,
      String memberLevel,
      String pic,
      @JsonKey(name: 'pic_mobile') int picMobile,
      int prize,
      @JsonKey(name: 'signtimes') int signTimes,
      String status,
      int times,
      String title});
}

class _$EventDataCopyWithImpl<$Res> implements $EventDataCopyWith<$Res> {
  _$EventDataCopyWithImpl(this._value, this._then);

  final EventData _value;
  // ignore: unused_field
  final $Res Function(EventData) _then;

  @override
  $Res call({
    Object signContinually = freezed,
    Object dateEnd = freezed,
    Object dateStart = freezed,
    Object id = freezed,
    Object joinMember = freezed,
    Object memberLevel = freezed,
    Object pic = freezed,
    Object picMobile = freezed,
    Object prize = freezed,
    Object signTimes = freezed,
    Object status = freezed,
    Object times = freezed,
    Object title = freezed,
  }) {
    return _then(_value.copyWith(
      signContinually: signContinually == freezed
          ? _value.signContinually
          : signContinually as String,
      dateEnd: dateEnd == freezed ? _value.dateEnd : dateEnd as String,
      dateStart: dateStart == freezed ? _value.dateStart : dateStart as String,
      id: id == freezed ? _value.id : id as int,
      joinMember:
          joinMember == freezed ? _value.joinMember : joinMember as String,
      memberLevel:
          memberLevel == freezed ? _value.memberLevel : memberLevel as String,
      pic: pic == freezed ? _value.pic : pic as String,
      picMobile: picMobile == freezed ? _value.picMobile : picMobile as int,
      prize: prize == freezed ? _value.prize : prize as int,
      signTimes: signTimes == freezed ? _value.signTimes : signTimes as int,
      status: status == freezed ? _value.status : status as String,
      times: times == freezed ? _value.times : times as int,
      title: title == freezed ? _value.title : title as String,
    ));
  }
}

abstract class _$EventDataCopyWith<$Res> implements $EventDataCopyWith<$Res> {
  factory _$EventDataCopyWith(
          _EventData value, $Res Function(_EventData) then) =
      __$EventDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'continue') String signContinually,
      @JsonKey(name: 'dateend') String dateEnd,
      @JsonKey(name: 'datestart') String dateStart,
      int id,
      @JsonKey(name: 'joinmember') String joinMember,
      String memberLevel,
      String pic,
      @JsonKey(name: 'pic_mobile') int picMobile,
      int prize,
      @JsonKey(name: 'signtimes') int signTimes,
      String status,
      int times,
      String title});
}

class __$EventDataCopyWithImpl<$Res> extends _$EventDataCopyWithImpl<$Res>
    implements _$EventDataCopyWith<$Res> {
  __$EventDataCopyWithImpl(_EventData _value, $Res Function(_EventData) _then)
      : super(_value, (v) => _then(v as _EventData));

  @override
  _EventData get _value => super._value as _EventData;

  @override
  $Res call({
    Object signContinually = freezed,
    Object dateEnd = freezed,
    Object dateStart = freezed,
    Object id = freezed,
    Object joinMember = freezed,
    Object memberLevel = freezed,
    Object pic = freezed,
    Object picMobile = freezed,
    Object prize = freezed,
    Object signTimes = freezed,
    Object status = freezed,
    Object times = freezed,
    Object title = freezed,
  }) {
    return _then(_EventData(
      signContinually: signContinually == freezed
          ? _value.signContinually
          : signContinually as String,
      dateEnd: dateEnd == freezed ? _value.dateEnd : dateEnd as String,
      dateStart: dateStart == freezed ? _value.dateStart : dateStart as String,
      id: id == freezed ? _value.id : id as int,
      joinMember:
          joinMember == freezed ? _value.joinMember : joinMember as String,
      memberLevel:
          memberLevel == freezed ? _value.memberLevel : memberLevel as String,
      pic: pic == freezed ? _value.pic : pic as String,
      picMobile: picMobile == freezed ? _value.picMobile : picMobile as int,
      prize: prize == freezed ? _value.prize : prize as int,
      signTimes: signTimes == freezed ? _value.signTimes : signTimes as int,
      status: status == freezed ? _value.status : status as String,
      times: times == freezed ? _value.times : times as int,
      title: title == freezed ? _value.title : title as String,
    ));
  }
}

class _$_EventData implements _EventData {
  const _$_EventData(
      {@JsonKey(name: 'continue') this.signContinually,
      @JsonKey(name: 'dateend') this.dateEnd,
      @JsonKey(name: 'datestart') this.dateStart,
      this.id,
      @JsonKey(name: 'joinmember') this.joinMember,
      this.memberLevel,
      this.pic,
      @JsonKey(name: 'pic_mobile') this.picMobile,
      this.prize,
      @JsonKey(name: 'signtimes') this.signTimes,
      this.status,
      this.times,
      this.title});

  @override
  @JsonKey(name: 'continue')
  final String signContinually;
  @override
  @JsonKey(name: 'dateend')
  final String dateEnd;
  @override
  @JsonKey(name: 'datestart')
  final String dateStart;
  @override
  final int id;
  @override
  @JsonKey(name: 'joinmember')
  final String joinMember;
  @override
  final String memberLevel;
  @override
  final String pic;
  @override
  @JsonKey(name: 'pic_mobile')
  final int picMobile;
  @override
  final int prize;
  @override
  @JsonKey(name: 'signtimes')
  final int signTimes;
  @override
  final String status;
  @override
  final int times;
  @override
  final String title;

  @override
  String toString() {
    return 'EventData(signContinually: $signContinually, dateEnd: $dateEnd, dateStart: $dateStart, id: $id, joinMember: $joinMember, memberLevel: $memberLevel, pic: $pic, picMobile: $picMobile, prize: $prize, signTimes: $signTimes, status: $status, times: $times, title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _EventData &&
            (identical(other.signContinually, signContinually) ||
                const DeepCollectionEquality()
                    .equals(other.signContinually, signContinually)) &&
            (identical(other.dateEnd, dateEnd) ||
                const DeepCollectionEquality()
                    .equals(other.dateEnd, dateEnd)) &&
            (identical(other.dateStart, dateStart) ||
                const DeepCollectionEquality()
                    .equals(other.dateStart, dateStart)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.joinMember, joinMember) ||
                const DeepCollectionEquality()
                    .equals(other.joinMember, joinMember)) &&
            (identical(other.memberLevel, memberLevel) ||
                const DeepCollectionEquality()
                    .equals(other.memberLevel, memberLevel)) &&
            (identical(other.pic, pic) ||
                const DeepCollectionEquality().equals(other.pic, pic)) &&
            (identical(other.picMobile, picMobile) ||
                const DeepCollectionEquality()
                    .equals(other.picMobile, picMobile)) &&
            (identical(other.prize, prize) ||
                const DeepCollectionEquality().equals(other.prize, prize)) &&
            (identical(other.signTimes, signTimes) ||
                const DeepCollectionEquality()
                    .equals(other.signTimes, signTimes)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.times, times) ||
                const DeepCollectionEquality().equals(other.times, times)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(signContinually) ^
      const DeepCollectionEquality().hash(dateEnd) ^
      const DeepCollectionEquality().hash(dateStart) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(joinMember) ^
      const DeepCollectionEquality().hash(memberLevel) ^
      const DeepCollectionEquality().hash(pic) ^
      const DeepCollectionEquality().hash(picMobile) ^
      const DeepCollectionEquality().hash(prize) ^
      const DeepCollectionEquality().hash(signTimes) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(times) ^
      const DeepCollectionEquality().hash(title);

  @override
  _$EventDataCopyWith<_EventData> get copyWith =>
      __$EventDataCopyWithImpl<_EventData>(this, _$identity);
}

abstract class _EventData implements EventData {
  const factory _EventData(
      {@JsonKey(name: 'continue') String signContinually,
      @JsonKey(name: 'dateend') String dateEnd,
      @JsonKey(name: 'datestart') String dateStart,
      int id,
      @JsonKey(name: 'joinmember') String joinMember,
      String memberLevel,
      String pic,
      @JsonKey(name: 'pic_mobile') int picMobile,
      int prize,
      @JsonKey(name: 'signtimes') int signTimes,
      String status,
      int times,
      String title}) = _$_EventData;

  @override
  @JsonKey(name: 'continue')
  String get signContinually;
  @override
  @JsonKey(name: 'dateend')
  String get dateEnd;
  @override
  @JsonKey(name: 'datestart')
  String get dateStart;
  @override
  int get id;
  @override
  @JsonKey(name: 'joinmember')
  String get joinMember;
  @override
  String get memberLevel;
  @override
  String get pic;
  @override
  @JsonKey(name: 'pic_mobile')
  int get picMobile;
  @override
  int get prize;
  @override
  @JsonKey(name: 'signtimes')
  int get signTimes;
  @override
  String get status;
  @override
  int get times;
  @override
  String get title;
  @override
  _$EventDataCopyWith<_EventData> get copyWith;
}

class _$EventSignDataTearOff {
  const _$EventSignDataTearOff();

// ignore: unused_element
  _EventSignData call(
      {@JsonKey(name: 'continue') int signContinually,
      int aid,
      @JsonKey(name: 'currtime') String currentDate,
      int id,
      int mid,
      @JsonKey(name: 'pretime') String lastSignDate,
      int times = -1}) {
    return _EventSignData(
      signContinually: signContinually,
      aid: aid,
      currentDate: currentDate,
      id: id,
      mid: mid,
      lastSignDate: lastSignDate,
      times: times,
    );
  }
}

// ignore: unused_element
const $EventSignData = _$EventSignDataTearOff();

mixin _$EventSignData {
  @JsonKey(name: 'continue')
  int get signContinually;
  int get aid;
  @JsonKey(name: 'currtime')
  String get currentDate;
  int get id;
  int get mid;
  @JsonKey(name: 'pretime')
  String get lastSignDate;
  int get times;

  $EventSignDataCopyWith<EventSignData> get copyWith;
}

abstract class $EventSignDataCopyWith<$Res> {
  factory $EventSignDataCopyWith(
          EventSignData value, $Res Function(EventSignData) then) =
      _$EventSignDataCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'continue') int signContinually,
      int aid,
      @JsonKey(name: 'currtime') String currentDate,
      int id,
      int mid,
      @JsonKey(name: 'pretime') String lastSignDate,
      int times});
}

class _$EventSignDataCopyWithImpl<$Res>
    implements $EventSignDataCopyWith<$Res> {
  _$EventSignDataCopyWithImpl(this._value, this._then);

  final EventSignData _value;
  // ignore: unused_field
  final $Res Function(EventSignData) _then;

  @override
  $Res call({
    Object signContinually = freezed,
    Object aid = freezed,
    Object currentDate = freezed,
    Object id = freezed,
    Object mid = freezed,
    Object lastSignDate = freezed,
    Object times = freezed,
  }) {
    return _then(_value.copyWith(
      signContinually: signContinually == freezed
          ? _value.signContinually
          : signContinually as int,
      aid: aid == freezed ? _value.aid : aid as int,
      currentDate:
          currentDate == freezed ? _value.currentDate : currentDate as String,
      id: id == freezed ? _value.id : id as int,
      mid: mid == freezed ? _value.mid : mid as int,
      lastSignDate: lastSignDate == freezed
          ? _value.lastSignDate
          : lastSignDate as String,
      times: times == freezed ? _value.times : times as int,
    ));
  }
}

abstract class _$EventSignDataCopyWith<$Res>
    implements $EventSignDataCopyWith<$Res> {
  factory _$EventSignDataCopyWith(
          _EventSignData value, $Res Function(_EventSignData) then) =
      __$EventSignDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'continue') int signContinually,
      int aid,
      @JsonKey(name: 'currtime') String currentDate,
      int id,
      int mid,
      @JsonKey(name: 'pretime') String lastSignDate,
      int times});
}

class __$EventSignDataCopyWithImpl<$Res>
    extends _$EventSignDataCopyWithImpl<$Res>
    implements _$EventSignDataCopyWith<$Res> {
  __$EventSignDataCopyWithImpl(
      _EventSignData _value, $Res Function(_EventSignData) _then)
      : super(_value, (v) => _then(v as _EventSignData));

  @override
  _EventSignData get _value => super._value as _EventSignData;

  @override
  $Res call({
    Object signContinually = freezed,
    Object aid = freezed,
    Object currentDate = freezed,
    Object id = freezed,
    Object mid = freezed,
    Object lastSignDate = freezed,
    Object times = freezed,
  }) {
    return _then(_EventSignData(
      signContinually: signContinually == freezed
          ? _value.signContinually
          : signContinually as int,
      aid: aid == freezed ? _value.aid : aid as int,
      currentDate:
          currentDate == freezed ? _value.currentDate : currentDate as String,
      id: id == freezed ? _value.id : id as int,
      mid: mid == freezed ? _value.mid : mid as int,
      lastSignDate: lastSignDate == freezed
          ? _value.lastSignDate
          : lastSignDate as String,
      times: times == freezed ? _value.times : times as int,
    ));
  }
}

class _$_EventSignData implements _EventSignData {
  const _$_EventSignData(
      {@JsonKey(name: 'continue') this.signContinually,
      this.aid,
      @JsonKey(name: 'currtime') this.currentDate,
      this.id,
      this.mid,
      @JsonKey(name: 'pretime') this.lastSignDate,
      this.times = -1})
      : assert(times != null);

  @override
  @JsonKey(name: 'continue')
  final int signContinually;
  @override
  final int aid;
  @override
  @JsonKey(name: 'currtime')
  final String currentDate;
  @override
  final int id;
  @override
  final int mid;
  @override
  @JsonKey(name: 'pretime')
  final String lastSignDate;
  @JsonKey(defaultValue: -1)
  @override
  final int times;

  @override
  String toString() {
    return 'EventSignData(signContinually: $signContinually, aid: $aid, currentDate: $currentDate, id: $id, mid: $mid, lastSignDate: $lastSignDate, times: $times)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _EventSignData &&
            (identical(other.signContinually, signContinually) ||
                const DeepCollectionEquality()
                    .equals(other.signContinually, signContinually)) &&
            (identical(other.aid, aid) ||
                const DeepCollectionEquality().equals(other.aid, aid)) &&
            (identical(other.currentDate, currentDate) ||
                const DeepCollectionEquality()
                    .equals(other.currentDate, currentDate)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.mid, mid) ||
                const DeepCollectionEquality().equals(other.mid, mid)) &&
            (identical(other.lastSignDate, lastSignDate) ||
                const DeepCollectionEquality()
                    .equals(other.lastSignDate, lastSignDate)) &&
            (identical(other.times, times) ||
                const DeepCollectionEquality().equals(other.times, times)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(signContinually) ^
      const DeepCollectionEquality().hash(aid) ^
      const DeepCollectionEquality().hash(currentDate) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(mid) ^
      const DeepCollectionEquality().hash(lastSignDate) ^
      const DeepCollectionEquality().hash(times);

  @override
  _$EventSignDataCopyWith<_EventSignData> get copyWith =>
      __$EventSignDataCopyWithImpl<_EventSignData>(this, _$identity);
}

abstract class _EventSignData implements EventSignData {
  const factory _EventSignData(
      {@JsonKey(name: 'continue') int signContinually,
      int aid,
      @JsonKey(name: 'currtime') String currentDate,
      int id,
      int mid,
      @JsonKey(name: 'pretime') String lastSignDate,
      int times}) = _$_EventSignData;

  @override
  @JsonKey(name: 'continue')
  int get signContinually;
  @override
  int get aid;
  @override
  @JsonKey(name: 'currtime')
  String get currentDate;
  @override
  int get id;
  @override
  int get mid;
  @override
  @JsonKey(name: 'pretime')
  String get lastSignDate;
  @override
  int get times;
  @override
  _$EventSignDataCopyWith<_EventSignData> get copyWith;
}
