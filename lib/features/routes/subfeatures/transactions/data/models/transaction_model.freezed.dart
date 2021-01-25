// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'transaction_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$TransactionModelTearOff {
  const _$TransactionModelTearOff();

// ignore: unused_element
  _TransactionModel call(
      {@JsonKey(name: 'current_page') int currentPage,
      @JsonKey(name: 'last_page') int lastPage,
      @JsonKey(name: 'per_page') int perPage,
      int from,
      int to,
      int total,
      @JsonKey(name: 'next_page_url') String nextPageUrl,
      @JsonKey(name: 'prev_page_url') String prevPageUrl,
      @JsonKey(fromJson: decodeTransactionData) List<TransactionData> data}) {
    return _TransactionModel(
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
const $TransactionModel = _$TransactionModelTearOff();

/// @nodoc
mixin _$TransactionModel {
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
  @JsonKey(fromJson: decodeTransactionData)
  List<TransactionData> get data;

  @JsonKey(ignore: true)
  $TransactionModelCopyWith<TransactionModel> get copyWith;
}

/// @nodoc
abstract class $TransactionModelCopyWith<$Res> {
  factory $TransactionModelCopyWith(
          TransactionModel value, $Res Function(TransactionModel) then) =
      _$TransactionModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'current_page') int currentPage,
      @JsonKey(name: 'last_page') int lastPage,
      @JsonKey(name: 'per_page') int perPage,
      int from,
      int to,
      int total,
      @JsonKey(name: 'next_page_url') String nextPageUrl,
      @JsonKey(name: 'prev_page_url') String prevPageUrl,
      @JsonKey(fromJson: decodeTransactionData) List<TransactionData> data});
}

/// @nodoc
class _$TransactionModelCopyWithImpl<$Res>
    implements $TransactionModelCopyWith<$Res> {
  _$TransactionModelCopyWithImpl(this._value, this._then);

  final TransactionModel _value;
  // ignore: unused_field
  final $Res Function(TransactionModel) _then;

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
      data: data == freezed ? _value.data : data as List<TransactionData>,
    ));
  }
}

/// @nodoc
abstract class _$TransactionModelCopyWith<$Res>
    implements $TransactionModelCopyWith<$Res> {
  factory _$TransactionModelCopyWith(
          _TransactionModel value, $Res Function(_TransactionModel) then) =
      __$TransactionModelCopyWithImpl<$Res>;
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
      @JsonKey(fromJson: decodeTransactionData) List<TransactionData> data});
}

/// @nodoc
class __$TransactionModelCopyWithImpl<$Res>
    extends _$TransactionModelCopyWithImpl<$Res>
    implements _$TransactionModelCopyWith<$Res> {
  __$TransactionModelCopyWithImpl(
      _TransactionModel _value, $Res Function(_TransactionModel) _then)
      : super(_value, (v) => _then(v as _TransactionModel));

  @override
  _TransactionModel get _value => super._value as _TransactionModel;

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
    return _then(_TransactionModel(
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
      data: data == freezed ? _value.data : data as List<TransactionData>,
    ));
  }
}

/// @nodoc
class _$_TransactionModel implements _TransactionModel {
  const _$_TransactionModel(
      {@JsonKey(name: 'current_page') this.currentPage,
      @JsonKey(name: 'last_page') this.lastPage,
      @JsonKey(name: 'per_page') this.perPage,
      this.from,
      this.to,
      this.total,
      @JsonKey(name: 'next_page_url') this.nextPageUrl,
      @JsonKey(name: 'prev_page_url') this.prevPageUrl,
      @JsonKey(fromJson: decodeTransactionData) this.data});

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
  @JsonKey(fromJson: decodeTransactionData)
  final List<TransactionData> data;

  @override
  String toString() {
    return 'TransactionModel(currentPage: $currentPage, lastPage: $lastPage, perPage: $perPage, from: $from, to: $to, total: $total, nextPageUrl: $nextPageUrl, prevPageUrl: $prevPageUrl, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TransactionModel &&
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
  _$TransactionModelCopyWith<_TransactionModel> get copyWith =>
      __$TransactionModelCopyWithImpl<_TransactionModel>(this, _$identity);
}

abstract class _TransactionModel implements TransactionModel {
  const factory _TransactionModel(
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
      @JsonKey(fromJson: decodeTransactionData)
          List<TransactionData> data}) = _$_TransactionModel;

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
  @JsonKey(fromJson: decodeTransactionData)
  List<TransactionData> get data;
  @override
  @JsonKey(ignore: true)
  _$TransactionModelCopyWith<_TransactionModel> get copyWith;
}

