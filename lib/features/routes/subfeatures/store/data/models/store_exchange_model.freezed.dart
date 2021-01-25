// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'store_exchange_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$StoreExchangeModelTearOff {
  const _$StoreExchangeModelTearOff();

// ignore: unused_element
  _StoreExchangeModel call(
      {@JsonKey(name: 'current_page')
          int currentPage,
      @JsonKey(name: 'last_page')
          int lastPage,
      @JsonKey(name: 'per_page')
          int perPage,
      int from,
      int to,
      int total,
      String path,
      @JsonKey(name: 'next_page_url')
          String nextPageUrl,
      @JsonKey(name: 'last_page_url')
          String lastPageUrl,
      @JsonKey(name: 'prev_page_url')
          String prevPageUrl,
      @JsonKey(fromJson: decodeStoreExchangeData)
          List<StoreExchangeData> data}) {
    return _StoreExchangeModel(
      currentPage: currentPage,
      lastPage: lastPage,
      perPage: perPage,
      from: from,
      to: to,
      total: total,
      path: path,
      nextPageUrl: nextPageUrl,
      lastPageUrl: lastPageUrl,
      prevPageUrl: prevPageUrl,
      data: data,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $StoreExchangeModel = _$StoreExchangeModelTearOff();

/// @nodoc
mixin _$StoreExchangeModel {
  @JsonKey(name: 'current_page')
  int get currentPage;
  @JsonKey(name: 'last_page')
  int get lastPage;
  @JsonKey(name: 'per_page')
  int get perPage;
  int get from;
  int get to;
  int get total;
  String get path;
  @JsonKey(name: 'next_page_url')
  String get nextPageUrl;
  @JsonKey(name: 'last_page_url')
  String get lastPageUrl;
  @JsonKey(name: 'prev_page_url')
  String get prevPageUrl;
  @JsonKey(fromJson: decodeStoreExchangeData)
  List<StoreExchangeData> get data;

  @JsonKey(ignore: true)
  $StoreExchangeModelCopyWith<StoreExchangeModel> get copyWith;
}

/// @nodoc
abstract class $StoreExchangeModelCopyWith<$Res> {
  factory $StoreExchangeModelCopyWith(
          StoreExchangeModel value, $Res Function(StoreExchangeModel) then) =
      _$StoreExchangeModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'current_page')
          int currentPage,
      @JsonKey(name: 'last_page')
          int lastPage,
      @JsonKey(name: 'per_page')
          int perPage,
      int from,
      int to,
      int total,
      String path,
      @JsonKey(name: 'next_page_url')
          String nextPageUrl,
      @JsonKey(name: 'last_page_url')
          String lastPageUrl,
      @JsonKey(name: 'prev_page_url')
          String prevPageUrl,
      @JsonKey(fromJson: decodeStoreExchangeData)
          List<StoreExchangeData> data});
}

/// @nodoc
class _$StoreExchangeModelCopyWithImpl<$Res>
    implements $StoreExchangeModelCopyWith<$Res> {
  _$StoreExchangeModelCopyWithImpl(this._value, this._then);

  final StoreExchangeModel _value;
  // ignore: unused_field
  final $Res Function(StoreExchangeModel) _then;

  @override
  $Res call({
    Object currentPage = freezed,
    Object lastPage = freezed,
    Object perPage = freezed,
    Object from = freezed,
    Object to = freezed,
    Object total = freezed,
    Object path = freezed,
    Object nextPageUrl = freezed,
    Object lastPageUrl = freezed,
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
      path: path == freezed ? _value.path : path as String,
      nextPageUrl:
          nextPageUrl == freezed ? _value.nextPageUrl : nextPageUrl as String,
      lastPageUrl:
          lastPageUrl == freezed ? _value.lastPageUrl : lastPageUrl as String,
      prevPageUrl:
          prevPageUrl == freezed ? _value.prevPageUrl : prevPageUrl as String,
      data: data == freezed ? _value.data : data as List<StoreExchangeData>,
    ));
  }
}

