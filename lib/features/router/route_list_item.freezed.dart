// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'route_list_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$RouteListItemTearOff {
  const _$RouteListItemTearOff();

// ignore: unused_element
  _RouteListItem call(
      {RouteEnum routeId,
      IconData iconData,
      String imageName,
      String imageSubName,
      RoutePage route,
      bool userOnly}) {
    return _RouteListItem(
      routeId: routeId,
      iconData: iconData,
      imageName: imageName,
      imageSubName: imageSubName,
      route: route,
      userOnly: userOnly,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $RouteListItem = _$RouteListItemTearOff();

/// @nodoc
mixin _$RouteListItem {
  RouteEnum get routeId;
  IconData get iconData; // IconData need to be constant
  String get imageName;
  String get imageSubName;
  RoutePage get route;
  bool get userOnly;

  $RouteListItemCopyWith<RouteListItem> get copyWith;
}

/// @nodoc
abstract class $RouteListItemCopyWith<$Res> {
  factory $RouteListItemCopyWith(
          RouteListItem value, $Res Function(RouteListItem) then) =
      _$RouteListItemCopyWithImpl<$Res>;
  $Res call(
      {RouteEnum routeId,
      IconData iconData,
      String imageName,
      String imageSubName,
      RoutePage route,
      bool userOnly});
}

/// @nodoc
class _$RouteListItemCopyWithImpl<$Res>
    implements $RouteListItemCopyWith<$Res> {
  _$RouteListItemCopyWithImpl(this._value, this._then);

  final RouteListItem _value;
  // ignore: unused_field
  final $Res Function(RouteListItem) _then;

  @override
  $Res call({
    Object routeId = freezed,
    Object iconData = freezed,
    Object imageName = freezed,
    Object imageSubName = freezed,
    Object route = freezed,
    Object userOnly = freezed,
  }) {
    return _then(_value.copyWith(
      routeId: routeId == freezed ? _value.routeId : routeId as RouteEnum,
      iconData: iconData == freezed ? _value.iconData : iconData as IconData,
      imageName: imageName == freezed ? _value.imageName : imageName as String,
      imageSubName: imageSubName == freezed
          ? _value.imageSubName
          : imageSubName as String,
      route: route == freezed ? _value.route : route as RoutePage,
      userOnly: userOnly == freezed ? _value.userOnly : userOnly as bool,
    ));
  }
}

/// @nodoc
abstract class _$RouteListItemCopyWith<$Res>
    implements $RouteListItemCopyWith<$Res> {
  factory _$RouteListItemCopyWith(
          _RouteListItem value, $Res Function(_RouteListItem) then) =
      __$RouteListItemCopyWithImpl<$Res>;
  @override
  $Res call(
      {RouteEnum routeId,
      IconData iconData,
      String imageName,
      String imageSubName,
      RoutePage route,
      bool userOnly});
}

/// @nodoc
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
    Object routeId = freezed,
    Object iconData = freezed,
    Object imageName = freezed,
    Object imageSubName = freezed,
    Object route = freezed,
    Object userOnly = freezed,
  }) {
    return _then(_RouteListItem(
      routeId: routeId == freezed ? _value.routeId : routeId as RouteEnum,
      iconData: iconData == freezed ? _value.iconData : iconData as IconData,
      imageName: imageName == freezed ? _value.imageName : imageName as String,
      imageSubName: imageSubName == freezed
          ? _value.imageSubName
          : imageSubName as String,
      route: route == freezed ? _value.route : route as RoutePage,
      userOnly: userOnly == freezed ? _value.userOnly : userOnly as bool,
    ));
  }
}

/// @nodoc
class _$_RouteListItem with DiagnosticableTreeMixin implements _RouteListItem {
  const _$_RouteListItem(
      {this.routeId,
      this.iconData,
      this.imageName,
      this.imageSubName,
      this.route,
      this.userOnly});

  @override
  final RouteEnum routeId;
  @override
  final IconData iconData;
  @override // IconData need to be constant
  final String imageName;
  @override
  final String imageSubName;
  @override
  final RoutePage route;
  @override
  final bool userOnly;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RouteListItem(routeId: $routeId, iconData: $iconData, imageName: $imageName, imageSubName: $imageSubName, route: $route, userOnly: $userOnly)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RouteListItem'))
      ..add(DiagnosticsProperty('routeId', routeId))
      ..add(DiagnosticsProperty('iconData', iconData))
      ..add(DiagnosticsProperty('imageName', imageName))
      ..add(DiagnosticsProperty('imageSubName', imageSubName))
      ..add(DiagnosticsProperty('route', route))
      ..add(DiagnosticsProperty('userOnly', userOnly));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RouteListItem &&
            (identical(other.routeId, routeId) ||
                const DeepCollectionEquality()
                    .equals(other.routeId, routeId)) &&
            (identical(other.iconData, iconData) ||
                const DeepCollectionEquality()
                    .equals(other.iconData, iconData)) &&
            (identical(other.imageName, imageName) ||
                const DeepCollectionEquality()
                    .equals(other.imageName, imageName)) &&
            (identical(other.imageSubName, imageSubName) ||
                const DeepCollectionEquality()
                    .equals(other.imageSubName, imageSubName)) &&
            (identical(other.route, route) ||
                const DeepCollectionEquality().equals(other.route, route)) &&
            (identical(other.userOnly, userOnly) ||
                const DeepCollectionEquality()
                    .equals(other.userOnly, userOnly)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(routeId) ^
      const DeepCollectionEquality().hash(iconData) ^
      const DeepCollectionEquality().hash(imageName) ^
      const DeepCollectionEquality().hash(imageSubName) ^
      const DeepCollectionEquality().hash(route) ^
      const DeepCollectionEquality().hash(userOnly);

  @override
  _$RouteListItemCopyWith<_RouteListItem> get copyWith =>
      __$RouteListItemCopyWithImpl<_RouteListItem>(this, _$identity);
}

abstract class _RouteListItem implements RouteListItem {
  const factory _RouteListItem(
      {RouteEnum routeId,
      IconData iconData,
      String imageName,
      String imageSubName,
      RoutePage route,
      bool userOnly}) = _$_RouteListItem;

  @override
  RouteEnum get routeId;
  @override
  IconData get iconData;
  @override // IconData need to be constant
  String get imageName;
  @override
  String get imageSubName;
  @override
  RoutePage get route;
  @override
  bool get userOnly;
  @override
  _$RouteListItemCopyWith<_RouteListItem> get copyWith;
}
