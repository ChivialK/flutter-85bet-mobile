// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'agent_commission_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$AgentCommissionModelTearOff {
  const _$AgentCommissionModelTearOff();

// ignore: unused_element
  _AgentCommissionModel call(
      {String direct,
      String fee,
      @JsonKey(name: 'platform_fee') String platformFee,
      String summary,
      String team,
      @JsonKey(name: 'validbet') String validBet,
      @JsonKey(name: 'winlose') String winLose,
      dynamic key}) {
    return _AgentCommissionModel(
      direct: direct,
      fee: fee,
      platformFee: platformFee,
      summary: summary,
      team: team,
      validBet: validBet,
      winLose: winLose,
      key: key,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $AgentCommissionModel = _$AgentCommissionModelTearOff();

/// @nodoc
mixin _$AgentCommissionModel {
  String get direct;
  String get fee;
  @JsonKey(name: 'platform_fee')
  String get platformFee;
  String get summary;
  String get team;
  @JsonKey(name: 'validbet')
  String get validBet;
  @JsonKey(name: 'winlose')
  String get winLose;
  dynamic get key;

  $AgentCommissionModelCopyWith<AgentCommissionModel> get copyWith;
}

/// @nodoc
abstract class $AgentCommissionModelCopyWith<$Res> {
  factory $AgentCommissionModelCopyWith(AgentCommissionModel value,
          $Res Function(AgentCommissionModel) then) =
      _$AgentCommissionModelCopyWithImpl<$Res>;
  $Res call(
      {String direct,
      String fee,
      @JsonKey(name: 'platform_fee') String platformFee,
      String summary,
      String team,
      @JsonKey(name: 'validbet') String validBet,
      @JsonKey(name: 'winlose') String winLose,
      dynamic key});
}

/// @nodoc
class _$AgentCommissionModelCopyWithImpl<$Res>
    implements $AgentCommissionModelCopyWith<$Res> {
  _$AgentCommissionModelCopyWithImpl(this._value, this._then);

  final AgentCommissionModel _value;
  // ignore: unused_field
  final $Res Function(AgentCommissionModel) _then;

  @override
  $Res call({
    Object direct = freezed,
    Object fee = freezed,
    Object platformFee = freezed,
    Object summary = freezed,
    Object team = freezed,
    Object validBet = freezed,
    Object winLose = freezed,
    Object key = freezed,
  }) {
    return _then(_value.copyWith(
      direct: direct == freezed ? _value.direct : direct as String,
      fee: fee == freezed ? _value.fee : fee as String,
      platformFee:
          platformFee == freezed ? _value.platformFee : platformFee as String,
      summary: summary == freezed ? _value.summary : summary as String,
      team: team == freezed ? _value.team : team as String,
      validBet: validBet == freezed ? _value.validBet : validBet as String,
      winLose: winLose == freezed ? _value.winLose : winLose as String,
      key: key == freezed ? _value.key : key as dynamic,
    ));
  }
}

/// @nodoc
abstract class _$AgentCommissionModelCopyWith<$Res>
    implements $AgentCommissionModelCopyWith<$Res> {
  factory _$AgentCommissionModelCopyWith(_AgentCommissionModel value,
          $Res Function(_AgentCommissionModel) then) =
      __$AgentCommissionModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String direct,
      String fee,
      @JsonKey(name: 'platform_fee') String platformFee,
      String summary,
      String team,
      @JsonKey(name: 'validbet') String validBet,
      @JsonKey(name: 'winlose') String winLose,
      dynamic key});
}

