import 'package:freezed_annotation/freezed_annotation.dart';

part 'freezed_form.freezed.dart';
part 'freezed_form.g.dart';

@freezed
abstract class FreezedForm with _$FreezedForm {
  const factory FreezedForm(
          @JsonKey(name: 'accountcode') String account, String password) =
      _FreezedForm;

  factory FreezedForm.fromJson(Map<String, dynamic> json) =>
      _$FreezedFormFromJson(json);
}

@freezed
abstract class FreezedNested with _$FreezedNested {
  const factory FreezedNested.add(int status) = _Add;
  const factory FreezedNested.subtract(int status) = _Subtract;
}

@freezed
abstract class FreezedOperation with _$FreezedOperation {
  const factory FreezedOperation.add(int value) = Add;
  const factory FreezedOperation.subtract(int value) = Subtract;
  const factory FreezedOperation.error([String msg]) = Error;
}
