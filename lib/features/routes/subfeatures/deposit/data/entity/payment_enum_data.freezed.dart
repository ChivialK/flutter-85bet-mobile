// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'payment_enum_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$PaymentTutorialItemTearOff {
  const _$PaymentTutorialItemTearOff();

// ignore: unused_element
  _PaymentTutorialItem call(
      {@required int sortId,
      @required String value,
      @required TutorialItemType type}) {
    return _PaymentTutorialItem(
      sortId: sortId,
      value: value,
      type: type,
    );
  }
}

// ignore: unused_element
const $PaymentTutorialItem = _$PaymentTutorialItemTearOff();

mixin _$PaymentTutorialItem {
  int get sortId;
  String get value;
  TutorialItemType get type;

  $PaymentTutorialItemCopyWith<PaymentTutorialItem> get copyWith;
}

abstract class $PaymentTutorialItemCopyWith<$Res> {
  factory $PaymentTutorialItemCopyWith(
          PaymentTutorialItem value, $Res Function(PaymentTutorialItem) then) =
      _$PaymentTutorialItemCopyWithImpl<$Res>;
  $Res call({int sortId, String value, TutorialItemType type});
}

class _$PaymentTutorialItemCopyWithImpl<$Res>
    implements $PaymentTutorialItemCopyWith<$Res> {
  _$PaymentTutorialItemCopyWithImpl(this._value, this._then);

  final PaymentTutorialItem _value;
  // ignore: unused_field
  final $Res Function(PaymentTutorialItem) _then;

  @override
  $Res call({
    Object sortId = freezed,
    Object value = freezed,
    Object type = freezed,
  }) {
    return _then(_value.copyWith(
      sortId: sortId == freezed ? _value.sortId : sortId as int,
      value: value == freezed ? _value.value : value as String,
      type: type == freezed ? _value.type : type as TutorialItemType,
    ));
  }
}

abstract class _$PaymentTutorialItemCopyWith<$Res>
    implements $PaymentTutorialItemCopyWith<$Res> {
  factory _$PaymentTutorialItemCopyWith(_PaymentTutorialItem value,
          $Res Function(_PaymentTutorialItem) then) =
      __$PaymentTutorialItemCopyWithImpl<$Res>;
  @override
  $Res call({int sortId, String value, TutorialItemType type});
}

class __$PaymentTutorialItemCopyWithImpl<$Res>
    extends _$PaymentTutorialItemCopyWithImpl<$Res>
    implements _$PaymentTutorialItemCopyWith<$Res> {
  __$PaymentTutorialItemCopyWithImpl(
      _PaymentTutorialItem _value, $Res Function(_PaymentTutorialItem) _then)
      : super(_value, (v) => _then(v as _PaymentTutorialItem));

  @override
  _PaymentTutorialItem get _value => super._value as _PaymentTutorialItem;

  @override
  $Res call({
    Object sortId = freezed,
    Object value = freezed,
    Object type = freezed,
  }) {
    return _then(_PaymentTutorialItem(
      sortId: sortId == freezed ? _value.sortId : sortId as int,
      value: value == freezed ? _value.value : value as String,
      type: type == freezed ? _value.type : type as TutorialItemType,
    ));
  }
}

class _$_PaymentTutorialItem implements _PaymentTutorialItem {
  const _$_PaymentTutorialItem(
      {@required this.sortId, @required this.value, @required this.type})
      : assert(sortId != null),
        assert(value != null),
        assert(type != null);

  @override
  final int sortId;
  @override
  final String value;
  @override
  final TutorialItemType type;

  @override
  String toString() {
    return 'PaymentTutorialItem(sortId: $sortId, value: $value, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PaymentTutorialItem &&
            (identical(other.sortId, sortId) ||
                const DeepCollectionEquality().equals(other.sortId, sortId)) &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(sortId) ^
      const DeepCollectionEquality().hash(value) ^
      const DeepCollectionEquality().hash(type);

  @override
  _$PaymentTutorialItemCopyWith<_PaymentTutorialItem> get copyWith =>
      __$PaymentTutorialItemCopyWithImpl<_PaymentTutorialItem>(
          this, _$identity);
}

abstract class _PaymentTutorialItem implements PaymentTutorialItem {
  const factory _PaymentTutorialItem(
      {@required int sortId,
      @required String value,
      @required TutorialItemType type}) = _$_PaymentTutorialItem;

