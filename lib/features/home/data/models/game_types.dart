import 'package:flutter_85bet_mobile/utils/json_util.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/game_platform.dart';
import 'game_category_model.dart';
import 'game_platform.dart';

part 'game_types.freezed.dart';

@freezed
abstract class GameTypes with _$GameTypes {
  const factory GameTypes({
    @JsonKey(name: 'category', fromJson: decodeGameCategoryModel)
        List<GameCategoryModel> categories,
    @JsonKey(name: 'list', fromJson: decodeGamePlatformModel)
        List<GamePlatform> platforms,
  }) = _GameTypes;

  static GameTypes jsonToGameTypes(Map<String, dynamic> jsonMap) =>
      _$_GameTypes(
        categories: jsonMap['category'] != null
            ? decodeGameCategoryModel(jsonMap['category'])
            : [],
        platforms: jsonMap['list'] != null
            ? decodeGamePlatformModel(jsonMap['list'])
            : [],
      );
}

List<GameCategoryModel> decodeGameCategoryModel(dynamic str) =>
    JsonUtil.decodeArrayToModel(
      str,
      (jsonMap) => GameCategoryModel.jsonToGameCategoryModel(jsonMap),
      tag: 'GameCategoryModel',
    );

List<GamePlatformModel> decodeGamePlatformModel(dynamic str) =>
    JsonUtil.decodeArrayToModel(
      str,
      (jsonMap) => GamePlatform.jsonToGamePlatformModel(jsonMap),
      tag: 'GamePlatformModel',
    );

extension GameTypesExtension on GameTypes {
  bool get isValid => categories.isNotEmpty && platforms.isNotEmpty;

  String get debug =>
      'categories=${categories.length} platforms=${platforms.length}';

  bool get platformReady => platforms.first is GamePlatformEntity;

  GameTypes get shrink {
    if (platforms.first is GamePlatformModel) {
      return copyWith(
          platforms: platforms.map((model) {
        if (model is GamePlatformModel)
          return model.entity;
        else
          return model;
      }).toList());
    } else
      return this;
  }
}
