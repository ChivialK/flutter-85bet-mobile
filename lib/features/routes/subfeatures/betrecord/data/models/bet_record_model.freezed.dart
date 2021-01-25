// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'bet_record_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$BetRecordModelTearOff {
  const _$BetRecordModelTearOff();

// ignore: unused_element
  _BetRecordModel call(
      {@JsonKey(name: 'current_page') int currentPage,
      @JsonKey(name: 'last_page') int lastPage,
      @JsonKey(name: 'per_page') int perPage,
      int from,
      int to,
      int total,
      @JsonKey(name: 'next_page_url') String nextPageUrl,
      @JsonKey(name: 'prev_page_url') String prevPageUrl,
      @JsonKey(fromJson: decodeBetRecordData) List<BetRecordData> data}) {
    return _BetRecordModel(
      currentPage: currentPage,
      lastPage: lastPage,
      perPage: perPage,
      from: from,
      to: to,
      total: total,
      nextPageUrl: nextPageUrl,
      prevPageUrl: prevPageUrl,
      data: data,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $BetRecordModel = _$BetRecordModelTearOff();

/// @nodoc
mixin _$BetRecordModel {
  @JsonKey(name: 'current_page')
  int get currentPage;
  @JsonKey(name: 'last_page')
  int get lastPage;
  @JsonKey(name: 'per_page')
  int get perPage;
  int get from;
  int get to;
  int get total;
  @JsonKey(name: 'next_page_url')
  String get nextPageUrl;
  @JsonKey(name: 'prev_page_url')
  String get prevPageUrl;
  @JsonKey(fromJson: decodeBetRecordData)
  List<BetRecordData> get data;

  @JsonKey(ignore: true)
  $BetRecordModelCopyWith<BetRecordModel> get copyWith;
}

/// @nodoc
abstract class $BetRecordModelCopyWith<$Res> {
  factory $BetRecordModelCopyWith(
          BetRecordModel value, $Res Function(BetRecordModel) then) =
      _$BetRecordModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'current_page') int currentPage,
      @JsonKey(name: 'last_page') int lastPage,
      @JsonKey(name: 'per_page') int perPage,
      int from,
      int to,
      int total,
      @JsonKey(name: 'next_page_url') String nextPageUrl,
      @JsonKey(name: 'prev_page_url') String prevPageUrl,
      @JsonKey(fromJson: decodeBetRecordData) List<BetRecordData> data});
}

/// @nodoc
class _$BetRecordModelCopyWithImpl<$Res>
    implements $BetRecordModelCopyWith<$Res> {
  _$BetRecordModelCopyWithImpl(this._value, this._then);

  final BetRecordModel _value;
  // ignore: unused_field
  final $Res Function(BetRecordModel) _then;

  @override
  $Res call({
    Object currentPage = freezed,
    Object lastPage = freezed,
    Object perPage = freezed,
    Object from = freezed,
    Object to = freezed,
    Object total = freezed,
    Object nextPageUrl = freezed,
    Object prevPageUrl = freezed,
    Object data = freezed,
  }) {
    return _then(_value.copyWith(
      currentPage:
          currentPage == freezed ? _value.currentPage : currentPage as int,
      lastPage: lastPage == freezed ? _value.lastPage : lastPage as int,
      perPage: perPage == freezed ? _value.perPage : perPage as int,
      from: from == freezed ? _value.from : from as int,
      to: to == freezed ? _value.to : to as int,
      total: total == freezed ? _value.total : total as int,
      nextPageUrl:
          nextPageUrl == freezed ? _value.nextPageUrl : nextPageUrl as String,
      prevPageUrl:
          prevPageUrl == freezed ? _value.prevPageUrl : prevPageUrl as String,
      data: data == freezed ? _value.data : data as List<BetRecordData>,
    ));
  }
}

