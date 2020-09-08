// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'failure_code.dart';

// **************************************************************************
// DataClassGenerator
// **************************************************************************

abstract class _$FailureCode {
  const _$FailureCode();

  FailureType get type;

  int get code;

  bool operator ==(other) {
    if (identical(this, other)) return true;
    if (other is! FailureCode) return false;

    return true && this.type == other.type && this.code == other.code;
  }

  int get hashCode {
    return mapPropsToHashCode([type, code]);
  }

  String toString() {
    return 'FailureCode <\'type\': ${this.type},\'code\': ${this.code},>';
  }

  FailureCode copyWith({FailureType type, int code}) {
    return FailureCode(
      type: type ?? this.type,
      code: code ?? this.code,
    );
  }
}
