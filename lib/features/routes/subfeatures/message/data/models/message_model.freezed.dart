// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'message_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$MessageModelTearOff {
  const _$MessageModelTearOff();

// ignore: unused_element
  _MessageModel call(
      {String date, String msg, int id, String status, String title}) {
    return _MessageModel(
      date: date,
      msg: msg,
      id: id,
      status: status,
      title: title,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $MessageModel = _$MessageModelTearOff();

/// @nodoc
mixin _$MessageModel {
  String get date;
  String get msg;
  int get id;
  String get status;
  String get title;

  @JsonKey(ignore: true)
  $MessageModelCopyWith<MessageModel> get copyWith;
}

/// @nodoc
abstract class $MessageModelCopyWith<$Res> {
  factory $MessageModelCopyWith(
          MessageModel value, $Res Function(MessageModel) then) =
      _$MessageModelCopyWithImpl<$Res>;
  $Res call({String date, String msg, int id, String status, String title});
}

/// @nodoc
class _$MessageModelCopyWithImpl<$Res> implements $MessageModelCopyWith<$Res> {
  _$MessageModelCopyWithImpl(this._value, this._then);

  final MessageModel _value;
  // ignore: unused_field
  final $Res Function(MessageModel) _then;

  @override
  $Res call({
    Object date = freezed,
    Object msg = freezed,
    Object id = freezed,
    Object status = freezed,
    Object title = freezed,
  }) {
    return _then(_value.copyWith(
      date: date == freezed ? _value.date : date as String,
      msg: msg == freezed ? _value.msg : msg as String,
      id: id == freezed ? _value.id : id as int,
      status: status == freezed ? _value.status : status as String,
      title: title == freezed ? _value.title : title as String,
    ));
  }
}

/// @nodoc
abstract class _$MessageModelCopyWith<$Res>
    implements $MessageModelCopyWith<$Res> {
  factory _$MessageModelCopyWith(
          _MessageModel value, $Res Function(_MessageModel) then) =
      __$MessageModelCopyWithImpl<$Res>;
  @override
  $Res call({String date, String msg, int id, String status, String title});
}

/// @nodoc
class __$MessageModelCopyWithImpl<$Res> extends _$MessageModelCopyWithImpl<$Res>
    implements _$MessageModelCopyWith<$Res> {
  __$MessageModelCopyWithImpl(
      _MessageModel _value, $Res Function(_MessageModel) _then)
      : super(_value, (v) => _then(v as _MessageModel));

  @override
  _MessageModel get _value => super._value as _MessageModel;

  @override
  $Res call({
    Object date = freezed,
    Object msg = freezed,
    Object id = freezed,
    Object status = freezed,
    Object title = freezed,
  }) {
    return _then(_MessageModel(
      date: date == freezed ? _value.date : date as String,
      msg: msg == freezed ? _value.msg : msg as String,
      id: id == freezed ? _value.id : id as int,
      status: status == freezed ? _value.status : status as String,
      title: title == freezed ? _value.title : title as String,
    ));
  }
}

/// @nodoc
class _$_MessageModel implements _MessageModel {
  _$_MessageModel({this.date, this.msg, this.id, this.status, this.title});

  @override
  final String date;
  @override
  final String msg;
  @override
  final int id;
  @override
  final String status;
  @override
  final String title;

  bool _didisRead = false;
  bool _isRead;

  @override
  bool get isRead {
    if (_didisRead == false) {
      _didisRead = true;
      _isRead = status == '1';
    }
    return _isRead;
  }

  @override
  String toString() {
    return 'MessageModel(date: $date, msg: $msg, id: $id, status: $status, title: $title, isRead: $isRead)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MessageModel &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)) &&
            (identical(other.msg, msg) ||
                const DeepCollectionEquality().equals(other.msg, msg)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(date) ^
      const DeepCollectionEquality().hash(msg) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(title);

  @JsonKey(ignore: true)
  @override
  _$MessageModelCopyWith<_MessageModel> get copyWith =>
      __$MessageModelCopyWithImpl<_MessageModel>(this, _$identity);
}

abstract class _MessageModel implements MessageModel {
  factory _MessageModel(
      {String date,
      String msg,
      int id,
      String status,
      String title}) = _$_MessageModel;

  @override
  String get date;
  @override
  String get msg;
  @override
  int get id;
  @override
  String get status;
  @override
  String get title;
  @override
  @JsonKey(ignore: true)
  _$MessageModelCopyWith<_MessageModel> get copyWith;
}
