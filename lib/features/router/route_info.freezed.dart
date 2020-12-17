// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'route_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$RouteInfoTearOff {
  const _$RouteInfoTearOff();

// ignore: unused_element
  _RouteInfo call(
      {@required RouteEnum id,
      @required String route,
      Object routeArg,
      String root = Routes.homeRoute,
      bool isFeature = false,
      bool isUserOnly = false,
      bool showDrawer = false,
      bool hideLanguageOption = false,
      bool hideAppbarActions = true,
      int bottomNavIndex = -1,
      String webPageName}) {
    return _RouteInfo(
      id: id,
      route: route,
      routeArg: routeArg,
      root: root,
      isFeature: isFeature,
      isUserOnly: isUserOnly,
      showDrawer: showDrawer,
      hideLanguageOption: hideLanguageOption,
      hideAppbarActions: hideAppbarActions,
      bottomNavIndex: bottomNavIndex,
      webPageName: webPageName,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $RouteInfo = _$RouteInfoTearOff();

/// @nodoc
mixin _$RouteInfo {
  RouteEnum get id;
  String get route;
  Object get routeArg;
  String get root;

  /// 1. effect the navigation action
  /// 2. if true, shows the side menu action bar
  bool get isFeature;

  /// if true, check the user login status before navigate
  bool get isUserOnly;

  /// if true, shows the top navigator drawer icon
  bool get showDrawer;

  /// if true, shows the widget on the left side (lang...etc)
  bool get hideLanguageOption;

  /// if true, shows the widget on the right side (logout, register...etc)
  bool get hideAppbarActions;

  /// sets the bottom navigator index to highlight icon
  int get bottomNavIndex;

  /// for promo and banner to find nav destination
  String get webPageName;

  $RouteInfoCopyWith<RouteInfo> get copyWith;
}

/// @nodoc
abstract class $RouteInfoCopyWith<$Res> {
  factory $RouteInfoCopyWith(RouteInfo value, $Res Function(RouteInfo) then) =
      _$RouteInfoCopyWithImpl<$Res>;
  $Res call(
      {RouteEnum id,
      String route,
      Object routeArg,
      String root,
      bool isFeature,
      bool isUserOnly,
      bool showDrawer,
      bool hideLanguageOption,
      bool hideAppbarActions,
      int bottomNavIndex,
      String webPageName});
}

/// @nodoc
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
    Object root = freezed,
    Object isFeature = freezed,
    Object isUserOnly = freezed,
    Object showDrawer = freezed,
    Object hideLanguageOption = freezed,
    Object hideAppbarActions = freezed,
    Object bottomNavIndex = freezed,
    Object webPageName = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as RouteEnum,
      route: route == freezed ? _value.route : route as String,
      routeArg: routeArg == freezed ? _value.routeArg : routeArg,
      root: root == freezed ? _value.root : root as String,
      isFeature: isFeature == freezed ? _value.isFeature : isFeature as bool,
      isUserOnly:
          isUserOnly == freezed ? _value.isUserOnly : isUserOnly as bool,
      showDrawer:
          showDrawer == freezed ? _value.showDrawer : showDrawer as bool,
      hideLanguageOption: hideLanguageOption == freezed
          ? _value.hideLanguageOption
          : hideLanguageOption as bool,
      hideAppbarActions: hideAppbarActions == freezed
          ? _value.hideAppbarActions
          : hideAppbarActions as bool,
      bottomNavIndex: bottomNavIndex == freezed
          ? _value.bottomNavIndex
          : bottomNavIndex as int,
      webPageName:
          webPageName == freezed ? _value.webPageName : webPageName as String,
    ));
  }
}

/// @nodoc
abstract class _$RouteInfoCopyWith<$Res> implements $RouteInfoCopyWith<$Res> {
  factory _$RouteInfoCopyWith(
          _RouteInfo value, $Res Function(_RouteInfo) then) =
      __$RouteInfoCopyWithImpl<$Res>;
  @override
  $Res call(
      {RouteEnum id,
      String route,
      Object routeArg,
      String root,
      bool isFeature,
      bool isUserOnly,
      bool showDrawer,
      bool hideLanguageOption,
      bool hideAppbarActions,
      int bottomNavIndex,
      String webPageName});
}

/// @nodoc
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
    Object root = freezed,
    Object isFeature = freezed,
    Object isUserOnly = freezed,
    Object showDrawer = freezed,
    Object hideLanguageOption = freezed,
    Object hideAppbarActions = freezed,
    Object bottomNavIndex = freezed,
    Object webPageName = freezed,
  }) {
    return _then(_RouteInfo(
      id: id == freezed ? _value.id : id as RouteEnum,
      route: route == freezed ? _value.route : route as String,
      routeArg: routeArg == freezed ? _value.routeArg : routeArg,
      root: root == freezed ? _value.root : root as String,
      isFeature: isFeature == freezed ? _value.isFeature : isFeature as bool,
      isUserOnly:
          isUserOnly == freezed ? _value.isUserOnly : isUserOnly as bool,
      showDrawer:
          showDrawer == freezed ? _value.showDrawer : showDrawer as bool,
      hideLanguageOption: hideLanguageOption == freezed
          ? _value.hideLanguageOption
          : hideLanguageOption as bool,
      hideAppbarActions: hideAppbarActions == freezed
          ? _value.hideAppbarActions
          : hideAppbarActions as bool,
      bottomNavIndex: bottomNavIndex == freezed
          ? _value.bottomNavIndex
          : bottomNavIndex as int,
      webPageName:
          webPageName == freezed ? _value.webPageName : webPageName as String,
    ));
  }
}

