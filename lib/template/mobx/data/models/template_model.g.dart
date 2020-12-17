// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'template_model.dart';

// **************************************************************************
// DataClassGenerator
// **************************************************************************

abstract class _$TemplateModel {
  const _$TemplateModel();

  String get vip1;
  String get vip2;
  String get vip3;
  String get vip4;
  String get vip5;
  String get vip6;
  bool operator ==(other) {
    if (identical(this, other)) return true;
    if (other is! TemplateModel) return false;
    return true &&
        this.vip1 == other.vip1 &&
        this.vip2 == other.vip2 &&
        this.vip3 == other.vip3 &&
        this.vip4 == other.vip4 &&
        this.vip5 == other.vip5 &&
        this.vip6 == other.vip6;
  }

  int get hashCode {
    return mapPropsToHashCode([vip1, vip2, vip3, vip4, vip5, vip6]);
  }

  String toString() {
    return 'TemplateModel <\'vip1\': ${this.vip1},\'vip2\': ${this.vip2},\'vip3\': ${this.vip3},\'vip4\': ${this.vip4},\'vip5\': ${this.vip5},\'vip6\': ${this.vip6},>';
  }

  TemplateModel copyWith(
      {String vip1,
      String vip2,
      String vip3,
      String vip4,
      String vip5,
      String vip6}) {
    return TemplateModel(
      vip1: vip1 ?? this.vip1,
      vip2: vip2 ?? this.vip2,
      vip3: vip3 ?? this.vip3,
      vip4: vip4 ?? this.vip4,
      vip5: vip5 ?? this.vip5,
      vip6: vip6 ?? this.vip6,
    );
  }
}
