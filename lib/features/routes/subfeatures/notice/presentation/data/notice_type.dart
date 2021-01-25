import 'package:flutter_85bet_mobile/core/base/data_operator.dart';
import 'package:flutter_85bet_mobile/core/internal/local_strings.dart';
import 'package:vnum/vnum.dart';

class NoticeType {
  final int id;
  final String type;

  const NoticeType(this.id, this.type);
}

@VnumDefinition
class NoticeTypeEnum extends Vnum<NoticeType> implements DataOperator {
  /// Case Definition
  static const NoticeTypeEnum MARQUEE =
      const NoticeTypeEnum.define(NoticeType(0, 'marquee'));
  static const NoticeTypeEnum MAINTENANCE =
      const NoticeTypeEnum.define(NoticeType(1, 'maintenance'));

  /// Used for defining cases
  const NoticeTypeEnum.define(NoticeType fromValue) : super.define(fromValue);

  /// Used for loading enum using value
  factory NoticeTypeEnum(NoticeType value) =>
      Vnum.fromValue(value, NoticeTypeEnum);

  /// Iterating cases
  /// All value needs to be constant for this to work
  static List<Vnum> get listAll => Vnum.allCasesFor(NoticeTypeEnum);

  static List<NoticeTypeEnum> get mapAll => Vnum.allCasesFor(NoticeTypeEnum)
      .map<NoticeTypeEnum>((e) => e as NoticeTypeEnum)
      .toList();

  @override
  String operator [](String key) => this.label;

  String get label {
    switch (value.type) {
      case 'marquee':
        return localeStr.noticeTabGeneral;
      case 'maintenance':
        return localeStr.noticeTabMaintenance;
      default:
        return '???';
    }
  }
}
