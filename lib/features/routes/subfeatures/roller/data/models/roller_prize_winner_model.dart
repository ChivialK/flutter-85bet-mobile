import 'package:freezed_annotation/freezed_annotation.dart';

part 'roller_prize_winner_model.freezed.dart';

@freezed
abstract class RollerPrizeWinnerModel with _$RollerPrizeWinnerModel {
  const factory RollerPrizeWinnerModel({
    String title,
    String accCode,
    String cdate,
  }) = _RollerPrizeWinnerModel;

  static RollerPrizeWinnerModel jsonToPrizeWinner(
          Map<String, dynamic> jsonMap) =>
      _$_RollerPrizeWinnerModel(
        title: jsonMap['title'] as String,
        accCode: jsonMap['accCode'] as String,
        cdate: jsonMap['cdate'] as String,
      );
}
