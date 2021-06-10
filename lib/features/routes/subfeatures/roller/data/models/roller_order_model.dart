import 'package:freezed_annotation/freezed_annotation.dart';

part 'roller_order_model.freezed.dart';

@freezed
abstract class RollerOrderModel with _$RollerOrderModel {
  const factory RollerOrderModel({
    int id,
    @JsonKey(name: 'accountid') int accountId,
    int prize,
    int status,
    @JsonKey(name: 'cdate') String date,
    String name,
  }) = _RollerOrderModel;

  static RollerOrderModel jsonToOrderModel(Map<String, dynamic> jsonMap) =>
      _$_RollerOrderModel(
        id: jsonMap['id'] as int,
        accountId: jsonMap['accountid'] as int,
        prize: jsonMap['prize'] as int,
        status: jsonMap['status'] as int,
        date: jsonMap['cdate'] as String,
        name: jsonMap['name'] as String,
      );
}
