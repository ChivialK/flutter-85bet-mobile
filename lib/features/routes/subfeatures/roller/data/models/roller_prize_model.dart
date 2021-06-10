import 'package:freezed_annotation/freezed_annotation.dart';

part 'roller_prize_model.freezed.dart';

@freezed
abstract class RollerPrizeModel with _$RollerPrizeModel {
  const factory RollerPrizeModel({
    int id,
    String prize,
    @JsonKey(name: 'img') String imgUrl,
    int pic,
    @JsonKey(name: 'alert') String alertPicUrl,
    @JsonKey(name: 'alert_pic') int alertPic,
  }) = _RollerPrizeModel;

  static RollerPrizeModel jsonToRollerPrizeModel(
          Map<String, dynamic> jsonMap) =>
      _$_RollerPrizeModel(
        id: jsonMap['id'] as int,
        prize: jsonMap['prize'] as String,
        imgUrl: jsonMap['img'] as String,
        pic: jsonMap['pic'] as int,
        alertPicUrl: jsonMap['alert'] as String,
        alertPic: jsonMap['alert_pic'] as int,
      );
}
