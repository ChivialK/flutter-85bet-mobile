import 'package:flutter_85bet_mobile/features/exports_for_route_widget.dart';
import 'package:flutter_85bet_mobile/features/router/router.gr.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'route_info.freezed.dart';

@freezed
abstract class RouteInfo with _$RouteInfo {
  const factory RouteInfo({
    @required RouteEnum id,
    @required String route,
    Object routeArg,
    @Default(Routes.homeRoute) String parentRoute,

    /// 1. effect the navigation action
    /// 2. if true, shows the side menu action bar
    @Default(false) bool isFeature,

    /// if true, shows the top navigator drawer icon
    @Default(false) bool showDrawer,

    /// if true, shows the widget on the left side (lang...etc)
    @Default(false) bool disableLanguageDropDown,

    /// if true, shows the widget on the right side (logout, register...etc)
    @Default(true) bool hideAppbarActions,

    /// sets the bottom navigator index to highlight icon
    @Default(-1) int bottomNavIndex,
  }) = _RouteInfo;
}
