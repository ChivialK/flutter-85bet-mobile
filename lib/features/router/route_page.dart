import 'package:flutter/foundation.dart' show debugPrint;
import 'package:flutter_85bet_mobile/core/error/exceptions.dart'
    show UnknownConditionException;
import 'package:flutter_85bet_mobile/core/internal/global.dart';
import 'package:flutter_85bet_mobile/features/router/route_enum.dart';
import 'package:vnum/vnum.dart';

import 'route_info.dart';
import 'router.gr.dart';

export 'package:flutter_85bet_mobile/features/router/route_enum.dart';

@VnumDefinition
class RoutePage extends Vnum<RouteInfo> {
  /// Case Definition
  static const RoutePage home = const RoutePage.define(RouteInfo(
    id: RouteEnum.HOME,
    route: Routes.homeRoute,
    isFeature: true,
    bottomNavIndex: 0,
    hideAppbarActions: false,
  ));

  static const RoutePage login = const RoutePage.define(RouteInfo(
    id: RouteEnum.LOGIN,
    route: Routes.loginRoute,
  ));

//  static const RoutePage movieEg = const RoutePage.define(RouteInfo(
//    id: RouteEnum.MOVIE_EG,
//    route: Routes.movieRoute,
//    disableLanguageDropDown: true,
//  ));
//
//  static const RoutePage movieNew = const RoutePage.define(RouteInfo(
//    id: RouteEnum.MOVIE_NEW,
//    route: Routes.movieRoute,
//    disableLanguageDropDown: true,
//  ));

  static const RoutePage register = const RoutePage.define(RouteInfo(
    id: RouteEnum.REGISTER,
    route: Routes.registerRoute,
    disableLanguageDropDown: true,
  ));

  static const RoutePage promo = const RoutePage.define(RouteInfo(
    id: RouteEnum.PROMO,
    route: Routes.promoRoute,
//    isFeature: true,
//    bottomNavIndex: 2,
//    hideAppbarActions: false,
  ));

  static const RoutePage service = const RoutePage.define(RouteInfo(
    id: RouteEnum.SERVICE,
    route: Routes.serviceRoute,
    isFeature: true,
    bottomNavIndex: 3,
    hideAppbarActions: false,
    disableLanguageDropDown: true,
  ));

  static const RoutePage member = const RoutePage.define(RouteInfo(
    id: RouteEnum.MEMBER,
    route: Routes.memberRoute,
    isFeature: true,
    bottomNavIndex: 2,
  ));

  static const RoutePage depositFeature = const RoutePage.define(RouteInfo(
    id: RouteEnum.DEPOSIT,
    route: Routes.depositFeatureRoute,
    parentRoute: Routes.homeRoute,
    isFeature: true,
    bottomNavIndex: 1,
  ));

  static const RoutePage deposit = const RoutePage.define(RouteInfo(
    id: RouteEnum.DEPOSIT,
    route: Routes.depositRoute,
    parentRoute: Routes.memberRoute,
  ));

  static const RoutePage depositWeb = const RoutePage.define(RouteInfo(
    id: RouteEnum.DEPOSIT,
    route: Routes.depositWebPage,
    parentRoute: Routes.depositRoute,
    disableLanguageDropDown: true,
  ));

  static const RoutePage transfer = const RoutePage.define(RouteInfo(
    id: RouteEnum.TRANSFER,
    route: Routes.transferRoute,
    parentRoute: Routes.memberRoute,
  ));

  static const RoutePage bankcard = const RoutePage.define(RouteInfo(
    id: RouteEnum.BANKCARD,
    route: Routes.bankcardRoute,
    parentRoute: Routes.memberRoute,
  ));

  static const RoutePage withdraw = const RoutePage.define(RouteInfo(
    id: RouteEnum.WITHDRAW,
    route: Routes.withdrawRoute,
    routeArg: BankcardRouteArguments(withdraw: true),
    parentRoute: Routes.memberRoute,
  ));

  static const RoutePage balance = const RoutePage.define(RouteInfo(
    id: RouteEnum.BALANCE,
    route: Routes.balanceRoute,
    parentRoute: Routes.memberRoute,
  ));