  @override
  int get sortId;
  @override
  String get value;
  @override
  TutorialItemType get type;
  @override
  _$PaymentTutorialItemCopyWith<_PaymentTutorialItem> get copyWith;
}

class _$PaymentEnumDataTearOff {
  const _$PaymentEnumDataTearOff();

// ignore: unused_element
  _PaymentEnumData call(
      {@required String title,
      @required String jsonKey,
      String tutorialTitle,
      List<PaymentTutorialItem> tutorialItem}) {
    return _PaymentEnumData(
      title: title,
      jsonKey: jsonKey,
      tutorialTitle: tutorialTitle,
      tutorialItem: tutorialItem,
    );
  }
}

// ignore: unused_element
const $PaymentEnumData = _$PaymentEnumDataTearOff();

mixin _$PaymentEnumData {
  String get title;
  String get jsonKey;
  String get tutorialTitle;
  List<PaymentTutorialItem> get tutorialItem;

  $PaymentEnumDataCopyWith<PaymentEnumData> get copyWith;
}

abstract class $PaymentEnumDataCopyWith<$Res> {
  factory $PaymentEnumDataCopyWith(
          PaymentEnumData value, $Res Function(PaymentEnumData) then) =
      _$PaymentEnumDataCopyWithImpl<$Res>;
  $Res call(
      {String title,
      String jsonKey,
      String tutorialTitle,
      List<PaymentTutorialItem> tutorialItem});
}

class _$PaymentEnumDataCopyWithImpl<$Res>
    implements $PaymentEnumDataCopyWith<$Res> {
  _$PaymentEnumDataCopyWithImpl(this._value, this._then);

  final PaymentEnumData _value;
  // ignore: unused_field
  final $Res Function(PaymentEnumData) _then;

  @override
  $Res call({
    Object title = freezed,
    Object jsonKey = freezed,
    Object tutorialTitle = freezed,
    Object tutorialItem = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed ? _value.title : title as String,
      jsonKey: jsonKey == freezed ? _value.jsonKey : jsonKey as String,
      tutorialTitle: tutorialTitle == freezed
          ? _value.tutorialTitle
          : tutorialTitle as String,
      tutorialItem: tutorialItem == freezed
          ? _value.tutorialItem
          : tutorialItem as List<PaymentTutorialItem>,
    ));
  }
}

abstract class _$PaymentEnumDataCopyWith<$Res>
    implements $PaymentEnumDataCopyWith<$Res> {
  factory _$PaymentEnumDataCopyWith(
          _PaymentEnumData value, $Res Function(_PaymentEnumData) then) =
      __$PaymentEnumDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {String title,
      String jsonKey,
      String tutorialTitle,
      List<PaymentTutorialItem> tutorialItem});
}

class __$PaymentEnumDataCopyWithImpl<$Res>
    extends _$PaymentEnumDataCopyWithImpl<$Res>
    implements _$PaymentEnumDataCopyWith<$Res> {
  __$PaymentEnumDataCopyWithImpl(
      _PaymentEnumData _value, $Res Function(_PaymentEnumData) _then)
      : super(_value, (v) => _then(v as _PaymentEnumData));

  @override
  _PaymentEnumData get _value => super._value as _PaymentEnumData;

  @override
  $Res call({
    Object title = freezed,
    Object jsonKey = freezed,
    Object tutorialTitle = freezed,
    Object tutorialItem = freezed,
  }) {
    return _then(_PaymentEnumData(
      title: title == freezed ? _value.title : title as String,
      jsonKey: jsonKey == freezed ? _value.jsonKey : jsonKey as String,
      tutorialTitle: tutorialTitle == freezed
          ? _value.tutorialTitle
          : tutorialTitle as String,
      tutorialItem: tutorialItem == freezed
          ? _value.tutorialItem
          : tutorialItem as List<PaymentTutorialItem>,
    ));
  }
}

class _$_PaymentEnumData implements _PaymentEnumData {
  const _$_PaymentEnumData(
      {@required this.title,
      @required this.jsonKey,
      this.tutorialTitle,
      this.tutorialItem})
      : assert(title != null),
        assert(jsonKey != null);

  @override
  final String title;
  @override
  final String jsonKey;
  @override
  final String tutorialTitle;
  @override
  final List<PaymentTutorialItem> tutorialItem;

  @override
  String toString() {
    return 'PaymentEnumData(title: $title, jsonKey: $jsonKey, tutorialTitle: $tutorialTitle, tutorialItem: $tutorialItem)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PaymentEnumData &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.jsonKey, jsonKey) ||
                const DeepCollectionEquality()
                    .equals(other.jsonKey, jsonKey)) &&
            (identical(other.tutorialTitle, tutorialTitle) ||
                const DeepCollectionEquality()
                    .equals(other.tutorialTitle, tutorialTitle)) &&
            (identical(other.tutorialItem, tutorialItem) ||
                const DeepCollectionEquality()
                    .equals(other.tutorialItem, tutorialItem)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(jsonKey) ^
      const DeepCollectionEquality().hash(tutorialTitle) ^
      const DeepCollectionEquality().hash(tutorialItem);

  @override
  _$PaymentEnumDataCopyWith<_PaymentEnumData> get copyWith =>
      __$PaymentEnumDataCopyWithImpl<_PaymentEnumData>(this, _$identity);
}

abstract class _PaymentEnumData implements PaymentEnumData {
  const factory _PaymentEnumData(
      {@required String title,
      @required String jsonKey,
      String tutorialTitle,
      List<PaymentTutorialItem> tutorialItem}) = _$_PaymentEnumData;

  @override
  String get title;
  @override
  String get jsonKey;
  @override
  String get tutorialTitle;
  @override
  List<PaymentTutorialItem> get tutorialItem;
  @override
  _$PaymentEnumDataCopyWith<_PaymentEnumData> get copyWith;
}
