import 'package:freezed_annotation/freezed_annotation.dart';

part 'store_rules_model.freezed.dart';

@freezed
abstract class StoreRulesModel with _$StoreRulesModel {
  const factory StoreRulesModel({
    List<StorePlatformDollar> platformRules,
    List<StoreRuleData> rules,
  }) = _StoreRulesModel;
}

@freezed
abstract class StoreRuleData with _$StoreRuleData {
  const factory StoreRuleData({
    @JsonKey(name: 'rule_id') int ruleId,
    String title,
    String content,
    String status,
  }) = _StoreRuleData;

  static StoreRuleData jsonToStoreRuleData(Map<String, dynamic> jsonMap) =>
      _$_StoreRuleData(
        ruleId: jsonMap['rule_id'] as int,
        title: jsonMap['title'] as String,
        content: jsonMap['content'] as String,
        status: jsonMap['status'] as String,
      );
}

@freezed
abstract class StorePlatformDollar with _$StorePlatformDollar {
  const factory StorePlatformDollar({
    @JsonKey(name: 'ch') String platform,
    @JsonKey(name: 'doller') num dollar,
  }) = _StorePlatformDollar;

  static StorePlatformDollar jsonToStorePlatformDollar(
          Map<String, dynamic> jsonMap) =>
      _$_StorePlatformDollar(
        platform: jsonMap['ch'] as String,
        dollar: jsonMap['doller'] as num,
      );
}