/// @nodoc
abstract class _$StoreExchangeModelCopyWith<$Res>
    implements $StoreExchangeModelCopyWith<$Res> {
  factory _$StoreExchangeModelCopyWith(
          _StoreExchangeModel value, $Res Function(_StoreExchangeModel) then) =
      __$StoreExchangeModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'current_page')
          int currentPage,
      @JsonKey(name: 'last_page')
          int lastPage,
      @JsonKey(name: 'per_page')
          int perPage,
      int from,
      int to,
      int total,
      String path,
      @JsonKey(name: 'next_page_url')
          String nextPageUrl,
      @JsonKey(name: 'last_page_url')
          String lastPageUrl,
      @JsonKey(name: 'prev_page_url')
          String prevPageUrl,
      @JsonKey(fromJson: decodeStoreExchangeData)
          List<StoreExchangeData> data});
}

/// @nodoc
class __$StoreExchangeModelCopyWithImpl<$Res>
    extends _$StoreExchangeModelCopyWithImpl<$Res>
    implements _$StoreExchangeModelCopyWith<$Res> {
  __$StoreExchangeModelCopyWithImpl(
      _StoreExchangeModel _value, $Res Function(_StoreExchangeModel) _then)
      : super(_value, (v) => _then(v as _StoreExchangeModel));

  @override
  _StoreExchangeModel get _value => super._value as _StoreExchangeModel;

  @override
  $Res call({
    Object currentPage = freezed,
    Object lastPage = freezed,
    Object perPage = freezed,
    Object from = freezed,
    Object to = freezed,
    Object total = freezed,
    Object path = freezed,
    Object nextPageUrl = freezed,
    Object lastPageUrl = freezed,
    Object prevPageUrl = freezed,
    Object data = freezed,
  }) {
    return _then(_StoreExchangeModel(
      currentPage:
          currentPage == freezed ? _value.currentPage : currentPage as int,
      lastPage: lastPage == freezed ? _value.lastPage : lastPage as int,
      perPage: perPage == freezed ? _value.perPage : perPage as int,
      from: from == freezed ? _value.from : from as int,
      to: to == freezed ? _value.to : to as int,
      total: total == freezed ? _value.total : total as int,
      path: path == freezed ? _value.path : path as String,
      nextPageUrl:
          nextPageUrl == freezed ? _value.nextPageUrl : nextPageUrl as String,
      lastPageUrl:
          lastPageUrl == freezed ? _value.lastPageUrl : lastPageUrl as String,
      prevPageUrl:
          prevPageUrl == freezed ? _value.prevPageUrl : prevPageUrl as String,
      data: data == freezed ? _value.data : data as List<StoreExchangeData>,
    ));
  }
}

/// @nodoc
class _$_StoreExchangeModel implements _StoreExchangeModel {
  const _$_StoreExchangeModel(
      {@JsonKey(name: 'current_page') this.currentPage,
      @JsonKey(name: 'last_page') this.lastPage,
      @JsonKey(name: 'per_page') this.perPage,
      this.from,
      this.to,
      this.total,
      this.path,
      @JsonKey(name: 'next_page_url') this.nextPageUrl,
      @JsonKey(name: 'last_page_url') this.lastPageUrl,
      @JsonKey(name: 'prev_page_url') this.prevPageUrl,
      @JsonKey(fromJson: decodeStoreExchangeData) this.data});

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
  final String path;
  @override
  @JsonKey(name: 'next_page_url')
  final String nextPageUrl;
  @override
  @JsonKey(name: 'last_page_url')
  final String lastPageUrl;
  @override
  @JsonKey(name: 'prev_page_url')
  final String prevPageUrl;
  @override
  @JsonKey(fromJson: decodeStoreExchangeData)
  final List<StoreExchangeData> data;