/// @nodoc
abstract class _$BetRecordModelCopyWith<$Res>
    implements $BetRecordModelCopyWith<$Res> {
  factory _$BetRecordModelCopyWith(
          _BetRecordModel value, $Res Function(_BetRecordModel) then) =
      __$BetRecordModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'current_page') int currentPage,
      @JsonKey(name: 'last_page') int lastPage,
      @JsonKey(name: 'per_page') int perPage,
      int from,
      int to,
      int total,
      @JsonKey(name: 'next_page_url') String nextPageUrl,
      @JsonKey(name: 'prev_page_url') String prevPageUrl,
      @JsonKey(fromJson: decodeBetRecordData) List<BetRecordData> data});
}

/// @nodoc
class __$BetRecordModelCopyWithImpl<$Res>
    extends _$BetRecordModelCopyWithImpl<$Res>
    implements _$BetRecordModelCopyWith<$Res> {
  __$BetRecordModelCopyWithImpl(
      _BetRecordModel _value, $Res Function(_BetRecordModel) _then)
      : super(_value, (v) => _then(v as _BetRecordModel));

  @override
  _BetRecordModel get _value => super._value as _BetRecordModel;

  @override
  $Res call({
    Object currentPage = freezed,
    Object lastPage = freezed,
    Object perPage = freezed,
    Object from = freezed,
    Object to = freezed,
    Object total = freezed,
    Object nextPageUrl = freezed,
    Object prevPageUrl = freezed,
    Object data = freezed,
  }) {
    return _then(_BetRecordModel(
      currentPage:
          currentPage == freezed ? _value.currentPage : currentPage as int,
      lastPage: lastPage == freezed ? _value.lastPage : lastPage as int,
      perPage: perPage == freezed ? _value.perPage : perPage as int,
      from: from == freezed ? _value.from : from as int,
      to: to == freezed ? _value.to : to as int,
      total: total == freezed ? _value.total : total as int,
      nextPageUrl:
          nextPageUrl == freezed ? _value.nextPageUrl : nextPageUrl as String,
      prevPageUrl:
          prevPageUrl == freezed ? _value.prevPageUrl : prevPageUrl as String,
      data: data == freezed ? _value.data : data as List<BetRecordData>,
    ));
  }
}

/// @nodoc
class _$_BetRecordModel implements _BetRecordModel {
  const _$_BetRecordModel(
      {@JsonKey(name: 'current_page') this.currentPage,
      @JsonKey(name: 'last_page') this.lastPage,
      @JsonKey(name: 'per_page') this.perPage,
      this.from,
      this.to,
      this.total,
      @JsonKey(name: 'next_page_url') this.nextPageUrl,
      @JsonKey(name: 'prev_page_url') this.prevPageUrl,
      @JsonKey(fromJson: decodeBetRecordData) this.data});

  @override
  @JsonKey(name: 'current_page')
  final int currentPage;
  @override
  @JsonKey(name: 'last_page')
  final int lastPage;
  @override
  @JsonKey(name: 'per_page')
  final int perPage;
  @override
  final int from;
  @override
  final int to;
  @override
  final int total;
  @override
  @JsonKey(name: 'next_page_url')
  final String nextPageUrl;
  @override
  @JsonKey(name: 'prev_page_url')
  final String prevPageUrl;
  @override
  @JsonKey(fromJson: decodeBetRecordData)
  final List<BetRecordData> data;

