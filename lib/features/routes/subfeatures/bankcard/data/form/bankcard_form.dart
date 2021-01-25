import 'package:freezed_annotation/freezed_annotation.dart';

part 'bankcard_form.freezed.dart';

@freezed
abstract class BankcardForm with _$BankcardForm {
  const factory BankcardForm({
    @required @JsonKey(name: 'bankname') String owner,
    @required @JsonKey(name: 'bankindex') String bankId,
    @required @JsonKey(name: 'bankaccno') String card,
    @JsonKey(name: 'bankaddress') String branch,
    @JsonKey(name: 'bankprovince') String province,
    @JsonKey(name: 'bankcity') String area,
  }) = _BankcardForm;
}

extension BankcardFormExtension on BankcardForm {
  bool get isValid =>
      owner.isNotEmpty &&
      bankId.isNotEmpty &&
      card.isNotEmpty &&
      card.startsWith('9704');

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'bankname': this.owner,
      'bankindex': this.bankId,
      'bankaccno': this.card,
      'bankaddress': this.branch,
      'bankprovince': this.province,
      'bankcity': this.area,
    };
  }
}