/// @nodoc
class __$AgentCommissionModelCopyWithImpl<$Res>
    extends _$AgentCommissionModelCopyWithImpl<$Res>
    implements _$AgentCommissionModelCopyWith<$Res> {
  __$AgentCommissionModelCopyWithImpl(
      _AgentCommissionModel _value, $Res Function(_AgentCommissionModel) _then)
      : super(_value, (v) => _then(v as _AgentCommissionModel));

  @override
  _AgentCommissionModel get _value => super._value as _AgentCommissionModel;

  @override
  $Res call({
    Object direct = freezed,
    Object fee = freezed,
    Object platformFee = freezed,
    Object summary = freezed,
    Object team = freezed,
    Object validBet = freezed,
    Object winLose = freezed,
    Object key = freezed,
  }) {
    return _then(_AgentCommissionModel(
      direct: direct == freezed ? _value.direct : direct as String,
      fee: fee == freezed ? _value.fee : fee as String,
      platformFee:
          platformFee == freezed ? _value.platformFee : platformFee as String,
      summary: summary == freezed ? _value.summary : summary as String,
      team: team == freezed ? _value.team : team as String,
      validBet: validBet == freezed ? _value.validBet : validBet as String,
      winLose: winLose == freezed ? _value.winLose : winLose as String,
      key: key == freezed ? _value.key : key as dynamic,
    ));
  }
}

/// @nodoc
class _$_AgentCommissionModel implements _AgentCommissionModel {
  const _$_AgentCommissionModel(
      {this.direct,
      this.fee,
      @JsonKey(name: 'platform_fee') this.platformFee,
      this.summary,
      this.team,
      @JsonKey(name: 'validbet') this.validBet,
      @JsonKey(name: 'winlose') this.winLose,
      this.key});

  @override
  final String direct;
  @override
  final String fee;
  @override
  @JsonKey(name: 'platform_fee')
  final String platformFee;
  @override
  final String summary;
  @override
  final String team;
  @override
  @JsonKey(name: 'validbet')
  final String validBet;
  @override
  @JsonKey(name: 'winlose')
  final String winLose;
  @override
  final dynamic key;

  @override
  String toString() {
    return 'AgentCommissionModel(direct: $direct, fee: $fee, platformFee: $platformFee, summary: $summary, team: $team, validBet: $validBet, winLose: $winLose, key: $key)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AgentCommissionModel &&
            (identical(other.direct, direct) ||
                const DeepCollectionEquality().equals(other.direct, direct)) &&
            (identical(other.fee, fee) ||
                const DeepCollectionEquality().equals(other.fee, fee)) &&
            (identical(other.platformFee, platformFee) ||
                const DeepCollectionEquality()
                    .equals(other.platformFee, platformFee)) &&
            (identical(other.summary, summary) ||
                const DeepCollectionEquality()
                    .equals(other.summary, summary)) &&
            (identical(other.team, team) ||
                const DeepCollectionEquality().equals(other.team, team)) &&
            (identical(other.validBet, validBet) ||
                const DeepCollectionEquality()
                    .equals(other.validBet, validBet)) &&
            (identical(other.winLose, winLose) ||
                const DeepCollectionEquality()
                    .equals(other.winLose, winLose)) &&
            (identical(other.key, key) ||
                const DeepCollectionEquality().equals(other.key, key)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(direct) ^
      const DeepCollectionEquality().hash(fee) ^
      const DeepCollectionEquality().hash(platformFee) ^
      const DeepCollectionEquality().hash(summary) ^
      const DeepCollectionEquality().hash(team) ^
      const DeepCollectionEquality().hash(validBet) ^
      const DeepCollectionEquality().hash(winLose) ^
      const DeepCollectionEquality().hash(key);

  @override
  _$AgentCommissionModelCopyWith<_AgentCommissionModel> get copyWith =>
      __$AgentCommissionModelCopyWithImpl<_AgentCommissionModel>(
          this, _$identity);
}

abstract class _AgentCommissionModel implements AgentCommissionModel {
  const factory _AgentCommissionModel(
      {String direct,
      String fee,
      @JsonKey(name: 'platform_fee') String platformFee,
      String summary,
      String team,
      @JsonKey(name: 'validbet') String validBet,
      @JsonKey(name: 'winlose') String winLose,
      dynamic key}) = _$_AgentCommissionModel;

  @override
  String get direct;
  @override
  String get fee;
  @override
  @JsonKey(name: 'platform_fee')
  String get platformFee;
  @override
  String get summary;
  @override
  String get team;
  @override
  @JsonKey(name: 'validbet')
  String get validBet;
  @override
  @JsonKey(name: 'winlose')
  String get winLose;
  @override
  dynamic get key;
  @override
  _$AgentCommissionModelCopyWith<_AgentCommissionModel> get copyWith;
}
