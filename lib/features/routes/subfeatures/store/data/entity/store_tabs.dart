import 'package:flutter_85bet_mobile/core/base/data_operator.dart';
import 'package:flutter_85bet_mobile/core/internal/local_strings.dart';
import 'package:vnum/vnum.dart';

class StoreTabs {
  final int id;
  final String category;

  const StoreTabs(this.id, this.category);
}

@VnumDefinition
class StoreTabsEnum extends Vnum<StoreTabs> implements DataOperator {
  /// Case Definition
  static const StoreTabsEnum product =
      const StoreTabsEnum.define(StoreTabs(0, 'product'));
  static const StoreTabsEnum rules =
      const StoreTabsEnum.define(StoreTabs(1, 'rules'));
  static const StoreTabsEnum records =
      const StoreTabsEnum.define(StoreTabs(2, 'record'));

  /// Used for defining cases
  const StoreTabsEnum.define(StoreTabs fromValue) : super.define(fromValue);

  /// Used for loading enum using value
  factory StoreTabsEnum(StoreTabs value) =>
      Vnum.fromValue(value, StoreTabsEnum);

  @override
  String operator [](String key) => this.label;

  String get label {
    switch (value.id) {
      case 0:
        return localeStr.storeTextTitleProduct;
      case 1:
        return localeStr.storeTextTitleRule;
      case 2:
        return localeStr.storeTextTitleRecord;
      default:
        return '???';
    }
  }
}