  @override
  String toString() {
    return 'BetRecordModel(currentPage: $currentPage, lastPage: $lastPage, perPage: $perPage, from: $from, to: $to, total: $total, nextPageUrl: $nextPageUrl, prevPageUrl: $prevPageUrl, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BetRecordModel &&
            (identical(other.currentPage, currentPage) ||
                const DeepCollectionEquality()
                    .equals(other.currentPage, currentPage)) &&
            (identical(other.lastPage, lastPage) ||
                const DeepCollectionEquality()
                    .equals(other.lastPage, lastPage)) &&
            (identical(other.perPage, perPage) ||
                const DeepCollectionEquality()
                    .equals(other.perPage, perPage)) &&
            (identical(other.from, from) ||
                const DeepCollectionEquality().equals(other.from, from)) &&
            (identical(other.to, to) ||
                const DeepCollectionEquality().equals(other.to, to)) &&
            (identical(other.total, total) ||
                const DeepCollectionEquality().equals(other.total, total)) &&
            (identical(other.nextPageUrl, nextPageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.nextPageUrl, nextPageUrl)) &&
            (identical(other.prevPageUrl, prevPageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.prevPageUrl, prevPageUrl)) &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(currentPage) ^
      const DeepCollectionEquality().hash(lastPage) ^
      const DeepCollectionEquality().hash(perPage) ^
      const DeepCollectionEquality().hash(from) ^
      const DeepCollectionEquality().hash(to) ^
      const DeepCollectionEquality().hash(total) ^
      const DeepCollectionEquality().hash(nextPageUrl) ^
      const DeepCollectionEquality().hash(prevPageUrl) ^
      const DeepCollectionEquality().hash(data);

  @JsonKey(ignore: true)
  @override
  _$BetRecordModelCopyWith<_BetRecordModel> get copyWith =>
      __$BetRecordModelCopyWithImpl<_BetRecordModel>(this, _$identity);
}

abstract class _BetRecordModel implements BetRecordModel {
  const factory _BetRecordModel(
          {@JsonKey(name: 'current_page') int currentPage,
          @JsonKey(name: 'last_page') int lastPage,
          @JsonKey(name: 'per_page') int perPage,
          int from,
          int to,
          int total,
          @JsonKey(name: 'next_page_url') String nextPageUrl,
          @JsonKey(name: 'prev_page_url') String prevPageUrl,
          @JsonKey(fromJson: decodeBetRecordData) List<BetRecordData> data}) =
      _$_BetRecordModel;

  @override
  @JsonKey(name: 'current_page')
  int get currentPage;
  @override
  @JsonKey(name: 'last_page')
  int get lastPage;
  @override
  @JsonKey(name: 'per_page')
  int get perPage;
  @override
  int get from;
  @override
  int get to;
  @override
  int get total;
  @override
  @JsonKey(name: 'next_page_url')
  String get nextPageUrl;
  @override
  @JsonKey(name: 'prev_page_url')
  String get prevPageUrl;
  @override
  @JsonKey(fromJson: decodeBetRecordData)
  List<BetRecordData> get data;
  @override
  @JsonKey(ignore: true)
  _$BetRecordModelCopyWith<_BetRecordModel> get copyWith;
}

/// @nodoc
class _$BetRecordDataTearOff {
  const _$BetRecordDataTearOff();

// ignore: unused_element
  _BetRecordData call(
      {@JsonKey(name: 'activebet') String activeBet,
      @JsonKey(name: 'validbet') String validBet,
      String bet,
      @JsonKey(name: 'betno') String betNo,
      String payout,
      String site,
      @JsonKey(name: 'starttime') String startTime,
      String type,
      dynamic key}) {
    return _BetRecordData(
      activeBet: activeBet,
      validBet: validBet,
      bet: bet,
      betNo: betNo,
      payout: payout,
      site: site,
      startTime: startTime,
      type: type,
      key: key,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $BetRecordData = _$BetRecordDataTearOff();

/// @nodoc
mixin _$BetRecordData {
  @JsonKey(name: 'activebet')
  String get activeBet;
  @JsonKey(name: 'validbet')
  String get validBet;
  String get bet;
  @JsonKey(name: 'betno')
  String get betNo;
  String get payout;
  String get site;
  @JsonKey(name: 'starttime')
  String get startTime;
  String get type;
  dynamic get key;

  @JsonKey(ignore: true)
  $BetRecordDataCopyWith<BetRecordData> get copyWith;
}

/// @nodoc
abstract class $BetRecordDataCopyWith<$Res> {
  factory $BetRecordDataCopyWith(
          BetRecordData value, $Res Function(BetRecordData) then) =
      _$BetRecordDataCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'activebet') String activeBet,
      @JsonKey(name: 'validbet') String validBet,
      String bet,
      @JsonKey(name: 'betno') String betNo,
      String payout,
      String site,
      @JsonKey(name: 'starttime') String startTime,
      String type,
      dynamic key});
}

/// @nodoc
class _$BetRecordDataCopyWithImpl<$Res>
    implements $BetRecordDataCopyWith<$Res> {
  _$BetRecordDataCopyWithImpl(this._value, this._then);

  final BetRecordData _value;
  // ignore: unused_field
  final $Res Function(BetRecordData) _then;

  @override
  $Res call({
    Object activeBet = freezed,
    Object validBet = freezed,
    Object bet = freezed,
    Object betNo = freezed,
    Object payout = freezed,
    Object site = freezed,
    Object startTime = freezed,
    Object type = freezed,
    Object key = freezed,
  }) {
    return _then(_value.copyWith(
      activeBet: activeBet == freezed ? _value.activeBet : activeBet as String,
      validBet: validBet == freezed ? _value.validBet : validBet as String,
      bet: bet == freezed ? _value.bet : bet as String,
      betNo: betNo == freezed ? _value.betNo : betNo as String,
      payout: payout == freezed ? _value.payout : payout as String,
      site: site == freezed ? _value.site : site as String,
      startTime: startTime == freezed ? _value.startTime : startTime as String,
      type: type == freezed ? _value.type : type as String,
      key: key == freezed ? _value.key : key as dynamic,
    ));
  }
}

/// @nodoc
abstract class _$BetRecordDataCopyWith<$Res>
    implements $BetRecordDataCopyWith<$Res> {
  factory _$BetRecordDataCopyWith(
          _BetRecordData value, $Res Function(_BetRecordData) then) =
      __$BetRecordDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'activebet') String activeBet,
      @JsonKey(name: 'validbet') String validBet,
      String bet,
      @JsonKey(name: 'betno') String betNo,
      String payout,
      String site,
      @JsonKey(name: 'starttime') String startTime,
      String type,
      dynamic key});
}

