import 'package:freezed_annotation/freezed_annotation.dart';

part 'center_password_form.freezed.dart';

@freezed
abstract class CenterPasswordForm with _$CenterPasswordForm {
  const factory CenterPasswordForm({
    @required @JsonKey(name: 'oldpassword') String oldPwd,
    @required @JsonKey(name: 'newpassword') String newPwd,
    @required @JsonKey(name: 'conpassword') String confirmPwd,
  }) = _CenterPasswordForm;
}

extension CenterPasswordFormExtension on CenterPasswordForm {
  bool get isValid =>
      oldPwd.isNotEmpty &&
      newPwd.isNotEmpty &&
      confirmPwd.isNotEmpty &&
      newPwd == confirmPwd;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'oldpassword': this.oldPwd,
      'newpassword': this.newPwd,
      'conpassword': this.confirmPwd,
    };
  }
}
