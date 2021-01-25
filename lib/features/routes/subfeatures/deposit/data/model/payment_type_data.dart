import 'package:flutter_85bet_mobile/utils/json_util.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_type_data.freezed.dart';
part 'payment_type_data.g.dart';

@freezed
abstract class PaymentTypeData with _$PaymentTypeData {
  const factory PaymentTypeData.other({
    String amount,
    @JsonKey(name: 'amountoption') List<String> amountOption,
    @JsonKey(name: 'amounttype') int amountType,
    @JsonKey(name: 'bankaccountid') int bankAccountId,
    int gateway,
    int max,
    int min,
    int payment,
    @JsonKey(name: 'pgindex') int pgIndex,
    @required List<int> sb,
    String type,
    dynamic key,
  }) = PaymentTypeOnlineData;

  const factory PaymentTypeData.local({
    @JsonKey(name: 'bankaccountid') int bankAccountId,
    @JsonKey(name: 'bankaccountno') String bankAccountNo,
    @JsonKey(name: 'bankindex') int bankIndex,
    @JsonKey(fromJson: JsonUtil.getRawJson) String max,
    @JsonKey(fromJson: JsonUtil.getRawJson) String min,
    String payment,
    String type,
    dynamic key,
  }) = PaymentTypeLocalData;

  factory PaymentTypeData.fromJson(Map<String, dynamic> json) {
    if (json.keys.contains('payment') && json['payment'] == 'localbank')
      json['runtimeType'] = 'local';
    else
      json['runtimeType'] = 'other';
    return _$PaymentTypeDataFromJson(json);
  }

  static PaymentTypeOnlineData jsonToPaymentTypeOnlineData(
      Map<String, dynamic> jsonMap) {
    jsonMap['runtimeType'] = 'other';
    return _$PaymentTypeDataFromJson(jsonMap);
  }

  static PaymentTypeLocalData jsonToPaymentTypeLocalData(
      Map<String, dynamic> jsonMap) {
    jsonMap['runtimeType'] = 'local';
    return _$PaymentTypeDataFromJson(jsonMap);
  }
}

extension PaymentTypeOnlineDataExtension on PaymentTypeOnlineData {
  bool get hasAmountOption => amountOption != null && amountOption.isNotEmpty;
}
