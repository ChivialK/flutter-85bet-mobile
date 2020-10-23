// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'agent_ledger_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$AgentLedgerModelTearOff {
  const _$AgentLedgerModelTearOff();

// ignore: unused_element
  _AgentLedgerModel call(
      {@JsonKey(name: 'current_page') int currentPage,
      @JsonKey(name: 'last_page') int lastPage,
      @JsonKey(name: 'per_page') int perPage,
      int from,
      int to,
      int total,
      @JsonKey(name: 'next_page_url') String nextPageUrl,
      @JsonKey(name: 'prev_page_url') String prevPageUrl,
      @JsonKey(fromJson: decodeAgentLedgerData) List<AgentLedgerData> data}) {
    return _AgentLedgerModel(
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
const $AgentLedgerModel = _$AgentLedgerModelTearOff();

/// @nodoc
mixin _$AgentLedgerModel {
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
  @JsonKey(fromJson: decodeAgentLedgerData)
  List<AgentLedgerData> get data;

  $AgentLedgerModelCopyWith<AgentLedgerModel> get copyWith;
}

/// @nodoc
abstract class $AgentLedgerModelCopyWith<$Res> {
  factory $AgentLedgerModelCopyWith(
          AgentLedgerModel value, $Res Function(AgentLedgerModel) then) =
      _$AgentLedgerModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'current_page') int currentPage,
      @JsonKey(name: 'last_page') int lastPage,
      @JsonKey(name: 'per_page') int perPage,
      int from,
      int to,
      int total,
      @JsonKey(name: 'next_page_url') String nextPageUrl,
      @JsonKey(name: 'prev_page_url') String prevPageUrl,
      @JsonKey(fromJson: decodeAgentLedgerData) List<AgentLedgerData> data});
}

/// @nodoc
class _$AgentLedgerModelCopyWithImpl<$Res>
    implements $AgentLedgerModelCopyWith<$Res> {
  _$AgentLedgerModelCopyWithImpl(this._value, this._then);

  final AgentLedgerModel _value;
  // ignore: unused_field
  final $Res Function(AgentLedgerModel) _then;

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
      data: data == freezed ? _value.data : data as List<AgentLedgerData>,
    ));
  }
}

/// @nodoc
abstract class _$AgentLedgerModelCopyWith<$Res>
    implements $AgentLedgerModelCopyWith<$Res> {
  factory _$AgentLedgerModelCopyWith(
          _AgentLedgerModel value, $Res Function(_AgentLedgerModel) then) =
      __$AgentLedgerModelCopyWithImpl<$Res>;
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
      @JsonKey(fromJson: decodeAgentLedgerData) List<AgentLedgerData> data});
}

/// @nodoc
class __$AgentLedgerModelCopyWithImpl<$Res>
    extends _$AgentLedgerModelCopyWithImpl<$Res>
    implements _$AgentLedgerModelCopyWith<$Res> {
  __$AgentLedgerModelCopyWithImpl(
      _AgentLedgerModel _value, $Res Function(_AgentLedgerModel) _then)
      : super(_value, (v) => _then(v as _AgentLedgerModel));

  @override
  _AgentLedgerModel get _value => super._value as _AgentLedgerModel;

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
    return _then(_AgentLedgerModel(
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
      data: data == freezed ? _value.data : data as List<AgentLedgerData>,
    ));
  }
}

/// @nodoc
class _$_AgentLedgerModel implements _AgentLedgerModel {
  const _$_AgentLedgerModel(
      {@JsonKey(name: 'current_page') this.currentPage,
      @JsonKey(name: 'last_page') this.lastPage,
      @JsonKey(name: 'per_page') this.perPage,
      this.from,
      this.to,
      this.total,
      @JsonKey(name: 'next_page_url') this.nextPageUrl,
      @JsonKey(name: 'prev_page_url') this.prevPageUrl,
      @JsonKey(fromJson: decodeAgentLedgerData) this.data});

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
  @JsonKey(fromJson: decodeAgentLedgerData)
  final List<AgentLedgerData> data;

