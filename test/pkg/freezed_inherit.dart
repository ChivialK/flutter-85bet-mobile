import 'package:flutter_85bet_mobile/core/base/data_operator.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'freezed_inherit.freezed.dart';
part 'freezed_inherit.g.dart';

@freezed
abstract class FreezedParent with _$FreezedParent implements DataOperator {
  factory FreezedParent({String account, String credit}) = FreezedParentData;
  factory FreezedParent.child({String account, String credit, String status}) =
      FreezedChildData;

  factory FreezedParent.fromJson(Map<String, dynamic> json) =>
      _$FreezedParentFromJson(json);
}

//@override
//String operator [](String key) {
//return account.toString();
//}