  @override
  String toString() {
    return 'StoreExchangeModel(currentPage: $currentPage, lastPage: $lastPage, perPage: $perPage, from: $from, to: $to, total: $total, path: $path, nextPageUrl: $nextPageUrl, lastPageUrl: $lastPageUrl, prevPageUrl: $prevPageUrl, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _StoreExchangeModel &&
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
            (identical(other.path, path) ||
                const DeepCollectionEquality().equals(other.path, path)) &&
            (identical(other.nextPageUrl, nextPageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.nextPageUrl, nextPageUrl)) &&
            (identical(other.lastPageUrl, lastPageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.lastPageUrl, lastPageUrl)) &&
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
      const DeepCollectionEquality().hash(path) ^
      const DeepCollectionEquality().hash(nextPageUrl) ^
      const DeepCollectionEquality().hash(lastPageUrl) ^
      const DeepCollectionEquality().hash(prevPageUrl) ^
      const DeepCollectionEquality().hash(data);

  @JsonKey(ignore: true)
  @override
  _$StoreExchangeModelCopyWith<_StoreExchangeModel> get copyWith =>
      __$StoreExchangeModelCopyWithImpl<_StoreExchangeModel>(this, _$identity);
}

abstract class _StoreExchangeModel implements StoreExchangeModel {
  const factory _StoreExchangeModel(
      {@JsonKey(name: 'current_page')
          int currentPage,
      @JsonKey(name: 'last_page')
          int lastPage,
      @JsonKey(name: 'per_page')
          int perPage,
      int from,
      int to,
      int total,
      String path,
      @JsonKey(name: 'next_page_url')
          String nextPageUrl,
      @JsonKey(name: 'last_page_url')
          String lastPageUrl,
      @JsonKey(name: 'prev_page_url')
          String prevPageUrl,
      @JsonKey(fromJson: decodeStoreExchangeData)
          List<StoreExchangeData> data}) = _$_StoreExchangeModel;

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
  String get path;
  @override
  @JsonKey(name: 'next_page_url')
  String get nextPageUrl;
  @override
  @JsonKey(name: 'last_page_url')
  String get lastPageUrl;
  @override
  @JsonKey(name: 'prev_page_url')
  String get prevPageUrl;
  @override
  @JsonKey(fromJson: decodeStoreExchangeData)
  List<StoreExchangeData> get data;
  @override
  @JsonKey(ignore: true)
  _$StoreExchangeModelCopyWith<_StoreExchangeModel> get copyWith;
}

/// @nodoc
class _$StoreExchangeDataTearOff {
  const _$StoreExchangeDataTearOff();

// ignore: unused_element
  _StoreExchangeData call(
      {int id,
      String code,
      String date,
      String name,
      String phone,
      String address,
      num point,
      @JsonKey(name: 'productname') String product,
      String status}) {
    return _StoreExchangeData(
      id: id,
      code: code,
      date: date,
      name: name,
      phone: phone,
      address: address,
      point: point,
      product: product,
      status: status,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $StoreExchangeData = _$StoreExchangeDataTearOff();

/// @nodoc
mixin _$StoreExchangeData {
  int get id;
  String get code;
  String get date;
  String get name;
  String get phone;
  String get address;
  num get point;
  @JsonKey(name: 'productname')
  String get product;
  String get status;

  @JsonKey(ignore: true)
  $StoreExchangeDataCopyWith<StoreExchangeData> get copyWith;
}

/// @nodoc
abstract class $StoreExchangeDataCopyWith<$Res> {
  factory $StoreExchangeDataCopyWith(
          StoreExchangeData value, $Res Function(StoreExchangeData) then) =
      _$StoreExchangeDataCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String code,
      String date,
      String name,
      String phone,
      String address,
      num point,
      @JsonKey(name: 'productname') String product,
      String status});
}

/// @nodoc
class _$StoreExchangeDataCopyWithImpl<$Res>
    implements $StoreExchangeDataCopyWith<$Res> {
  _$StoreExchangeDataCopyWithImpl(this._value, this._then);

  final StoreExchangeData _value;
  // ignore: unused_field
  final $Res Function(StoreExchangeData) _then;

  @override
  $Res call({
    Object id = freezed,
    Object code = freezed,
    Object date = freezed,
    Object name = freezed,
    Object phone = freezed,
    Object address = freezed,
    Object point = freezed,
    Object product = freezed,
    Object status = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as int,
      code: code == freezed ? _value.code : code as String,
      date: date == freezed ? _value.date : date as String,
      name: name == freezed ? _value.name : name as String,
      phone: phone == freezed ? _value.phone : phone as String,
      address: address == freezed ? _value.address : address as String,
      point: point == freezed ? _value.point : point as num,
      product: product == freezed ? _value.product : product as String,
      status: status == freezed ? _value.status : status as String,
    ));
  }
}

/// @nodoc
abstract class _$StoreExchangeDataCopyWith<$Res>
    implements $StoreExchangeDataCopyWith<$Res> {
  factory _$StoreExchangeDataCopyWith(
          _StoreExchangeData value, $Res Function(_StoreExchangeData) then) =
      __$StoreExchangeDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String code,
      String date,
      String name,
      String phone,
      String address,
      num point,
      @JsonKey(name: 'productname') String product,
      String status});
}

