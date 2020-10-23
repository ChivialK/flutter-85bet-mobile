// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'agent_chart_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$AgentChartModelTearOff {
  const _$AgentChartModelTearOff();

// ignore: unused_element
  _AgentChartModel call({String platform, List<AgentChartData> dataList}) {
    return _AgentChartModel(
      platform: platform,
      dataList: dataList,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $AgentChartModel = _$AgentChartModelTearOff();

/// @nodoc
mixin _$AgentChartModel {
  String get platform;
  List<AgentChartData> get dataList;

  $AgentChartModelCopyWith<AgentChartModel> get copyWith;
}

/// @nodoc
abstract class $AgentChartModelCopyWith<$Res> {
  factory $AgentChartModelCopyWith(
          AgentChartModel value, $Res Function(AgentChartModel) then) =
      _$AgentChartModelCopyWithImpl<$Res>;
  $Res call({String platform, List<AgentChartData> dataList});
}

/// @nodoc
class _$AgentChartModelCopyWithImpl<$Res>
    implements $AgentChartModelCopyWith<$Res> {
  _$AgentChartModelCopyWithImpl(this._value, this._then);

  final AgentChartModel _value;
  // ignore: unused_field
  final $Res Function(AgentChartModel) _then;

  @override
  $Res call({
    Object platform = freezed,
    Object dataList = freezed,
  }) {
    return _then(_value.copyWith(
      platform: platform == freezed ? _value.platform : platform as String,
      dataList: dataList == freezed
          ? _value.dataList
          : dataList as List<AgentChartData>,
    ));
  }
}

/// @nodoc
abstract class _$AgentChartModelCopyWith<$Res>
    implements $AgentChartModelCopyWith<$Res> {
  factory _$AgentChartModelCopyWith(
          _AgentChartModel value, $Res Function(_AgentChartModel) then) =
      __$AgentChartModelCopyWithImpl<$Res>;
  @override
  $Res call({String platform, List<AgentChartData> dataList});
}

/// @nodoc
class __$AgentChartModelCopyWithImpl<$Res>
    extends _$AgentChartModelCopyWithImpl<$Res>
    implements _$AgentChartModelCopyWith<$Res> {
  __$AgentChartModelCopyWithImpl(
      _AgentChartModel _value, $Res Function(_AgentChartModel) _then)
      : super(_value, (v) => _then(v as _AgentChartModel));

  @override
  _AgentChartModel get _value => super._value as _AgentChartModel;

  @override
  $Res call({
    Object platform = freezed,
    Object dataList = freezed,
  }) {
    return _then(_AgentChartModel(
      platform: platform == freezed ? _value.platform : platform as String,
      dataList: dataList == freezed
          ? _value.dataList
          : dataList as List<AgentChartData>,
    ));
  }
}

/// @nodoc
class _$_AgentChartModel implements _AgentChartModel {
  const _$_AgentChartModel({this.platform, this.dataList});

  @override
  final String platform;
  @override
  final List<AgentChartData> dataList;

  @override
  String toString() {
    return 'AgentChartModel(platform: $platform, dataList: $dataList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AgentChartModel &&
            (identical(other.platform, platform) ||
                const DeepCollectionEquality()
                    .equals(other.platform, platform)) &&
            (identical(other.dataList, dataList) ||
                const DeepCollectionEquality()
                    .equals(other.dataList, dataList)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(platform) ^
      const DeepCollectionEquality().hash(dataList);

  @override
  _$AgentChartModelCopyWith<_AgentChartModel> get copyWith =>
      __$AgentChartModelCopyWithImpl<_AgentChartModel>(this, _$identity);

  @override
  dynamic operator [](int key) {
    return dataList[key];
  }
}

abstract class _AgentChartModel implements AgentChartModel {
  const factory _AgentChartModel(
      {String platform, List<AgentChartData> dataList}) = _$_AgentChartModel;

  @override
  String get platform;
  @override
  List<AgentChartData> get dataList;
  @override
  _$AgentChartModelCopyWith<_AgentChartModel> get copyWith;
}

/// @nodoc
class _$AgentChartDataTearOff {
  const _$AgentChartDataTearOff();

// ignore: unused_element
  _AgentChartData call(
      {num bet,
      num payout,
      @JsonKey(name: 'validbet') num validBet,
      num wager,
      @JsonKey(name: 'totalbet') num totalBet,
      @JsonKey(name: 'totalpayout') num totalPayout,
      @JsonKey(name: 'totalvalidbet') num totalValidBet,
      @JsonKey(name: 'totalwager') num totalWager,
      String key}) {
    return _AgentChartData(
      bet: bet,
      payout: payout,
      validBet: validBet,
      wager: wager,
      totalBet: totalBet,
      totalPayout: totalPayout,
      totalValidBet: totalValidBet,
      totalWager: totalWager,
      key: key,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $AgentChartData = _$AgentChartDataTearOff();

/// @nodoc
mixin _$AgentChartData {
  num get bet;
  num get payout;
  @JsonKey(name: 'validbet')
  num get validBet;
  num get wager;
  @JsonKey(name: 'totalbet')
  num get totalBet;
  @JsonKey(name: 'totalpayout')
  num get totalPayout;
  @JsonKey(name: 'totalvalidbet')
  num get totalValidBet;
  @JsonKey(name: 'totalwager')
  num get totalWager;
  String get key;

  $AgentChartDataCopyWith<AgentChartData> get copyWith;
}

/// @nodoc
abstract class $AgentChartDataCopyWith<$Res> {
  factory $AgentChartDataCopyWith(
          AgentChartData value, $Res Function(AgentChartData) then) =
      _$AgentChartDataCopyWithImpl<$Res>;
  $Res call(
      {num bet,
      num payout,
      @JsonKey(name: 'validbet') num validBet,
      num wager,
      @JsonKey(name: 'totalbet') num totalBet,
      @JsonKey(name: 'totalpayout') num totalPayout,
      @JsonKey(name: 'totalvalidbet') num totalValidBet,
      @JsonKey(name: 'totalwager') num totalWager,
      String key});
}

/// @nodoc
class _$AgentChartDataCopyWithImpl<$Res>
    implements $AgentChartDataCopyWith<$Res> {
  _$AgentChartDataCopyWithImpl(this._value, this._then);

  final AgentChartData _value;
  // ignore: unused_field
  final $Res Function(AgentChartData) _then;

  @override
  $Res call({
    Object bet = freezed,
    Object payout = freezed,
    Object validBet = freezed,
    Object wager = freezed,
    Object totalBet = freezed,
    Object totalPayout = freezed,
    Object totalValidBet = freezed,
    Object totalWager = freezed,
    Object key = freezed,
  }) {
    return _then(_value.copyWith(
      bet: bet == freezed ? _value.bet : bet as num,
      payout: payout == freezed ? _value.payout : payout as num,
      validBet: validBet == freezed ? _value.validBet : validBet as num,
      wager: wager == freezed ? _value.wager : wager as num,
      totalBet: totalBet == freezed ? _value.totalBet : totalBet as num,
      totalPayout:
          totalPayout == freezed ? _value.totalPayout : totalPayout as num,
      totalValidBet: totalValidBet == freezed
          ? _value.totalValidBet
          : totalValidBet as num,
      totalWager: totalWager == freezed ? _value.totalWager : totalWager as num,
      key: key == freezed ? _value.key : key as String,
    ));
  }
}

/// @nodoc
abstract class _$AgentChartDataCopyWith<$Res>
    implements $AgentChartDataCopyWith<$Res> {
  factory _$AgentChartDataCopyWith(
          _AgentChartData value, $Res Function(_AgentChartData) then) =
      __$AgentChartDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {num bet,
      num payout,
      @JsonKey(name: 'validbet') num validBet,
      num wager,
      @JsonKey(name: 'totalbet') num totalBet,
      @JsonKey(name: 'totalpayout') num totalPayout,
      @JsonKey(name: 'totalvalidbet') num totalValidBet,
      @JsonKey(name: 'totalwager') num totalWager,
      String key});
}

/// @nodoc
class __$AgentChartDataCopyWithImpl<$Res>
    extends _$AgentChartDataCopyWithImpl<$Res>
    implements _$AgentChartDataCopyWith<$Res> {
  __$AgentChartDataCopyWithImpl(
      _AgentChartData _value, $Res Function(_AgentChartData) _then)
      : super(_value, (v) => _then(v as _AgentChartData));

  @override
  _AgentChartData get _value => super._value as _AgentChartData;

  @override
  $Res call({
    Object bet = freezed,
    Object payout = freezed,
    Object validBet = freezed,
    Object wager = freezed,
    Object totalBet = freezed,
    Object totalPayout = freezed,
    Object totalValidBet = freezed,
    Object totalWager = freezed,
    Object key = freezed,
  }) {
    return _then(_AgentChartData(
      bet: bet == freezed ? _value.bet : bet as num,
      payout: payout == freezed ? _value.payout : payout as num,
      validBet: validBet == freezed ? _value.validBet : validBet as num,
      wager: wager == freezed ? _value.wager : wager as num,
      totalBet: totalBet == freezed ? _value.totalBet : totalBet as num,
      totalPayout:
          totalPayout == freezed ? _value.totalPayout : totalPayout as num,
      totalValidBet: totalValidBet == freezed
          ? _value.totalValidBet
          : totalValidBet as num,
      totalWager: totalWager == freezed ? _value.totalWager : totalWager as num,
      key: key == freezed ? _value.key : key as String,
    ));
  }
}

/// @nodoc
class _$_AgentChartData implements _AgentChartData {
  const _$_AgentChartData(
      {this.bet,
      this.payout,
      @JsonKey(name: 'validbet') this.validBet,
      this.wager,
      @JsonKey(name: 'totalbet') this.totalBet,
      @JsonKey(name: 'totalpayout') this.totalPayout,
      @JsonKey(name: 'totalvalidbet') this.totalValidBet,
      @JsonKey(name: 'totalwager') this.totalWager,
      this.key});

  @override
  final num bet;
  @override
  final num payout;
  @override
  @JsonKey(name: 'validbet')
  final num validBet;
  @override
  final num wager;
  @override
  @JsonKey(name: 'totalbet')
  final num totalBet;
  @override
  @JsonKey(name: 'totalpayout')
  final num totalPayout;
  @override
  @JsonKey(name: 'totalvalidbet')
  final num totalValidBet;
  @override
  @JsonKey(name: 'totalwager')
  final num totalWager;
  @override
  final String key;

  @override
  String toString() {
    return 'AgentChartData(bet: $bet, payout: $payout, validBet: $validBet, wager: $wager, totalBet: $totalBet, totalPayout: $totalPayout, totalValidBet: $totalValidBet, totalWager: $totalWager, key: $key)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AgentChartData &&
            (identical(other.bet, bet) ||
                const DeepCollectionEquality().equals(other.bet, bet)) &&
            (identical(other.payout, payout) ||
                const DeepCollectionEquality().equals(other.payout, payout)) &&
            (identical(other.validBet, validBet) ||
                const DeepCollectionEquality()
                    .equals(other.validBet, validBet)) &&
            (identical(other.wager, wager) ||
                const DeepCollectionEquality().equals(other.wager, wager)) &&
            (identical(other.totalBet, totalBet) ||
                const DeepCollectionEquality()
                    .equals(other.totalBet, totalBet)) &&
            (identical(other.totalPayout, totalPayout) ||
                const DeepCollectionEquality()
                    .equals(other.totalPayout, totalPayout)) &&
            (identical(other.totalValidBet, totalValidBet) ||
                const DeepCollectionEquality()
                    .equals(other.totalValidBet, totalValidBet)) &&
            (identical(other.totalWager, totalWager) ||
                const DeepCollectionEquality()
                    .equals(other.totalWager, totalWager)) &&
            (identical(other.key, key) ||
                const DeepCollectionEquality().equals(other.key, key)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(bet) ^
      const DeepCollectionEquality().hash(payout) ^
      const DeepCollectionEquality().hash(validBet) ^
      const DeepCollectionEquality().hash(wager) ^
      const DeepCollectionEquality().hash(totalBet) ^
      const DeepCollectionEquality().hash(totalPayout) ^
      const DeepCollectionEquality().hash(totalValidBet) ^
      const DeepCollectionEquality().hash(totalWager) ^
      const DeepCollectionEquality().hash(key);

  @override
  _$AgentChartDataCopyWith<_AgentChartData> get copyWith =>
      __$AgentChartDataCopyWithImpl<_AgentChartData>(this, _$identity);

  @override
  operator [](int key) {
    switch (key) {
      case 0:
        return wager;
      case 1:
        return bet;
      case 2:
        return validBet;
      case 3:
        return payout;
      case 4:
        return totalWager;
      case 5:
        return totalBet;
      case 6:
        return totalValidBet;
      case 7:
        return totalPayout;
      default:
        return 0;
    }
  }
}

abstract class _AgentChartData implements AgentChartData {
  const factory _AgentChartData(
      {num bet,
      num payout,
      @JsonKey(name: 'validbet') num validBet,
      num wager,
      @JsonKey(name: 'totalbet') num totalBet,
      @JsonKey(name: 'totalpayout') num totalPayout,
      @JsonKey(name: 'totalvalidbet') num totalValidBet,
      @JsonKey(name: 'totalwager') num totalWager,
      String key}) = _$_AgentChartData;

  @override
  num get bet;
  @override
  num get payout;
  @override
  @JsonKey(name: 'validbet')
  num get validBet;
  @override
  num get wager;
  @override
  @JsonKey(name: 'totalbet')
  num get totalBet;
  @override
  @JsonKey(name: 'totalpayout')
  num get totalPayout;
  @override
  @JsonKey(name: 'totalvalidbet')
  num get totalValidBet;
  @override
  @JsonKey(name: 'totalwager')
  num get totalWager;
  @override
  String get key;
  @override
  _$AgentChartDataCopyWith<_AgentChartData> get copyWith;
}
