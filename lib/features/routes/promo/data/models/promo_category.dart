import 'package:flutter_85bet_mobile/core/base/data_operator.dart';
import 'package:flutter_85bet_mobile/core/internal/local_strings.dart';
import 'package:vnum/vnum.dart';

class PromoCategory {
  final int id;
  final String category;
  final String iconUrl;

  const PromoCategory(this.id, this.category, this.iconUrl);
}

@VnumDefinition
class PromoCategoryEnum extends Vnum<PromoCategory> implements DataOperator {
  /// Case Definition
  static const PromoCategoryEnum all = const PromoCategoryEnum.define(
      PromoCategory(0, 'All', 'images/index/all.png'));
  static const PromoCategoryEnum fish = const PromoCategoryEnum.define(
      PromoCategory(1, 'fish', 'images/index/fish.png'));
  static const PromoCategoryEnum slot = const PromoCategoryEnum.define(
      PromoCategory(2, 'slot', 'images/index/slot.png'));
  static const PromoCategoryEnum live = const PromoCategoryEnum.define(
      PromoCategory(3, 'live', 'images/index/casino.png'));
  static const PromoCategoryEnum sport = const PromoCategoryEnum.define(
      PromoCategory(4, 'sports', 'images/index/sport.png'));
  static const PromoCategoryEnum lottery = const PromoCategoryEnum.define(
      PromoCategory(5, 'lotto', 'images/index/lottery.png'));
  static const PromoCategoryEnum other = const PromoCategoryEnum.define(
      PromoCategory(6, 'other', 'images/index/icon-other.png'));

  /// Used for defining cases
  const PromoCategoryEnum.define(PromoCategory fromValue)
      : super.define(fromValue);

  /// Used for loading enum using value
  factory PromoCategoryEnum(PromoCategory value) =>
      Vnum.fromValue(value, PromoCategoryEnum);

  @override
  String operator [](String key) => this.label;

  String get label {
    switch (value.category) {
      case 'All':
        return localeStr.gameCategoryAll;
      case 'fish':
        return localeStr.gameCategoryFish;
      case 'slot':
        return localeStr.gameCategorySlot;
      case 'live':
        return localeStr.gameCategoryCasino;
      case 'sports':
        return localeStr.gameCategorySport;
      case 'lotto':
        return localeStr.gameCategoryLottery;
      case 'other':
        return localeStr.gameCategoryOther;
      default:
        return '???';
    }
  }

  /// (optional) Extend your Vnums
  //PromoCategory example() {
  //  switch(value) {
  //    default:
  //      return PromoCategoryEnum.example.value;
  //  };
  //}
}
