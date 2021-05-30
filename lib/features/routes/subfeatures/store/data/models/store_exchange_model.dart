import 'package:flutter_85bet_mobile/utils/json_util.dart';
import 'package:flutter_85bet_mobile/utils/value_util.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'store_exchange_model.freezed.dart';

@freezed
abstract class StoreExchangeModel with _$StoreExchangeModel {
  const factory StoreExchangeModel({
    @JsonKey(name: 'current_page') int currentPage,
    @JsonKey(name: 'last_page') int lastPage,
    @JsonKey(name: 'per_page') int perPage,
    int from,
    int to,
    int total,
    String path,
    @JsonKey(name: 'next_page_url') String nextPageUrl,
    @JsonKey(name: 'last_page_url') String lastPageUrl,
    @JsonKey(name: 'prev_page_url') String prevPageUrl,
    @JsonKey(fromJson: decodeStoreExchangeData) List<StoreExchangeData> data,
  }) = _StoreExchangeModel;

  static StoreExchangeModel jsonToStoreExchangeModel(
          Map<String, dynamic> jsonMap) =>
      _$_StoreExchangeModel(
        currentPage: jsonMap['current_page'] as int,
        lastPage: jsonMap['last_page'] as int,
        perPage: '${jsonMap['per_page']}'.strToInt,
        from: jsonMap['from'] as int,
        to: jsonMap['to'] as int,
        total: jsonMap['total'] as int,
        path: jsonMap['path'] as String,
        nextPageUrl: jsonMap['next_page_url'] as String,
        lastPageUrl: jsonMap['last_page_url'] as String,
        prevPageUrl: jsonMap['prev_page_url'] as String,
        data: decodeStoreExchangeData(jsonMap['data']),
      );
}

List<StoreExchangeData> decodeStoreExchangeData(dynamic str) =>
    JsonUtil.decodeArrayToModel(
      str,
      (jsonMap) => StoreExchangeData.jsonToStoreExchangeData(jsonMap),
      tag: 'StoreExchangeData',
    );

@freezed
abstract class StoreExchangeData with _$StoreExchangeData {
  const factory StoreExchangeData({
    int id,
    String code,
    String date,
    String name,
    String phone,
    String address,
    num point,
    @JsonKey(name: 'productname') String product,
    String status,
  }) = _StoreExchangeData;

  static StoreExchangeData jsonToStoreExchangeData(
          Map<String, dynamic> jsonMap) =>
      _$_StoreExchangeData(
        id: jsonMap['id'] as int,
        code: '${jsonMap['code']}',
        date: jsonMap['date'] as String,
        name: jsonMap['name'] as String,
        phone: jsonMap['phone'] as String,
        address: jsonMap['address'] as String,
        point: jsonMap['point'] as num,
        product: jsonMap['productname'] as String,
        status: jsonMap['status'] as String,
      );
}
