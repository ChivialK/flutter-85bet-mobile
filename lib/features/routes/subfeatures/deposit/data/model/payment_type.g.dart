// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_type.dart';

// **************************************************************************
// DataClassGenerator
// **************************************************************************

abstract class _$PaymentType {
  const _$PaymentType();

  int get key;
  List<PaymentTypeData> get data;
  bool operator ==(other) {
    if (identical(this, other)) return true;
    if (other is! PaymentType) return false;
    return true && this.key == other.key && this.data == other.data;
  }

  int get hashCode {
    return mapPropsToHashCode([key, data]);
  }

  String toString() {
    return 'PaymentType <\'key\': ${this.key},\'data\': ${this.data},>';
  }

  PaymentType copyWith({int key, List<PaymentTypeData> data}) {
    return PaymentType(
      key: key ?? this.key,
      data: data ?? this.data,
    );
  }
}