  @override
  String toString() {
    return 'AgentLedgerModel(currentPage: $currentPage, lastPage: $lastPage, perPage: $perPage, from: $from, to: $to, total: $total, nextPageUrl: $nextPageUrl, prevPageUrl: $prevPageUrl, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AgentLedgerModel &&
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

  @override
  _$AgentLedgerModelCopyWith<_AgentLedgerModel> get copyWith =>
      __$AgentLedgerModelCopyWithImpl<_AgentLedgerModel>(this, _$identity);

  @override
  operator [](int key) {
    return data[key];
  }
}

abstract class _AgentLedgerModel implements AgentLedgerModel {
  const factory _AgentLedgerModel(
      {@JsonKey(name: 'current_page')
          int currentPage,
      @JsonKey(name: 'last_page')
          int lastPage,
      @JsonKey(name: 'per_page')
          int perPage,
      int from,
      int to,
      int total,
      @JsonKey(name: 'next_page_url')
          String nextPageUrl,
      @JsonKey(name: 'prev_page_url')
          String prevPageUrl,
      @JsonKey(fromJson: decodeAgentLedgerData)
          List<AgentLedgerData> data}) = _$_AgentLedgerModel;

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
  @JsonKey(fromJson: decodeAgentLedgerData)
  List<AgentLedgerData> get data;
  @override
  _$AgentLedgerModelCopyWith<_AgentLedgerModel> get copyWith;
}

/// @nodoc
class _$AgentLedgerDataTearOff {
  const _$AgentLedgerDataTearOff();

// ignore: unused_element
  _AgentLedgerData call(
      {@JsonKey(name: 'Deposit') num deposit,
      @JsonKey(name: 'Preferential') num preferential,
      @JsonKey(name: 'Rolling') num rolling,
      @JsonKey(name: 'Withdraw') num withdraw,
      @JsonKey(name: 'accountcode') String account}) {
    return _AgentLedgerData(
      deposit: deposit,
      preferential: preferential,
      rolling: rolling,
      withdraw: withdraw,
      account: account,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $AgentLedgerData = _$AgentLedgerDataTearOff();

/// @nodoc
mixin _$AgentLedgerData {
  @JsonKey(name: 'Deposit')
  num get deposit;
  @JsonKey(name: 'Preferential')
  num get preferential;
  @JsonKey(name: 'Rolling')
  num get rolling;
  @JsonKey(name: 'Withdraw')
  num get withdraw;
  @JsonKey(name: 'accountcode')
  String get account;

  $AgentLedgerDataCopyWith<AgentLedgerData> get copyWith;
}

/// @nodoc
abstract class $AgentLedgerDataCopyWith<$Res> {
  factory $AgentLedgerDataCopyWith(
          AgentLedgerData value, $Res Function(AgentLedgerData) then) =
      _$AgentLedgerDataCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'Deposit') num deposit,
      @JsonKey(name: 'Preferential') num preferential,
      @JsonKey(name: 'Rolling') num rolling,
      @JsonKey(name: 'Withdraw') num withdraw,
      @JsonKey(name: 'accountcode') String account});
}

/// @nodoc
class _$AgentLedgerDataCopyWithImpl<$Res>
    implements $AgentLedgerDataCopyWith<$Res> {
  _$AgentLedgerDataCopyWithImpl(this._value, this._then);

  final AgentLedgerData _value;
  // ignore: unused_field
  final $Res Function(AgentLedgerData) _then;

  @override
  $Res call({
    Object deposit = freezed,
    Object preferential = freezed,
    Object rolling = freezed,
    Object withdraw = freezed,
    Object account = freezed,
  }) {
    return _then(_value.copyWith(
      deposit: deposit == freezed ? _value.deposit : deposit as num,
      preferential:
          preferential == freezed ? _value.preferential : preferential as num,
      rolling: rolling == freezed ? _value.rolling : rolling as num,
      withdraw: withdraw == freezed ? _value.withdraw : withdraw as num,
      account: account == freezed ? _value.account : account as String,
    ));
  }
}

/// @nodoc
abstract class _$AgentLedgerDataCopyWith<$Res>
    implements $AgentLedgerDataCopyWith<$Res> {
  factory _$AgentLedgerDataCopyWith(
          _AgentLedgerData value, $Res Function(_AgentLedgerData) then) =
      __$AgentLedgerDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'Deposit') num deposit,
      @JsonKey(name: 'Preferential') num preferential,
      @JsonKey(name: 'Rolling') num rolling,
      @JsonKey(name: 'Withdraw') num withdraw,
      @JsonKey(name: 'accountcode') String account});
}

