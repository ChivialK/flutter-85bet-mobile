part of 'route_page.dart';

List<Vnum> _featureScreenRoutes;

extension PagesNameExtension on String {
  /// Get route info by router name which generates in [Router.gr.dart]
  RoutePage get toRoutePage {
    _featureScreenRoutes ??= RoutePage.listAll;
    // debugPrint("route vnum list length: ${_featureScreenRoutes.length}");
    // debugPrint("check FeatureScreenRoutes list type: "
    //     "${RoutePage.listAll.every((vnum) => vnum is RoutePage && vnum.value is RouteInfo)}");
    try {
      return _featureScreenRoutes.singleWhere(
          (page) => (page.value as RouteInfo).route == this,
          orElse: () => null) as RoutePage;
    } catch (e) {
      debugPrint("looking for route page by path: $this");
      debugPrint("filtered debug:"
          "${_featureScreenRoutes.where((page) => (page.value as RouteInfo).route == this)}");
      MyLogger.warn(
          msg: 'Warning on get route page by path: $this !!',
          tag: 'RoutePageExt');
      return RoutePage.home;
    }
  }

  RoutePage get urlToRoutePage {
    _featureScreenRoutes ??= RoutePage.listAll;
    try {
      if (this == '/') return RoutePage.home;
      return _featureScreenRoutes.singleWhere(
          (page) => (page.value as RouteInfo).webPageName == this,
          orElse: () => null) as RoutePage;
    } catch (e) {
      debugPrint("looking for route page by url: $this");
      debugPrint("filtered debug:"
          "${_featureScreenRoutes.where((page) => (page.value as RouteInfo).webPageName == this)}");
      MyLogger.warn(
          msg: 'Warning on get route page by url: $this !!',
          tag: 'RoutePageExt');
      return RoutePage.home;
    }
  }
}
