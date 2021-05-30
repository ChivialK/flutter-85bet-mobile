part of '../models/game_category_model.dart';

///
/// This is for tab bar to know which child widget it should use
/// Don't forget to add the value to [HomeCategoryEnum]
/// @see [HomeDisplayTabs]
///
enum GamePageType {
  Games,
  Recommend,
  Favorite,
  Promo,
  Website,
}

///
/// Defines [GameCategoryModel] that does not come with json
/// to add additional tabs in home page
///
const GameCategoryModel recommendCategory = GameCategoryModel(
    type: 'recommend', ch: '推荐', info: GameCategory.recommend);

const GameCategoryModel favoriteCategory =
    GameCategoryModel(type: 'favorite', ch: '最爱', info: GameCategory.favorite);

const GameCategoryModel cockfightingCategory = GameCategoryModel(
    type: 'cockfighting', ch: '斗鸡', info: GameCategory.cockfighting);

const GameCategoryModel promoCategory =
    GameCategoryModel(type: 'promo', ch: '优惠', info: GameCategory.promo);

const GameCategoryModel websiteCategory =
    GameCategoryModel(type: 'website', ch: '网页版', info: GameCategory.website);

///
/// A Map to get [GameCategory] data by [GameCategoryModel].type
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
  'recommend': GameCategory.recommend,
  'favorite': GameCategory.favorite,
  'promo': GameCategory.promo,
  'website': GameCategory.website,
};
