import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'login_form.freezed.dart';

part 'login_form.g.dart';

@freezed
abstract class LoginForm with _$LoginForm {
  const factory LoginForm({
    @JsonKey(name: 'accountcode') String account,
    String password,
    @JsonKey(name: 'key') String captchaKey,
    @JsonKey(name: 'captcha') String captchaAns,
  }) = _LoginForm;
}

extension LoginFormExtension on LoginForm {
  Map<String, dynamic> toJson() => <String, dynamic>{
        'accountcode': this.account,
        'password': this.password,
        'key': this.captchaKey,
        'captcha': this.captchaAns,
      };

  Map<String, dynamic> captchaToJson() => <String, dynamic>{
        'key': this.captchaKey,
        'captcha': this.captchaAns,
      };
}

@freezed
abstract class LoginHiveForm with _$LoginHiveForm {
  @HiveType(typeId: 109)
  const factory LoginHiveForm({
    @HiveField(0) String account,
    @HiveField(1) String password,
    @HiveField(2) @Default(false) bool fastLogin,
  }) = _LoginHiveForm;
}

extension LoginHiveFormExtension on LoginHiveForm {
  LoginForm get simple => LoginForm(
        account: this.account,
        password: this.password,
      );

  bool get isValid => this.account.isNotEmpty && this.password.isNotEmpty;
}
