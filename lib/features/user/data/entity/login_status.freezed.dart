// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'login_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$LoginStatusTearOff {
  const _$LoginStatusTearOff();

// ignore: unused_element
  _LoginStatus call({@required bool loggedIn, UserEntity currentUser}) {
    return _LoginStatus(
      loggedIn: loggedIn,
      currentUser: currentUser,
    );
  }
}

// ignore: unused_element
const $LoginStatus = _$LoginStatusTearOff();

mixin _$LoginStatus {
  bool get loggedIn;
  UserEntity get currentUser;

  $LoginStatusCopyWith<LoginStatus> get copyWith;
}

abstract class $LoginStatusCopyWith<$Res> {
  factory $LoginStatusCopyWith(
          LoginStatus value, $Res Function(LoginStatus) then) =
      _$LoginStatusCopyWithImpl<$Res>;
  $Res call({bool loggedIn, UserEntity currentUser});

  $UserEntityCopyWith<$Res> get currentUser;
}

class _$LoginStatusCopyWithImpl<$Res> implements $LoginStatusCopyWith<$Res> {
  _$LoginStatusCopyWithImpl(this._value, this._then);

  final LoginStatus _value;
  // ignore: unused_field
  final $Res Function(LoginStatus) _then;

  @override
  $Res call({
    Object loggedIn = freezed,
    Object currentUser = freezed,
  }) {
    return _then(_value.copyWith(
      loggedIn: loggedIn == freezed ? _value.loggedIn : loggedIn as bool,
      currentUser: currentUser == freezed
          ? _value.currentUser
          : currentUser as UserEntity,
    ));
  }

  @override
  $UserEntityCopyWith<$Res> get currentUser {
    if (_value.currentUser == null) {
      return null;
    }
    return $UserEntityCopyWith<$Res>(_value.currentUser, (value) {
      return _then(_value.copyWith(currentUser: value));
    });
  }
}

abstract class _$LoginStatusCopyWith<$Res>
    implements $LoginStatusCopyWith<$Res> {
  factory _$LoginStatusCopyWith(
          _LoginStatus value, $Res Function(_LoginStatus) then) =
      __$LoginStatusCopyWithImpl<$Res>;
  @override
  $Res call({bool loggedIn, UserEntity currentUser});

  @override
  $UserEntityCopyWith<$Res> get currentUser;
}

class __$LoginStatusCopyWithImpl<$Res> extends _$LoginStatusCopyWithImpl<$Res>
    implements _$LoginStatusCopyWith<$Res> {
  __$LoginStatusCopyWithImpl(
      _LoginStatus _value, $Res Function(_LoginStatus) _then)
      : super(_value, (v) => _then(v as _LoginStatus));

  @override
  _LoginStatus get _value => super._value as _LoginStatus;

  @override
  $Res call({
    Object loggedIn = freezed,
    Object currentUser = freezed,
  }) {
    return _then(_LoginStatus(
      loggedIn: loggedIn == freezed ? _value.loggedIn : loggedIn as bool,
      currentUser: currentUser == freezed
          ? _value.currentUser
          : currentUser as UserEntity,
    ));
  }
}

class _$_LoginStatus implements _LoginStatus {
  const _$_LoginStatus({@required this.loggedIn, this.currentUser})
      : assert(loggedIn != null);

  @override
  final bool loggedIn;
  @override
  final UserEntity currentUser;

  @override
  String toString() {
    return 'LoginStatus(loggedIn: $loggedIn, currentUser: $currentUser)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LoginStatus &&
            (identical(other.loggedIn, loggedIn) ||
                const DeepCollectionEquality()
                    .equals(other.loggedIn, loggedIn)) &&
            (identical(other.currentUser, currentUser) ||
                const DeepCollectionEquality()
                    .equals(other.currentUser, currentUser)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(loggedIn) ^
      const DeepCollectionEquality().hash(currentUser);

  @override
  _$LoginStatusCopyWith<_LoginStatus> get copyWith =>
      __$LoginStatusCopyWithImpl<_LoginStatus>(this, _$identity);
}

abstract class _LoginStatus implements LoginStatus {
  const factory _LoginStatus(
      {@required bool loggedIn, UserEntity currentUser}) = _$_LoginStatus;

  @override
  bool get loggedIn;
  @override
  UserEntity get currentUser;
  @override
  _$LoginStatusCopyWith<_LoginStatus> get copyWith;
}
