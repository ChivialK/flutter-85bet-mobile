import 'package:flutter_85bet_mobile/core/internal/global.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../entity/marquee_entity.dart';

part 'marquee_model.freezed.dart';

@freezed
abstract class MarqueeModel with _$MarqueeModel {
  const factory MarqueeModel({
    @required int id,
    @JsonKey(name: 'content_cn') String content,
    @required String url,
    @JsonKey(name: 'created_at', required: true) String createdAt,
    @JsonKey(name: 'updated_at', required: true) String updatedAt,
    @required String showDate,
  }) = _MarqueeModel;

  static MarqueeModel jsonToMarqueeModel(Map<String, dynamic> jsonMap) =>
      _$_MarqueeModel(
        id: jsonMap['id'] as int,
        content: jsonMap[Global.localeJsonKey] as String,
        url: jsonMap['url'] as String,
        createdAt: jsonMap['created_at'] as String,
        updatedAt: jsonMap['updated_at'] as String,
        showDate: jsonMap['showDate'] as String,
      );
}

extension MarqueeModelExtension on MarqueeModel {
  MarqueeEntity get entity => MarqueeEntity(id: id, content: content, url: url);
}