/// @nodoc
class _$TransactionDataTearOff {
  const _$TransactionDataTearOff();

// ignore: unused_element
  _TransactionData call(
      {String amount,
      @JsonKey(name: 'clindex') int index,
      @JsonKey(name: 'com_from') String from,
      @JsonKey(name: 'com_to') String to,
      @JsonKey(name: 'transferdatetime') String date,
      String type,
      dynamic key}) {
    return _TransactionData(
      amount: amount,
      index: index,
      from: from,
      to: to,
      date: date,
      type: type,
      key: key,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $TransactionData = _$TransactionDataTearOff();

/// @nodoc
mixin _$TransactionData {
  String get amount;
  @JsonKey(name: 'clindex')
  int get index;
  @JsonKey(name: 'com_from')
  String get from;
  @JsonKey(name: 'com_to')
  String get to;
  @JsonKey(name: 'transferdatetime')
  String get date;
  String get type;
  dynamic get key;

  @JsonKey(ignore: true)
  $TransactionDataCopyWith<TransactionData> get copyWith;
}

/// @nodoc
abstract class $TransactionDataCopyWith<$Res> {
  factory $TransactionDataCopyWith(
          TransactionData value, $Res Function(TransactionData) then) =
      _$TransactionDataCopyWithImpl<$Res>;
  $Res call(
      {String amount,
      @JsonKey(name: 'clindex') int index,
      @JsonKey(name: 'com_from') String from,
      @JsonKey(name: 'com_to') String to,
      @JsonKey(name: 'transferdatetime') String date,
      String type,
      dynamic key});
}

/// @nodoc
class _$TransactionDataCopyWithImpl<$Res>
    implements $TransactionDataCopyWith<$Res> {
  _$TransactionDataCopyWithImpl(this._value, this._then);

  final TransactionData _value;
  // ignore: unused_field
  final $Res Function(TransactionData) _then;

  @override
  $Res call({
    Object amount = freezed,
    Object index = freezed,
    Object from = freezed,
    Object to = freezed,
    Object date = freezed,
    Object type = freezed,
    Object key = freezed,
  }) {
    return _then(_value.copyWith(
      amount: amount == freezed ? _value.amount : amount as String,
      index: index == freezed ? _value.index : index as int,
      from: from == freezed ? _value.from : from as String,
      to: to == freezed ? _value.to : to as String,
      date: date == freezed ? _value.date : date as String,
      type: type == freezed ? _value.type : type as String,
      key: key == freezed ? _value.key : key as dynamic,
    ));
  }
}

/// @nodoc
abstract class _$TransactionDataCopyWith<$Res>
    implements $TransactionDataCopyWith<$Res> {
  factory _$TransactionDataCopyWith(
          _TransactionData value, $Res Function(_TransactionData) then) =
      __$TransactionDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {String amount,
      @JsonKey(name: 'clindex') int index,
      @JsonKey(name: 'com_from') String from,
      @JsonKey(name: 'com_to') String to,
      @JsonKey(name: 'transferdatetime') String date,
      String type,
      dynamic key});
}

/// @nodoc
class __$TransactionDataCopyWithImpl<$Res>
    extends _$TransactionDataCopyWithImpl<$Res>
    implements _$TransactionDataCopyWith<$Res> {
  __$TransactionDataCopyWithImpl(
      _TransactionData _value, $Res Function(_TransactionData) _then)
      : super(_value, (v) => _then(v as _TransactionData));

  @override
  _TransactionData get _value => super._value as _TransactionData;

  @override
  $Res call({
    Object amount = freezed,
    Object index = freezed,
    Object from = freezed,
    Object to = freezed,
    Object date = freezed,
    Object type = freezed,
    Object key = freezed,
  }) {
    return _then(_TransactionData(
      amount: amount == freezed ? _value.amount : amount as String,
      index: index == freezed ? _value.index : index as int,
      from: from == freezed ? _value.from : from as String,
      to: to == freezed ? _value.to : to as String,
      date: date == freezed ? _value.date : date as String,
      type: type == freezed ? _value.type : type as String,
      key: key == freezed ? _value.key : key as dynamic,
    ));
  }
}

/// @nodoc
class _$_TransactionData implements _TransactionData {
  const _$_TransactionData(
      {this.amount,
      @JsonKey(name: 'clindex') this.index,
      @JsonKey(name: 'com_from') this.from,
      @JsonKey(name: 'com_to') this.to,
      @JsonKey(name: 'transferdatetime') this.date,
      this.type,
      this.key});

  @override
  final String amount;
  @override
  @JsonKey(name: 'clindex')
  final int index;
  @override
  @JsonKey(name: 'com_from')
  final String from;
  @override
  @JsonKey(name: 'com_to')
  final String to;
  @override
  @JsonKey(name: 'transferdatetime')
  final String date;
  @override
  final String type;
  @override
  final dynamic key;

  @override
  String toString() {
    return 'TransactionData(amount: $amount, index: $index, from: $from, to: $to, date: $date, type: $type, key: $key)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TransactionData &&
            (identical(other.amount, amount) ||
                const DeepCollectionEquality().equals(other.amount, amount)) &&
            (identical(other.index, index) ||
                const DeepCollectionEquality().equals(other.index, index)) &&
            (identical(other.from, from) ||
                const DeepCollectionEquality().equals(other.from, from)) &&
            (identical(other.to, to) ||
                const DeepCollectionEquality().equals(other.to, to)) &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.key, key) ||
                const DeepCollectionEquality().equals(other.key, key)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(amount) ^
      const DeepCollectionEquality().hash(index) ^
      const DeepCollectionEquality().hash(from) ^
      const DeepCollectionEquality().hash(to) ^
      const DeepCollectionEquality().hash(date) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(key);

  @JsonKey(ignore: true)
  @override
  _$TransactionDataCopyWith<_TransactionData> get copyWith =>
      __$TransactionDataCopyWithImpl<_TransactionData>(this, _$identity);
}

abstract class _TransactionData implements TransactionData {
  const factory _TransactionData(
      {String amount,
      @JsonKey(name: 'clindex') int index,
      @JsonKey(name: 'com_from') String from,
      @JsonKey(name: 'com_to') String to,
      @JsonKey(name: 'transferdatetime') String date,
      String type,
      dynamic key}) = _$_TransactionData;

  @override
  String get amount;
  @override
  @JsonKey(name: 'clindex')
  int get index;
  @override
  @JsonKey(name: 'com_from')
  String get from;
  @override
  @JsonKey(name: 'com_to')
  String get to;
  @override
  @JsonKey(name: 'transferdatetime')
  String get date;
  @override
  String get type;
  @override
  dynamic get key;
  @override
  @JsonKey(ignore: true)
  _$TransactionDataCopyWith<_TransactionData> get copyWith;
}
