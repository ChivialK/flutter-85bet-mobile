import 'dart:io' show Cookie;

import 'package:hive/hive.dart';
import 'package:meta/meta.dart' show required;

part 'hive_cookie.g.dart';

@HiveType(typeId: 108)
class HiveCookieEntity {
  @HiveField(0)
  final String account;
  @HiveField(1)
  final Cookie cookie;

  HiveCookieEntity({@required this.account, @required this.cookie});
}

class CookieAdapter extends TypeAdapter<Cookie> {
  @override
  final typeId = 107;

  @override
  Cookie read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Cookie(fields[0].toString(), fields[1].toString());
  }

  @override
  void write(BinaryWriter writer, Cookie obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.value);
  }
}
