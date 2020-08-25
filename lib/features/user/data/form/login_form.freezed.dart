// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'login_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$LoginFormTearOff {
  const _$LoginFormTearOff();

// ignore: unused_element
  _LoginForm call(
      {@JsonKey(name: 'accountcode') String account, String password}) {
    return _LoginForm(
      account: account,
      password: password,
    );
  }
}

// ignore: unused_element
const $LoginForm = _$LoginFormTearOff();

mixin _$LoginForm {
  @JsonKey(name: 'accountcode')
  String get account;
  String get password;

  $LoginFormCopyWith<LoginForm> get copyWith;
}

abstract class $LoginFormCopyWith<$Res> {
  factory $LoginFormCopyWith(LoginForm value, $Res Function(LoginForm) then) =
      _$LoginFormCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: 'accountcode') String account, String password});
}

class _$LoginFormCopyWithImpl<$Res> implements $LoginFormCopyWith<$Res> {
  _$LoginFormCopyWithImpl(this._value, this._then);

  final LoginForm _value;
  // ignore: unused_field
  final $Res Function(LoginForm) _then;

  @override
  $Res call({
    Object account = freezed,
    Object password = freezed,
  }) {
    return _then(_value.copyWith(
      account: account == freezed ? _value.account : account as String,
      password: password == freezed ? _value.password : password as String,
    ));
  }
}

abstract class _$LoginFormCopyWith<$Res> implements $LoginFormCopyWith<$Res> {
  factory _$LoginFormCopyWith(
          _LoginForm value, $Res Function(_LoginForm) then) =
      __$LoginFormCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'accountcode') String account, String password});
}

class __$LoginFormCopyWithImpl<$Res> extends _$LoginFormCopyWithImpl<$Res>
    implements _$LoginFormCopyWith<$Res> {
  __$LoginFormCopyWithImpl(_LoginForm _value, $Res Function(_LoginForm) _then)
      : super(_value, (v) => _then(v as _LoginForm));

  @override
  _LoginForm get _value => super._value as _LoginForm;

  @override
  $Res call({
    Object account = freezed,
    Object password = freezed,
  }) {
    return _then(_LoginForm(
      account: account == freezed ? _value.account : account as String,
      password: password == freezed ? _value.password : password as String,
    ));
  }
}

class _$_LoginForm implements _LoginForm {
  const _$_LoginForm(
      {@JsonKey(name: 'accountcode') this.account, this.password});

  @override
  @JsonKey(name: 'accountcode')
  final String account;
  @override
  final String password;

  @override
  String toString() {
    return 'LoginForm(account: $account, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LoginForm &&
            (identical(other.account, account) ||
                const DeepCollectionEquality()
                    .equals(other.account, account)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(account) ^
      const DeepCollectionEquality().hash(password);

  @override
  _$LoginFormCopyWith<_LoginForm> get copyWith =>
      __$LoginFormCopyWithImpl<_LoginForm>(this, _$identity);
}

abstract class _LoginForm implements LoginForm {
  const factory _LoginForm(
      {@JsonKey(name: 'accountcode') String account,
      String password}) = _$_LoginForm;

  @override
  @JsonKey(name: 'accountcode')
  String get account;
  @override
  String get password;
  @override
  _$LoginFormCopyWith<_LoginForm> get copyWith;
}

class _$LoginHiveFormTearOff {
  const _$LoginHiveFormTearOff();

// ignore: unused_element
  _LoginHiveForm call(
      {@HiveField(0) String account,
      @HiveField(1) String password,
      @HiveField(2) bool fastLogin = false}) {
    return _LoginHiveForm(
      account: account,
      password: password,
      fastLogin: fastLogin,
    );
  }
}

// ignore: unused_element
const $LoginHiveForm = _$LoginHiveFormTearOff();

mixin _$LoginHiveForm {
  @HiveField(0)
  String get account;
  @HiveField(1)
  String get password;
  @HiveField(2)
  bool get fastLogin;

  $LoginHiveFormCopyWith<LoginHiveForm> get copyWith;
}

abstract class $LoginHiveFormCopyWith<$Res> {
  factory $LoginHiveFormCopyWith(
          LoginHiveForm value, $Res Function(LoginHiveForm) then) =
      _$LoginHiveFormCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) String account,
      @HiveField(1) String password,
      @HiveField(2) bool fastLogin});
}

