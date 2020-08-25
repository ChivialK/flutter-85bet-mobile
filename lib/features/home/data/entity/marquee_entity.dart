import 'package:flutter_85bet_mobile/core/base/data_operator.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'marquee_entity.freezed.dart';
part 'marquee_entity.g.dart';

@freezed
abstract class MarqueeEntity with _$MarqueeEntity {
  @HiveType(typeId: 102)
  @Implements(DataOperator)
  const factory MarqueeEntity({
    @HiveField(0) @required int id,
    @HiveField(1) @required String content,
    @HiveField(2) @required String url,
  }) = _MarqueeEntity;

//  @override
//  String operator [](String key) {
//    return id.toString();
//  }
}
