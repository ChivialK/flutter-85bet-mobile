import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_model.freezed.dart';

@freezed
abstract class ServiceModel with _$ServiceModel {
  const factory ServiceModel({
    @JsonKey(name: 'app_pic') String appPic,
    @JsonKey(name: 'app_url') String appUrl,
    String cs,
    String fb,
    String mail,
    String zalo,
    @JsonKey(name: 'zalo_pic') String zaloPic,
  }) = _ServiceModel;

  static ServiceModel jsonToServiceModel(Map<String, dynamic> jsonMap) =>
      _$_ServiceModel(
        appPic: '${jsonMap['app_pic']}',
        appUrl: '${jsonMap['app_url']}',
        cs: '${jsonMap['cs']}',
        fb: '${jsonMap['fb']}',
        mail: '${jsonMap['mail']}',
        zalo: '${jsonMap['zalo']}',
        zaloPic: '${jsonMap['zalo_pic']}',
      );
}
