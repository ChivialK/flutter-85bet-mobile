// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'notice_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$NoticeModelTearOff {
  const _$NoticeModelTearOff();

// ignore: unused_element
  _NoticeModel call({String code, NoticeDataModel data, String msg}) {
    return _NoticeModel(
      code: code,
      data: data,
      msg: msg,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $NoticeModel = _$NoticeModelTearOff();

/// @nodoc
mixin _$NoticeModel {
  String get code;
  NoticeDataModel get data;
  String get msg;

  $NoticeModelCopyWith<NoticeModel> get copyWith;
}

/// @nodoc
abstract class $NoticeModelCopyWith<$Res> {
  factory $NoticeModelCopyWith(
          NoticeModel value, $Res Function(NoticeModel) then) =
      _$NoticeModelCopyWithImpl<$Res>;
  $Res call({String code, NoticeDataModel data, String msg});

  $NoticeDataModelCopyWith<$Res> get data;
}

/// @nodoc
class _$NoticeModelCopyWithImpl<$Res> implements $NoticeModelCopyWith<$Res> {
  _$NoticeModelCopyWithImpl(this._value, this._then);

  final NoticeModel _value;
  // ignore: unused_field
  final $Res Function(NoticeModel) _then;

  @override
  $Res call({
    Object code = freezed,
    Object data = freezed,
    Object msg = freezed,
  }) {
    return _then(_value.copyWith(
      code: code == freezed ? _value.code : code as String,
      data: data == freezed ? _value.data : data as NoticeDataModel,
      msg: msg == freezed ? _value.msg : msg as String,
    ));
  }

  @override
  $NoticeDataModelCopyWith<$Res> get data {
    if (_value.data == null) {
      return null;
    }
    return $NoticeDataModelCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value));
    });
  }
}

/// @nodoc
abstract class _$NoticeModelCopyWith<$Res>
    implements $NoticeModelCopyWith<$Res> {
  factory _$NoticeModelCopyWith(
          _NoticeModel value, $Res Function(_NoticeModel) then) =
      __$NoticeModelCopyWithImpl<$Res>;
  @override
  $Res call({String code, NoticeDataModel data, String msg});

  @override
  $NoticeDataModelCopyWith<$Res> get data;
}

/// @nodoc
class __$NoticeModelCopyWithImpl<$Res> extends _$NoticeModelCopyWithImpl<$Res>
    implements _$NoticeModelCopyWith<$Res> {
  __$NoticeModelCopyWithImpl(
      _NoticeModel _value, $Res Function(_NoticeModel) _then)
      : super(_value, (v) => _then(v as _NoticeModel));

  @override
  _NoticeModel get _value => super._value as _NoticeModel;

  @override
  $Res call({
    Object code = freezed,
    Object data = freezed,
    Object msg = freezed,
  }) {
    return _then(_NoticeModel(
      code: code == freezed ? _value.code : code as String,
      data: data == freezed ? _value.data : data as NoticeDataModel,
      msg: msg == freezed ? _value.msg : msg as String,
    ));
  }
}

/// @nodoc
class _$_NoticeModel implements _NoticeModel {
  const _$_NoticeModel({this.code, this.data, this.msg});

  @override
  final String code;
  @override
  final NoticeDataModel data;
  @override
  final String msg;

  @override
  String toString() {
    return 'NoticeModel(code: $code, data: $data, msg: $msg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _NoticeModel &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)) &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.msg, msg) ||
                const DeepCollectionEquality().equals(other.msg, msg)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(code) ^
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(msg);

  @override
  _$NoticeModelCopyWith<_NoticeModel> get copyWith =>
      __$NoticeModelCopyWithImpl<_NoticeModel>(this, _$identity);
}

abstract class _NoticeModel implements NoticeModel {
  const factory _NoticeModel({String code, NoticeDataModel data, String msg}) =
      _$_NoticeModel;

