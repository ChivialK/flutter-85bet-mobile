import 'package:vnum/vnum.dart';

@VnumDefinition
class DealsTypeEnum extends Vnum<int> {
  /// Case Definition
  static const DealsTypeEnum ALL = const DealsTypeEnum.define(0);
  static const DealsTypeEnum DEPOSIT = const DealsTypeEnum.define(1);
  static const DealsTypeEnum WITHDRAW = const DealsTypeEnum.define(2);
  static const DealsTypeEnum BONUS = const DealsTypeEnum.define(3);

  /// Used for defining cases
  const DealsTypeEnum.define(int fromValue) : super.define(fromValue);

  /// Used for loading enum using value
  factory DealsTypeEnum(int value) => Vnum.fromValue(value, DealsTypeEnum);

  /// Iterating cases
  /// All value needs to be constant for this to work
  static List<Vnum> get listAll => Vnum.allCasesFor(DealsTypeEnum);

  static const List<DealsTypeEnum> LIST = [
    DealsTypeEnum.ALL,
    DealsTypeEnum.DEPOSIT,
    DealsTypeEnum.WITHDRAW,
    DealsTypeEnum.BONUS,
  ];
}
