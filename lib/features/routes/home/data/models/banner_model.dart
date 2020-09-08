import 'package:freezed_annotation/freezed_annotation.dart';

import '../entity/banner_entity.dart';

part 'banner_model.freezed.dart';

@freezed
abstract class BannerModel with _$BannerModel {
  const factory BannerModel({
    @required int id,
    @required String title,
    @required String type,
    @required String pic,
    @JsonKey(name: 'pic_mobile', required: true) String picMobile,
    @required bool status,
    @JsonKey(name: 'start_time', required: true) String startTime,
    @JsonKey(name: 'end_time', required: true) String endTime,
    @required int sort,
    @JsonKey(name: 'url_blank', required: true) bool urlBlank,
    @required String url,
    @JsonKey(name: 'mobile_url', required: true) String mobileUrl,
  }) = _BannerModel;

  static BannerModel jsonToBannerModel(Map<String, dynamic> jsonMap) =>
      _$_BannerModel(
        id: jsonMap['id'] as int,
        title: jsonMap['title'] as String,
        type: jsonMap['type'] as String,
        pic: jsonMap['pic'] as String,
        picMobile: jsonMap['pic_mobile'] as String,
        status: jsonMap['status'] as bool,
        startTime: jsonMap['start_time'] as String,
        endTime: jsonMap['end_time'] as String,
        sort: jsonMap['sort'] as int,
        urlBlank: jsonMap['url_blank'] as bool,
        url: jsonMap['url'] as String,
        mobileUrl: jsonMap['mobile_url'] as String,
      );
}

extension BannerModelExtension on BannerModel {
  BannerEntity get entity => BannerEntity(
      id: id,
      pic: picMobile,
      noPromo: urlBlank,
      promoUrl: mobileUrl,
      sort: sort);
}
