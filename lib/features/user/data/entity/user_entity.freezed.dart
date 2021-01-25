// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'user_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$UserEntityTearOff {
  const _$UserEntityTearOff();

// ignore: unused_element
  _UserEntity call(
      {@required String account, @required String credit, @required int vip}) {
    return _UserEntity(
      account: account,
      credit: credit,
      vip: vip,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $UserEntity = _$UserEntityTearOff();

/// @nodoc
mixin _$UserEntity {
  String get account;
  String get credit;
  int get vip;

  @JsonKey(ignore: true)
  $UserEntityCopyWith<UserEntity> get copyWith;
}

/// @nodoc
abstract class $UserEntityCopyWith<$Res> {
  factory $UserEntityCopyWith(
          UserEntity value, $Res Function(UserEntity) then) =
      _$UserEntityCopyWithImpl<$Res>;
  $Res call({String account, String credit, int vip});
}

/// @nodoc
class _$UserEntityCopyWithImpl<$Res> implements $UserEntityCopyWith<$Res> {
  _$UserEntityCopyWithImpl(this._value, this._then);

  final UserEntity _value;
  // ignore: unused_field
  final $Res Function(UserEntity) _then;

  @override
  $Res call({
    Object account = freezed,
    Object credit = freezed,
    Object vip = freezed,
  }) {
    return _then(_value.copyWith(
      account: account == freezed ? _value.account : account as String,
      credit: credit == freezed ? _value.credit : credit as String,
      vip: vip == freezed ? _value.vip : vip as int,
    ));
  }
}

/// @nodoc
abstract class _$UserEntityCopyWith<$Res> implements $UserEntityCopyWith<$Res> {
  factory _$UserEntityCopyWith(
          _UserEntity value, $Res Function(_UserEntity) then) =
      __$UserEntityCopyWithImpl<$Res>;
  @override
  $Res call({String account, String credit, int vip});
}

/// @nodoc
class __$UserEntityCopyWithImpl<$Res> extends _$UserEntityCopyWithImpl<$Res>
    implements _$UserEntityCopyWith<$Res> {
  __$UserEntityCopyWithImpl(
      _UserEntity _value, $Res Function(_UserEntity) _then)
      : super(_value, (v) => _then(v as _UserEntity));

  @override
  _UserEntity get _value => super._value as _UserEntity;

  @override
  $Res call({
    Object account = freezed,
    Object credit = freezed,
    Object vip = freezed,
  }) {
    return _then(_UserEntity(
      account: account == freezed ? _value.account : account as String,
      credit: credit == freezed ? _value.credit : credit as String,
      vip: vip == freezed ? _value.vip : vip as int,
    ));
  }
}

/// @nodoc
class _$_UserEntity implements _UserEntity {
  const _$_UserEntity(
      {@required this.account, @required this.credit, @required this.vip})
      : assert(account != null),
        assert(credit != null),
        assert(vip != null);

  @override
  final String account;
  @override
  final String credit;
  @override
  final int vip;

  @override
  String toString() {
    return 'UserEntity(account: $account, credit: $credit, vip: $vip)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserEntity &&
            (identical(other.account, account) ||
                const DeepCollectionEquality()
                    .equals(other.account, account)) &&
            (identical(other.credit, credit) ||
                const DeepCollectionEquality().equals(other.credit, credit)) &&
            (identical(other.vip, vip) ||
                const DeepCollectionEquality().equals(other.vip, vip)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(account) ^
      const DeepCollectionEquality().hash(credit) ^
      const DeepCollectionEquality().hash(vip);

  @JsonKey(ignore: true)
  @override
  _$UserEntityCopyWith<_UserEntity> get copyWith =>
      __$UserEntityCopyWithImpl<_UserEntity>(this, _$identity);
}

abstract class _UserEntity implements UserEntity {
  const factory _UserEntity(
      {@required String account,
      @required String credit,
      @required int vip}) = _$_UserEntity;

  @override
  String get account;
  @override
  String get credit;
  @override
  int get vip;
  @override
  @JsonKey(ignore: true)
  _$UserEntityCopyWith<_UserEntity> get copyWith;
}
