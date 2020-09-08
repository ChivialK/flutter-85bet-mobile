import 'package:dataclass/dataclass.dart';
import 'package:flutter_85bet_mobile/core/base/data_operator.dart';
import 'package:flutter_85bet_mobile/core/internal/local_strings.dart';
import 'package:flutter_85bet_mobile/utils/json_util.dart';
import 'package:flutter_85bet_mobile/utils/value_util.dart';

import 'payment_type_data.dart';

part 'payment_type.g.dart';

@dataClass
class PaymentType extends _$PaymentType implements DataOperator {
  final int key;
  final List<PaymentTypeData> data;

  const PaymentType({this.key, this.data});

  @override
  String operator [](String key) => label;
}

List<PaymentType> decodePaymentTypes(Map<String, dynamic> json) {
  List<PaymentType> list = new List();
  json.forEach((key, value) {
    list.add(
        PaymentType(key: '$key'.strToInt, data: decodePaymentTypeData(value)));
  });
  list.sort((a, b) => a.key.compareTo(b.key));
  return list;
}

List<PaymentTypeData> decodePaymentTypeData(dynamic str) =>
    JsonUtil.decodeMapToModelList(
      str,
      (jsonMap) => PaymentTypeData.fromJson(jsonMap),
      tag: 'PaymentType',
    );

extension PaymentTypeExtension on PaymentType {
  String get label {
    switch (key) {
      case 1:
        return localeStr?.depositPaymentTitleBank ?? 'Bank';
      case 2:
        return localeStr?.depositPaymentTitleOnline ?? 'Online';
      default:
//        var firstData;
//        if (data is List && data.isNotEmpty)
//          firstData = data.first;
//        else if (data is Map && data.isNotEmpty) firstData = data.values.first;
//
//        if (firstData != null &&
//            firstData is Map &&
//            firstData.containsKey('type'))
//          return firstData['type'];
        if (data != null && data.isNotEmpty)
          return data.first.type;
        else
          return 'Unknown';
    }
  }
}
