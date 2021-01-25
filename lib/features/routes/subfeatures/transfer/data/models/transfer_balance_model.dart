import 'package:freezed_annotation/freezed_annotation.dart';

part 'transfer_balance_model.freezed.dart';

@freezed
abstract class TransferBalanceModel with _$TransferBalanceModel {
  const factory TransferBalanceModel({
    String balance,
  }) = _TransferBalanceModel;

  static TransferBalanceModel jsonToTransferBalanceModel(
          Map<String, dynamic> jsonMap) =>
      _$_TransferBalanceModel(
        balance: '${jsonMap['balance']}',
      );
}