class _$LoginHiveFormCopyWithImpl<$Res>
    implements $LoginHiveFormCopyWith<$Res> {
  _$LoginHiveFormCopyWithImpl(this._value, this._then);

  final LoginHiveForm _value;
  // ignore: unused_field
  final $Res Function(LoginHiveForm) _then;

  @override
  $Res call({
    Object account = freezed,
    Object password = freezed,
    Object fastLogin = freezed,
  }) {
    return _then(_value.copyWith(
      account: account == freezed ? _value.account : account as String,
      password: password == freezed ? _value.password : password as String,
      fastLogin: fastLogin == freezed ? _value.fastLogin : fastLogin as bool,
    ));
  }
}

abstract class _$LoginHiveFormCopyWith<$Res>
    implements $LoginHiveFormCopyWith<$Res> {
  factory _$LoginHiveFormCopyWith(
          _LoginHiveForm value, $Res Function(_LoginHiveForm) then) =
      __$LoginHiveFormCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) String account,
      @HiveField(1) String password,
      @HiveField(2) bool fastLogin});
}

class __$LoginHiveFormCopyWithImpl<$Res>
    extends _$LoginHiveFormCopyWithImpl<$Res>
    implements _$LoginHiveFormCopyWith<$Res> {
  __$LoginHiveFormCopyWithImpl(
      _LoginHiveForm _value, $Res Function(_LoginHiveForm) _then)
      : super(_value, (v) => _then(v as _LoginHiveForm));

  @override
  _LoginHiveForm get _value => super._value as _LoginHiveForm;

  @override
  $Res call({
    Object account = freezed,
    Object password = freezed,
    Object fastLogin = freezed,
  }) {
    return _then(_LoginHiveForm(
      account: account == freezed ? _value.account : account as String,
      password: password == freezed ? _value.password : password as String,
      fastLogin: fastLogin == freezed ? _value.fastLogin : fastLogin as bool,
    ));
  }
}

@HiveType(typeId: 109)
class _$_LoginHiveForm implements _LoginHiveForm {
  const _$_LoginHiveForm(
      {@HiveField(0) this.account,
      @HiveField(1) this.password,
      @HiveField(2) this.fastLogin = false})
      : assert(fastLogin != null);

  @override
  @HiveField(0)
  final String account;
  @override
  @HiveField(1)
  final String password;
  @JsonKey(defaultValue: false)
  @override
  @HiveField(2)
  final bool fastLogin;

  @override
  String toString() {
    return 'LoginHiveForm(account: $account, password: $password, fastLogin: $fastLogin)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LoginHiveForm &&
            (identical(other.account, account) ||
                const DeepCollectionEquality()
                    .equals(other.account, account)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)) &&
            (identical(other.fastLogin, fastLogin) ||
                const DeepCollectionEquality()
                    .equals(other.fastLogin, fastLogin)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(account) ^
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(fastLogin);

  @override
  _$LoginHiveFormCopyWith<_LoginHiveForm> get copyWith =>
      __$LoginHiveFormCopyWithImpl<_LoginHiveForm>(this, _$identity);
}

abstract class _LoginHiveForm implements LoginHiveForm {
  const factory _LoginHiveForm(
      {@HiveField(0) String account,
      @HiveField(1) String password,
      @HiveField(2) bool fastLogin}) = _$_LoginHiveForm;

  @override
  @HiveField(0)
  String get account;
  @override
  @HiveField(1)
  String get password;
  @override
  @HiveField(2)
  bool get fastLogin;
  @override
  _$LoginHiveFormCopyWith<_LoginHiveForm> get copyWith;
}
