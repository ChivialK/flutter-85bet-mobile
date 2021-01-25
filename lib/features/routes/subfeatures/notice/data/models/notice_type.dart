import 'package:flutter_85bet_mobile/core/base/data_operator.dart';
import 'package:flutter_85bet_mobile/core/internal/local_strings.dart';
import 'package:vnum/vnum.dart';

class NoticeType {
  final int id;
  final String category;

  const NoticeType(this.id, this.category);
}

@VnumDefinition
class NoticeTypeEnum extends Vnum<NoticeType> implements DataOperator {
  /// Case Definition
  static const NoticeTypeEnum general =
      const NoticeTypeEnum.define(NoticeType(0, 'general'));
  static const NoticeTypeEnum maintenance =
      const NoticeTypeEnum.define(NoticeType(1, 'maintenance'));

  /// Used for defining cases
  const NoticeTypeEnum.define(NoticeType fromValue) : super.define(fromValue);

  /// Used for loading enum using value
  factory NoticeTypeEnum(NoticeType value) =>
      Vnum.fromValue(value, NoticeTypeEnum);

  @override
  String operator [](String key) => this.label;

  String get label {
    switch (value.category) {
      case 'general':
        return localeStr.noticeTabGeneral;
      case 'maintenance':
        return localeStr.noticeTabMaintenance;
      default:
        return '???';
    }
  }
}
