// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'route_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$RouteInfoTearOff {
  const _$RouteInfoTearOff();

// ignore: unused_element
  _RouteInfo call(
      {@required RouteEnum id,
      @required String route,
      Object routeArg,
      String parentRoute = Routes.homeRoute,
      bool isFeature = false,
      bool showDrawer = false,
      bool disableLanguageDropDown = false,
      bool hideAppbarActions = true,
      int bottomNavIndex = -1}) {
    return _RouteInfo(
      id: id,
      route: route,
      routeArg: routeArg,
      parentRoute: parentRoute,
      isFeature: isFeature,
      showDrawer: showDrawer,
      disableLanguageDropDown: disableLanguageDropDown,
      hideAppbarActions: hideAppbarActions,
      bottomNavIndex: bottomNavIndex,
    );
  }
}

// ignore: unused_element
const $RouteInfo = _$RouteInfoTearOff();

mixin _$RouteInfo {
  RouteEnum get id;
  String get route;
  Object get routeArg;
  String get parentRoute;
  bool get isFeature;
  bool get showDrawer;
  bool get disableLanguageDropDown;
  bool get hideAppbarActions;
  int get bottomNavIndex;

  $RouteInfoCopyWith<RouteInfo> get copyWith;
}

abstract class $RouteInfoCopyWith<$Res> {
  factory $RouteInfoCopyWith(RouteInfo value, $Res Function(RouteInfo) then) =
      _$RouteInfoCopyWithImpl<$Res>;
  $Res call(
      {RouteEnum id,
      String route,
      Object routeArg,
      String parentRoute,
      bool isFeature,
      bool showDrawer,
      bool disableLanguageDropDown,
      bool hideAppbarActions,
      int bottomNavIndex});
}

class _$RouteInfoCopyWithImpl<$Res> implements $RouteInfoCopyWith<$Res> {
  _$RouteInfoCopyWithImpl(this._value, this._then);

  final RouteInfo _value;
  // ignore: unused_field
  final $Res Function(RouteInfo) _then;

  @override
  $Res call({
    Object id = freezed,
    Object route = freezed,
    Object routeArg = freezed,
    Object parentRoute = freezed,
    Object isFeature = freezed,
    Object showDrawer = freezed,
    Object disableLanguageDropDown = freezed,
    Object hideAppbarActions = freezed,
    Object bottomNavIndex = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as RouteEnum,
      route: route == freezed ? _value.route : route as String,
      routeArg: routeArg == freezed ? _value.routeArg : routeArg,
      parentRoute:
          parentRoute == freezed ? _value.parentRoute : parentRoute as String,
      isFeature: isFeature == freezed ? _value.isFeature : isFeature as bool,
      showDrawer:
          showDrawer == freezed ? _value.showDrawer : showDrawer as bool,
      disableLanguageDropDown: disableLanguageDropDown == freezed
          ? _value.disableLanguageDropDown
          : disableLanguageDropDown as bool,
      hideAppbarActions: hideAppbarActions == freezed
          ? _value.hideAppbarActions
          : hideAppbarActions as bool,
      bottomNavIndex: bottomNavIndex == freezed
          ? _value.bottomNavIndex
          : bottomNavIndex as int,
    ));
  }
}

abstract class _$RouteInfoCopyWith<$Res> implements $RouteInfoCopyWith<$Res> {
  factory _$RouteInfoCopyWith(
          _RouteInfo value, $Res Function(_RouteInfo) then) =
      __$RouteInfoCopyWithImpl<$Res>;
  @override
  $Res call(
      {RouteEnum id,
      String route,
      Object routeArg,
      String parentRoute,
      bool isFeature,
      bool showDrawer,
      bool disableLanguageDropDown,
      bool hideAppbarActions,
      int bottomNavIndex});
}

class __$RouteInfoCopyWithImpl<$Res> extends _$RouteInfoCopyWithImpl<$Res>
    implements _$RouteInfoCopyWith<$Res> {
  __$RouteInfoCopyWithImpl(_RouteInfo _value, $Res Function(_RouteInfo) _then)
      : super(_value, (v) => _then(v as _RouteInfo));

  @override
  _RouteInfo get _value => super._value as _RouteInfo;

  @override
  $Res call({
    Object id = freezed,
    Object route = freezed,
    Object routeArg = freezed,
    Object parentRoute = freezed,
    Object isFeature = freezed,
    Object showDrawer = freezed,
    Object disableLanguageDropDown = freezed,
    Object hideAppbarActions = freezed,
    Object bottomNavIndex = freezed,
  }) {
    return _then(_RouteInfo(
      id: id == freezed ? _value.id : id as RouteEnum,
      route: route == freezed ? _value.route : route as String,
      routeArg: routeArg == freezed ? _value.routeArg : routeArg,
      parentRoute:
          parentRoute == freezed ? _value.parentRoute : parentRoute as String,
      isFeature: isFeature == freezed ? _value.isFeature : isFeature as bool,
      showDrawer:
          showDrawer == freezed ? _value.showDrawer : showDrawer as bool,
      disableLanguageDropDown: disableLanguageDropDown == freezed
          ? _value.disableLanguageDropDown
          : disableLanguageDropDown as bool,
      hideAppbarActions: hideAppbarActions == freezed
          ? _value.hideAppbarActions
          : hideAppbarActions as bool,
      bottomNavIndex: bottomNavIndex == freezed
          ? _value.bottomNavIndex
          : bottomNavIndex as int,
    ));
  }
}

