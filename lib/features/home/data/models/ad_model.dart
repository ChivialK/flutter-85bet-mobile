import 'package:freezed_annotation/freezed_annotation.dart';

part 'ad_model.freezed.dart';

@freezed
abstract class AdModel with _$AdModel {
  const factory AdModel({
    int id,
    String title,
    String type,
    String pic,
    String url,
    @JsonKey(name: 'mobile_url') String mobileUrl,
    @JsonKey(name: 'pic_mobile') String picMobile,
    @JsonKey(name: 'start_time') String startTime,
    @JsonKey(name: 'end_time') String endTime,
    int sort,
    bool status,
    @JsonKey(name: 'url_blank') bool urlBlank,
  }) = _AdModel;

  static AdModel jsonToAdModel(Map<String, dynamic> jsonMap) => _$_AdModel(
        id: jsonMap['id'] as int,
        title: jsonMap['title'] as String,
        type: jsonMap['type'] as String,
        pic: jsonMap['pic'] as String,
        url: jsonMap['url'] as String,
        mobileUrl: jsonMap['mobile_url'] as String,
        picMobile: jsonMap['pic_mobile'] as String,
        startTime: jsonMap['start_time'] as String,
        endTime: jsonMap['end_time'] as String,
        sort: jsonMap['sort'] as int,
        status: jsonMap['status'] as bool,
        urlBlank: jsonMap['url_blank'] as bool,
      );
}
