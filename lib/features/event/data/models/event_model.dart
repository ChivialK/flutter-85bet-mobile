import 'package:flutter_85bet_mobile/utils/datetime_format.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_model.freezed.dart';

@freezed
abstract class EventModel with _$EventModel {
  const factory EventModel({
    @JsonKey(name: '0') EventData eventData,
    EventSignData signData,
    @Default(true) bool hasData,
  }) = _EventModel;

  static EventModel jsonToEventModel(Map<String, dynamic> jsonMap) =>
      _$_EventModel(
        eventData: jsonMap['0'] == null
            ? null
            : EventData.jsonToEventData(jsonMap['0']),
        signData: jsonMap['signData'] == null
            ? null
            : EventSignData.jsonToEventSignData(jsonMap['signData']),
        hasData: !(jsonMap.containsKey('msg') && jsonMap['msg'] == 'noData'),
      );
}

extension EventModelExtension on EventModel {
  bool get hasEvent => eventData != null;

  bool get canSign => signData.times == -1 || signData.hasSigned == false;

  bool userLevelMatchEvent(int userLevel) => eventData.isValidEvent(userLevel);

  bool showDialog(int userLevel) =>
      hasEvent && userLevelMatchEvent(userLevel) && canSign;
}

@freezed
abstract class EventData with _$EventData {
  const factory EventData({
    @JsonKey(name: 'continue') String signContinually, // 需不需要連續簽到
    @JsonKey(name: 'dateend') String dateEnd,
    @JsonKey(name: 'datestart') String dateStart,
    int id,
    @JsonKey(name: 'joinmember') String joinMember,
    String memberLevel,
    String pic,
    @JsonKey(name: 'pic_mobile') int picMobile,
    int prize,
    @JsonKey(name: 'signtimes') int signTimes, // 需要簽到的次數
    String status, // 活動開關狀態
    int times, // 可以領取獎勵的次數
    String title,
  }) = _EventData;

  static EventData jsonToEventData(Map<String, dynamic> jsonMap) =>
      _$_EventData(
        signContinually: jsonMap['continue'] as String,
        dateEnd: jsonMap['dateend'] as String,
        dateStart: jsonMap['datestart'] as String,
        id: jsonMap['id'] as int,
        joinMember: jsonMap['joinmember'] as String,
        memberLevel: jsonMap['memberLevel'] as String,
        pic: jsonMap['pic'] as String,
        picMobile: jsonMap['pic_mobile'] as int,
        prize: jsonMap['prize'] as int,
        signTimes: jsonMap['signtimes'] as int,
        status: jsonMap['status'] as String,
        times: jsonMap['times'] as int,
        title: jsonMap['title'] as String,
      );
}

extension EventDataExtension on EventData {
  bool isValidEvent(int userMemberLevel) =>
      status == '1' &&
      memberLevel.contains('$userMemberLevel') &&
      hasExpired(dateEnd) == false;
}

@freezed
abstract class EventSignData with _$EventSignData {
  const factory EventSignData({
    @JsonKey(name: 'continue') int signContinually,
    int aid,
    @JsonKey(name: 'currtime') String currentDate,
    int id,
    int mid,
    @JsonKey(name: 'pretime') String lastSignDate,
    @Default(-1) int times,
  }) = _EventSignData;

  static EventSignData jsonToEventSignData(Map<String, dynamic> jsonMap) =>
      _$_EventSignData(
        signContinually: jsonMap['continue'] as int,
        aid: jsonMap['aid'] as int,
        currentDate: jsonMap['currtime'] as String,
        id: jsonMap['id'] as int,
        mid: jsonMap['mid'] as int,
        lastSignDate: jsonMap['pretime'] as String,
        times: jsonMap['times'] as int ?? -1,
      );
}

extension EventSignDataExtension on EventSignData {
  bool get hasSigned => isSameDay(currentDate);
}