  @override
  String get code;
  @override
  NoticeDataModel get data;
  @override
  String get msg;
  @override
  _$NoticeModelCopyWith<_NoticeModel> get copyWith;
}

/// @nodoc
class _$NoticeDataModelTearOff {
  const _$NoticeDataModelTearOff();

// ignore: unused_element
  _NoticeDataModel call(
      {List<NoticeData> maintenanceList, List<NoticeData> marqueeList}) {
    return _NoticeDataModel(
      maintenanceList: maintenanceList,
      marqueeList: marqueeList,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $NoticeDataModel = _$NoticeDataModelTearOff();

/// @nodoc
mixin _$NoticeDataModel {
  List<NoticeData> get maintenanceList;
  List<NoticeData> get marqueeList;

  $NoticeDataModelCopyWith<NoticeDataModel> get copyWith;
}

/// @nodoc
abstract class $NoticeDataModelCopyWith<$Res> {
  factory $NoticeDataModelCopyWith(
          NoticeDataModel value, $Res Function(NoticeDataModel) then) =
      _$NoticeDataModelCopyWithImpl<$Res>;
  $Res call({List<NoticeData> maintenanceList, List<NoticeData> marqueeList});
}

/// @nodoc
class _$NoticeDataModelCopyWithImpl<$Res>
    implements $NoticeDataModelCopyWith<$Res> {
  _$NoticeDataModelCopyWithImpl(this._value, this._then);

  final NoticeDataModel _value;
  // ignore: unused_field
  final $Res Function(NoticeDataModel) _then;

  @override
  $Res call({
    Object maintenanceList = freezed,
    Object marqueeList = freezed,
  }) {
    return _then(_value.copyWith(
      maintenanceList: maintenanceList == freezed
          ? _value.maintenanceList
          : maintenanceList as List<NoticeData>,
      marqueeList: marqueeList == freezed
          ? _value.marqueeList
          : marqueeList as List<NoticeData>,
    ));
  }
}

/// @nodoc
abstract class _$NoticeDataModelCopyWith<$Res>
    implements $NoticeDataModelCopyWith<$Res> {
  factory _$NoticeDataModelCopyWith(
          _NoticeDataModel value, $Res Function(_NoticeDataModel) then) =
      __$NoticeDataModelCopyWithImpl<$Res>;
  @override
  $Res call({List<NoticeData> maintenanceList, List<NoticeData> marqueeList});
}

/// @nodoc
class __$NoticeDataModelCopyWithImpl<$Res>
    extends _$NoticeDataModelCopyWithImpl<$Res>
    implements _$NoticeDataModelCopyWith<$Res> {
  __$NoticeDataModelCopyWithImpl(
      _NoticeDataModel _value, $Res Function(_NoticeDataModel) _then)
      : super(_value, (v) => _then(v as _NoticeDataModel));

  @override
  _NoticeDataModel get _value => super._value as _NoticeDataModel;

  @override
  $Res call({
    Object maintenanceList = freezed,
    Object marqueeList = freezed,
  }) {
    return _then(_NoticeDataModel(
      maintenanceList: maintenanceList == freezed
          ? _value.maintenanceList
          : maintenanceList as List<NoticeData>,
      marqueeList: marqueeList == freezed
          ? _value.marqueeList
          : marqueeList as List<NoticeData>,
    ));
  }
}

/// @nodoc
class _$_NoticeDataModel implements _NoticeDataModel {
  const _$_NoticeDataModel({this.maintenanceList, this.marqueeList});

  @override
  final List<NoticeData> maintenanceList;
  @override
  final List<NoticeData> marqueeList;

  @override
  String toString() {
    return 'NoticeDataModel(maintenanceList: $maintenanceList, marqueeList: $marqueeList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _NoticeDataModel &&
            (identical(other.maintenanceList, maintenanceList) ||
                const DeepCollectionEquality()
                    .equals(other.maintenanceList, maintenanceList)) &&
            (identical(other.marqueeList, marqueeList) ||
                const DeepCollectionEquality()
                    .equals(other.marqueeList, marqueeList)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(maintenanceList) ^
      const DeepCollectionEquality().hash(marqueeList);

  @override
  _$NoticeDataModelCopyWith<_NoticeDataModel> get copyWith =>
      __$NoticeDataModelCopyWithImpl<_NoticeDataModel>(this, _$identity);
}

abstract class _NoticeDataModel implements NoticeDataModel {
  const factory _NoticeDataModel(
      {List<NoticeData> maintenanceList,
      List<NoticeData> marqueeList}) = _$_NoticeDataModel;

  @override
  List<NoticeData> get maintenanceList;
  @override
  List<NoticeData> get marqueeList;
  @override
  _$NoticeDataModelCopyWith<_NoticeDataModel> get copyWith;
}

/// @nodoc
class _$NoticeDataTearOff {
  const _$NoticeDataTearOff();

// ignore: unused_element
  _NoticeData call(
      {@JsonKey(name: 'content_cn') String content, String date, int sort}) {
    return _NoticeData(
      content: content,
      date: date,
      sort: sort,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $NoticeData = _$NoticeDataTearOff();

/// @nodoc
mixin _$NoticeData {
  @JsonKey(name: 'content_cn')
  String get content;
  String get date;
  int get sort;

  $NoticeDataCopyWith<NoticeData> get copyWith;
}

/// @nodoc
abstract class $NoticeDataCopyWith<$Res> {
  factory $NoticeDataCopyWith(
          NoticeData value, $Res Function(NoticeData) then) =
      _$NoticeDataCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'content_cn') String content, String date, int sort});
}

/// @nodoc
class _$NoticeDataCopyWithImpl<$Res> implements $NoticeDataCopyWith<$Res> {
  _$NoticeDataCopyWithImpl(this._value, this._then);

  final NoticeData _value;
  // ignore: unused_field
  final $Res Function(NoticeData) _then;

  @override
  $Res call({
    Object content = freezed,
    Object date = freezed,
    Object sort = freezed,
  }) {
    return _then(_value.copyWith(
      content: content == freezed ? _value.content : content as String,
      date: date == freezed ? _value.date : date as String,
      sort: sort == freezed ? _value.sort : sort as int,
    ));
  }
}

/// @nodoc
abstract class _$NoticeDataCopyWith<$Res> implements $NoticeDataCopyWith<$Res> {
  factory _$NoticeDataCopyWith(
          _NoticeData value, $Res Function(_NoticeData) then) =
      __$NoticeDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'content_cn') String content, String date, int sort});
}

/// @nodoc
class __$NoticeDataCopyWithImpl<$Res> extends _$NoticeDataCopyWithImpl<$Res>
    implements _$NoticeDataCopyWith<$Res> {
  __$NoticeDataCopyWithImpl(
      _NoticeData _value, $Res Function(_NoticeData) _then)
      : super(_value, (v) => _then(v as _NoticeData));

  @override
  _NoticeData get _value => super._value as _NoticeData;

  @override
  $Res call({
    Object content = freezed,
    Object date = freezed,
    Object sort = freezed,
  }) {
    return _then(_NoticeData(
      content: content == freezed ? _value.content : content as String,
      date: date == freezed ? _value.date : date as String,
      sort: sort == freezed ? _value.sort : sort as int,
    ));
  }
}

/// @nodoc
class _$_NoticeData implements _NoticeData {
  const _$_NoticeData(
      {@JsonKey(name: 'content_cn') this.content, this.date, this.sort});

  @override
  @JsonKey(name: 'content_cn')
  final String content;
  @override
  final String date;
  @override
  final int sort;

  @override
  String toString() {
    return 'NoticeData(content: $content, date: $date, sort: $sort)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _NoticeData &&
            (identical(other.content, content) ||
                const DeepCollectionEquality()
                    .equals(other.content, content)) &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)) &&
            (identical(other.sort, sort) ||
                const DeepCollectionEquality().equals(other.sort, sort)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(content) ^
      const DeepCollectionEquality().hash(date) ^
      const DeepCollectionEquality().hash(sort);

  @override
  _$NoticeDataCopyWith<_NoticeData> get copyWith =>
      __$NoticeDataCopyWithImpl<_NoticeData>(this, _$identity);
}

abstract class _NoticeData implements NoticeData {
  const factory _NoticeData(
      {@JsonKey(name: 'content_cn') String content,
      String date,
      int sort}) = _$_NoticeData;

  @override
  @JsonKey(name: 'content_cn')
  String get content;
  @override
  String get date;
  @override
  int get sort;
  @override
  _$NoticeDataCopyWith<_NoticeData> get copyWith;
}