/// @nodoc
class __$BetRecordDataCopyWithImpl<$Res>
    extends _$BetRecordDataCopyWithImpl<$Res>
    implements _$BetRecordDataCopyWith<$Res> {
  __$BetRecordDataCopyWithImpl(
      _BetRecordData _value, $Res Function(_BetRecordData) _then)
      : super(_value, (v) => _then(v as _BetRecordData));

  @override
  _BetRecordData get _value => super._value as _BetRecordData;

  @override
  $Res call({
    Object activeBet = freezed,
    Object validBet = freezed,
    Object bet = freezed,
    Object betNo = freezed,
    Object payout = freezed,
    Object site = freezed,
    Object startTime = freezed,
    Object type = freezed,
    Object key = freezed,
  }) {
    return _then(_BetRecordData(
      activeBet: activeBet == freezed ? _value.activeBet : activeBet as String,
      validBet: validBet == freezed ? _value.validBet : validBet as String,
      bet: bet == freezed ? _value.bet : bet as String,
      betNo: betNo == freezed ? _value.betNo : betNo as String,
      payout: payout == freezed ? _value.payout : payout as String,
      site: site == freezed ? _value.site : site as String,
      startTime: startTime == freezed ? _value.startTime : startTime as String,
      type: type == freezed ? _value.type : type as String,
      key: key == freezed ? _value.key : key as dynamic,
    ));
  }
}

/// @nodoc
class _$_BetRecordData implements _BetRecordData {
  const _$_BetRecordData(
      {@JsonKey(name: 'activebet') this.activeBet,
      @JsonKey(name: 'validbet') this.validBet,
      this.bet,
      @JsonKey(name: 'betno') this.betNo,
      this.payout,
      this.site,
      @JsonKey(name: 'starttime') this.startTime,
      this.type,
      this.key});

  @override
  @JsonKey(name: 'activebet')
  final String activeBet;
  @override
  @JsonKey(name: 'validbet')
  final String validBet;
  @override
  final String bet;
  @override
  @JsonKey(name: 'betno')
  final String betNo;
  @override
  final String payout;
  @override
  final String site;
  @override
  @JsonKey(name: 'starttime')
  final String startTime;
  @override
  final String type;
  @override
  final dynamic key;