class _$_RouteInfo implements _RouteInfo {
  const _$_RouteInfo(
      {@required this.id,
      @required this.route,
      this.routeArg,
      this.parentRoute = Routes.homeRoute,
      this.isFeature = false,
      this.showDrawer = false,
      this.disableLanguageDropDown = false,
      this.hideAppbarActions = true,
      this.bottomNavIndex = -1})
      : assert(id != null),
        assert(route != null),
        assert(parentRoute != null),
        assert(isFeature != null),
        assert(showDrawer != null),
        assert(disableLanguageDropDown != null),
        assert(hideAppbarActions != null),
        assert(bottomNavIndex != null);

  @override
  final RouteEnum id;
  @override
  final String route;
  @override
  final Object routeArg;
  @JsonKey(defaultValue: Routes.homeRoute)
  @override
  final String parentRoute;
  @JsonKey(defaultValue: false)
  @override
  final bool isFeature;
  @JsonKey(defaultValue: false)
  @override
  final bool showDrawer;
  @JsonKey(defaultValue: false)
  @override
  final bool disableLanguageDropDown;
  @JsonKey(defaultValue: true)
  @override
  final bool hideAppbarActions;
  @JsonKey(defaultValue: -1)
  @override
  final int bottomNavIndex;

  @override
  String toString() {
    return 'RouteInfo(id: $id, route: $route, routeArg: $routeArg, parentRoute: $parentRoute, isFeature: $isFeature, showDrawer: $showDrawer, disableLanguageDropDown: $disableLanguageDropDown, hideAppbarActions: $hideAppbarActions, bottomNavIndex: $bottomNavIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RouteInfo &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.route, route) ||
                const DeepCollectionEquality().equals(other.route, route)) &&
            (identical(other.routeArg, routeArg) ||
                const DeepCollectionEquality()
                    .equals(other.routeArg, routeArg)) &&
            (identical(other.parentRoute, parentRoute) ||
                const DeepCollectionEquality()
                    .equals(other.parentRoute, parentRoute)) &&
            (identical(other.isFeature, isFeature) ||
                const DeepCollectionEquality()
                    .equals(other.isFeature, isFeature)) &&
            (identical(other.showDrawer, showDrawer) ||
                const DeepCollectionEquality()
                    .equals(other.showDrawer, showDrawer)) &&
            (identical(
                    other.disableLanguageDropDown, disableLanguageDropDown) ||
                const DeepCollectionEquality().equals(
                    other.disableLanguageDropDown, disableLanguageDropDown)) &&
            (identical(other.hideAppbarActions, hideAppbarActions) ||
                const DeepCollectionEquality()
                    .equals(other.hideAppbarActions, hideAppbarActions)) &&
            (identical(other.bottomNavIndex, bottomNavIndex) ||
                const DeepCollectionEquality()
                    .equals(other.bottomNavIndex, bottomNavIndex)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(route) ^
      const DeepCollectionEquality().hash(routeArg) ^
      const DeepCollectionEquality().hash(parentRoute) ^
      const DeepCollectionEquality().hash(isFeature) ^
      const DeepCollectionEquality().hash(showDrawer) ^
      const DeepCollectionEquality().hash(disableLanguageDropDown) ^
      const DeepCollectionEquality().hash(hideAppbarActions) ^
      const DeepCollectionEquality().hash(bottomNavIndex);

  @override
  _$RouteInfoCopyWith<_RouteInfo> get copyWith =>
      __$RouteInfoCopyWithImpl<_RouteInfo>(this, _$identity);
}

abstract class _RouteInfo implements RouteInfo {
  const factory _RouteInfo(
      {@required RouteEnum id,
      @required String route,
      Object routeArg,
      String parentRoute,
      bool isFeature,
      bool showDrawer,
      bool disableLanguageDropDown,
      bool hideAppbarActions,
      int bottomNavIndex}) = _$_RouteInfo;

  @override
  RouteEnum get id;
  @override
  String get route;
  @override
  Object get routeArg;
  @override
  String get parentRoute;
  @override
  bool get isFeature;
  @override
  bool get showDrawer;
  @override
  bool get disableLanguageDropDown;
  @override
  bool get hideAppbarActions;
  @override
  int get bottomNavIndex;
  @override
  _$RouteInfoCopyWith<_RouteInfo> get copyWith;
}
