// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_cookie.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveCookieEntityAdapter extends TypeAdapter<HiveCookieEntity> {
  @override
  final int typeId = 108;

  @override
  HiveCookieEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveCookieEntity(
      account: fields[0] as String,
      cookie: fields[1] as Cookie,
    );
  }

  @override
  void write(BinaryWriter writer, HiveCookieEntity obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.account)
      ..writeByte(1)
      ..write(obj.cookie);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveCookieEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
