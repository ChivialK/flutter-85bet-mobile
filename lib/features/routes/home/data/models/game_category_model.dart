import 'package:flutter/widgets.dart';
import 'package:flutter_85bet_mobile/core/base/data_operator.dart';
import 'package:flutter_85bet_mobile/core/error/exceptions.dart';
import 'package:flutter_85bet_mobile/core/internal/local_strings.dart';
import 'package:flutter_85bet_mobile/res.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:vnum/vnum.dart';

part 'game_category.dart';
part 'game_category_model.freezed.dart';
part 'game_category_model.g.dart';

@freezed
abstract class GameCategoryModel with _$GameCategoryModel {
  @HiveType(typeId: 103)
  @Implements(DataOperator)
  const factory GameCategoryModel({
    @HiveField(0) @required String ch,
    @HiveField(1) @required String type,
    GameCategory info,
  }) = _GameCategoryModel;

  static GameCategoryModel jsonToGameCategoryModel(
          Map<String, dynamic> jsonMap) =>
      _$_GameCategoryModel(
        ch: jsonMap['ch'] as String,
        type: jsonMap['type'] as String,
        info: _categoryMap['${jsonMap['type']}'] ?? GameCategory.undefined,
      );

//  @override
//  String operator [](String key) {
//    return type.toString();
//  }
}

///
/// This is for tab bar to know what type of Widget it use
/// Add [HomeCategoryEnum] also
///
enum GamePageType {
  Games,
  Recommend,
  Favorite,
  MovieEg,
  MovieNew,
  Promo,
  MovieWebsite,
  Website,
  About,
}

///
/// Define Category Type Key
///
const GameCategoryModel movieEgCategory =
    GameCategoryModel(type: 'eg_movie', ch: 'EG影城', info: GameCategory.egMovie);
const GameCategoryModel movieNewCategory = GameCategoryModel(
    type: 'new_movie', ch: '新影城', info: GameCategory.newMovie);
const GameCategoryModel recommendCategory = GameCategoryModel(
    type: 'recommend', ch: '推荐', info: GameCategory.recommend);
const GameCategoryModel favoriteCategory =
    GameCategoryModel(type: 'favorite', ch: '最爱', info: GameCategory.favorite);
const GameCategoryModel cockfightingCategory = GameCategoryModel(
    type: 'cockfighting', ch: '斗鸡', info: GameCategory.cockfighting);
const GameCategoryModel promoCategory =
    GameCategoryModel(type: 'promo', ch: '优惠', info: GameCategory.promo);
const GameCategoryModel movieWebCategory = GameCategoryModel(
    type: 'movieweb', ch: '影城', info: GameCategory.movieWebsite);
const GameCategoryModel websiteCategory =
    GameCategoryModel(type: 'website', ch: '开启网页版', info: GameCategory.website);
const GameCategoryModel aboutCategory =
    GameCategoryModel(type: 'about', ch: '关于我们', info: GameCategory.about);

///
/// Define Category Info
///
const Map<String, GameCategory> _categoryMap = {
  'casino': GameCategory.casino,
  'slot': GameCategory.slot,
  'sport': GameCategory.sport,
  'fish': GameCategory.fish,
  'lottery': GameCategory.lottery,
  'card': GameCategory.card,
  'gift': GameCategory.gift,
  'cockfighting': GameCategory.cockfighting,
  'eg_movie': GameCategory.egMovie,
  'new_movie': GameCategory.newMovie,
  'recommend': GameCategory.recommend,
  'favorite': GameCategory.favorite,
  'promo': GameCategory.promo,
  'movieweb': GameCategory.movieWebsite,
  'website': GameCategory.website,
  'about': GameCategory.about,
};

///
/// Define Category Font Icon
///
const _promoIcon = const IconData(0xe966, fontFamily: 'IconMoon');
const _movieWebsiteIcon = const IconData(0xe977, fontFamily: 'IconMoon');
const _websiteIcon = const IconData(0xe905, fontFamily: 'IconMoon');
const _aboutIcon = const IconData(0xe88f, fontFamily: 'MaterialIcons');
const _unknownIcon = const IconData(0xe145, fontFamily: 'MaterialIcons');

extension GameCategoryModelExtension on GameCategoryModel {
  String get label => info.value.label ?? '?';
  String get iconUrl => info.value.imageUrl ?? '';
  String get assetPath => info.value.assetPath;
  GamePageType get pageType => info.value.pageType;

  IconData get iconCode {
//    debugPrint('looking for icon code: $type');
    switch (type) {
      case 'promo':
        return _promoIcon;
      case 'movieweb':
        return _movieWebsiteIcon;
      case 'website':
        return _websiteIcon;
      default:
        return _unknownIcon;
    }
  }
}
