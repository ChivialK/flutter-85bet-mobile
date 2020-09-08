import 'package:freezed_annotation/freezed_annotation.dart';

part 'bankcard_model.freezed.dart';
part 'bankcard_model.g.dart';

@freezed
abstract class BankcardModel with _$BankcardModel {
  const factory BankcardModel({
    @nullable bool hasCard,
    @JsonKey(name: 'bankaddress', defaultValue: '') String bankAddress,
    @JsonKey(name: 'firstname', defaultValue: '') String firstName,
    @JsonKey(name: 'bankaccountno', defaultValue: '') String bankAccountNo,
    @JsonKey(name: 'bankprovince', defaultValue: '') String bankProvince,
    @JsonKey(name: 'bankcity', defaultValue: '') String bankCity,
    @JsonKey(name: 'bankarea', defaultValue: '') String bankArea,
    @JsonKey(name: 'bankname', defaultValue: '') String bankName,
  }) = _BankcardModel;

  factory BankcardModel.fromJson(Map<String, dynamic> json) =>
      _$BankcardModelFromJson(json);

  static BankcardModel jsonToBankcardModel(Map<String, dynamic> jsonMap) =>
      BankcardModel.fromJson(jsonMap);
}
