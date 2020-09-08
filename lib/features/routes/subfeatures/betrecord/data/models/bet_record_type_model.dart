import 'package:flutter_85bet_mobile/core/internal/local_strings.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bet_record_type_model.freezed.dart';

@freezed
abstract class BetRecordTypeModel with _$BetRecordTypeModel {
  const factory BetRecordTypeModel({
    @JsonKey(name: 'id') int categoryId,
    @Deprecated('use label getter instead')
    @JsonKey(name: 'ch')
        String categoryName,
    @JsonKey(name: 'type') String categoryType,
    Map<String, dynamic> platformMap,
  }) = _BetRecordTypeModel;

  static jsonToBetRecordTypeModel(Map<String, dynamic> jsonMap) {
    return _$_BetRecordTypeModel(
      categoryId: jsonMap['id'] as int,
      categoryName: jsonMap['ch'] as String,
      categoryType: jsonMap['type'] as String,
    );
  }
}

extension BetRecordTypeModelExtension on BetRecordTypeModel {
  String get label {
    switch (categoryType) {
      case 'casino':
        return localeStr.gameCategoryCasino;
      case 'slot':
        return localeStr.gameCategorySlot;
      case 'sport':
        return localeStr.gameCategorySport;
      case 'fish':
        return localeStr.gameCategoryFish;
      case 'lottery':
        return localeStr.gameCategoryLottery;
      case 'card':
        return localeStr.gameCategoryCard;
      default:
        return categoryName;
    }
  }
}
