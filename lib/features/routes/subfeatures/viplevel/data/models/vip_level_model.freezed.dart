// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'vip_level_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$VipLevelModelTearOff {
  const _$VipLevelModelTearOff();

// ignore: unused_element
  _VipLevelModel call(
      {@JsonKey(name: 'level', fromJson: decodeVipLevelName)
          List<VipLevelName> levels,
      @JsonKey(name: 'option', fromJson: decodeVipLevelOption)
          List<VipLevelOption> options,
      @JsonKey(name: 'vip')
          Map<String, dynamic> rules}) {
    return _VipLevelModel(
      levels: levels,
      options: options,
      rules: rules,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $VipLevelModel = _$VipLevelModelTearOff();

/// @nodoc
mixin _$VipLevelModel {
  @JsonKey(name: 'level', fromJson: decodeVipLevelName)
  List<VipLevelName> get levels;
  @JsonKey(name: 'option', fromJson: decodeVipLevelOption)
  List<VipLevelOption> get options;
  @JsonKey(name: 'vip')
  Map<String, dynamic> get rules;

  @JsonKey(ignore: true)
  $VipLevelModelCopyWith<VipLevelModel> get copyWith;
}

/// @nodoc
abstract class $VipLevelModelCopyWith<$Res> {
  factory $VipLevelModelCopyWith(
          VipLevelModel value, $Res Function(VipLevelModel) then) =
      _$VipLevelModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'level', fromJson: decodeVipLevelName)
          List<VipLevelName> levels,
      @JsonKey(name: 'option', fromJson: decodeVipLevelOption)
          List<VipLevelOption> options,
      @JsonKey(name: 'vip')
          Map<String, dynamic> rules});
}

