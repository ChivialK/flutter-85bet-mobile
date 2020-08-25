// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'route_list_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$RouteListItemTearOff {
  const _$RouteListItemTearOff();

// ignore: unused_element
  _RouteListItem call(
      {@required RouteEnum id,
      IconData iconData,
      String imageName,
      RoutePage route,
      bool isUserOnly = false}) {
    return _RouteListItem(
      id: id,
      iconData: iconData,
      imageName: imageName,
      route: route,
      isUserOnly: isUserOnly,
    );
  }
}

// ignore: unused_element
const $RouteListItem = _$RouteListItemTearOff();

mixin _$RouteListItem {
  RouteEnum get id;
  IconData get iconData;
  String get imageName;
  RoutePage get route;
  bool get isUserOnly;

  $RouteListItemCopyWith<RouteListItem> get copyWith;
}

abstract class $RouteListItemCopyWith<$Res> {
  factory $RouteListItemCopyWith(
          RouteListItem value, $Res Function(RouteListItem) then) =
      _$RouteListItemCopyWithImpl<$Res>;
  $Res call(
      {RouteEnum id,
      IconData iconData,
      String imageName,
      RoutePage route,
      bool isUserOnly});
}

class _$RouteListItemCopyWithImpl<$Res>
    implements $RouteListItemCopyWith<$Res> {
  _$RouteListItemCopyWithImpl(this._value, this._then);

  final RouteListItem _value;
  // ignore: unused_field
  final $Res Function(RouteListItem) _then;

  @override
  $Res call({
    Object id = freezed,
    Object iconData = freezed,
    Object imageName = freezed,
    Object route = freezed,
    Object isUserOnly = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as RouteEnum,
      iconData: iconData == freezed ? _value.iconData : iconData as IconData,
      imageName: imageName == freezed ? _value.imageName : imageName as String,
      route: route == freezed ? _value.route : route as RoutePage,
      isUserOnly:
          isUserOnly == freezed ? _value.isUserOnly : isUserOnly as bool,
    ));
  }
}

abstract class _$RouteListItemCopyWith<$Res>
    implements $RouteListItemCopyWith<$Res> {
  factory _$RouteListItemCopyWith(
          _RouteListItem value, $Res Function(_RouteListItem) then) =
      __$RouteListItemCopyWithImpl<$Res>;
  @override
  $Res call(
      {RouteEnum id,
      IconData iconData,
      String imageName,
      RoutePage route,
      bool isUserOnly});
}

class __$RouteListItemCopyWithImpl<$Res>
    extends _$RouteListItemCopyWithImpl<$Res>
    implements _$RouteListItemCopyWith<$Res> {
  __$RouteListItemCopyWithImpl(
      _RouteListItem _value, $Res Function(_RouteListItem) _then)
      : super(_value, (v) => _then(v as _RouteListItem));

  @override
  _RouteListItem get _value => super._value as _RouteListItem;

  @override
  $Res call({
    Object id = freezed,
    Object iconData = freezed,
    Object imageName = freezed,
    Object route = freezed,
    Object isUserOnly = freezed,
  }) {
    return _then(_RouteListItem(
      id: id == freezed ? _value.id : id as RouteEnum,
      iconData: iconData == freezed ? _value.iconData : iconData as IconData,
      imageName: imageName == freezed ? _value.imageName : imageName as String,
      route: route == freezed ? _value.route : route as RoutePage,
      isUserOnly:
          isUserOnly == freezed ? _value.isUserOnly : isUserOnly as bool,
    ));
  }
}

class _$_RouteListItem with DiagnosticableTreeMixin implements _RouteListItem {
  const _$_RouteListItem(
      {@required this.id,
      this.iconData,
      this.imageName,
      this.route,
      this.isUserOnly = false})
      : assert(id != null),
        assert(isUserOnly != null);

  @override
  final RouteEnum id;
  @override
  final IconData iconData;
  @override
  final String imageName;
  @override
  final RoutePage route;
  @JsonKey(defaultValue: false)
  @override
  final bool isUserOnly;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RouteListItem(id: $id, iconData: $iconData, imageName: $imageName, route: $route, isUserOnly: $isUserOnly)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RouteListItem'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('iconData', iconData))
      ..add(DiagnosticsProperty('imageName', imageName))
      ..add(DiagnosticsProperty('route', route))
      ..add(DiagnosticsProperty('isUserOnly', isUserOnly));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RouteListItem &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.iconData, iconData) ||
                const DeepCollectionEquality()
                    .equals(other.iconData, iconData)) &&
            (identical(other.imageName, imageName) ||
                const DeepCollectionEquality()
                    .equals(other.imageName, imageName)) &&
            (identical(other.route, route) ||
                const DeepCollectionEquality().equals(other.route, route)) &&
            (identical(other.isUserOnly, isUserOnly) ||
                const DeepCollectionEquality()
                    .equals(other.isUserOnly, isUserOnly)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(iconData) ^
      const DeepCollectionEquality().hash(imageName) ^
      const DeepCollectionEquality().hash(route) ^
      const DeepCollectionEquality().hash(isUserOnly);

  @override
  _$RouteListItemCopyWith<_RouteListItem> get copyWith =>
      __$RouteListItemCopyWithImpl<_RouteListItem>(this, _$identity);
}

abstract class _RouteListItem implements RouteListItem {
  const factory _RouteListItem(
      {@required RouteEnum id,
      IconData iconData,
      String imageName,
      RoutePage route,
      bool isUserOnly}) = _$_RouteListItem;

  @override
  RouteEnum get id;
  @override
  IconData get iconData;
  @override
  String get imageName;
  @override
  RoutePage get route;
  @override
  bool get isUserOnly;
  @override
  _$RouteListItemCopyWith<_RouteListItem> get copyWith;
}