  @override
  String toString() {
    return 'BetRecordData(activeBet: $activeBet, validBet: $validBet, bet: $bet, betNo: $betNo, payout: $payout, site: $site, startTime: $startTime, type: $type, key: $key)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BetRecordData &&
            (identical(other.activeBet, activeBet) ||
                const DeepCollectionEquality()
                    .equals(other.activeBet, activeBet)) &&
            (identical(other.validBet, validBet) ||
                const DeepCollectionEquality()
                    .equals(other.validBet, validBet)) &&
            (identical(other.bet, bet) ||
                const DeepCollectionEquality().equals(other.bet, bet)) &&
            (identical(other.betNo, betNo) ||
                const DeepCollectionEquality().equals(other.betNo, betNo)) &&
            (identical(other.payout, payout) ||
                const DeepCollectionEquality().equals(other.payout, payout)) &&
            (identical(other.site, site) ||
                const DeepCollectionEquality().equals(other.site, site)) &&
            (identical(other.startTime, startTime) ||
                const DeepCollectionEquality()
                    .equals(other.startTime, startTime)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.key, key) ||
                const DeepCollectionEquality().equals(other.key, key)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(activeBet) ^
      const DeepCollectionEquality().hash(validBet) ^
      const DeepCollectionEquality().hash(bet) ^
      const DeepCollectionEquality().hash(betNo) ^
      const DeepCollectionEquality().hash(payout) ^
      const DeepCollectionEquality().hash(site) ^
      const DeepCollectionEquality().hash(startTime) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(key);

  @JsonKey(ignore: true)
  @override
  _$BetRecordDataCopyWith<_BetRecordData> get copyWith =>
      __$BetRecordDataCopyWithImpl<_BetRecordData>(this, _$identity);
}

abstract class _BetRecordData implements BetRecordData {
  const factory _BetRecordData(
      {@JsonKey(name: 'activebet') String activeBet,
      @JsonKey(name: 'validbet') String validBet,
      String bet,
      @JsonKey(name: 'betno') String betNo,
      String payout,
      String site,
      @JsonKey(name: 'starttime') String startTime,
      String type,
      dynamic key}) = _$_BetRecordData;

