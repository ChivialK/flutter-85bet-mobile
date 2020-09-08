import 'package:vnum/vnum.dart';

@VnumDefinition
class AgentChartType extends Vnum<String> {
  static const AgentChartType PLATFORM =
      const AgentChartType.define('platform');

  static const AgentChartType CATEGORY =
      const AgentChartType.define('category');

  /// Used for defining cases
  const AgentChartType.define(String fromValue) : super.define(fromValue);

  /// Used for loading enum using value
  factory AgentChartType(String value) => Vnum.fromValue(value, AgentChartType);

  /// Iterating cases
  /// All value needs to be constant for this to work
  static List<Vnum> get listAll => Vnum.allCasesFor(AgentChartType);

  /// (optional) Extend your Vnums
  static const List<AgentChartType> LIST = [
    AgentChartType.PLATFORM,
    AgentChartType.CATEGORY,
  ];
}
