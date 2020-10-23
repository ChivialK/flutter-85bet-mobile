// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'center_password_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$CenterPasswordFormTearOff {
  const _$CenterPasswordFormTearOff();

// ignore: unused_element
  _CenterPasswordForm call(
      {@required @JsonKey(name: 'oldpassword') String oldPwd,
      @required @JsonKey(name: 'newpassword') String newPwd,
      @required @JsonKey(name: 'conpassword') String confirmPwd}) {
    return _CenterPasswordForm(
      oldPwd: oldPwd,
      newPwd: newPwd,
      confirmPwd: confirmPwd,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $CenterPasswordForm = _$CenterPasswordFormTearOff();

/// @nodoc
mixin _$CenterPasswordForm {
  @JsonKey(name: 'oldpassword')
  String get oldPwd;
  @JsonKey(name: 'newpassword')
  String get newPwd;
  @JsonKey(name: 'conpassword')
  String get confirmPwd;

  $CenterPasswordFormCopyWith<CenterPasswordForm> get copyWith;
}

/// @nodoc
abstract class $CenterPasswordFormCopyWith<$Res> {
  factory $CenterPasswordFormCopyWith(
          CenterPasswordForm value, $Res Function(CenterPasswordForm) then) =
      _$CenterPasswordFormCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'oldpassword') String oldPwd,
      @JsonKey(name: 'newpassword') String newPwd,
      @JsonKey(name: 'conpassword') String confirmPwd});
}

/// @nodoc
class _$CenterPasswordFormCopyWithImpl<$Res>
    implements $CenterPasswordFormCopyWith<$Res> {
  _$CenterPasswordFormCopyWithImpl(this._value, this._then);

  final CenterPasswordForm _value;
  // ignore: unused_field
  final $Res Function(CenterPasswordForm) _then;

  @override
  $Res call({
    Object oldPwd = freezed,
    Object newPwd = freezed,
    Object confirmPwd = freezed,
  }) {
    return _then(_value.copyWith(
      oldPwd: oldPwd == freezed ? _value.oldPwd : oldPwd as String,
      newPwd: newPwd == freezed ? _value.newPwd : newPwd as String,
      confirmPwd:
          confirmPwd == freezed ? _value.confirmPwd : confirmPwd as String,
    ));
  }
}

/// @nodoc
abstract class _$CenterPasswordFormCopyWith<$Res>
    implements $CenterPasswordFormCopyWith<$Res> {
  factory _$CenterPasswordFormCopyWith(
          _CenterPasswordForm value, $Res Function(_CenterPasswordForm) then) =
      __$CenterPasswordFormCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'oldpassword') String oldPwd,
      @JsonKey(name: 'newpassword') String newPwd,
      @JsonKey(name: 'conpassword') String confirmPwd});
}

/// @nodoc
class __$CenterPasswordFormCopyWithImpl<$Res>
    extends _$CenterPasswordFormCopyWithImpl<$Res>
    implements _$CenterPasswordFormCopyWith<$Res> {
  __$CenterPasswordFormCopyWithImpl(
      _CenterPasswordForm _value, $Res Function(_CenterPasswordForm) _then)
      : super(_value, (v) => _then(v as _CenterPasswordForm));

  @override
  _CenterPasswordForm get _value => super._value as _CenterPasswordForm;

  @override
  $Res call({
    Object oldPwd = freezed,
    Object newPwd = freezed,
    Object confirmPwd = freezed,
  }) {
    return _then(_CenterPasswordForm(
      oldPwd: oldPwd == freezed ? _value.oldPwd : oldPwd as String,
      newPwd: newPwd == freezed ? _value.newPwd : newPwd as String,
      confirmPwd:
          confirmPwd == freezed ? _value.confirmPwd : confirmPwd as String,
    ));
  }
}

/// @nodoc
class _$_CenterPasswordForm implements _CenterPasswordForm {
  const _$_CenterPasswordForm(
      {@required @JsonKey(name: 'oldpassword') this.oldPwd,
      @required @JsonKey(name: 'newpassword') this.newPwd,
      @required @JsonKey(name: 'conpassword') this.confirmPwd})
      : assert(oldPwd != null),
        assert(newPwd != null),
        assert(confirmPwd != null);

  @override
  @JsonKey(name: 'oldpassword')
  final String oldPwd;
  @override
  @JsonKey(name: 'newpassword')
  final String newPwd;
  @override
  @JsonKey(name: 'conpassword')
  final String confirmPwd;

  @override
  String toString() {
    return 'CenterPasswordForm(oldPwd: $oldPwd, newPwd: $newPwd, confirmPwd: $confirmPwd)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CenterPasswordForm &&
            (identical(other.oldPwd, oldPwd) ||
                const DeepCollectionEquality().equals(other.oldPwd, oldPwd)) &&
            (identical(other.newPwd, newPwd) ||
                const DeepCollectionEquality().equals(other.newPwd, newPwd)) &&
            (identical(other.confirmPwd, confirmPwd) ||
                const DeepCollectionEquality()
                    .equals(other.confirmPwd, confirmPwd)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(oldPwd) ^
      const DeepCollectionEquality().hash(newPwd) ^
      const DeepCollectionEquality().hash(confirmPwd);

  @override
  _$CenterPasswordFormCopyWith<_CenterPasswordForm> get copyWith =>
      __$CenterPasswordFormCopyWithImpl<_CenterPasswordForm>(this, _$identity);
}

abstract class _CenterPasswordForm implements CenterPasswordForm {
  const factory _CenterPasswordForm(
          {@required @JsonKey(name: 'oldpassword') String oldPwd,
          @required @JsonKey(name: 'newpassword') String newPwd,
          @required @JsonKey(name: 'conpassword') String confirmPwd}) =
      _$_CenterPasswordForm;

  @override
  @JsonKey(name: 'oldpassword')
  String get oldPwd;
  @override
  @JsonKey(name: 'newpassword')
  String get newPwd;
  @override
  @JsonKey(name: 'conpassword')
  String get confirmPwd;
  @override
  _$CenterPasswordFormCopyWith<_CenterPasswordForm> get copyWith;
}