  static const RoutePage wallet = const RoutePage.define(RouteInfo(
    id: RouteEnum.WALLET,
    route: Routes.walletRoute,
    parentRoute: Routes.memberRoute,
  ));

  static const RoutePage message = const RoutePage.define(RouteInfo(
    id: RouteEnum.MESSAGE,
    route: Routes.messageRoute,
    parentRoute: Routes.memberRoute,
    disableLanguageDropDown: true,
  ));

  static const RoutePage center = const RoutePage.define(RouteInfo(
    id: RouteEnum.CENTER,
    route: Routes.centerRoute,
    parentRoute: Routes.memberRoute,
    disableLanguageDropDown: true,
  ));

  static const RoutePage centerPassword = const RoutePage.define(RouteInfo(
    id: RouteEnum.PASSWORD,
    route: Routes.centerPasswordPage,
    parentRoute: Routes.centerRoute,
    disableLanguageDropDown: true,
  ));

  static const RoutePage centerWeb = const RoutePage.define(RouteInfo(
    id: RouteEnum.CENTER,
    route: Routes.centerWebPage,
    parentRoute: Routes.centerRoute,
    disableLanguageDropDown: true,
  ));

  static const RoutePage transaction = const RoutePage.define(RouteInfo(
    id: RouteEnum.TRANSFER_RECORD,
    route: Routes.transactionRoute,
    parentRoute: Routes.memberRoute,
  ));

  static const RoutePage betRecord = const RoutePage.define(RouteInfo(
    id: RouteEnum.BETS,
    route: Routes.betRecordRoute,
    parentRoute: Routes.memberRoute,
  ));

  static const RoutePage deals = const RoutePage.define(RouteInfo(
    id: RouteEnum.DEALS,
    route: Routes.dealsRoute,
    parentRoute: Routes.memberRoute,
  ));

  static const RoutePage flows = const RoutePage.define(RouteInfo(
    id: RouteEnum.FLOW,
    route: Routes.flowsRoute,
    parentRoute: Routes.memberRoute,
  ));

  static const RoutePage agentFeature = const RoutePage.define(RouteInfo(
    id: RouteEnum.AGENT,
    route: Routes.agentFeatureRoute,
    parentRoute: Routes.homeRoute,
    isFeature: true,
    bottomNavIndex: 1,
    disableLanguageDropDown: true,
  ));

  static const RoutePage agent = const RoutePage.define(RouteInfo(
    id: RouteEnum.AGENT,
    route: Routes.agentRoute,
    parentRoute: Routes.memberRoute,
    disableLanguageDropDown: true,
  ));

  static const RoutePage tutorial = const RoutePage.define(RouteInfo(
    id: RouteEnum.TUTORIAL,
    route: Routes.moreWebPage,
    routeArg: const WebRouteArguments(
      startUrl: '${Global.CURRENT_BASE}newbie',
      hideBars: true,
    ),
    parentRoute: Routes.homeRoute,
    disableLanguageDropDown: true,
  ));

  static const RoutePage noticeBoard = const RoutePage.define(RouteInfo(
    id: RouteEnum.NOTICE,
    route: Routes.noticeRoute,
    parentRoute: Routes.memberRoute,
  ));

  static const RoutePage vipLevel = const RoutePage.define(RouteInfo(
    id: RouteEnum.VIP,
    route: Routes.levelRoute,
    parentRoute: Routes.memberRoute,
  ));

  static const RoutePage agentAbout = const RoutePage.define(RouteInfo(
    id: RouteEnum.AGENT_ABOUT,
    route: Routes.moreWebPage,
    routeArg: const WebRouteArguments(
      startUrl: '${Global.CURRENT_BASE}agentPage',
      hideBars: true,
    ),
    parentRoute: Routes.homeRoute,
    disableLanguageDropDown: true,
  ));

  /// side menu route
  static const RoutePage downloadArea = const RoutePage.define(RouteInfo(
    id: RouteEnum.DOWNLOAD,
    route: Routes.downloadAreaRoute,
    showDrawer: true,
    disableLanguageDropDown: true,
  ));

