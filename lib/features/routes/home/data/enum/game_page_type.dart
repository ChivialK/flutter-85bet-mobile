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
  Member,
}

///
/// Defines [GameCategoryModel] that does not come with json
/// to add additional tabs in home page
///
const GameCategoryModel recommendCategory = GameCategoryModel(
    type: 'recommend', ch: '推荐', info: GameCategory.recommend);

const GameCategoryModel favoriteCategory =
    GameCategoryModel(type: 'favorite', ch: '最爱', info: GameCategory.favorite);

const GameCategoryModel memberCategory =
    GameCategoryModel(type: 'member', ch: '帳戶', info: GameCategory.member);

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
  'recommend': GameCategory.recommend,
  'favorite': GameCategory.favorite,
  'member': GameCategory.member,
};
