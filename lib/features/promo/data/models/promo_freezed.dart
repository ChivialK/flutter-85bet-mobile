import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'promo_freezed.freezed.dart';
part 'promo_freezed.g.dart';

@freezed
abstract class PromoModel with _$PromoModel {
  const factory PromoModel({
    @required int id,
    @JsonKey(name: 'post_category_id') int postCategoryId,
    @required String name,
    @required String banner,
    @JsonKey(name: 'banner_mobile') String bannerMobile,
    @JsonKey(name: 'text_content') String textContent,
    @JsonKey(name: 'place_content') String placeContent,
    @JsonKey(name: 'apply_content') String applyContent,
    @JsonKey(name: 'rule_content') String ruleContent,
    @JsonKey(name: 'act_time') String actTime,
    @JsonKey(name: 'only_table') String onlyTable,
    @required String top,
    @required String status,
    @required int sort,
    @JsonKey(name: 'created_at') String createdAt,
    @JsonKey(name: 'updated_at') String updatedAt,
    @required String categoryStr,
  }) = _PromoModel;

  factory PromoModel.fromJson(Map<String, dynamic> json) =>
      _$PromoModelFromJson(json);

  static PromoModel jsonToPromoModel(Map<String, dynamic> jsonMap) =>
      PromoModel.fromJson(jsonMap);
}

extension PromoModelExtension on PromoModel {
  PromoEntity get entity => PromoEntity(
        id: id,
        name: name,
        bannerMobile: bannerMobile,
        textContent: textContent,
        placeContent: placeContent,
        applyContent: applyContent,
        ruleContent: ruleContent,
        top: top,
        sort: sort,
        postCategoryId: postCategoryId,
        categoryStr: categoryStr,
        status: status,
      );
}

@freezed
abstract class PromoEntity with _$PromoEntity {
  @HiveType(typeId: 201)
  const factory PromoEntity({
    @HiveField(0) @required int id,
    @HiveField(1) @required String name,
    @HiveField(2) @required String bannerMobile,
    @HiveField(3) @required String textContent,
    @HiveField(4) @required String placeContent,
    @HiveField(5) @required String applyContent,
    @HiveField(6) @required String ruleContent,
    @HiveField(7) @required String top,
    @HiveField(8) @required int sort,
    @HiveField(9) @required int postCategoryId,
    @HiveField(10) @required String categoryStr,
    @HiveField(11) @required String status,
  }) = _PromoEntity;
}

//class PromoEntityAdapter extends TypeAdapter<PromoEntity> {
//  @override
//  final typeId = 201;
//
//  @override
//  PromoEntity read(BinaryReader reader) {
//    var numOfFields = reader.readByte();
//    var fields = <int, dynamic>{
//      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//    };
//    return PromoEntity(
//      applyContent: fields[5] as String,
//      bannerMobile: fields[2] as String,
//      postCategoryId: fields[9] as int,
//      categoryStr: fields[10] as String,
//      id: fields[0] as int,
//      name: fields[1] as String,
//      placeContent: fields[4] as String,
//      ruleContent: fields[6] as String,
//      sort: fields[8] as int,
//      status: fields[11] as String,
//      textContent: fields[3] as String,
//      top: fields[7] as String,
//    );
//  }
//
//  @override
//  void write(BinaryWriter writer, PromoEntity obj) {
//    writer
//      ..writeByte(12)
//      ..writeByte(0)
//      ..write(obj.id)
//      ..writeByte(1)
//      ..write(obj.name)
//      ..writeByte(2)
//      ..write(obj.bannerMobile)
//      ..writeByte(3)
//      ..write(obj.textContent)
//      ..writeByte(4)
//      ..write(obj.placeContent)
//      ..writeByte(5)
//      ..write(obj.applyContent)
//      ..writeByte(6)
//      ..write(obj.ruleContent)
//      ..writeByte(7)
//      ..write(obj.top)
//      ..writeByte(8)
//      ..write(obj.sort)
//      ..writeByte(9)
//      ..write(obj.postCategoryId)
//      ..writeByte(10)
//      ..write(obj.categoryStr)
//      ..writeByte(11)
//      ..write(obj.status);
//  }
//}
