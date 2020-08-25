import 'package:freezed_annotation/freezed_annotation.dart';

part 'wallet_model.freezed.dart';
part 'wallet_model.g.dart';

@freezed
abstract class WalletModel with _$WalletModel {
  const factory WalletModel({
    @Default('0') String auto,
    @JsonKey(name: 'creditlimit', defaultValue: '0.00') String credit,
  }) = _WalletModel;

  factory WalletModel.fromJson(Map<String, dynamic> json) =>
      _$WalletModelFromJson(json);

  static WalletModel jsonToWalletModel(Map<String, dynamic> jsonMap) =>
      WalletModel.fromJson(jsonMap);
}