  static const RoutePage sideNoticeBoard = const RoutePage.define(RouteInfo(
    id: RouteEnum.NOTICE,
    route: Routes.noticeRoute,
    showDrawer: true,
  ));

  static const RoutePage sideTutorial = const RoutePage.define(RouteInfo(
    id: RouteEnum.TUTORIAL,
    route: Routes.moreWebPage,
    routeArg: const WebRouteArguments(
      startUrl: '${Global.CURRENT_BASE}newbie',
      hideBars: true,
    ),
    showDrawer: true,
    disableLanguageDropDown: true,
  ));

  static const RoutePage sideWallet = const RoutePage.define(RouteInfo(
    id: RouteEnum.WALLET,
    route: Routes.walletRoute,
    showDrawer: true,
  ));

  static const RoutePage sideVipLevel = const RoutePage.define(RouteInfo(
    id: RouteEnum.VIP,
    route: Routes.levelRoute,
    showDrawer: true,
  ));
//
//  static const RoutePage pointStore = const RoutePage.define(RouteInfo(
//    id: RouteEnum.STORE,
//    route: Routes.storeRoute,
//    showDrawer: true,
//    disableLanguageDropDown: true,
//  ));
//
//  static const RoutePage roller = const RoutePage.define(RouteInfo(
//    id: RouteEnum.ROLLER,
//    route: Routes.rollerRoute,
//    showDrawer: true,
//    disableLanguageDropDown: true,
//  ));

  /// test route
//  static const RoutePage template = const RoutePage.define(RouteInfo(
//    id: RouteEnum.TEMPLATE,
//    route: Routes.templateRoute,
//    disableLanguageDropDown: true,
//  ));

  static const RoutePage testArea = const RoutePage.define(RouteInfo(
    id: RouteEnum.TEST,
    route: Routes.testAreaRoute,
    disableLanguageDropDown: true,
  ));

  /// Used for defining cases
  const RoutePage.define(RouteInfo fromValue) : super.define(fromValue);

  /// Used for loading enum using value
  factory RoutePage(RouteInfo value) => Vnum.fromValue(value, RoutePage);

  /// Iterating cases
  /// All value needs to be constant for this to work
  static List<Vnum> get listAll => Vnum.allCasesFor(RoutePage);

  /// (optional) Extend your Vnums
  //RouteInfo example() {
  //  switch(value) {
  //    default:
  //      return RoutePage.example.value;
  //  };
  //}

  String get page => value.route;
  String get pageTitle => value.id.title;
  String get pageRoot => value.parentRoute;
  bool get isFeature => value.isFeature;
  bool get hideBarAction => value.hideAppbarActions;
  int get navIndex => value.bottomNavIndex;
}

List<Vnum> _routes;

extension PagesNameExtension on String {
  /// Get route info by router name which generates in [Router.gr.dart]
  RoutePage get toRoutePage {
    _routes ??= RoutePage.listAll;
    debugPrint("route vnum list length: ${_routes.length}");
//      debugPrint("check routes list type: "
//          "${RoutePage.listAll.every((vnum) => vnum is RoutePage && vnum.value is RouteInfo)}");
    return _routes.singleWhere(
      (page) => (page.value as RouteInfo).route == this,
      orElse: () => getRoutePageByName,
    );
  }

  RoutePage get getRoutePageByName {
    debugPrint("asking route by name: $this");
    switch (this) {
      case '/':
      case Routes.homeRoute:
        return RoutePage.home;
      case Routes.loginRoute:
        return RoutePage.login;
      case Routes.agentFeatureRoute:
        return RoutePage.agentFeature;
      case Routes.agentRoute:
        return RoutePage.agent;
      case Routes.depositFeatureRoute:
        return RoutePage.depositFeature;
      case Routes.depositRoute:
        return RoutePage.deposit;
      case Routes.promoRoute:
        return RoutePage.promo;
      case Routes.serviceRoute:
        return RoutePage.service;
      case Routes.memberRoute:
        return RoutePage.member;
      case Routes.centerRoute:
        return RoutePage.center;
//      case Routes.templateRoute:
//        return RoutePage.template;
      case Routes.testAreaRoute:
        return RoutePage.testArea;
      default:
        throw UnknownConditionException();
    }
  }
}