  @override
  @JsonKey(name: 'activebet')
  String get activeBet;
  @override
  @JsonKey(name: 'validbet')
  String get validBet;
  @override
  String get bet;
  @override
  @JsonKey(name: 'betno')
  String get betNo;
  @override
  String get payout;
  @override
  String get site;
  @override
  @JsonKey(name: 'starttime')
  String get startTime;
  @override
  String get type;
  @override
  dynamic get key;
  @override
  @JsonKey(ignore: true)
  _$BetRecordDataCopyWith<_BetRecordData> get copyWith;
}

/// @nodoc
class _$BetRecordDataAllPlatformTearOff {
  const _$BetRecordDataAllPlatformTearOff();

// ignore: unused_element
  _BetRecordDataAllPlatform call(
      {num bet, num valid, num payout, dynamic key}) {
    return _BetRecordDataAllPlatform(
      bet: bet,
      valid: valid,
      payout: payout,
      key: key,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $BetRecordDataAllPlatform = _$BetRecordDataAllPlatformTearOff();

/// @nodoc
mixin _$BetRecordDataAllPlatform {
  num get bet;
  num get valid;
  num get payout;
  dynamic get key;

  @JsonKey(ignore: true)
  $BetRecordDataAllPlatformCopyWith<BetRecordDataAllPlatform> get copyWith;
}

/// @nodoc
abstract class $BetRecordDataAllPlatformCopyWith<$Res> {
  factory $BetRecordDataAllPlatformCopyWith(BetRecordDataAllPlatform value,
          $Res Function(BetRecordDataAllPlatform) then) =
      _$BetRecordDataAllPlatformCopyWithImpl<$Res>;
  $Res call({num bet, num valid, num payout, dynamic key});
}

/// @nodoc
class _$BetRecordDataAllPlatformCopyWithImpl<$Res>
    implements $BetRecordDataAllPlatformCopyWith<$Res> {
  _$BetRecordDataAllPlatformCopyWithImpl(this._value, this._then);

  final BetRecordDataAllPlatform _value;
  // ignore: unused_field
  final $Res Function(BetRecordDataAllPlatform) _then;

  @override
  $Res call({
    Object bet = freezed,
    Object valid = freezed,
    Object payout = freezed,
    Object key = freezed,
  }) {
    return _then(_value.copyWith(
      bet: bet == freezed ? _value.bet : bet as num,
      valid: valid == freezed ? _value.valid : valid as num,
      payout: payout == freezed ? _value.payout : payout as num,
      key: key == freezed ? _value.key : key as dynamic,
    ));
  }
}

/// @nodoc
abstract class _$BetRecordDataAllPlatformCopyWith<$Res>
    implements $BetRecordDataAllPlatformCopyWith<$Res> {
  factory _$BetRecordDataAllPlatformCopyWith(_BetRecordDataAllPlatform value,
          $Res Function(_BetRecordDataAllPlatform) then) =
      __$BetRecordDataAllPlatformCopyWithImpl<$Res>;
  @override
  $Res call({num bet, num valid, num payout, dynamic key});
}

/// @nodoc
class __$BetRecordDataAllPlatformCopyWithImpl<$Res>
    extends _$BetRecordDataAllPlatformCopyWithImpl<$Res>
    implements _$BetRecordDataAllPlatformCopyWith<$Res> {
  __$BetRecordDataAllPlatformCopyWithImpl(_BetRecordDataAllPlatform _value,
      $Res Function(_BetRecordDataAllPlatform) _then)
      : super(_value, (v) => _then(v as _BetRecordDataAllPlatform));

  @override
  _BetRecordDataAllPlatform get _value =>
      super._value as _BetRecordDataAllPlatform;

  @override
  $Res call({
    Object bet = freezed,
    Object valid = freezed,
    Object payout = freezed,
    Object key = freezed,
  }) {
    return _then(_BetRecordDataAllPlatform(
      bet: bet == freezed ? _value.bet : bet as num,
      valid: valid == freezed ? _value.valid : valid as num,
      payout: payout == freezed ? _value.payout : payout as num,
      key: key == freezed ? _value.key : key as dynamic,
    ));
  }
}

/// @nodoc
class _$_BetRecordDataAllPlatform implements _BetRecordDataAllPlatform {
  const _$_BetRecordDataAllPlatform(
      {this.bet, this.valid, this.payout, this.key});

  @override
  final num bet;
  @override
  final num valid;
  @override
  final num payout;
  @override
  final dynamic key;

  @override
  String toString() {
    return 'BetRecordDataAllPlatform(bet: $bet, valid: $valid, payout: $payout, key: $key)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BetRecordDataAllPlatform &&
            (identical(other.bet, bet) ||
                const DeepCollectionEquality().equals(other.bet, bet)) &&
            (identical(other.valid, valid) ||
                const DeepCollectionEquality().equals(other.valid, valid)) &&
            (identical(other.payout, payout) ||
                const DeepCollectionEquality().equals(other.payout, payout)) &&
            (identical(other.key, key) ||
                const DeepCollectionEquality().equals(other.key, key)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(bet) ^
      const DeepCollectionEquality().hash(valid) ^
      const DeepCollectionEquality().hash(payout) ^
      const DeepCollectionEquality().hash(key);

  @JsonKey(ignore: true)
  @override
  _$BetRecordDataAllPlatformCopyWith<_BetRecordDataAllPlatform> get copyWith =>
      __$BetRecordDataAllPlatformCopyWithImpl<_BetRecordDataAllPlatform>(
          this, _$identity);
}

abstract class _BetRecordDataAllPlatform implements BetRecordDataAllPlatform {
  const factory _BetRecordDataAllPlatform(
      {num bet,
      num valid,
      num payout,
      dynamic key}) = _$_BetRecordDataAllPlatform;

  @override
  num get bet;
  @override
  num get valid;
  @override
  num get payout;
  @override
  dynamic get key;
  @override
  @JsonKey(ignore: true)
  _$BetRecordDataAllPlatformCopyWith<_BetRecordDataAllPlatform> get copyWith;
}
