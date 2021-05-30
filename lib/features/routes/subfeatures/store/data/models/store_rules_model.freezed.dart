// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'store_rules_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$StoreRulesModelTearOff {
  const _$StoreRulesModelTearOff();

// ignore: unused_element
  _StoreRulesModel call(
      {List<StorePlatformDollar> platformRules, List<StoreRuleData> rules}) {
    return _StoreRulesModel(
      platformRules: platformRules,
      rules: rules,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $StoreRulesModel = _$StoreRulesModelTearOff();

/// @nodoc
mixin _$StoreRulesModel {
  List<StorePlatformDollar> get platformRules;
  List<StoreRuleData> get rules;

  $StoreRulesModelCopyWith<StoreRulesModel> get copyWith;
}

/// @nodoc
abstract class $StoreRulesModelCopyWith<$Res> {
  factory $StoreRulesModelCopyWith(
          StoreRulesModel value, $Res Function(StoreRulesModel) then) =
      _$StoreRulesModelCopyWithImpl<$Res>;
  $Res call(
      {List<StorePlatformDollar> platformRules, List<StoreRuleData> rules});
}

/// @nodoc
class _$StoreRulesModelCopyWithImpl<$Res>
    implements $StoreRulesModelCopyWith<$Res> {
  _$StoreRulesModelCopyWithImpl(this._value, this._then);

  final StoreRulesModel _value;
  // ignore: unused_field
  final $Res Function(StoreRulesModel) _then;

  @override
  $Res call({
    Object platformRules = freezed,
    Object rules = freezed,
  }) {
    return _then(_value.copyWith(
      platformRules: platformRules == freezed
          ? _value.platformRules
          : platformRules as List<StorePlatformDollar>,
      rules: rules == freezed ? _value.rules : rules as List<StoreRuleData>,
    ));
  }
}

/// @nodoc
abstract class _$StoreRulesModelCopyWith<$Res>
    implements $StoreRulesModelCopyWith<$Res> {
  factory _$StoreRulesModelCopyWith(
          _StoreRulesModel value, $Res Function(_StoreRulesModel) then) =
      __$StoreRulesModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<StorePlatformDollar> platformRules, List<StoreRuleData> rules});
}

/// @nodoc
class __$StoreRulesModelCopyWithImpl<$Res>
    extends _$StoreRulesModelCopyWithImpl<$Res>
    implements _$StoreRulesModelCopyWith<$Res> {
  __$StoreRulesModelCopyWithImpl(
      _StoreRulesModel _value, $Res Function(_StoreRulesModel) _then)
      : super(_value, (v) => _then(v as _StoreRulesModel));

  @override
  _StoreRulesModel get _value => super._value as _StoreRulesModel;

  @override
  $Res call({
    Object platformRules = freezed,
    Object rules = freezed,
  }) {
    return _then(_StoreRulesModel(
      platformRules: platformRules == freezed
          ? _value.platformRules
          : platformRules as List<StorePlatformDollar>,
      rules: rules == freezed ? _value.rules : rules as List<StoreRuleData>,
    ));
  }
}

/// @nodoc
class _$_StoreRulesModel implements _StoreRulesModel {
  const _$_StoreRulesModel({this.platformRules, this.rules});

  @override
  final List<StorePlatformDollar> platformRules;
  @override
  final List<StoreRuleData> rules;

