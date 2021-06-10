import 'package:flutter_85bet_mobile/core/base/data_operator.dart';
import 'package:flutter_85bet_mobile/core/internal/local_strings.dart';
import 'package:flutter_85bet_mobile/utils/regex_util.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'game_platform.freezed.dart';

part 'game_platform.g.dart';

typedef HomeSearchPlatformClicked = void Function(GamePlatformEntity);

@freezed
abstract class GamePlatform with _$GamePlatform {
  const factory GamePlatform.model({
    @required int id,
    @JsonKey(name: 'class', fromJson: decodePlatformClassName) String className,
    @JsonKey(fromJson: decodePlatformChName) String ch,
    int cid,
    @required String site,
    String site2,
    @JsonKey(name: 'type', required: true) String category,
    int sort,
    String status,
    @Default('0') String favorite,
  }) = GamePlatformModel;

  @HiveType(typeId: 104)
  @Implements(DataOperator)
  const factory GamePlatform.entity({
    @HiveField(0) @required int id,
    @HiveField(1)
    @JsonKey(name: 'class', fromJson: decodePlatformClassName)
        String className,
    @HiveField(2) @JsonKey(fromJson: decodePlatformChName) String ch,
    @HiveField(3) @required String site,
    @HiveField(4) @JsonKey(name: 'type', required: true) String category,
    @Default('0') String favorite,
  }) = GamePlatformEntity;

//  static GamePlatformModel jsonToGamePlatformModel(
//      Map<String, dynamic> jsonMap) {
//    jsonMap['runtimeType'] = 'model';
//    return _$GamePlatformFromJson(jsonMap);
//  }

  static GamePlatformModel jsonToGamePlatformModel(
          Map<String, dynamic> jsonMap) =>
      _$GamePlatformModel(
        id: jsonMap['id'] as int ?? jsonMap['sort'],
        className: decodePlatformClassName(jsonMap),
        ch: decodePlatformChName(jsonMap),
        cid: jsonMap['cid'] as int,
        site: jsonMap['site'] as String,
        site2: jsonMap['site2'] as String,
        category: jsonMap['type'] as String,
        sort: jsonMap['sort'] as int,
        status: jsonMap['status'] as String,
        favorite: jsonMap['favorite'] as String ?? '0',
      );

//  static GamePlatformEntity jsonToGamePlatformEntity(
//      Map<String, dynamic> jsonMap) {
//    jsonMap['runtimeType'] = 'entity';
//    return _$GamePlatformFromJson(jsonMap);
//  }

  static GamePlatformEntity jsonToGamePlatformEntity(
          Map<String, dynamic> jsonMap) =>
      _$GamePlatformEntity(
        id: jsonMap['id'] as int,
        className: decodePlatformClassName(jsonMap),
        ch: decodePlatformChName(jsonMap),
        site: jsonMap['site'] as String,
        category: jsonMap['type'] as String,
        favorite: jsonMap['favorite'] as String ?? '0',
      );

//  @override
//  String operator [](String key) {
//    return className.toString();
//  }
}

String decodePlatformClassName(dynamic str) => (str.containsKey('class'))
    ? '${str['class']}'
    : '${str['site']}-${str['type']}';

String decodePlatformChName(dynamic str) => (str.containsKey('ch'))
    ? '${str['ch']}'
    : '${'${str['site']}'.toUpperCase()} ${str['type']}';

extension GamePlatformModelExtension on GamePlatformModel {
  GamePlatformEntity get entity => GamePlatformEntity(
        id: id,
        className: className,
        ch: ch,
        site: site,
        category: category,
        favorite: favorite,
      );
}

extension GamePlatformEntityExtension on GamePlatformEntity {
  bool get isGameHall => ['casino', 'sport', 'lottery'].contains(category);

  String get iconUrl => '/images/index/logo/${site.toUpperCase()}.png';

  String get imageUrl => '/images/nav/nav_${site}_$category.png';

  String get gameUrl => '$site/$category/0';

  String get label {
    switch (category) {
      case 'casino':
        return '${site.toUpperCase()} ${localeStr.gameCategoryCasino}';
      case 'slot':
        return '${site.toUpperCase()} ${localeStr.gameCategorySlot}';
      case 'sport':
        return '${site.toUpperCase()} ${localeStr.gameCategorySport}';
      case 'fish':
        return '${site.toUpperCase()} ${localeStr.gameCategoryFish}';
      case 'lottery':
        return '${site.toUpperCase()} ${localeStr.gameCategoryLottery}';
      case 'card':
        return '${site.toUpperCase()} ${localeStr.gameCategoryCard}';
      default:
        return ch;
    }
  }

  bool isLongText(double limit) => label.countLength > limit;
}
