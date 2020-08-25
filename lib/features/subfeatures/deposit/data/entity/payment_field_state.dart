import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_field_state.freezed.dart';

@freezed
abstract class PaymentFieldState with _$PaymentFieldState {
  const factory PaymentFieldState({
    num min,
    num max,
    num amountStep,
    String fieldError,
    @Default(false) bool isValid,
  }) = _PaymentFieldState;
}
