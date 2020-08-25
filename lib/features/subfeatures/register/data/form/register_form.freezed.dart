// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'register_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$RegisterFormTearOff {
  const _$RegisterFormTearOff();

// ignore: unused_element
  _RegisterForm call(
      {@required String username,
      @required String password,
      @required String confirmPassword,
      String intro,
      String mobileno,
      String code}) {
    return _RegisterForm(
      username: username,
      password: password,
      confirmPassword: confirmPassword,
      intro: intro,
      mobileno: mobileno,
      code: code,
    );
  }
}

// ignore: unused_element
const $RegisterForm = _$RegisterFormTearOff();

mixin _$RegisterForm {
  String get username;
  String get password;
  String get confirmPassword;
  String get intro;
  String get mobileno;
  String get code;

  $RegisterFormCopyWith<RegisterForm> get copyWith;
}

abstract class $RegisterFormCopyWith<$Res> {
  factory $RegisterFormCopyWith(
          RegisterForm value, $Res Function(RegisterForm) then) =
      _$RegisterFormCopyWithImpl<$Res>;
  $Res call(
      {String username,
      String password,
      String confirmPassword,
      String intro,
      String mobileno,
      String code});
}

class _$RegisterFormCopyWithImpl<$Res> implements $RegisterFormCopyWith<$Res> {
  _$RegisterFormCopyWithImpl(this._value, this._then);

  final RegisterForm _value;
  // ignore: unused_field
  final $Res Function(RegisterForm) _then;

  @override
  $Res call({
    Object username = freezed,
    Object password = freezed,
    Object confirmPassword = freezed,
    Object intro = freezed,
    Object mobileno = freezed,
    Object code = freezed,
  }) {
    return _then(_value.copyWith(
      username: username == freezed ? _value.username : username as String,
      password: password == freezed ? _value.password : password as String,
      confirmPassword: confirmPassword == freezed
          ? _value.confirmPassword
          : confirmPassword as String,
      intro: intro == freezed ? _value.intro : intro as String,
      mobileno: mobileno == freezed ? _value.mobileno : mobileno as String,
      code: code == freezed ? _value.code : code as String,
    ));
  }
}

abstract class _$RegisterFormCopyWith<$Res>
    implements $RegisterFormCopyWith<$Res> {
  factory _$RegisterFormCopyWith(
          _RegisterForm value, $Res Function(_RegisterForm) then) =
      __$RegisterFormCopyWithImpl<$Res>;
  @override
  $Res call(
      {String username,
      String password,
      String confirmPassword,
      String intro,
      String mobileno,
      String code});
}

class __$RegisterFormCopyWithImpl<$Res> extends _$RegisterFormCopyWithImpl<$Res>
    implements _$RegisterFormCopyWith<$Res> {
  __$RegisterFormCopyWithImpl(
      _RegisterForm _value, $Res Function(_RegisterForm) _then)
      : super(_value, (v) => _then(v as _RegisterForm));

  @override
  _RegisterForm get _value => super._value as _RegisterForm;

  @override
  $Res call({
    Object username = freezed,
    Object password = freezed,
    Object confirmPassword = freezed,
    Object intro = freezed,
    Object mobileno = freezed,
    Object code = freezed,
  }) {
    return _then(_RegisterForm(
      username: username == freezed ? _value.username : username as String,
      password: password == freezed ? _value.password : password as String,
      confirmPassword: confirmPassword == freezed
          ? _value.confirmPassword
          : confirmPassword as String,
      intro: intro == freezed ? _value.intro : intro as String,
      mobileno: mobileno == freezed ? _value.mobileno : mobileno as String,
      code: code == freezed ? _value.code : code as String,
    ));
  }
}

class _$_RegisterForm implements _RegisterForm {
  const _$_RegisterForm(
      {@required this.username,
      @required this.password,
      @required this.confirmPassword,
      this.intro,
      this.mobileno,
      this.code})
      : assert(username != null),
        assert(password != null),
        assert(confirmPassword != null);

  @override
  final String username;
  @override
  final String password;
  @override
  final String confirmPassword;
  @override
  final String intro;
  @override
  final String mobileno;
  @override
  final String code;

  @override
  String toString() {
    return 'RegisterForm(username: $username, password: $password, confirmPassword: $confirmPassword, intro: $intro, mobileno: $mobileno, code: $code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RegisterForm &&
            (identical(other.username, username) ||
                const DeepCollectionEquality()
                    .equals(other.username, username)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)) &&
            (identical(other.confirmPassword, confirmPassword) ||
                const DeepCollectionEquality()
                    .equals(other.confirmPassword, confirmPassword)) &&
            (identical(other.intro, intro) ||
                const DeepCollectionEquality().equals(other.intro, intro)) &&
            (identical(other.mobileno, mobileno) ||
                const DeepCollectionEquality()
                    .equals(other.mobileno, mobileno)) &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(username) ^
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(confirmPassword) ^
      const DeepCollectionEquality().hash(intro) ^
      const DeepCollectionEquality().hash(mobileno) ^
      const DeepCollectionEquality().hash(code);

  @override
  _$RegisterFormCopyWith<_RegisterForm> get copyWith =>
      __$RegisterFormCopyWithImpl<_RegisterForm>(this, _$identity);
}

abstract class _RegisterForm implements RegisterForm {
  const factory _RegisterForm(
      {@required String username,
      @required String password,
      @required String confirmPassword,
      String intro,
      String mobileno,
      String code}) = _$_RegisterForm;

  @override
  String get username;
  @override
  String get password;
  @override
  String get confirmPassword;
  @override
  String get intro;
  @override
  String get mobileno;
  @override
  String get code;
  @override
  _$RegisterFormCopyWith<_RegisterForm> get copyWith;
}
