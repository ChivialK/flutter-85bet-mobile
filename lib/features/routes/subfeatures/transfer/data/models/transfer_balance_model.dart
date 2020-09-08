import 'package:freezed_annotation/freezed_annotation.dart';

part 'transfer_balance_model.freezed.dart';
part 'transfer_balance_model.g.dart';

@freezed
abstract class TransferBalanceModel with _$TransferBalanceModel {
  const factory TransferBalanceModel({
    String balance,
  }) = _TransferBalanceModel;

  factory TransferBalanceModel.fromJson(Map<String, dynamic> json) =>
      _$TransferBalanceModelFromJson(json);

  static TransferBalanceModel jsonToTransferBalanceModel(
          Map<String, dynamic> jsonMap) =>
      TransferBalanceModel.fromJson(jsonMap);
}
