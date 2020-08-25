import 'package:freezed_annotation/freezed_annotation.dart';

part 'center_account_entity.freezed.dart';

@freezed
abstract class CenterAccountEntity with _$CenterAccountEntity {
  const factory CenterAccountEntity({
    String accountCode,
    int accountId,
    String birthDate,
    String phone,
    String gender,
    String email,
    String wechat,
    String firstName,
    String autoTransfer,
    String cgpWallet,
    String cpwWallet,
  }) = _CenterAccountEntity;
}

extension CenterAccountEntityExtension on CenterAccountEntity {
  bool get canBindCard => firstName.isEmpty;
  bool get canBindBirthDate => birthDate.isEmpty;
  bool get canVerifyPhone => phone.isNotEmpty && phone.contains('未') == true;
  bool get canBindMail => email.isEmpty;
  bool get canBindWechat => wechat.isEmpty;
  bool get canBindCgp => cgpWallet.isEmpty || cgpWallet != '-1';
  bool get canBindCpw => cpwWallet.isEmpty || cpwWallet != '-1';

  List<String> get getInitInput => [
        accountCode,
        firstName,
        birthDate,
        phone,
        email,
        wechat,
        cgpWallet,
        cpwWallet,
      ];
}
