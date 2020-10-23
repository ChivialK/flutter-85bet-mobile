import 'package:flutter_85bet_mobile/utils/json_util.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bet_record_model.freezed.dart';

@freezed
abstract class BetRecordModel with _$BetRecordModel {
  const factory BetRecordModel({
    @JsonKey(name: 'current_page') int currentPage,
    @JsonKey(name: 'last_page') int lastPage,
    @JsonKey(name: 'per_page') int perPage,
    int from,
    int to,
    int total,
    @JsonKey(name: 'next_page_url') String nextPageUrl,
    @JsonKey(name: 'prev_page_url') String prevPageUrl,
    @JsonKey(fromJson: decodeBetRecordData) List<BetRecordData> data,
  }) = _BetRecordModel;

  static BetRecordModel jsonToBetRecordModel(Map<String, dynamic> jsonMap) {
    return _$_BetRecordModel(
      currentPage: jsonMap['current_page'] as int,
      lastPage: jsonMap['last_page'] as int,
      perPage: jsonMap['per_page'] as int,
      from: jsonMap['from'] as int,
      to: jsonMap['to'] as int,
      total: jsonMap['total'] as int,
      nextPageUrl: jsonMap['next_page_url'] as String,
      prevPageUrl: jsonMap['prev_page_url'] as String,
      data: decodeBetRecordData(jsonMap['data']),
    );
  }
}

extension BetRecordModelExtension on BetRecordModel {
  bool get hasNoData =>
      data == null ||
      data.isEmpty ||
      (data.length == 1 && data.first.isSumData());

  BetRecordData get getSum =>
      data.singleWhere((element) => element.isSumData());
}

List<BetRecordData> decodeBetRecordData(dynamic str) =>
    JsonUtil.decodeMapToModelList(
      str,
      (jsonMap) => BetRecordData.jsonToBetRecordData(jsonMap),
      tag: 'BetRecordData',
    );

@freezed
abstract class BetRecordData with _$BetRecordData {
  const factory BetRecordData({
    @JsonKey(name: 'activebet') String activeBet,
    @JsonKey(name: 'validbet') String validBet,
    String bet,
    @JsonKey(name: 'betno') String betNo,
    String payout,
    String site,
    @JsonKey(name: 'starttime') String startTime,
    String type,
    dynamic key,
  }) = _BetRecordData;

  static BetRecordData jsonToBetRecordData(Map<String, dynamic> jsonMap) {
    return _$_BetRecordData(
      activeBet: jsonMap['activebet'] as String,
      validBet: jsonMap['validbet'] as String,
      bet: jsonMap['bet'] as String,
      betNo: jsonMap['betno'] as String,
      payout: jsonMap['payout'] as String,
      site: jsonMap['site'] as String,
      startTime: jsonMap['starttime'] as String,
      type: jsonMap['type'] as String,
      key: jsonMap['key'],
    );
  }
}

extension BetRecordDataExtension on BetRecordData {
  bool isSumData() => key.toString() == 'sumTotal';
}

@freezed
abstract class BetRecordDataAllPlatform with _$BetRecordDataAllPlatform {
  const factory BetRecordDataAllPlatform({
    num bet,
    num valid,
    num payout,
    dynamic key,
  }) = _BetRecordDataAllPlatform;

  static BetRecordDataAllPlatform jsonToBetRecordDataAllPlatform(
      Map<String, dynamic> jsonMap) {
    return _$_BetRecordDataAllPlatform(
      bet: jsonMap['bet'] as num,
      valid: jsonMap['validbet'] as num,
      payout: jsonMap['payout'] as num,
      key: jsonMap['key'],
    );
  }
}

extension BetRecordDataAllPlatformExtension on BetRecordDataAllPlatform {
  bool isSumData() => key.toString() == 'total';
}
