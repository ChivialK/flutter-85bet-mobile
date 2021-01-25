// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'deals_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$DealsModelTearOff {
  const _$DealsModelTearOff();

// ignore: unused_element
  _DealsModel call(
      {@JsonKey(name: 'current_page') int currentPage,
      @JsonKey(name: 'last_page') int lastPage,
      @JsonKey(name: 'per_page') int perPage,
      int from,
      int to,
      int total,
      @JsonKey(name: 'next_page_url') String nextPageUrl,
      @JsonKey(name: 'prev_page_url') String prevPageUrl,
      @JsonKey(fromJson: decodeDealsData) List<DealsData> data}) {
    return _DealsModel(
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
const $DealsModel = _$DealsModelTearOff();

/// @nodoc
mixin _$DealsModel {
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
  @JsonKey(fromJson: decodeDealsData)
  List<DealsData> get data;

  @JsonKey(ignore: true)
  $DealsModelCopyWith<DealsModel> get copyWith;
}

/// @nodoc
abstract class $DealsModelCopyWith<$Res> {
  factory $DealsModelCopyWith(
          DealsModel value, $Res Function(DealsModel) then) =
      _$DealsModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'current_page') int currentPage,
      @JsonKey(name: 'last_page') int lastPage,
      @JsonKey(name: 'per_page') int perPage,
      int from,
      int to,
      int total,
      @JsonKey(name: 'next_page_url') String nextPageUrl,
      @JsonKey(name: 'prev_page_url') String prevPageUrl,
      @JsonKey(fromJson: decodeDealsData) List<DealsData> data});
}

/// @nodoc
class _$DealsModelCopyWithImpl<$Res> implements $DealsModelCopyWith<$Res> {
  _$DealsModelCopyWithImpl(this._value, this._then);

  final DealsModel _value;
  // ignore: unused_field
  final $Res Function(DealsModel) _then;

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
      data: data == freezed ? _value.data : data as List<DealsData>,
    ));
  }
}

/// @nodoc
abstract class _$DealsModelCopyWith<$Res> implements $DealsModelCopyWith<$Res> {
  factory _$DealsModelCopyWith(
          _DealsModel value, $Res Function(_DealsModel) then) =
      __$DealsModelCopyWithImpl<$Res>;
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
      @JsonKey(fromJson: decodeDealsData) List<DealsData> data});
}

/// @nodoc
class __$DealsModelCopyWithImpl<$Res> extends _$DealsModelCopyWithImpl<$Res>
    implements _$DealsModelCopyWith<$Res> {
  __$DealsModelCopyWithImpl(
      _DealsModel _value, $Res Function(_DealsModel) _then)
      : super(_value, (v) => _then(v as _DealsModel));

  @override
  _DealsModel get _value => super._value as _DealsModel;

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
    return _then(_DealsModel(
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
      data: data == freezed ? _value.data : data as List<DealsData>,
    ));
  }
}

/// @nodoc
class _$_DealsModel implements _DealsModel {
  const _$_DealsModel(
      {@JsonKey(name: 'current_page') this.currentPage,
      @JsonKey(name: 'last_page') this.lastPage,
      @JsonKey(name: 'per_page') this.perPage,
      this.from,
      this.to,
      this.total,
      @JsonKey(name: 'next_page_url') this.nextPageUrl,
      @JsonKey(name: 'prev_page_url') this.prevPageUrl,
      @JsonKey(fromJson: decodeDealsData) this.data});

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
  @JsonKey(fromJson: decodeDealsData)
  final List<DealsData> data;