/// @nodoc
class __$StoreExchangeDataCopyWithImpl<$Res>
    extends _$StoreExchangeDataCopyWithImpl<$Res>
    implements _$StoreExchangeDataCopyWith<$Res> {
  __$StoreExchangeDataCopyWithImpl(
      _StoreExchangeData _value, $Res Function(_StoreExchangeData) _then)
      : super(_value, (v) => _then(v as _StoreExchangeData));

  @override
  _StoreExchangeData get _value => super._value as _StoreExchangeData;

  @override
  $Res call({
    Object id = freezed,
    Object code = freezed,
    Object date = freezed,
    Object name = freezed,
    Object phone = freezed,
    Object address = freezed,
    Object point = freezed,
    Object product = freezed,
    Object status = freezed,
  }) {
    return _then(_StoreExchangeData(
      id: id == freezed ? _value.id : id as int,
      code: code == freezed ? _value.code : code as String,
      date: date == freezed ? _value.date : date as String,
      name: name == freezed ? _value.name : name as String,
      phone: phone == freezed ? _value.phone : phone as String,
      address: address == freezed ? _value.address : address as String,
      point: point == freezed ? _value.point : point as num,
      product: product == freezed ? _value.product : product as String,
      status: status == freezed ? _value.status : status as String,
    ));
  }
}

/// @nodoc
class _$_StoreExchangeData implements _StoreExchangeData {
  const _$_StoreExchangeData(
      {this.id,
      this.code,
      this.date,
      this.name,
      this.phone,
      this.address,
      this.point,
      @JsonKey(name: 'productname') this.product,
      this.status});

  @override
  final int id;
  @override
  final String code;
  @override
  final String date;
  @override
  final String name;
  @override
  final String phone;
  @override
  final String address;
  @override
  final num point;
  @override
  @JsonKey(name: 'productname')
  final String product;
  @override
  final String status;

  @override
  String toString() {
    return 'StoreExchangeData(id: $id, code: $code, date: $date, name: $name, phone: $phone, address: $address, point: $point, product: $product, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _StoreExchangeData &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)) &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.phone, phone) ||
                const DeepCollectionEquality().equals(other.phone, phone)) &&
            (identical(other.address, address) ||
                const DeepCollectionEquality()
                    .equals(other.address, address)) &&
            (identical(other.point, point) ||
                const DeepCollectionEquality().equals(other.point, point)) &&
            (identical(other.product, product) ||
                const DeepCollectionEquality()
                    .equals(other.product, product)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(code) ^
      const DeepCollectionEquality().hash(date) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(phone) ^
      const DeepCollectionEquality().hash(address) ^
      const DeepCollectionEquality().hash(point) ^
      const DeepCollectionEquality().hash(product) ^
      const DeepCollectionEquality().hash(status);

  @JsonKey(ignore: true)
  @override
  _$StoreExchangeDataCopyWith<_StoreExchangeData> get copyWith =>
      __$StoreExchangeDataCopyWithImpl<_StoreExchangeData>(this, _$identity);
}

abstract class _StoreExchangeData implements StoreExchangeData {
  const factory _StoreExchangeData(
      {int id,
      String code,
      String date,
      String name,
      String phone,
      String address,
      num point,
      @JsonKey(name: 'productname') String product,
      String status}) = _$_StoreExchangeData;

  @override
  int get id;
  @override
  String get code;
  @override
  String get date;
  @override
  String get name;
  @override
  String get phone;
  @override
  String get address;
  @override
  num get point;
  @override
  @JsonKey(name: 'productname')
  String get product;
  @override
  String get status;
  @override
  @JsonKey(ignore: true)
  _$StoreExchangeDataCopyWith<_StoreExchangeData> get copyWith;
}
