import 'package:flutter_85bet_mobile/utils/json_util.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'marquee_model.dart';

part 'marquee_model_list.freezed.dart';

@freezed
abstract class MarqueeModelList with _$MarqueeModelList {
  const factory MarqueeModelList({
    @JsonKey(name: 'marquee', fromJson: decodeMarqueeModel, required: true)
        List<MarqueeModel> marquees,
    @required int speed,
  }) = _MarqueeModelList;

  static MarqueeModelList jsonToMarqueeModelList(
          Map<String, dynamic> jsonMap) =>
      _$_MarqueeModelList(
        marquees: jsonMap['marquee'] != null
            ? decodeMarqueeModel(jsonMap['marquee'])
            : null,
        speed: jsonMap['speed'],
      );
}

List<MarqueeModel> decodeMarqueeModel(dynamic str) =>
    JsonUtil.decodeArrayToModel(
      str,
      (jsonMap) => MarqueeModel.jsonToMarqueeModel(jsonMap),
      tag: 'MarqueeModel',
    );
