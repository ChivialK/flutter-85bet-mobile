import 'package:freezed_annotation/freezed_annotation.dart';

part 'transfer_platform_model.freezed.dart';
part 'transfer_platform_model.g.dart';

@freezed
abstract class TransferPlatformModel with _$TransferPlatformModel {
  const factory TransferPlatformModel({
    String site,
    @JsonKey(name: 'site_name') String name,
  }) = _TransferPlatformModel;

  factory TransferPlatformModel.fromJson(Map<String, dynamic> json) =>
      _$TransferPlatformModelFromJson(json);

  static TransferPlatformModel jsonToTransferPlatformModel(
          Map<String, dynamic> jsonMap) =>
      TransferPlatformModel.fromJson(jsonMap);
}

@freezed
abstract class TransferPlatformList with _$TransferPlatformList {
  const factory TransferPlatformList({
    List<TransferPlatformModel> list,
  }) = _TransferPlatformList;
}
