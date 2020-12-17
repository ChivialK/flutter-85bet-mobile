import 'package:flutter_85bet_mobile/utils/json_util.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notice_model.freezed.dart';

@freezed
abstract class NoticeModel with _$NoticeModel {
  const factory NoticeModel({
    String code,
    NoticeDataModel data,
    String msg,
  }) = _NoticeModel;

  static NoticeModel jsonToNoticeModel(Map<String, dynamic> jsonMap) {
    return _$_NoticeModel(
      code: jsonMap['code'] as String,
      data: NoticeDataModel.jsonToNoticeDataModel(
          jsonMap['data'] as Map<String, dynamic>),
      msg: jsonMap['msg'] as String,
    );
  }
}

@freezed
abstract class NoticeDataModel with _$NoticeDataModel {
  const factory NoticeDataModel({
    List<NoticeData> maintenanceList,
    List<NoticeData> marqueeList,
  }) = _NoticeDataModel;

  static NoticeDataModel jsonToNoticeDataModel(Map<String, dynamic> jsonMap) {
    return _$_NoticeDataModel(
      maintenanceList: noticeDataArrayToList(jsonMap['maintenance'])
        ..sort((a, b) => a.sort.compareTo(b.sort)),
      marqueeList: noticeDataArrayToList(jsonMap['marquee'])
        ..sort((a, b) => a.sort.compareTo(b.sort)),
    );
  }
}

@freezed
abstract class NoticeData with _$NoticeData {
  const factory NoticeData({
    @JsonKey(name: 'content_cn', defaultValue: '') String content,
    @JsonKey(name: 'content_us', defaultValue: '') String contentEN,
    @JsonKey(name: 'content_vn', defaultValue: '') String contentVI,
    @JsonKey(name: 'content_th', defaultValue: '') String contentTH,
    String date,
    int sort,
  }) = _NoticeData;

  static NoticeData jsonToNoticeData(Map<String, dynamic> jsonMap) {
    return _$_NoticeData(
      content: (jsonMap.containsKey('content')
          ? jsonMap['content']
          : jsonMap['content_cn']) as String,
      contentEN: (jsonMap.containsKey('content_us'))
          ? jsonMap['content_us'] as String
          : '',
      contentVI: (jsonMap.containsKey('content_vn'))
          ? jsonMap['content_vn'] as String
          : '',
      contentTH: (jsonMap.containsKey('content_th'))
          ? jsonMap['content_th'] as String
          : '',
      date: jsonMap['date'] as String,
      sort: jsonMap['sort'] as int,
    );
  }
}

List<NoticeData> noticeDataArrayToList(dynamic map) =>
    JsonUtil.decodeArrayToModel(
      map,
      (jsonMap) => NoticeData.jsonToNoticeData(jsonMap),
      tag: 'NoticeDataModel',
    );
