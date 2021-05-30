// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'roller_requirement_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$RollerRequirementModelTearOff {
  const _$RollerRequirementModelTearOff();

// ignore: unused_element
  _RollerRequirementModel call(
      {@JsonKey(name: 'type', fromJson: decodeRollerRequirementType)
          List<RollerRequirementType> types,
      @JsonKey(name: 'target', fromJson: decodeRollerRequirementTarget)
          Map<String, List<RollerRequirementTarget>> targets,
      @JsonKey(name: 'current', fromJson: decodeRollerRequirementCurrent)
          List<RollerRequirementCurrent> current,
      @nullable
          bool hasData = true}) {
    return _RollerRequirementModel(
      types: types,
      targets: targets,
      current: current,
      hasData: hasData,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $RollerRequirementModel = _$RollerRequirementModelTearOff();

/// @nodoc
mixin _$RollerRequirementModel {
  @JsonKey(name: 'type', fromJson: decodeRollerRequirementType)
  List<RollerRequirementType> get types;
  @JsonKey(name: 'target', fromJson: decodeRollerRequirementTarget)
  Map<String, List<RollerRequirementTarget>> get targets;
  @JsonKey(name: 'current', fromJson: decodeRollerRequirementCurrent)
  List<RollerRequirementCurrent> get current;
  @nullable
  bool get hasData;

  $RollerRequirementModelCopyWith<RollerRequirementModel> get copyWith;
}

/// @nodoc
abstract class $RollerRequirementModelCopyWith<$Res> {
  factory $RollerRequirementModelCopyWith(RollerRequirementModel value,
          $Res Function(RollerRequirementModel) then) =
      _$RollerRequirementModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'type', fromJson: decodeRollerRequirementType)
          List<RollerRequirementType> types,
      @JsonKey(name: 'target', fromJson: decodeRollerRequirementTarget)
          Map<String, List<RollerRequirementTarget>> targets,
      @JsonKey(name: 'current', fromJson: decodeRollerRequirementCurrent)
          List<RollerRequirementCurrent> current,
      @nullable
          bool hasData});
}

/// @nodoc
class _$RollerRequirementModelCopyWithImpl<$Res>
    implements $RollerRequirementModelCopyWith<$Res> {
  _$RollerRequirementModelCopyWithImpl(this._value, this._then);

  final RollerRequirementModel _value;
  // ignore: unused_field
  final $Res Function(RollerRequirementModel) _then;

  @override
  $Res call({
    Object types = freezed,
    Object targets = freezed,
    Object current = freezed,
    Object hasData = freezed,
  }) {
    return _then(_value.copyWith(
      types: types == freezed
          ? _value.types
          : types as List<RollerRequirementType>,
      targets: targets == freezed
          ? _value.targets
          : targets as Map<String, List<RollerRequirementTarget>>,
      current: current == freezed
          ? _value.current
          : current as List<RollerRequirementCurrent>,
      hasData: hasData == freezed ? _value.hasData : hasData as bool,
    ));
  }
}

/// @nodoc
abstract class _$RollerRequirementModelCopyWith<$Res>
    implements $RollerRequirementModelCopyWith<$Res> {
  factory _$RollerRequirementModelCopyWith(_RollerRequirementModel value,
          $Res Function(_RollerRequirementModel) then) =
      __$RollerRequirementModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'type', fromJson: decodeRollerRequirementType)
          List<RollerRequirementType> types,
      @JsonKey(name: 'target', fromJson: decodeRollerRequirementTarget)
          Map<String, List<RollerRequirementTarget>> targets,
      @JsonKey(name: 'current', fromJson: decodeRollerRequirementCurrent)
          List<RollerRequirementCurrent> current,
      @nullable
          bool hasData});
}

