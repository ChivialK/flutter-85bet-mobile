import 'package:flutter/widgets.dart';
import 'package:flutter_85bet_mobile/core/base/data_operator.dart';
import 'package:flutter_85bet_mobile/core/error/exceptions.dart';
import 'package:flutter_85bet_mobile/core/internal/local_strings.dart';
import 'package:flutter_85bet_mobile/features/themes/icon_code.dart';
import 'package:flutter_85bet_mobile/res.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:vnum/vnum.dart';

part 'game_category.dart';
part 'game_category_model.freezed.dart';
part 'game_category_model.g.dart';
part '../enum/game_page_type.dart';

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

extension GameCategoryModelExtension on GameCategoryModel {
  String get label => info.value.label ?? '?';
  String get iconUrl => info.value.imageUrl ?? '';
  String get assetPath => info.value.assetPath;
  GamePageType get pageType => info.value.pageType;

  IconData get iconCode {
//    debugPrint('looking for icon code: $type');
    switch (type) {
      case 'promo':
        return IconCode.tabPromo;
      case 'movieweb':
        return IconCode.tabMovieWebsite;
      case 'website':
        return IconCode.tabWebsite;
      case 'about':
        return IconCode.tabAbout;
      default:
        return IconCode.tabUnknown;
    }
  }
}