/// @nodoc
class __$AgentLedgerDataCopyWithImpl<$Res>
    extends _$AgentLedgerDataCopyWithImpl<$Res>
    implements _$AgentLedgerDataCopyWith<$Res> {
  __$AgentLedgerDataCopyWithImpl(
      _AgentLedgerData _value, $Res Function(_AgentLedgerData) _then)
      : super(_value, (v) => _then(v as _AgentLedgerData));

  @override
  _AgentLedgerData get _value => super._value as _AgentLedgerData;

  @override
  $Res call({
    Object deposit = freezed,
    Object preferential = freezed,
    Object rolling = freezed,
    Object withdraw = freezed,
    Object account = freezed,
  }) {
    return _then(_AgentLedgerData(
      deposit: deposit == freezed ? _value.deposit : deposit as num,
      preferential:
          preferential == freezed ? _value.preferential : preferential as num,
      rolling: rolling == freezed ? _value.rolling : rolling as num,
      withdraw: withdraw == freezed ? _value.withdraw : withdraw as num,
      account: account == freezed ? _value.account : account as String,
    ));
  }
}

/// @nodoc
class _$_AgentLedgerData implements _AgentLedgerData {
  const _$_AgentLedgerData(
      {@JsonKey(name: 'Deposit') this.deposit,
      @JsonKey(name: 'Preferential') this.preferential,
      @JsonKey(name: 'Rolling') this.rolling,
      @JsonKey(name: 'Withdraw') this.withdraw,
      @JsonKey(name: 'accountcode') this.account});

  @override
  @JsonKey(name: 'Deposit')
  final num deposit;
  @override
  @JsonKey(name: 'Preferential')
  final num preferential;
  @override
  @JsonKey(name: 'Rolling')
  final num rolling;
  @override
  @JsonKey(name: 'Withdraw')
  final num withdraw;
  @override
  @JsonKey(name: 'accountcode')
  final String account;

  @override
  String toString() {
    return 'AgentLedgerData(deposit: $deposit, preferential: $preferential, rolling: $rolling, withdraw: $withdraw, account: $account)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AgentLedgerData &&
            (identical(other.deposit, deposit) ||
                const DeepCollectionEquality()
                    .equals(other.deposit, deposit)) &&
            (identical(other.preferential, preferential) ||
                const DeepCollectionEquality()
                    .equals(other.preferential, preferential)) &&
            (identical(other.rolling, rolling) ||
                const DeepCollectionEquality()
                    .equals(other.rolling, rolling)) &&
            (identical(other.withdraw, withdraw) ||
                const DeepCollectionEquality()
                    .equals(other.withdraw, withdraw)) &&
            (identical(other.account, account) ||
                const DeepCollectionEquality().equals(other.account, account)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(deposit) ^
      const DeepCollectionEquality().hash(preferential) ^
      const DeepCollectionEquality().hash(rolling) ^
      const DeepCollectionEquality().hash(withdraw) ^
      const DeepCollectionEquality().hash(account);

  @override
  _$AgentLedgerDataCopyWith<_AgentLedgerData> get copyWith =>
      __$AgentLedgerDataCopyWithImpl<_AgentLedgerData>(this, _$identity);

  @override
  operator [](int key) {
    switch (key) {
      case 0:
        return deposit;
      case 1:
        return withdraw;
      case 2:
        return preferential;
      case 3:
        return rolling;
      default:
        return 0;
    }
  }
}

abstract class _AgentLedgerData implements AgentLedgerData {
  const factory _AgentLedgerData(
      {@JsonKey(name: 'Deposit') num deposit,
      @JsonKey(name: 'Preferential') num preferential,
      @JsonKey(name: 'Rolling') num rolling,
      @JsonKey(name: 'Withdraw') num withdraw,
      @JsonKey(name: 'accountcode') String account}) = _$_AgentLedgerData;

  @override
  @JsonKey(name: 'Deposit')
  num get deposit;
  @override
  @JsonKey(name: 'Preferential')
  num get preferential;
  @override
  @JsonKey(name: 'Rolling')
  num get rolling;
  @override
  @JsonKey(name: 'Withdraw')
  num get withdraw;
  @override
  @JsonKey(name: 'accountcode')
  String get account;
  @override
  _$AgentLedgerDataCopyWith<_AgentLedgerData> get copyWith;
}