/// @nodoc
class __$RollerRequirementModelCopyWithImpl<$Res>
    extends _$RollerRequirementModelCopyWithImpl<$Res>
    implements _$RollerRequirementModelCopyWith<$Res> {
  __$RollerRequirementModelCopyWithImpl(_RollerRequirementModel _value,
      $Res Function(_RollerRequirementModel) _then)
      : super(_value, (v) => _then(v as _RollerRequirementModel));

  @override
  _RollerRequirementModel get _value => super._value as _RollerRequirementModel;

  @override
  $Res call({
    Object types = freezed,
    Object targets = freezed,
    Object current = freezed,
    Object hasData = freezed,
  }) {
    return _then(_RollerRequirementModel(
      types: types == freezed
          ? _value.types
          : types as List<RollerRequirementType>,
      targets: targets == freezed
          ? _value.targets
          : targets as Map<String, List<RollerRequirementTarget>>,
      current: current == freezed
          ? _value.current
          : current as List<RollerRequirementCurrent>,
      hasData: hasData == freezed ? _value.hasData : hasData as bool,
    ));
  }
}

/// @nodoc
class _$_RollerRequirementModel implements _RollerRequirementModel {
  const _$_RollerRequirementModel(
      {@JsonKey(name: 'type', fromJson: decodeRollerRequirementType)
          this.types,
      @JsonKey(name: 'target', fromJson: decodeRollerRequirementTarget)
          this.targets,
      @JsonKey(name: 'current', fromJson: decodeRollerRequirementCurrent)
          this.current,
      @nullable
          this.hasData = true});

  @override
  @JsonKey(name: 'type', fromJson: decodeRollerRequirementType)
  final List<RollerRequirementType> types;
  @override
  @JsonKey(name: 'target', fromJson: decodeRollerRequirementTarget)
  final Map<String, List<RollerRequirementTarget>> targets;
  @override
  @JsonKey(name: 'current', fromJson: decodeRollerRequirementCurrent)
  final List<RollerRequirementCurrent> current;
  @JsonKey(defaultValue: true)
  @override
  @nullable
  final bool hasData;

  @override
  String toString() {
    return 'RollerRequirementModel(types: $types, targets: $targets, current: $current, hasData: $hasData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RollerRequirementModel &&
            (identical(other.types, types) ||
                const DeepCollectionEquality().equals(other.types, types)) &&
            (identical(other.targets, targets) ||
                const DeepCollectionEquality()
                    .equals(other.targets, targets)) &&
            (identical(other.current, current) ||
                const DeepCollectionEquality()
                    .equals(other.current, current)) &&
            (identical(other.hasData, hasData) ||
                const DeepCollectionEquality().equals(other.hasData, hasData)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(types) ^
      const DeepCollectionEquality().hash(targets) ^
      const DeepCollectionEquality().hash(current) ^
      const DeepCollectionEquality().hash(hasData);

  @override
  _$RollerRequirementModelCopyWith<_RollerRequirementModel> get copyWith =>
      __$RollerRequirementModelCopyWithImpl<_RollerRequirementModel>(
          this, _$identity);
}

abstract class _RollerRequirementModel implements RollerRequirementModel {
  const factory _RollerRequirementModel(
      {@JsonKey(name: 'type', fromJson: decodeRollerRequirementType)
          List<RollerRequirementType> types,
      @JsonKey(name: 'target', fromJson: decodeRollerRequirementTarget)
          Map<String, List<RollerRequirementTarget>> targets,
      @JsonKey(name: 'current', fromJson: decodeRollerRequirementCurrent)
          List<RollerRequirementCurrent> current,
      @nullable
          bool hasData}) = _$_RollerRequirementModel;

  @override
  @JsonKey(name: 'type', fromJson: decodeRollerRequirementType)
  List<RollerRequirementType> get types;
  @override
  @JsonKey(name: 'target', fromJson: decodeRollerRequirementTarget)
  Map<String, List<RollerRequirementTarget>> get targets;
  @override
  @JsonKey(name: 'current', fromJson: decodeRollerRequirementCurrent)
  List<RollerRequirementCurrent> get current;
  @override
  @nullable
  bool get hasData;
  @override
  _$RollerRequirementModelCopyWith<_RollerRequirementModel> get copyWith;
}
