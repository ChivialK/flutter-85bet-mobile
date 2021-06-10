// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'roller_data_entity.dart';

// **************************************************************************
// DataClassGenerator
// **************************************************************************

abstract class _$RollerDataEntity {
  const _$RollerDataEntity();

  String get rule;
  List<RollerPrizeModel> get prizes;
  bool operator ==(other) {
    if (identical(this, other)) return true;
    if (other is! RollerDataEntity) return false;
    return true &&
        this.rule == other.rule &&
        DeepCollectionEquality().equals(this.prizes, other.prizes);
  }

  int get hashCode {
    return mapPropsToHashCode([rule, prizes]);
  }

  String toString() {
    return 'RollerDataEntity <\'rule\': ${this.rule},\'prizes\': ${this.prizes},>';
  }

  RollerDataEntity copyWith({String rule, List<RollerPrizeModel> prizes}) {
    return RollerDataEntity(
      rule: rule ?? this.rule,
      prizes: prizes ?? this.prizes,
    );
  }
}
