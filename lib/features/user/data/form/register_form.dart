import 'package:flutter_85bet_mobile/core/internal/input_limit.dart';
import 'package:flutter_85bet_mobile/utils/value_util.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_form.freezed.dart';

@freezed
abstract class RegisterForm with _$RegisterForm {
  const factory RegisterForm({
    @required String username,
    @required String password,
    @required String confirmPassword,
    String intro,
    String mobileno,
    String code,
    @JsonKey(name: 'key') String captchaKey,
    @JsonKey(name: 'captcha') String captchaAns,
  }) = _RegisterForm;
}

extension RegisterFormExtension on RegisterForm {
  /// This method is not reversible
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'username': this.username,
      'password': this.password,
      'confirmPassword': this.confirmPassword,
      'intro': this.intro ?? '',
      'mobileno': this.mobileno ?? '',
      'code': this.code ?? '',
    };
  }

  Map<String, dynamic> captchaToJson() => <String, dynamic>{
        'key': this.captchaKey,
        'captcha': this.captchaAns,
      };

  bool get isValid =>
      username.isNotEmpty &&
      password.isNotEmpty &&
      confirmPassword.isNotEmpty &&
      password == confirmPassword &&
      intro.isNotEmpty &&
      mobileno.isNotEmpty &&
      rangeCheck(
        value: mobileno.length,
        min: InputLimit.PHONE_MIN,
        max: InputLimit.PHONE_MAX,
      );
}
