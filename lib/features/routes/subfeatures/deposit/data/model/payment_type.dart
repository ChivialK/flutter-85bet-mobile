import 'package:flutter/cupertino.dart';
import 'package:flutter_85bet_mobile/builders/dataclass/dataclass.dart';
import 'package:flutter_85bet_mobile/core/base/data_operator.dart';
import 'package:flutter_85bet_mobile/core/internal/local_strings.dart';
import 'package:flutter_85bet_mobile/features/themes/icon_code.dart';
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
        return localeStr?.depositPaymentTitleOnline;
      case 2:
        return localeStr?.depositPaymentTitleAtm;
      case 3:
        return localeStr?.depositPaymentTitleBank;
      case 6:
        return 'Zalo Pay';
      case 7:
        return 'MOMO';
      case 8:
        return 'Viettel PAY';
      default:
        if (data != null && data.isNotEmpty)
          return data.first?.type ?? 'Unknown';
        else
          return 'Unknown';
    }
  }

  IconData get icon {
    switch (key) {
      case 1:
        return IconCode.payCard;
      case 2:
        return IconCode.payAtm;
      case 3:
        return IconCode.payLocal;
      case 6:
        return IconCode.payZalo;
      case 7:
        return IconCode.payMomo;
      case 8:
        return IconCode.payViet;
      default:
        return IconCode.payOther;
    }
  }
}
