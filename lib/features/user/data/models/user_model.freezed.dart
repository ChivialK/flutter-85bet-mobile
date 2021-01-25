// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$UserModelTearOff {
  const _$UserModelTearOff();

// ignore: unused_element
  _UserModel call(
      {@JsonKey(name: 'accountcode', required: true) String account,
      @JsonKey(name: 'creditlimit', required: true) String credit,
      @required String status,
      @required int vip,
      @JsonKey(name: 'vip_name', required: false) String vipName}) {
    return _UserModel(
      account: account,
      credit: credit,
      status: status,
      vip: vip,
      vipName: vipName,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $UserModel = _$UserModelTearOff();

/// @nodoc
mixin _$UserModel {
  @JsonKey(name: 'accountcode', required: true)
  String get account;
  @JsonKey(name: 'creditlimit', required: true)
  String get credit;
  String get status;
  int get vip;
  @JsonKey(name: 'vip_name', required: false)
  String get vipName;

  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'accountcode', required: true) String account,
      @JsonKey(name: 'creditlimit', required: true) String credit,
      String status,
      int vip,
      @JsonKey(name: 'vip_name', required: false) String vipName});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res> implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  final UserModel _value;
  // ignore: unused_field
  final $Res Function(UserModel) _then;

  @override
  $Res call({
    Object account = freezed,
    Object credit = freezed,
    Object status = freezed,
    Object vip = freezed,
    Object vipName = freezed,
  }) {
    return _then(_value.copyWith(
      account: account == freezed ? _value.account : account as String,
      credit: credit == freezed ? _value.credit : credit as String,
      status: status == freezed ? _value.status : status as String,
      vip: vip == freezed ? _value.vip : vip as int,
      vipName: vipName == freezed ? _value.vipName : vipName as String,
    ));
  }
}

/// @nodoc
abstract class _$UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$UserModelCopyWith(
          _UserModel value, $Res Function(_UserModel) then) =
      __$UserModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'accountcode', required: true) String account,
      @JsonKey(name: 'creditlimit', required: true) String credit,
      String status,
      int vip,
      @JsonKey(name: 'vip_name', required: false) String vipName});
}

/// @nodoc
class __$UserModelCopyWithImpl<$Res> extends _$UserModelCopyWithImpl<$Res>
    implements _$UserModelCopyWith<$Res> {
  __$UserModelCopyWithImpl(_UserModel _value, $Res Function(_UserModel) _then)
      : super(_value, (v) => _then(v as _UserModel));

  @override
  _UserModel get _value => super._value as _UserModel;

  @override
  $Res call({
    Object account = freezed,
    Object credit = freezed,
    Object status = freezed,
    Object vip = freezed,
    Object vipName = freezed,
  }) {
    return _then(_UserModel(
      account: account == freezed ? _value.account : account as String,
      credit: credit == freezed ? _value.credit : credit as String,
      status: status == freezed ? _value.status : status as String,
      vip: vip == freezed ? _value.vip : vip as int,
      vipName: vipName == freezed ? _value.vipName : vipName as String,
    ));
  }
}

/// @nodoc
class _$_UserModel implements _UserModel {
  const _$_UserModel(
      {@JsonKey(name: 'accountcode', required: true) this.account,
      @JsonKey(name: 'creditlimit', required: true) this.credit,
      @required this.status,
      @required this.vip,
      @JsonKey(name: 'vip_name', required: false) this.vipName})
      : assert(status != null),
        assert(vip != null);

  @override
  @JsonKey(name: 'accountcode', required: true)
  final String account;
  @override
  @JsonKey(name: 'creditlimit', required: true)
  final String credit;
  @override
  final String status;
  @override
  final int vip;
  @override
  @JsonKey(name: 'vip_name', required: false)
  final String vipName;

  @override
  String toString() {
    return 'UserModel(account: $account, credit: $credit, status: $status, vip: $vip, vipName: $vipName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserModel &&
            (identical(other.account, account) ||
                const DeepCollectionEquality()
                    .equals(other.account, account)) &&
            (identical(other.credit, credit) ||
                const DeepCollectionEquality().equals(other.credit, credit)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.vip, vip) ||
                const DeepCollectionEquality().equals(other.vip, vip)) &&
            (identical(other.vipName, vipName) ||
                const DeepCollectionEquality().equals(other.vipName, vipName)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(account) ^
      const DeepCollectionEquality().hash(credit) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(vip) ^
      const DeepCollectionEquality().hash(vipName);

  @JsonKey(ignore: true)
  @override
  _$UserModelCopyWith<_UserModel> get copyWith =>
      __$UserModelCopyWithImpl<_UserModel>(this, _$identity);
}

abstract class _UserModel implements UserModel {
  const factory _UserModel(
          {@JsonKey(name: 'accountcode', required: true) String account,
          @JsonKey(name: 'creditlimit', required: true) String credit,
          @required String status,
          @required int vip,
          @JsonKey(name: 'vip_name', required: false) String vipName}) =
      _$_UserModel;

  @override
  @JsonKey(name: 'accountcode', required: true)
  String get account;
  @override
  @JsonKey(name: 'creditlimit', required: true)
  String get credit;
  @override
  String get status;
  @override
  int get vip;
  @override
  @JsonKey(name: 'vip_name', required: false)
  String get vipName;
  @override
  @JsonKey(ignore: true)
  _$UserModelCopyWith<_UserModel> get copyWith;
}
