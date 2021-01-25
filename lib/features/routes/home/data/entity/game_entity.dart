import 'package:flutter_85bet_mobile/utils/regex_util.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_entity.freezed.dart';

@freezed
abstract class GameEntity with _$GameEntity {
  const factory GameEntity({
    @required int id,
    @required String cname,
    @JsonKey(fromJson: decodeGameUrl, required: true) String gameUrl,
    @Default(0) int favorite,
    @Default(0) int sort,
  }) = _GameEntity;

  static GameEntity jsonToGameEntity(Map<String, dynamic> jsonMap) =>
      _$_GameEntity(
        id: jsonMap['id'] as int,
        cname: jsonMap['cname'] as String,
        gameUrl: decodeGameUrl(jsonMap['gameUrl'] as Map<String, dynamic>),
        favorite: jsonMap['favorite'] as int ?? 0,
        sort: jsonMap['sort'] as int ?? 0,
      );
}

String decodeGameUrl(Map<String, dynamic> json) =>
    '${json['platform']}/${json['category']}/${json['gameid']}';

extension GameEntityExtension on GameEntity {
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    final info = gameUrl.split('/');
    data['category'] = info[1];
    data['cname'] = cname;
    data['gameid'] = info[2];
    data['id'] = id;
    data['platform'] = info[0];
    return data;
  }

  String get imageUrl => '/images/games/game/$id.jpg';

  bool isLongText(int limit) => cname.countLength > limit;
}
