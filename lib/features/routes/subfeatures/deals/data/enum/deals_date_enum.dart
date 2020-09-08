import 'package:vnum/vnum.dart';

@VnumDefinition
class DealsDateEnum extends Vnum<int> {
  /// Case Definition
  static const DealsDateEnum TODAY = const DealsDateEnum.define(0);
  static const DealsDateEnum YESTERDAY = const DealsDateEnum.define(1);
  static const DealsDateEnum MONTH = const DealsDateEnum.define(2);
  static const DealsDateEnum ALL = const DealsDateEnum.define(3);

  /// Used for defining cases
  const DealsDateEnum.define(int fromValue) : super.define(fromValue);

  /// Used for loading enum using value
  factory DealsDateEnum(int value) => Vnum.fromValue(value, DealsDateEnum);

  /// Iterating cases
  /// All value needs to be constant for this to work
  static List<Vnum> get listAll => Vnum.allCasesFor(DealsDateEnum);

  static const List<DealsDateEnum> LIST = [
    DealsDateEnum.TODAY,
    DealsDateEnum.YESTERDAY,
    DealsDateEnum.MONTH,
    DealsDateEnum.ALL,
  ];
}
