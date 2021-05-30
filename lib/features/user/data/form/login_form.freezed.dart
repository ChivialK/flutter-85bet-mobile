// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'login_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$LoginFormTearOff {
  const _$LoginFormTearOff();

// ignore: unused_element
  _LoginForm call(
      {@JsonKey(name: 'accountcode') String account,
      String password,
      @JsonKey(name: 'key') String captchaKey,
      @JsonKey(name: 'captcha') String captchaAns}) {
    return _LoginForm(
      account: account,
      password: password,
      captchaKey: captchaKey,
      captchaAns: captchaAns,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $LoginForm = _$LoginFormTearOff();

/// @nodoc
mixin _$LoginForm {
  @JsonKey(name: 'accountcode')
  String get account;
  String get password;
  @JsonKey(name: 'key')
  String get captchaKey;
  @JsonKey(name: 'captcha')
  String get captchaAns;

  $LoginFormCopyWith<LoginForm> get copyWith;
}

/// @nodoc
abstract class $LoginFormCopyWith<$Res> {
  factory $LoginFormCopyWith(LoginForm value, $Res Function(LoginForm) then) =
      _$LoginFormCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'accountcode') String account,
      String password,
      @JsonKey(name: 'key') String captchaKey,
      @JsonKey(name: 'captcha') String captchaAns});
}

/// @nodoc
class _$LoginFormCopyWithImpl<$Res> implements $LoginFormCopyWith<$Res> {
  _$LoginFormCopyWithImpl(this._value, this._then);

  final LoginForm _value;
  // ignore: unused_field
  final $Res Function(LoginForm) _then;

  @override
  $Res call({
    Object account = freezed,
    Object password = freezed,
    Object captchaKey = freezed,
    Object captchaAns = freezed,
  }) {
    return _then(_value.copyWith(
      account: account == freezed ? _value.account : account as String,
      password: password == freezed ? _value.password : password as String,
      captchaKey:
          captchaKey == freezed ? _value.captchaKey : captchaKey as String,
      captchaAns:
          captchaAns == freezed ? _value.captchaAns : captchaAns as String,
    ));
  }
}

/// @nodoc
abstract class _$LoginFormCopyWith<$Res> implements $LoginFormCopyWith<$Res> {
  factory _$LoginFormCopyWith(
          _LoginForm value, $Res Function(_LoginForm) then) =
      __$LoginFormCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'accountcode') String account,
      String password,
      @JsonKey(name: 'key') String captchaKey,
      @JsonKey(name: 'captcha') String captchaAns});
}

/// @nodoc
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
    Object captchaKey = freezed,
    Object captchaAns = freezed,
  }) {
    return _then(_LoginForm(
      account: account == freezed ? _value.account : account as String,
      password: password == freezed ? _value.password : password as String,
      captchaKey:
          captchaKey == freezed ? _value.captchaKey : captchaKey as String,
      captchaAns:
          captchaAns == freezed ? _value.captchaAns : captchaAns as String,
    ));
  }
}

/// @nodoc
class _$_LoginForm implements _LoginForm {
  const _$_LoginForm(
      {@JsonKey(name: 'accountcode') this.account,
      this.password,
      @JsonKey(name: 'key') this.captchaKey,
      @JsonKey(name: 'captcha') this.captchaAns});

  @override
  @JsonKey(name: 'accountcode')
  final String account;
  @override
  final String password;
  @override
  @JsonKey(name: 'key')
  final String captchaKey;
  @override
  @JsonKey(name: 'captcha')
  final String captchaAns;

  @override
  String toString() {
    return 'LoginForm(account: $account, password: $password, captchaKey: $captchaKey, captchaAns: $captchaAns)';
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
                    .equals(other.password, password)) &&
            (identical(other.captchaKey, captchaKey) ||
                const DeepCollectionEquality()
                    .equals(other.captchaKey, captchaKey)) &&
            (identical(other.captchaAns, captchaAns) ||
                const DeepCollectionEquality()
                    .equals(other.captchaAns, captchaAns)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(account) ^
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(captchaKey) ^
      const DeepCollectionEquality().hash(captchaAns);

  @override
  _$LoginFormCopyWith<_LoginForm> get copyWith =>
      __$LoginFormCopyWithImpl<_LoginForm>(this, _$identity);
}

abstract class _LoginForm implements LoginForm {
  const factory _LoginForm(
      {@JsonKey(name: 'accountcode') String account,
      String password,
      @JsonKey(name: 'key') String captchaKey,
      @JsonKey(name: 'captcha') String captchaAns}) = _$_LoginForm;

  @override
  @JsonKey(name: 'accountcode')
  String get account;
  @override
  String get password;
  @override
  @JsonKey(name: 'key')
  String get captchaKey;
  @override
  @JsonKey(name: 'captcha')
  String get captchaAns;
  @override
  _$LoginFormCopyWith<_LoginForm> get copyWith;
}

/// @nodoc
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

/// @nodoc
// ignore: unused_element
const $LoginHiveForm = _$LoginHiveFormTearOff();

/// @nodoc
mixin _$LoginHiveForm {
  @HiveField(0)
  String get account;
  @HiveField(1)
  String get password;
  @HiveField(2)
  bool get fastLogin;

  $LoginHiveFormCopyWith<LoginHiveForm> get copyWith;
}

/// @nodoc
abstract class $LoginHiveFormCopyWith<$Res> {
  factory $LoginHiveFormCopyWith(
          LoginHiveForm value, $Res Function(LoginHiveForm) then) =
      _$LoginHiveFormCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) String account,
      @HiveField(1) String password,
      @HiveField(2) bool fastLogin});
}

/// @nodoc
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

/// @nodoc
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

/// @nodoc
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

/// @nodoc
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
