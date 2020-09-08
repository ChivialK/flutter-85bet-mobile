// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_category_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GameCategoryModelAdapter extends TypeAdapter<_$_GameCategoryModel> {
  @override
  final int typeId = 103;

  @override
  _$_GameCategoryModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_GameCategoryModel(
      ch: fields[0] as String,
      type: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, _$_GameCategoryModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.ch)
      ..writeByte(1)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GameCategoryModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