  @override
  String toString() {
    return 'StoreRulesModel(platformRules: $platformRules, rules: $rules)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _StoreRulesModel &&
            (identical(other.platformRules, platformRules) ||
                const DeepCollectionEquality()
                    .equals(other.platformRules, platformRules)) &&
            (identical(other.rules, rules) ||
                const DeepCollectionEquality().equals(other.rules, rules)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(platformRules) ^
      const DeepCollectionEquality().hash(rules);

  @override
  _$StoreRulesModelCopyWith<_StoreRulesModel> get copyWith =>
      __$StoreRulesModelCopyWithImpl<_StoreRulesModel>(this, _$identity);
}

abstract class _StoreRulesModel implements StoreRulesModel {
  const factory _StoreRulesModel(
      {List<StorePlatformDollar> platformRules,
      List<StoreRuleData> rules}) = _$_StoreRulesModel;

  @override
  List<StorePlatformDollar> get platformRules;
  @override
  List<StoreRuleData> get rules;
  @override
  _$StoreRulesModelCopyWith<_StoreRulesModel> get copyWith;
}

/// @nodoc
class _$StoreRuleDataTearOff {
  const _$StoreRuleDataTearOff();

// ignore: unused_element
  _StoreRuleData call(
      {@JsonKey(name: 'rule_id') int ruleId,
      String title,
      String content,
      String status}) {
    return _StoreRuleData(
      ruleId: ruleId,
      title: title,
      content: content,
      status: status,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $StoreRuleData = _$StoreRuleDataTearOff();

/// @nodoc
mixin _$StoreRuleData {
  @JsonKey(name: 'rule_id')
  int get ruleId;
  String get title;
  String get content;
  String get status;

  $StoreRuleDataCopyWith<StoreRuleData> get copyWith;
}

/// @nodoc
abstract class $StoreRuleDataCopyWith<$Res> {
  factory $StoreRuleDataCopyWith(
          StoreRuleData value, $Res Function(StoreRuleData) then) =
      _$StoreRuleDataCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'rule_id') int ruleId,
      String title,
      String content,
      String status});
}

/// @nodoc
class _$StoreRuleDataCopyWithImpl<$Res>
    implements $StoreRuleDataCopyWith<$Res> {
  _$StoreRuleDataCopyWithImpl(this._value, this._then);

  final StoreRuleData _value;
  // ignore: unused_field
  final $Res Function(StoreRuleData) _then;

  @override
  $Res call({
    Object ruleId = freezed,
    Object title = freezed,
    Object content = freezed,
    Object status = freezed,
  }) {
    return _then(_value.copyWith(
      ruleId: ruleId == freezed ? _value.ruleId : ruleId as int,
      title: title == freezed ? _value.title : title as String,
      content: content == freezed ? _value.content : content as String,
      status: status == freezed ? _value.status : status as String,
    ));
  }
}

/// @nodoc
abstract class _$StoreRuleDataCopyWith<$Res>
    implements $StoreRuleDataCopyWith<$Res> {
  factory _$StoreRuleDataCopyWith(
          _StoreRuleData value, $Res Function(_StoreRuleData) then) =
      __$StoreRuleDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'rule_id') int ruleId,
      String title,
      String content,
      String status});
}

/// @nodoc
class __$StoreRuleDataCopyWithImpl<$Res>
    extends _$StoreRuleDataCopyWithImpl<$Res>
    implements _$StoreRuleDataCopyWith<$Res> {
  __$StoreRuleDataCopyWithImpl(
      _StoreRuleData _value, $Res Function(_StoreRuleData) _then)
      : super(_value, (v) => _then(v as _StoreRuleData));

  @override
  _StoreRuleData get _value => super._value as _StoreRuleData;

  @override
  $Res call({
    Object ruleId = freezed,
    Object title = freezed,
    Object content = freezed,
    Object status = freezed,
  }) {
    return _then(_StoreRuleData(
      ruleId: ruleId == freezed ? _value.ruleId : ruleId as int,
      title: title == freezed ? _value.title : title as String,
      content: content == freezed ? _value.content : content as String,
      status: status == freezed ? _value.status : status as String,
    ));
  }
}

/// @nodoc
class _$_StoreRuleData implements _StoreRuleData {
  const _$_StoreRuleData(
      {@JsonKey(name: 'rule_id') this.ruleId,
      this.title,
      this.content,
      this.status});

  @override
  @JsonKey(name: 'rule_id')
  final int ruleId;
  @override
  final String title;
  @override
  final String content;
  @override
  final String status;

  @override
  String toString() {
    return 'StoreRuleData(ruleId: $ruleId, title: $title, content: $content, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _StoreRuleData &&
            (identical(other.ruleId, ruleId) ||
                const DeepCollectionEquality().equals(other.ruleId, ruleId)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.content, content) ||
                const DeepCollectionEquality()
                    .equals(other.content, content)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(ruleId) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(content) ^
      const DeepCollectionEquality().hash(status);

  @override
  _$StoreRuleDataCopyWith<_StoreRuleData> get copyWith =>
      __$StoreRuleDataCopyWithImpl<_StoreRuleData>(this, _$identity);
}

abstract class _StoreRuleData implements StoreRuleData {
  const factory _StoreRuleData(
      {@JsonKey(name: 'rule_id') int ruleId,
      String title,
      String content,
      String status}) = _$_StoreRuleData;

