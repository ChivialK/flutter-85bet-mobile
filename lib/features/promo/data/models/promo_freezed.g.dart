// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promo_freezed.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PromoEntityAdapter extends TypeAdapter<_$_PromoEntity> {
  @override
  final int typeId = 201;

  @override
  _$_PromoEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_PromoEntity(
      id: fields[0] as int,
      name: fields[1] as String,
      bannerMobile: fields[2] as String,
      textContent: fields[3] as String,
      placeContent: fields[4] as String,
      applyContent: fields[5] as String,
      ruleContent: fields[6] as String,
      top: fields[7] as String,
      sort: fields[8] as int,
      postCategoryId: fields[9] as int,
      categoryStr: fields[10] as String,
      status: fields[11] as String,
    );
  }

  @override
  void write(BinaryWriter writer, _$_PromoEntity obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.bannerMobile)
      ..writeByte(3)
      ..write(obj.textContent)
      ..writeByte(4)
      ..write(obj.placeContent)
      ..writeByte(5)
      ..write(obj.applyContent)
      ..writeByte(6)
      ..write(obj.ruleContent)
      ..writeByte(7)
      ..write(obj.top)
      ..writeByte(8)
      ..write(obj.sort)
      ..writeByte(9)
      ..write(obj.postCategoryId)
      ..writeByte(10)
      ..write(obj.categoryStr)
      ..writeByte(11)
      ..write(obj.status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PromoEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

// ignore: non_constant_identifier_names
_$_PromoModel _$_$_PromoModelFromJson(Map<String, dynamic> json) {
  return _$_PromoModel(
    id: json['id'] as int,
    postCategoryId: json['post_category_id'] as int,
    name: json['name'] as String,
    banner: json['banner'] as String,
    bannerMobile: json['banner_mobile'] as String,
    textContent: json['text_content'] as String,
    placeContent: json['place_content'] as String,
    applyContent: json['apply_content'] as String,
    ruleContent: json['rule_content'] as String,
    actTime: json['act_time'] as String,
    onlyTable: json['only_table'] as String,
    top: json['top'] as String,
    status: json['status'] as String,
    sort: json['sort'] as int,
    createdAt: json['created_at'] as String,
    updatedAt: json['updated_at'] as String,
    categoryStr: json['categoryStr'] as String,
  );
}

// ignore: non_constant_identifier_names
Map<String, dynamic> _$_$_PromoModelToJson(_$_PromoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'post_category_id': instance.postCategoryId,
      'name': instance.name,
      'banner': instance.banner,
      'banner_mobile': instance.bannerMobile,
      'text_content': instance.textContent,
      'place_content': instance.placeContent,
      'apply_content': instance.applyContent,
      'rule_content': instance.ruleContent,
      'act_time': instance.actTime,
      'only_table': instance.onlyTable,
      'top': instance.top,
      'status': instance.status,
      'sort': instance.sort,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'categoryStr': instance.categoryStr,
    };