/// @nodoc
class _$_RouteInfo implements _RouteInfo {
  const _$_RouteInfo(
      {@required this.id,
      @required this.route,
      this.routeArg,
      this.root = Routes.homeRoute,
      this.isFeature = false,
      this.isUserOnly = false,
      this.showDrawer = false,
      this.hideLanguageOption = false,
      this.hideAppbarActions = true,
      this.bottomNavIndex = -1,
      this.webPageName})
      : assert(id != null),
        assert(route != null),
        assert(root != null),
        assert(isFeature != null),
        assert(isUserOnly != null),
        assert(showDrawer != null),
        assert(hideLanguageOption != null),
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
  final String root;
  @JsonKey(defaultValue: false)
  @override

  /// 1. effect the navigation action
  /// 2. if true, shows the side menu action bar
  final bool isFeature;
  @JsonKey(defaultValue: false)
  @override

  /// if true, check the user login status before navigate
  final bool isUserOnly;
  @JsonKey(defaultValue: false)
  @override

  /// if true, shows the top navigator drawer icon
  final bool showDrawer;
  @JsonKey(defaultValue: false)
  @override

  /// if true, shows the widget on the left side (lang...etc)
  final bool hideLanguageOption;
  @JsonKey(defaultValue: true)
  @override

  /// if true, shows the widget on the right side (logout, register...etc)
  final bool hideAppbarActions;
  @JsonKey(defaultValue: -1)
  @override

  /// sets the bottom navigator index to highlight icon
  final int bottomNavIndex;
  @override

  /// for promo and banner to find nav destination
  final String webPageName;

  @override
  String toString() {
    return 'RouteInfo(id: $id, route: $route, routeArg: $routeArg, root: $root, isFeature: $isFeature, isUserOnly: $isUserOnly, showDrawer: $showDrawer, hideLanguageOption: $hideLanguageOption, hideAppbarActions: $hideAppbarActions, bottomNavIndex: $bottomNavIndex, webPageName: $webPageName)';
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
            (identical(other.root, root) ||
                const DeepCollectionEquality().equals(other.root, root)) &&
            (identical(other.isFeature, isFeature) ||
                const DeepCollectionEquality()
                    .equals(other.isFeature, isFeature)) &&
            (identical(other.isUserOnly, isUserOnly) ||
                const DeepCollectionEquality()
                    .equals(other.isUserOnly, isUserOnly)) &&
            (identical(other.showDrawer, showDrawer) ||
                const DeepCollectionEquality()
                    .equals(other.showDrawer, showDrawer)) &&
            (identical(other.hideLanguageOption, hideLanguageOption) ||
                const DeepCollectionEquality()
                    .equals(other.hideLanguageOption, hideLanguageOption)) &&
            (identical(other.hideAppbarActions, hideAppbarActions) ||
                const DeepCollectionEquality()
                    .equals(other.hideAppbarActions, hideAppbarActions)) &&
            (identical(other.bottomNavIndex, bottomNavIndex) ||
                const DeepCollectionEquality()
                    .equals(other.bottomNavIndex, bottomNavIndex)) &&
            (identical(other.webPageName, webPageName) ||
                const DeepCollectionEquality()
                    .equals(other.webPageName, webPageName)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(route) ^
      const DeepCollectionEquality().hash(routeArg) ^
      const DeepCollectionEquality().hash(root) ^
      const DeepCollectionEquality().hash(isFeature) ^
      const DeepCollectionEquality().hash(isUserOnly) ^
      const DeepCollectionEquality().hash(showDrawer) ^
      const DeepCollectionEquality().hash(hideLanguageOption) ^
      const DeepCollectionEquality().hash(hideAppbarActions) ^
      const DeepCollectionEquality().hash(bottomNavIndex) ^
      const DeepCollectionEquality().hash(webPageName);

  @override
  _$RouteInfoCopyWith<_RouteInfo> get copyWith =>
      __$RouteInfoCopyWithImpl<_RouteInfo>(this, _$identity);
}

abstract class _RouteInfo implements RouteInfo {
  const factory _RouteInfo(
      {@required RouteEnum id,
      @required String route,
      Object routeArg,
      String root,
      bool isFeature,
      bool isUserOnly,
      bool showDrawer,
      bool hideLanguageOption,
      bool hideAppbarActions,
      int bottomNavIndex,
      String webPageName}) = _$_RouteInfo;

  @override
  RouteEnum get id;
  @override
  String get route;
  @override
  Object get routeArg;
  @override
  String get root;
  @override

  /// 1. effect the navigation action
  /// 2. if true, shows the side menu action bar
  bool get isFeature;
  @override

  /// if true, check the user login status before navigate
  bool get isUserOnly;
  @override

  /// if true, shows the top navigator drawer icon
  bool get showDrawer;
  @override

  /// if true, shows the widget on the left side (lang...etc)
  bool get hideLanguageOption;
  @override

  /// if true, shows the widget on the right side (logout, register...etc)
  bool get hideAppbarActions;
  @override

  /// sets the bottom navigator index to highlight icon
  int get bottomNavIndex;
  @override

  /// for promo and banner to find nav destination
  String get webPageName;
  @override
  _$RouteInfoCopyWith<_RouteInfo> get copyWith;
}
