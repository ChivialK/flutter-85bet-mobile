import 'package:vnum/vnum.dart';

@VnumDefinition
class DealsStatusEnum extends Vnum<int> {
  /// Case Definition
  static const DealsStatusEnum ALL = const DealsStatusEnum.define(0);
  static const DealsStatusEnum SUCCESS = const DealsStatusEnum.define(1);
  static const DealsStatusEnum FAIL = const DealsStatusEnum.define(2);
  static const DealsStatusEnum PROCESSING = const DealsStatusEnum.define(3);
  static const DealsStatusEnum NEW_DEAL = const DealsStatusEnum.define(4);

  /// Used for defining cases
  const DealsStatusEnum.define(int fromValue) : super.define(fromValue);

  /// Used for loading enum using value
  factory DealsStatusEnum(int value) => Vnum.fromValue(value, DealsStatusEnum);

  /// Iterating cases
  /// All value needs to be constant for this to work
  static List<Vnum> get listAll => Vnum.allCasesFor(DealsStatusEnum);

  static const List<DealsStatusEnum> LIST = [
    DealsStatusEnum.ALL,
    DealsStatusEnum.SUCCESS,
    DealsStatusEnum.FAIL,
    DealsStatusEnum.PROCESSING,
    DealsStatusEnum.NEW_DEAL,
  ];
}
