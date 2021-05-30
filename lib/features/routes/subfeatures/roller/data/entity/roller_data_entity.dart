import 'package:flutter_85bet_mobile/builders/dataclass/dataclass.dart';
import 'package:flutter_85bet_mobile/features/routes/subfeatures/roller/data/models/roller_prize_model.dart';

part 'roller_data_entity.g.dart';

@dataClass
class RollerDataEntity extends _$RollerDataEntity {
  final String rule;
  @Collection(deepEquality: true)
  final List<RollerPrizeModel> prizes;

  const RollerDataEntity({this.rule, this.prizes});
}
