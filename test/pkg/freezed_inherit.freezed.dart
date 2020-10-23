// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'freezed_inherit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
FreezedParent _$FreezedParentFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType'] as String) {
    case 'default':
      return FreezedParentData.fromJson(json);
    case 'child':
      return FreezedChildData.fromJson(json);

    default:
      throw FallThroughError();
  }
}

/// @nodoc
class _$FreezedParentTearOff {
  const _$FreezedParentTearOff();

// ignore: unused_element
  FreezedParentData call({String account, String credit}) {
    return FreezedParentData(
      account: account,
      credit: credit,
    );
  }

// ignore: unused_element
  FreezedChildData child({String account, String credit, String status}) {
    return FreezedChildData(
      account: account,
      credit: credit,
      status: status,
    );
  }

// ignore: unused_element
  FreezedParent fromJson(Map<String, Object> json) {
    return FreezedParent.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $FreezedParent = _$FreezedParentTearOff();

/// @nodoc
mixin _$FreezedParent {
  String get account;
  String get credit;

  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(String account, String credit), {
    @required Result child(String account, String credit, String status),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(String account, String credit), {
    Result child(String account, String credit, String status),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(FreezedParentData value), {
    @required Result child(FreezedChildData value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(FreezedParentData value), {
    Result child(FreezedChildData value),
    @required Result orElse(),
  });
  Map<String, dynamic> toJson();
  $FreezedParentCopyWith<FreezedParent> get copyWith;
}

/// @nodoc
abstract class $FreezedParentCopyWith<$Res> {
  factory $FreezedParentCopyWith(
          FreezedParent value, $Res Function(FreezedParent) then) =
      _$FreezedParentCopyWithImpl<$Res>;
  $Res call({String account, String credit});
}

/// @nodoc
class _$FreezedParentCopyWithImpl<$Res>
    implements $FreezedParentCopyWith<$Res> {
  _$FreezedParentCopyWithImpl(this._value, this._then);

  final FreezedParent _value;
  // ignore: unused_field
  final $Res Function(FreezedParent) _then;

  @override
  $Res call({
    Object account = freezed,
    Object credit = freezed,
  }) {
    return _then(_value.copyWith(
      account: account == freezed ? _value.account : account as String,
      credit: credit == freezed ? _value.credit : credit as String,
    ));
  }
}

/// @nodoc
abstract class $FreezedParentDataCopyWith<$Res>
    implements $FreezedParentCopyWith<$Res> {
  factory $FreezedParentDataCopyWith(
          FreezedParentData value, $Res Function(FreezedParentData) then) =
      _$FreezedParentDataCopyWithImpl<$Res>;
  @override
  $Res call({String account, String credit});
}

/// @nodoc
class _$FreezedParentDataCopyWithImpl<$Res>
    extends _$FreezedParentCopyWithImpl<$Res>
    implements $FreezedParentDataCopyWith<$Res> {
  _$FreezedParentDataCopyWithImpl(
      FreezedParentData _value, $Res Function(FreezedParentData) _then)
      : super(_value, (v) => _then(v as FreezedParentData));

  @override
  FreezedParentData get _value => super._value as FreezedParentData;

  @override
  $Res call({
    Object account = freezed,
    Object credit = freezed,
  }) {
    return _then(FreezedParentData(
      account: account == freezed ? _value.account : account as String,
      credit: credit == freezed ? _value.credit : credit as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$FreezedParentData implements FreezedParentData {
  _$FreezedParentData({this.account, this.credit});

  factory _$FreezedParentData.fromJson(Map<String, dynamic> json) =>
      _$_$FreezedParentDataFromJson(json);

  @override
  final String account;
  @override
  final String credit;

  @override
  String toString() {
    return 'FreezedParent(account: $account, credit: $credit)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FreezedParentData &&
            (identical(other.account, account) ||
                const DeepCollectionEquality()
                    .equals(other.account, account)) &&
            (identical(other.credit, credit) ||
                const DeepCollectionEquality().equals(other.credit, credit)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(account) ^
      const DeepCollectionEquality().hash(credit);

  @override
  $FreezedParentDataCopyWith<FreezedParentData> get copyWith =>
      _$FreezedParentDataCopyWithImpl<FreezedParentData>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(String account, String credit), {
    @required Result child(String account, String credit, String status),
  }) {
    assert($default != null);
    assert(child != null);
    return $default(account, credit);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(String account, String credit), {
    Result child(String account, String credit, String status),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(account, credit);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(FreezedParentData value), {
    @required Result child(FreezedChildData value),
  }) {
    assert($default != null);
    assert(child != null);
    return $default(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(FreezedParentData value), {
    Result child(FreezedChildData value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$FreezedParentDataToJson(this)..['runtimeType'] = 'default';
  }

  @override
  String operator [](String key) {
    return account.toString();
  }
}

abstract class FreezedParentData implements FreezedParent {
  factory FreezedParentData({String account, String credit}) =
      _$FreezedParentData;

  factory FreezedParentData.fromJson(Map<String, dynamic> json) =
      _$FreezedParentData.fromJson;

  @override
  String get account;
  @override
  String get credit;
  @override
  $FreezedParentDataCopyWith<FreezedParentData> get copyWith;
}

/// @nodoc
abstract class $FreezedChildDataCopyWith<$Res>
    implements $FreezedParentCopyWith<$Res> {
  factory $FreezedChildDataCopyWith(
          FreezedChildData value, $Res Function(FreezedChildData) then) =
      _$FreezedChildDataCopyWithImpl<$Res>;
  @override
  $Res call({String account, String credit, String status});
}

/// @nodoc
class _$FreezedChildDataCopyWithImpl<$Res>
    extends _$FreezedParentCopyWithImpl<$Res>
    implements $FreezedChildDataCopyWith<$Res> {
  _$FreezedChildDataCopyWithImpl(
      FreezedChildData _value, $Res Function(FreezedChildData) _then)
      : super(_value, (v) => _then(v as FreezedChildData));

  @override
  FreezedChildData get _value => super._value as FreezedChildData;

  @override
  $Res call({
    Object account = freezed,
    Object credit = freezed,
    Object status = freezed,
  }) {
    return _then(FreezedChildData(
      account: account == freezed ? _value.account : account as String,
      credit: credit == freezed ? _value.credit : credit as String,
      status: status == freezed ? _value.status : status as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$FreezedChildData implements FreezedChildData {
  _$FreezedChildData({this.account, this.credit, this.status});

  factory _$FreezedChildData.fromJson(Map<String, dynamic> json) =>
      _$_$FreezedChildDataFromJson(json);

  @override
  final String account;
  @override
  final String credit;
  @override
  final String status;

  @override
  String toString() {
    return 'FreezedParent.child(account: $account, credit: $credit, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FreezedChildData &&
            (identical(other.account, account) ||
                const DeepCollectionEquality()
                    .equals(other.account, account)) &&
            (identical(other.credit, credit) ||
                const DeepCollectionEquality().equals(other.credit, credit)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(account) ^
      const DeepCollectionEquality().hash(credit) ^
      const DeepCollectionEquality().hash(status);

  @override
  $FreezedChildDataCopyWith<FreezedChildData> get copyWith =>
      _$FreezedChildDataCopyWithImpl<FreezedChildData>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(String account, String credit), {
    @required Result child(String account, String credit, String status),
  }) {
    assert($default != null);
    assert(child != null);
    return child(account, credit, status);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(String account, String credit), {
    Result child(String account, String credit, String status),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (child != null) {
      return child(account, credit, status);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(FreezedParentData value), {
    @required Result child(FreezedChildData value),
  }) {
    assert($default != null);
    assert(child != null);
    return child(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(FreezedParentData value), {
    Result child(FreezedChildData value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (child != null) {
      return child(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$FreezedChildDataToJson(this)..['runtimeType'] = 'child';
  }

  @override
  String operator [](String key) {
    return account.toString();
  }
}

abstract class FreezedChildData implements FreezedParent {
  factory FreezedChildData({String account, String credit, String status}) =
      _$FreezedChildData;

  factory FreezedChildData.fromJson(Map<String, dynamic> json) =
      _$FreezedChildData.fromJson;

  @override
  String get account;
  @override
  String get credit;
  String get status;
  @override
  $FreezedChildDataCopyWith<FreezedChildData> get copyWith;
}
