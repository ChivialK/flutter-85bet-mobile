import 'package:flutter_85bet_mobile/utils/json_util.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'deals_model.freezed.dart';

@freezed
abstract class DealsModel with _$DealsModel {
  const factory DealsModel({
    @JsonKey(name: 'current_page') int currentPage,
    @JsonKey(name: 'last_page') int lastPage,
    @JsonKey(name: 'per_page') int perPage,
    int from,
    int to,
    int total,
    @JsonKey(name: 'next_page_url') String nextPageUrl,
    @JsonKey(name: 'prev_page_url') String prevPageUrl,
    @JsonKey(fromJson: decodeDealsData) List<DealsData> data,
  }) = _DealsModel;

  static DealsModel jsonToDealsModel(Map<String, dynamic> jsonMap) {
    return _$_DealsModel(
      currentPage: jsonMap['current_page'] as int,
      lastPage: jsonMap['last_page'] as int,
      perPage: jsonMap['per_page'] as int,
      from: jsonMap['from'] as int,
      to: jsonMap['to'] as int,
      total: jsonMap['total'] as int,
      nextPageUrl: jsonMap['next_page_url'] as String,
      prevPageUrl: jsonMap['prev_page_url'] as String,
      data: decodeDealsData(jsonMap['data']),
    );
  }
}

List<DealsData> decodeDealsData(dynamic map) {
  if (map == null) return [];
  return JsonUtil.decodeArrayToModel(
    map,
    (jsonMap) => DealsData.jsonToDealsData(jsonMap),
    tag: 'DealsData',
  );
}

@freezed
abstract class DealsData with _$DealsData {
  const factory DealsData({
    String amount,
    @JsonKey(name: 'ledgerdatetime') String date,
    @JsonKey(name: 'ledgerid') int id,
    String status,
    @JsonKey(name: 'transactionid') String action,
    String type,
  }) = _DealsData;

  static DealsData jsonToDealsData(Map<String, dynamic> jsonMap) {
    return _$_DealsData(
      amount: jsonMap['amount'] as String,
      date: jsonMap['ledgerdatetime'] as String,
      id: jsonMap['ledgerid'] as int,
      status: jsonMap['status'] as String,
      action: jsonMap['transactionid'] as String,
      type: jsonMap['type'] as String,
    );
  }
}
