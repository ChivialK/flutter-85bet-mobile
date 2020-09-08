/// First used in hive_action.dart as a getter of hive data attribute name to
/// compare the value between new and old data.
abstract class DataOperator {
  String operator [](String key);
}
