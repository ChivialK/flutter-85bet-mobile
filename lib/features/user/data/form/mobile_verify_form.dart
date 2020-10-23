import 'package:freezed_annotation/freezed_annotation.dart';

part 'mobile_verify_form.freezed.dart';
part 'mobile_verify_form.g.dart';

@freezed
abstract class MobileVerifyForm with _$MobileVerifyForm {
  const factory MobileVerifyForm({
    @required String mobile,
    String uuid,
  }) = _MobileVerifyForm;

  factory MobileVerifyForm.fromJson(Map<String, dynamic> json) =>
      _$MobileVerifyFormFromJson(json);
}
