import 'package:flutter_85bet_mobile/core/base/data_operator.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'banner_entity.freezed.dart';
part 'banner_entity.g.dart';

@freezed
abstract class BannerEntity with _$BannerEntity {
  @HiveType(typeId: 101)
  @Implements(DataOperator)
  const factory BannerEntity({
    @HiveField(0) @required int id,
    @HiveField(1) @required String pic,
    @HiveField(2) @required bool noPromo,
    @HiveField(3) @required String promoUrl,
    @HiveField(4) @required int sort,
  }) = _BannerEntity;

//  @override
//  String operator [](String key) {
//    return id.toString();
//  }
}