  @override
  @JsonKey(name: 'rule_id')
  int get ruleId;
  @override
  String get title;
  @override
  String get content;
  @override
  String get status;
  @override
  _$StoreRuleDataCopyWith<_StoreRuleData> get copyWith;
}

/// @nodoc
class _$StorePlatformDollarTearOff {
  const _$StorePlatformDollarTearOff();

// ignore: unused_element
  _StorePlatformDollar call(
      {@JsonKey(name: 'ch') String platform,
      @JsonKey(name: 'doller') num dollar}) {
    return _StorePlatformDollar(
      platform: platform,
      dollar: dollar,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $StorePlatformDollar = _$StorePlatformDollarTearOff();

/// @nodoc
mixin _$StorePlatformDollar {
  @JsonKey(name: 'ch')
  String get platform;
  @JsonKey(name: 'doller')
  num get dollar;

  $StorePlatformDollarCopyWith<StorePlatformDollar> get copyWith;
}

/// @nodoc
abstract class $StorePlatformDollarCopyWith<$Res> {
  factory $StorePlatformDollarCopyWith(
          StorePlatformDollar value, $Res Function(StorePlatformDollar) then) =
      _$StorePlatformDollarCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'ch') String platform,
      @JsonKey(name: 'doller') num dollar});
}

/// @nodoc
class _$StorePlatformDollarCopyWithImpl<$Res>
    implements $StorePlatformDollarCopyWith<$Res> {
  _$StorePlatformDollarCopyWithImpl(this._value, this._then);

  final StorePlatformDollar _value;
  // ignore: unused_field
  final $Res Function(StorePlatformDollar) _then;

  @override
  $Res call({
    Object platform = freezed,
    Object dollar = freezed,
  }) {
    return _then(_value.copyWith(
      platform: platform == freezed ? _value.platform : platform as String,
      dollar: dollar == freezed ? _value.dollar : dollar as num,
    ));
  }
}

/// @nodoc
abstract class _$StorePlatformDollarCopyWith<$Res>
    implements $StorePlatformDollarCopyWith<$Res> {
  factory _$StorePlatformDollarCopyWith(_StorePlatformDollar value,
          $Res Function(_StorePlatformDollar) then) =
      __$StorePlatformDollarCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'ch') String platform,
      @JsonKey(name: 'doller') num dollar});
}

/// @nodoc
class __$StorePlatformDollarCopyWithImpl<$Res>
    extends _$StorePlatformDollarCopyWithImpl<$Res>
    implements _$StorePlatformDollarCopyWith<$Res> {
  __$StorePlatformDollarCopyWithImpl(
      _StorePlatformDollar _value, $Res Function(_StorePlatformDollar) _then)
      : super(_value, (v) => _then(v as _StorePlatformDollar));

  @override
  _StorePlatformDollar get _value => super._value as _StorePlatformDollar;

  @override
  $Res call({
    Object platform = freezed,
    Object dollar = freezed,
  }) {
    return _then(_StorePlatformDollar(
      platform: platform == freezed ? _value.platform : platform as String,
      dollar: dollar == freezed ? _value.dollar : dollar as num,
    ));
  }
}

/// @nodoc
class _$_StorePlatformDollar implements _StorePlatformDollar {
  const _$_StorePlatformDollar(
      {@JsonKey(name: 'ch') this.platform,
      @JsonKey(name: 'doller') this.dollar});

  @override
  @JsonKey(name: 'ch')
  final String platform;
  @override
  @JsonKey(name: 'doller')
  final num dollar;

  @override
  String toString() {
    return 'StorePlatformDollar(platform: $platform, dollar: $dollar)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _StorePlatformDollar &&
            (identical(other.platform, platform) ||
                const DeepCollectionEquality()
                    .equals(other.platform, platform)) &&
            (identical(other.dollar, dollar) ||
                const DeepCollectionEquality().equals(other.dollar, dollar)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(platform) ^
      const DeepCollectionEquality().hash(dollar);

  @override
  _$StorePlatformDollarCopyWith<_StorePlatformDollar> get copyWith =>
      __$StorePlatformDollarCopyWithImpl<_StorePlatformDollar>(
          this, _$identity);
}

abstract class _StorePlatformDollar implements StorePlatformDollar {
  const factory _StorePlatformDollar(
      {@JsonKey(name: 'ch') String platform,
      @JsonKey(name: 'doller') num dollar}) = _$_StorePlatformDollar;

  @override
  @JsonKey(name: 'ch')
  String get platform;
  @override
  @JsonKey(name: 'doller')
  num get dollar;
  @override
  _$StorePlatformDollarCopyWith<_StorePlatformDollar> get copyWith;
}
