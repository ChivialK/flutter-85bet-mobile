import 'package:hive/hive.dart';
import 'package:meta/meta.dart' show required;

part 'hive_app_data.g.dart';

@HiveType(typeId: 106)
class HiveAppDataEntity {
  @HiveField(0)
  final String key;
  @HiveField(1)
  final dynamic data;

  HiveAppDataEntity({@required this.key, @required this.data});
}