/// @nodoc
class _$VipLevelModelCopyWithImpl<$Res>
    implements $VipLevelModelCopyWith<$Res> {
  _$VipLevelModelCopyWithImpl(this._value, this._then);

  final VipLevelModel _value;
  // ignore: unused_field
  final $Res Function(VipLevelModel) _then;

  @override
  $Res call({
    Object levels = freezed,
    Object options = freezed,
    Object rules = freezed,
  }) {
    return _then(_value.copyWith(
      levels: levels == freezed ? _value.levels : levels as List<VipLevelName>,
      options:
          options == freezed ? _value.options : options as List<VipLevelOption>,
      rules: rules == freezed ? _value.rules : rules as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
abstract class _$VipLevelModelCopyWith<$Res>
    implements $VipLevelModelCopyWith<$Res> {
  factory _$VipLevelModelCopyWith(
          _VipLevelModel value, $Res Function(_VipLevelModel) then) =
      __$VipLevelModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'level', fromJson: decodeVipLevelName)
          List<VipLevelName> levels,
      @JsonKey(name: 'option', fromJson: decodeVipLevelOption)
          List<VipLevelOption> options,
      @JsonKey(name: 'vip')
          Map<String, dynamic> rules});
}

/// @nodoc
class __$VipLevelModelCopyWithImpl<$Res>
    extends _$VipLevelModelCopyWithImpl<$Res>
    implements _$VipLevelModelCopyWith<$Res> {
  __$VipLevelModelCopyWithImpl(
      _VipLevelModel _value, $Res Function(_VipLevelModel) _then)
      : super(_value, (v) => _then(v as _VipLevelModel));

  @override
  _VipLevelModel get _value => super._value as _VipLevelModel;

  @override
  $Res call({
    Object levels = freezed,
    Object options = freezed,
    Object rules = freezed,
  }) {
    return _then(_VipLevelModel(
      levels: levels == freezed ? _value.levels : levels as List<VipLevelName>,
      options:
          options == freezed ? _value.options : options as List<VipLevelOption>,
      rules: rules == freezed ? _value.rules : rules as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
class _$_VipLevelModel implements _VipLevelModel {
  const _$_VipLevelModel(
      {@JsonKey(name: 'level', fromJson: decodeVipLevelName) this.levels,
      @JsonKey(name: 'option', fromJson: decodeVipLevelOption) this.options,
      @JsonKey(name: 'vip') this.rules});

  @override
  @JsonKey(name: 'level', fromJson: decodeVipLevelName)
  final List<VipLevelName> levels;
  @override
  @JsonKey(name: 'option', fromJson: decodeVipLevelOption)
  final List<VipLevelOption> options;
  @override
  @JsonKey(name: 'vip')
  final Map<String, dynamic> rules;

  @override
  String toString() {
    return 'VipLevelModel(levels: $levels, options: $options, rules: $rules)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _VipLevelModel &&
            (identical(other.levels, levels) ||
                const DeepCollectionEquality().equals(other.levels, levels)) &&
            (identical(other.options, options) ||
                const DeepCollectionEquality()
                    .equals(other.options, options)) &&
            (identical(other.rules, rules) ||
                const DeepCollectionEquality().equals(other.rules, rules)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(levels) ^
      const DeepCollectionEquality().hash(options) ^
      const DeepCollectionEquality().hash(rules);

  @JsonKey(ignore: true)
  @override
  _$VipLevelModelCopyWith<_VipLevelModel> get copyWith =>
      __$VipLevelModelCopyWithImpl<_VipLevelModel>(this, _$identity);
}

abstract class _VipLevelModel implements VipLevelModel {
  const factory _VipLevelModel(
      {@JsonKey(name: 'level', fromJson: decodeVipLevelName)
          List<VipLevelName> levels,
      @JsonKey(name: 'option', fromJson: decodeVipLevelOption)
          List<VipLevelOption> options,
      @JsonKey(name: 'vip')
          Map<String, dynamic> rules}) = _$_VipLevelModel;

  @override
  @JsonKey(name: 'level', fromJson: decodeVipLevelName)
  List<VipLevelName> get levels;
  @override
  @JsonKey(name: 'option', fromJson: decodeVipLevelOption)
  List<VipLevelOption> get options;
  @override
  @JsonKey(name: 'vip')
  Map<String, dynamic> get rules;
  @override
  @JsonKey(ignore: true)
  _$VipLevelModelCopyWith<_VipLevelModel> get copyWith;
}

/// @nodoc
class _$VipLevelNameTearOff {
  const _$VipLevelNameTearOff();

// ignore: unused_element
  _VipLevelName call({String key, String title, String img}) {
    return _VipLevelName(
      key: key,
      title: title,
      img: img,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $VipLevelName = _$VipLevelNameTearOff();

/// @nodoc
mixin _$VipLevelName {
  String get key;
  String get title;
  String get img;

  @JsonKey(ignore: true)
  $VipLevelNameCopyWith<VipLevelName> get copyWith;
}

/// @nodoc
abstract class $VipLevelNameCopyWith<$Res> {
  factory $VipLevelNameCopyWith(
          VipLevelName value, $Res Function(VipLevelName) then) =
      _$VipLevelNameCopyWithImpl<$Res>;
  $Res call({String key, String title, String img});
}

/// @nodoc
class _$VipLevelNameCopyWithImpl<$Res> implements $VipLevelNameCopyWith<$Res> {
  _$VipLevelNameCopyWithImpl(this._value, this._then);

  final VipLevelName _value;
  // ignore: unused_field
  final $Res Function(VipLevelName) _then;

  @override
  $Res call({
    Object key = freezed,
    Object title = freezed,
    Object img = freezed,
  }) {
    return _then(_value.copyWith(
      key: key == freezed ? _value.key : key as String,
      title: title == freezed ? _value.title : title as String,
      img: img == freezed ? _value.img : img as String,
    ));
  }
}

/// @nodoc
abstract class _$VipLevelNameCopyWith<$Res>
    implements $VipLevelNameCopyWith<$Res> {
  factory _$VipLevelNameCopyWith(
          _VipLevelName value, $Res Function(_VipLevelName) then) =
      __$VipLevelNameCopyWithImpl<$Res>;
  @override
  $Res call({String key, String title, String img});
}

/// @nodoc
class __$VipLevelNameCopyWithImpl<$Res> extends _$VipLevelNameCopyWithImpl<$Res>
    implements _$VipLevelNameCopyWith<$Res> {
  __$VipLevelNameCopyWithImpl(
      _VipLevelName _value, $Res Function(_VipLevelName) _then)
      : super(_value, (v) => _then(v as _VipLevelName));

  @override
  _VipLevelName get _value => super._value as _VipLevelName;

  @override
  $Res call({
    Object key = freezed,
    Object title = freezed,
    Object img = freezed,
  }) {
    return _then(_VipLevelName(
      key: key == freezed ? _value.key : key as String,
      title: title == freezed ? _value.title : title as String,
      img: img == freezed ? _value.img : img as String,
    ));
  }
}

/// @nodoc
class _$_VipLevelName implements _VipLevelName {
  const _$_VipLevelName({this.key, this.title, this.img});

  @override
  final String key;
  @override
  final String title;
  @override
  final String img;

  @override
  String toString() {
    return 'VipLevelName(key: $key, title: $title, img: $img)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _VipLevelName &&
            (identical(other.key, key) ||
                const DeepCollectionEquality().equals(other.key, key)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.img, img) ||
                const DeepCollectionEquality().equals(other.img, img)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(key) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(img);

  @JsonKey(ignore: true)
  @override
  _$VipLevelNameCopyWith<_VipLevelName> get copyWith =>
      __$VipLevelNameCopyWithImpl<_VipLevelName>(this, _$identity);
}

abstract class _VipLevelName implements VipLevelName {
  const factory _VipLevelName({String key, String title, String img}) =
      _$_VipLevelName;

  @override
  String get key;
  @override
  String get title;
  @override
  String get img;
  @override
  @JsonKey(ignore: true)
  _$VipLevelNameCopyWith<_VipLevelName> get copyWith;
}

/// @nodoc
class _$VipLevelOptionTearOff {
  const _$VipLevelOptionTearOff();

// ignore: unused_element
  _VipLevelOption call({String key, String name, String ch, String type}) {
    return _VipLevelOption(
      key: key,
      name: name,
      ch: ch,
      type: type,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $VipLevelOption = _$VipLevelOptionTearOff();

/// @nodoc
mixin _$VipLevelOption {
  String get key;
  String get name;
  String get ch;
  String get type;

  @JsonKey(ignore: true)
  $VipLevelOptionCopyWith<VipLevelOption> get copyWith;
}

/// @nodoc
abstract class $VipLevelOptionCopyWith<$Res> {
  factory $VipLevelOptionCopyWith(
          VipLevelOption value, $Res Function(VipLevelOption) then) =
      _$VipLevelOptionCopyWithImpl<$Res>;
  $Res call({String key, String name, String ch, String type});
}

/// @nodoc
class _$VipLevelOptionCopyWithImpl<$Res>
    implements $VipLevelOptionCopyWith<$Res> {
  _$VipLevelOptionCopyWithImpl(this._value, this._then);

  final VipLevelOption _value;
  // ignore: unused_field
  final $Res Function(VipLevelOption) _then;

  @override
  $Res call({
    Object key = freezed,
    Object name = freezed,
    Object ch = freezed,
    Object type = freezed,
  }) {
    return _then(_value.copyWith(
      key: key == freezed ? _value.key : key as String,
      name: name == freezed ? _value.name : name as String,
      ch: ch == freezed ? _value.ch : ch as String,
      type: type == freezed ? _value.type : type as String,
    ));
  }
}

/// @nodoc
abstract class _$VipLevelOptionCopyWith<$Res>
    implements $VipLevelOptionCopyWith<$Res> {
  factory _$VipLevelOptionCopyWith(
          _VipLevelOption value, $Res Function(_VipLevelOption) then) =
      __$VipLevelOptionCopyWithImpl<$Res>;
  @override
  $Res call({String key, String name, String ch, String type});
}

/// @nodoc
class __$VipLevelOptionCopyWithImpl<$Res>
    extends _$VipLevelOptionCopyWithImpl<$Res>
    implements _$VipLevelOptionCopyWith<$Res> {
  __$VipLevelOptionCopyWithImpl(
      _VipLevelOption _value, $Res Function(_VipLevelOption) _then)
      : super(_value, (v) => _then(v as _VipLevelOption));

  @override
  _VipLevelOption get _value => super._value as _VipLevelOption;

  @override
  $Res call({
    Object key = freezed,
    Object name = freezed,
    Object ch = freezed,
    Object type = freezed,
  }) {
    return _then(_VipLevelOption(
      key: key == freezed ? _value.key : key as String,
      name: name == freezed ? _value.name : name as String,
      ch: ch == freezed ? _value.ch : ch as String,
      type: type == freezed ? _value.type : type as String,
    ));
  }
}

/// @nodoc
class _$_VipLevelOption implements _VipLevelOption {
  const _$_VipLevelOption({this.key, this.name, this.ch, this.type});

  @override
  final String key;
  @override
  final String name;
  @override
  final String ch;
  @override
  final String type;

  @override
  String toString() {
    return 'VipLevelOption(key: $key, name: $name, ch: $ch, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _VipLevelOption &&
            (identical(other.key, key) ||
                const DeepCollectionEquality().equals(other.key, key)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.ch, ch) ||
                const DeepCollectionEquality().equals(other.ch, ch)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(key) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(ch) ^
      const DeepCollectionEquality().hash(type);

  @JsonKey(ignore: true)
  @override
  _$VipLevelOptionCopyWith<_VipLevelOption> get copyWith =>
      __$VipLevelOptionCopyWithImpl<_VipLevelOption>(this, _$identity);
}

abstract class _VipLevelOption implements VipLevelOption {
  const factory _VipLevelOption(
      {String key, String name, String ch, String type}) = _$_VipLevelOption;

  @override
  String get key;
  @override
  String get name;
  @override
  String get ch;
  @override
  String get type;
  @override
  @JsonKey(ignore: true)
  _$VipLevelOptionCopyWith<_VipLevelOption> get copyWith;
}