  @override
  String toString() {
    return 'DealsModel(currentPage: $currentPage, lastPage: $lastPage, perPage: $perPage, from: $from, to: $to, total: $total, nextPageUrl: $nextPageUrl, prevPageUrl: $prevPageUrl, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DealsModel &&
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
  _$DealsModelCopyWith<_DealsModel> get copyWith =>
      __$DealsModelCopyWithImpl<_DealsModel>(this, _$identity);
}

abstract class _DealsModel implements DealsModel {
  const factory _DealsModel(
          {@JsonKey(name: 'current_page') int currentPage,
          @JsonKey(name: 'last_page') int lastPage,
          @JsonKey(name: 'per_page') int perPage,
          int from,
          int to,
          int total,
          @JsonKey(name: 'next_page_url') String nextPageUrl,
          @JsonKey(name: 'prev_page_url') String prevPageUrl,
          @JsonKey(fromJson: decodeDealsData) List<DealsData> data}) =
      _$_DealsModel;

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
  @JsonKey(fromJson: decodeDealsData)
  List<DealsData> get data;
  @override
  @JsonKey(ignore: true)
  _$DealsModelCopyWith<_DealsModel> get copyWith;
}

/// @nodoc
class _$DealsDataTearOff {
  const _$DealsDataTearOff();

// ignore: unused_element
  _DealsData call(
      {String amount,
      @JsonKey(name: 'ledgerdatetime') String date,
      @JsonKey(name: 'ledgerid') int id,
      String status,
      @JsonKey(name: 'transactionid') String action,
      String type}) {
    return _DealsData(
      amount: amount,
      date: date,
      id: id,
      status: status,
      action: action,
      type: type,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $DealsData = _$DealsDataTearOff();

/// @nodoc
mixin _$DealsData {
  String get amount;
  @JsonKey(name: 'ledgerdatetime')
  String get date;
  @JsonKey(name: 'ledgerid')
  int get id;
  String get status;
  @JsonKey(name: 'transactionid')
  String get action;
  String get type;

  @JsonKey(ignore: true)
  $DealsDataCopyWith<DealsData> get copyWith;
}

/// @nodoc
abstract class $DealsDataCopyWith<$Res> {
  factory $DealsDataCopyWith(DealsData value, $Res Function(DealsData) then) =
      _$DealsDataCopyWithImpl<$Res>;
  $Res call(
      {String amount,
      @JsonKey(name: 'ledgerdatetime') String date,
      @JsonKey(name: 'ledgerid') int id,
      String status,
      @JsonKey(name: 'transactionid') String action,
      String type});
}

/// @nodoc
class _$DealsDataCopyWithImpl<$Res> implements $DealsDataCopyWith<$Res> {
  _$DealsDataCopyWithImpl(this._value, this._then);

  final DealsData _value;
  // ignore: unused_field
  final $Res Function(DealsData) _then;

  @override
  $Res call({
    Object amount = freezed,
    Object date = freezed,
    Object id = freezed,
    Object status = freezed,
    Object action = freezed,
    Object type = freezed,
  }) {
    return _then(_value.copyWith(
      amount: amount == freezed ? _value.amount : amount as String,
      date: date == freezed ? _value.date : date as String,
      id: id == freezed ? _value.id : id as int,
      status: status == freezed ? _value.status : status as String,
      action: action == freezed ? _value.action : action as String,
      type: type == freezed ? _value.type : type as String,
    ));
  }
}

/// @nodoc
abstract class _$DealsDataCopyWith<$Res> implements $DealsDataCopyWith<$Res> {
  factory _$DealsDataCopyWith(
          _DealsData value, $Res Function(_DealsData) then) =
      __$DealsDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {String amount,
      @JsonKey(name: 'ledgerdatetime') String date,
      @JsonKey(name: 'ledgerid') int id,
      String status,
      @JsonKey(name: 'transactionid') String action,
      String type});
}

/// @nodoc
class __$DealsDataCopyWithImpl<$Res> extends _$DealsDataCopyWithImpl<$Res>
    implements _$DealsDataCopyWith<$Res> {
  __$DealsDataCopyWithImpl(_DealsData _value, $Res Function(_DealsData) _then)
      : super(_value, (v) => _then(v as _DealsData));

  @override
  _DealsData get _value => super._value as _DealsData;

  @override
  $Res call({
    Object amount = freezed,
    Object date = freezed,
    Object id = freezed,
    Object status = freezed,
    Object action = freezed,
    Object type = freezed,
  }) {
    return _then(_DealsData(
      amount: amount == freezed ? _value.amount : amount as String,
      date: date == freezed ? _value.date : date as String,
      id: id == freezed ? _value.id : id as int,
      status: status == freezed ? _value.status : status as String,
      action: action == freezed ? _value.action : action as String,
      type: type == freezed ? _value.type : type as String,
    ));
  }
}

/// @nodoc
class _$_DealsData implements _DealsData {
  const _$_DealsData(
      {this.amount,
      @JsonKey(name: 'ledgerdatetime') this.date,
      @JsonKey(name: 'ledgerid') this.id,
      this.status,
      @JsonKey(name: 'transactionid') this.action,
      this.type});

  @override
  final String amount;
  @override
  @JsonKey(name: 'ledgerdatetime')
  final String date;
  @override
  @JsonKey(name: 'ledgerid')
  final int id;
  @override
  final String status;
  @override
  @JsonKey(name: 'transactionid')
  final String action;
  @override
  final String type;

  @override
  String toString() {
    return 'DealsData(amount: $amount, date: $date, id: $id, status: $status, action: $action, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DealsData &&
            (identical(other.amount, amount) ||
                const DeepCollectionEquality().equals(other.amount, amount)) &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.action, action) ||
                const DeepCollectionEquality().equals(other.action, action)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(amount) ^
      const DeepCollectionEquality().hash(date) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(action) ^
      const DeepCollectionEquality().hash(type);

  @JsonKey(ignore: true)
  @override
  _$DealsDataCopyWith<_DealsData> get copyWith =>
      __$DealsDataCopyWithImpl<_DealsData>(this, _$identity);
}

abstract class _DealsData implements DealsData {
  const factory _DealsData(
      {String amount,
      @JsonKey(name: 'ledgerdatetime') String date,
      @JsonKey(name: 'ledgerid') int id,
      String status,
      @JsonKey(name: 'transactionid') String action,
      String type}) = _$_DealsData;

  @override
  String get amount;
  @override
  @JsonKey(name: 'ledgerdatetime')
  String get date;
  @override
  @JsonKey(name: 'ledgerid')
  int get id;
  @override
  String get status;
  @override
  @JsonKey(name: 'transactionid')
  String get action;
  @override
  String get type;
  @override
  @JsonKey(ignore: true)
  _$DealsDataCopyWith<_DealsData> get copyWith;
}
