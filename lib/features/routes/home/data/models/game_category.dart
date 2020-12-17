part of 'game_category_model.dart';

enum HomeCategoryEnum {
  CASINO,
  SLOT,
  SPORT,
  FISH,
  LOTTERY,
  CARD,
  GIFT,
  COCKFIGHTING,
  MOVIE,
  EG_MOVIE,
  NEW_MOVIE,
  RECOMMEND,
  FAVORITE,
  PROMO,
  MOVIE_WEBSITE,
  WEBSITE,
  ABOUT,
  UNDEFINE,
}

class HomeCategoryInfo {
  final HomeCategoryEnum id;
  final String imageUrl;
  final String assetPath;
  final GamePageType pageType;

  ///
  /// icon needs to be constant, define it in [GameCategoryModel]
  /// if [imageUrl] is empty, will try to use icon
  ///
  const HomeCategoryInfo({
    @required this.id,
    this.imageUrl,
    this.assetPath,
    this.pageType = GamePageType.Games,
  });
}

@VnumDefinition
class GameCategory extends Vnum<HomeCategoryInfo> {
  /// GAMES
  static const GameCategory casino = const GameCategory.define(HomeCategoryInfo(
    id: HomeCategoryEnum.CASINO,
    imageUrl: 'images/phone_nav_casino_Color1.png',
  ));
  static const GameCategory slot = const GameCategory.define(HomeCategoryInfo(
    id: HomeCategoryEnum.SLOT,
    imageUrl: 'images/phone_nav_slot_Color1.png',
  ));
  static const GameCategory sport = const GameCategory.define(HomeCategoryInfo(
    id: HomeCategoryEnum.SPORT,
    imageUrl: 'images/phone_nav_sport_Color1.png',
  ));
  static const GameCategory fish = const GameCategory.define(HomeCategoryInfo(
    id: HomeCategoryEnum.FISH,
    imageUrl: 'images/phone_nav_fish_Color1.png',
  ));
  static const GameCategory lottery =
      const GameCategory.define(HomeCategoryInfo(
    id: HomeCategoryEnum.LOTTERY,
    imageUrl: 'images/phone_nav_lottery_Color1.png',
  ));
  static const GameCategory card = const GameCategory.define(HomeCategoryInfo(
    id: HomeCategoryEnum.CARD,
    imageUrl: 'images/phone_nav_card_Color1.png',
  ));
  static const GameCategory gift = const GameCategory.define(HomeCategoryInfo(
    id: HomeCategoryEnum.GIFT,
    imageUrl: 'images/index/tbico_gift.png',
  ));
  static const GameCategory cockfighting =
      const GameCategory.define(HomeCategoryInfo(
    id: HomeCategoryEnum.COCKFIGHTING,
    imageUrl: 'images/phone_nav_cockfighting_Color1.png',
  ));

  /// MOVIES
  static const GameCategory egMovie =
      const GameCategory.define(HomeCategoryInfo(
    id: HomeCategoryEnum.EG_MOVIE,
    imageUrl: 'images/index/tbico_movie.png',
    pageType: GamePageType.MovieEg,
  ));
  static const GameCategory newMovie =
      const GameCategory.define(HomeCategoryInfo(
    id: HomeCategoryEnum.NEW_MOVIE,
    imageUrl: 'images/index/tbico_movie.png',
    pageType: GamePageType.MovieNew,
  ));

  /// USER
  static const GameCategory recommend =
      const GameCategory.define(HomeCategoryInfo(
    id: HomeCategoryEnum.RECOMMEND,
    imageUrl: 'images/index/tbico_recommend.png',
    pageType: GamePageType.Recommend,
  ));
  static const GameCategory favorite =
      const GameCategory.define(HomeCategoryInfo(
    id: HomeCategoryEnum.FAVORITE,
    imageUrl: 'images/index/tbico_love.png',
    pageType: GamePageType.Favorite,
  ));

  /// OTHER
  static const GameCategory promo = const GameCategory.define(HomeCategoryInfo(
    id: HomeCategoryEnum.PROMO,
    imageUrl: '',
    pageType: GamePageType.Promo,
  ));
  static const GameCategory movieWebsite =
      const GameCategory.define(HomeCategoryInfo(
    id: HomeCategoryEnum.MOVIE_WEBSITE,
    imageUrl: '',
    pageType: GamePageType.MovieWebsite,
  ));
  static const GameCategory website =
      const GameCategory.define(HomeCategoryInfo(
    id: HomeCategoryEnum.WEBSITE,
    imageUrl: '',
    pageType: GamePageType.Website,
  ));
  static const GameCategory about = const GameCategory.define(HomeCategoryInfo(
    id: HomeCategoryEnum.ABOUT,
    imageUrl: '',
    assetPath: Res.iconAbout,
    pageType: GamePageType.About,
  ));
  static const GameCategory undefined =
      const GameCategory.define(HomeCategoryInfo(
    id: HomeCategoryEnum.UNDEFINE,
    imageUrl: '',
  ));

  /// Used for defining cases
  const GameCategory.define(HomeCategoryInfo fromValue)
      : super.define(fromValue);

  /// Used for loading enum using value
  factory GameCategory(HomeCategoryInfo value) =>
      Vnum.fromValue(value, GameCategory);

  /// Iterating cases
  /// All value needs to be constant for this to work
  static List<Vnum> get listAll => Vnum.allCasesFor(GameCategory);

  static GameCategory findCategoryById(HomeCategoryEnum id) =>
      GameCategory.listAll.singleWhere(
        (category) => (category.value as HomeCategoryInfo).id == id,
        orElse: () => throw UnknownException(),
      );
}

///
/// Use extension method to get label string,
/// so category name will be update when language changed
///
extension HomeCategoryExtension on HomeCategoryInfo {
  String get label {
    switch (id) {
      case HomeCategoryEnum.CASINO:
        return localeStr.gameCategoryCasinoFull;
      case HomeCategoryEnum.SLOT:
        return localeStr.gameCategorySlotFull;
      case HomeCategoryEnum.SPORT:
        return localeStr.gameCategorySportFull;
      case HomeCategoryEnum.FISH:
        return localeStr.gameCategoryFishFull;
      case HomeCategoryEnum.LOTTERY:
        return localeStr.gameCategoryLotteryFull;
      case HomeCategoryEnum.CARD:
        return localeStr.gameCategoryCardFull;
      case HomeCategoryEnum.GIFT:
        return localeStr.gameCategoryGift;
      case HomeCategoryEnum.COCKFIGHTING:
        return localeStr.gameCategoryCockFighting;
      case HomeCategoryEnum.RECOMMEND:
        return localeStr.homeUserTabCategoryRecommend;
      case HomeCategoryEnum.FAVORITE:
        return localeStr.homeUserTabCategoryFavorite;
      case HomeCategoryEnum.PROMO:
        return localeStr.pageTitlePromo;
      case HomeCategoryEnum.MOVIE_WEBSITE:
        return localeStr.gameCategoryMovieWeb;
      case HomeCategoryEnum.WEBSITE:
        return localeStr.gameCategoryWeb;
      case HomeCategoryEnum.ABOUT:
        return localeStr.gameCategoryAbout;
      default:
        return '???';
    }
  }
}
