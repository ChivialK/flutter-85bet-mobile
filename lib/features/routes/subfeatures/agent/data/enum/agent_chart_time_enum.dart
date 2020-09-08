import 'package:vnum/vnum.dart';

@VnumDefinition
class AgentChartTime extends Vnum<int> {
  static const AgentChartTime THIS_MONTH = const AgentChartTime.define(1);
  static const AgentChartTime LAST_MONTH = const AgentChartTime.define(0);

  /// Used for defining cases
  const AgentChartTime.define(int fromValue) : super.define(fromValue);

  /// Used for loading enum using value
  factory AgentChartTime(int value) => Vnum.fromValue(value, AgentChartTime);

  /// Iterating cases
  /// All value needs to be constant for this to work
  static List<Vnum> get listAll => Vnum.allCasesFor(AgentChartTime);

  /// (optional) Extend your Vnums
  static const List<AgentChartTime> LIST = [
    AgentChartTime.LAST_MONTH,
    AgentChartTime.THIS_MONTH,
  ];
}
