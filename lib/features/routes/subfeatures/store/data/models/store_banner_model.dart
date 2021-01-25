import 'package:freezed_annotation/freezed_annotation.dart';

part 'store_banner_model.freezed.dart';

@freezed
abstract class StoreBannerModel with _$StoreBannerModel {
  const factory StoreBannerModel({
    String title,
    String pic,
    @JsonKey(name: 'end_time') String expire,
  }) = _StoreBannerModel;

  static StoreBannerModel jsonToStoreBannerModel(
          Map<String, dynamic> jsonMap) =>
      _$_StoreBannerModel(
        title: jsonMap['title'] as String,
        pic: jsonMap['pic'] as String,
        expire: jsonMap['end_time'] as String,
      );
}
