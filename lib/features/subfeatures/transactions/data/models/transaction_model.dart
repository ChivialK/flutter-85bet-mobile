import 'package:flutter_85bet_mobile/utils/json_util.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_model.freezed.dart';

@freezed
abstract class TransactionModel with _$TransactionModel {
  const factory TransactionModel({
    @JsonKey(name: 'current_page') int currentPage,
    @JsonKey(name: 'last_page') int lastPage,
    @JsonKey(name: 'per_page') int perPage,
    int from,
    int to,
    int total,
    @JsonKey(name: 'next_page_url') String nextPageUrl,
    @JsonKey(name: 'prev_page_url') String prevPageUrl,
    @JsonKey(fromJson: decodeTransactionData) List<TransactionData> data,
  }) = _TransactionModel;

  static TransactionModel jsonToTransactionModel(Map<String, dynamic> jsonMap) {
    return _$_TransactionModel(
      currentPage: jsonMap['current_page'] as int,
      lastPage: jsonMap['last_page'] as int,
      perPage: jsonMap['per_page'] as int,
      from: jsonMap['from'] as int,
      to: jsonMap['to'] as int,
      total: jsonMap['total'] as int,
      nextPageUrl: jsonMap['next_page_url'] as String,
      prevPageUrl: jsonMap['prev_page_url'] as String,
      data: decodeTransactionData(jsonMap['data']),
    );
  }
}

List<TransactionData> decodeTransactionData(dynamic str) =>
    JsonUtil.decodeMapToModelList(
      str,
      (jsonMap) => TransactionData.jsonToTransactionData(jsonMap),
      tag: 'TransactionData',
    );

@freezed
abstract class TransactionData with _$TransactionData {
  const factory TransactionData({
    String amount,
    @JsonKey(name: 'clindex') int index,
    @JsonKey(name: 'com_from') String from,
    @JsonKey(name: 'com_to') String to,
    @JsonKey(name: 'transferdatetime') String date,
    String type,
    dynamic key,
  }) = _TransactionData;

  static TransactionData jsonToTransactionData(Map<String, dynamic> jsonMap) {
    return _$_TransactionData(
      amount: jsonMap['amount'] as String,
      index: jsonMap['clindex'] as int,
      from: jsonMap['com_from'] as String,
      to: jsonMap['com_to'] as String,
      date: jsonMap['transferdatetime'] as String,
      type: jsonMap['type'] as String,
      key: jsonMap['key'],
    );
  }
}
