import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_model.freezed.dart';

@freezed
abstract class ServiceModel with _$ServiceModel {
  const factory ServiceModel({
    @Default('') String title,
    @JsonKey(name: 'app_pic', defaultValue: '') String appPic,
    @JsonKey(name: 'app_url', defaultValue: '') String appUrl,
    @Default('') String cs,
    @Default('') String mail,
    @Default('') String phone,
    @Default('') String skype,
    @Default('') String fb,
    @Default('') String zalo,
    @JsonKey(name: 'zalo_pic', defaultValue: '') String zaloPic,
    @Default('') String line,
    @JsonKey(name: 'line_pic', defaultValue: '') String linePic,
  }) = _ServiceModel;

  static ServiceModel jsonToServiceModel(Map<String, dynamic> jsonMap) =>
      _$_ServiceModel(
        title: jsonMap['title']?.toString() ?? '',
        appPic: jsonMap['app_pic']?.toString() ?? '',
        appUrl: jsonMap['app_url']?.toString() ?? '',
        cs: jsonMap['cs']?.toString() ?? '',
        mail: jsonMap['mail']?.toString() ?? '',
        phone: jsonMap['phone']?.toString() ?? '',
        skype: jsonMap['skype']?.toString() ?? '',
        fb: jsonMap['fb']?.toString() ?? jsonMap['facebook']?.toString() ?? '',
        zalo: jsonMap['zalo']?.toString() ?? '',
        zaloPic: jsonMap['zalo_pic']?.toString() ?? '',
        line: jsonMap['line']?.toString() ?? '',
        linePic: jsonMap['line_pic']?.toString() ?? '',
      );
}
