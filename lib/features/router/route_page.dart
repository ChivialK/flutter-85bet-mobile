import 'package:flutter/foundation.dart' show debugPrint;
import 'package:flutter_85bet_mobile/core/internal/global.dart';
import 'package:flutter_85bet_mobile/mylogger.dart';
import 'package:vnum/vnum.dart';

import 'route_enum.dart';
import 'route_info.dart';
import 'router.gr.dart';

export 'route_enum.dart';

part 'route_page_ext.dart';

@VnumDefinition
class RoutePage extends Vnum<RouteInfo> {
  /// Case Definition
  static const RoutePage home = const RoutePage.define(RouteInfo(
    id: RouteEnum.HOME,
    route: Routes.homeRoute,
    bottomNavIndex: 0,
    hideAppbarActions: false,
  ));

  static const RoutePage login = const RoutePage.define(RouteInfo(
    id: RouteEnum.LOGIN,
    route: Routes.loginRoute,
    bottomNavIndex: 2,
  ));

  static const RoutePage register = const RoutePage.define(RouteInfo(
    id: RouteEnum.REGISTER,
    route: Routes.registerRoute,
    webPageName: ('/register'),
    hideLanguageOption: true,
  ));

  static const RoutePage promo = const RoutePage.define(RouteInfo(
    id: RouteEnum.PROMO,
    route: Routes.promoRoute,
    webPageName: ('/promo'),
    hideAppbarActions: false,
  ));

  static const RoutePage service = const RoutePage.define(RouteInfo(
    id: RouteEnum.SERVICE,
    route: Routes.serviceRoute,
    webPageName: ('/customer_service'),
    bottomNavIndex: 3,
    hideAppbarActions: false,
    hideLanguageOption: true,
  ));

  static const RoutePage serviceWeb = const RoutePage.define(RouteInfo(
    id: RouteEnum.SERVICE_WEB,
    route: Routes.serviceWebRoute,
    root: Routes.serviceRoute,
    bottomNavIndex: 3,
    hideAppbarActions: false,
    hideLanguageOption: true,
  ));

  static const RoutePage member = const RoutePage.define(RouteInfo(
    id: RouteEnum.MEMBER,
    route: Routes.memberRoute,
    webPageName: ('/myaccount'),
    bottomNavIndex: 2,
    isUserOnly: true,
  ));

  static const RoutePage depositFeature = const RoutePage.define(RouteInfo(
    id: RouteEnum.DEPOSIT,
    route: Routes.depositFeatureRoute,
    webPageName: ('/deposit'),
    bottomNavIndex: 1,
    isUserOnly: true,
  ));

  static const RoutePage deposit = const RoutePage.define(RouteInfo(
    id: RouteEnum.DEPOSIT,
    route: Routes.depositRoute,
    root: Routes.memberRoute,
    isUserOnly: true,
  ));

  static const RoutePage depositWeb = const RoutePage.define(RouteInfo(
    id: RouteEnum.DEPOSIT,
    route: Routes.depositWebPage,
    root: Routes.depositRoute,
    hideLanguageOption: true,
  ));

  static const RoutePage transfer = const RoutePage.define(RouteInfo(
    id: RouteEnum.TRANSFER,
    route: Routes.transferRoute,
    root: Routes.memberRoute,
    webPageName: ('/transfer'),
    isUserOnly: true,
  ));

  static const RoutePage bankcard = const RoutePage.define(RouteInfo(
    id: RouteEnum.BANKCARD,
    route: Routes.bankcardRoute,
    root: Routes.memberRoute,
    webPageName: ('/bankcard'),
    isUserOnly: true,
  ));

  static const RoutePage withdraw = const RoutePage.define(RouteInfo(
    id: RouteEnum.WITHDRAW,
    route: Routes.withdrawRoute,
    routeArg: BankcardRouteArguments(withdraw: true),
    root: Routes.memberRoute,
    webPageName: ('/withdrawal'),
    isUserOnly: true,
  ));

  static const RoutePage balance = const RoutePage.define(RouteInfo(
    id: RouteEnum.BALANCE,
    route: Routes.balanceRoute,
    root: Routes.memberRoute,
    webPageName: ('/platform'),
    isUserOnly: true,
  ));

  static const RoutePage wallet = const RoutePage.define(RouteInfo(
    id: RouteEnum.WALLET,
    route: Routes.walletRoute,
    root: Routes.memberRoute,
    webPageName: ('/wallet'),
    isUserOnly: true,
  ));

  static const RoutePage message = const RoutePage.define(RouteInfo(
    id: RouteEnum.MESSAGE,
    route: Routes.messageRoute,
    root: Routes.memberRoute,
    webPageName: ('/station'),
    hideLanguageOption: true,
    isUserOnly: true,
  ));

  static const RoutePage center = const RoutePage.define(RouteInfo(
    id: RouteEnum.CENTER,
    route: Routes.centerRoute,
    root: Routes.memberRoute,
    webPageName: ('/center'),
    hideLanguageOption: true,
    isUserOnly: true,
  ));

  static const RoutePage centerPassword = const RoutePage.define(RouteInfo(
    id: RouteEnum.PASSWORD,
    route: Routes.centerPasswordPage,
    root: Routes.centerRoute,
    hideLanguageOption: true,
  ));

  static const RoutePage centerWeb = const RoutePage.define(RouteInfo(
    id: RouteEnum.CENTER,
    route: Routes.centerWebPage,
    root: Routes.centerRoute,
    hideLanguageOption: true,
  ));

  static const RoutePage transaction = const RoutePage.define(RouteInfo(
    id: RouteEnum.TRANSFER_RECORD,
    route: Routes.transactionRoute,
    root: Routes.memberRoute,
    webPageName: ('/transfer_record'),
    isUserOnly: true,
  ));

  static const RoutePage betRecord = const RoutePage.define(RouteInfo(
    id: RouteEnum.BETS,
    route: Routes.betRecordRoute,
    root: Routes.memberRoute,
    webPageName: ('/bet_history'),
    isUserOnly: true,
  ));

  static const RoutePage deals = const RoutePage.define(RouteInfo(
    id: RouteEnum.DEALS,
    route: Routes.dealsRoute,
    root: Routes.memberRoute,
    webPageName: ('/transaction'),
    isUserOnly: true,
  ));

  static const RoutePage rollback = const RoutePage.define(RouteInfo(
    id: RouteEnum.ROLLBACK,
    route: Routes.rollbackRoute,
    root: Routes.memberRoute,
    webPageName: ('/bet_rollback'),
    isUserOnly: true,
  ));

  static const RoutePage noticeBoard = const RoutePage.define(RouteInfo(
    id: RouteEnum.NOTICE,
    route: Routes.noticeRoute,
    root: Routes.memberRoute,
    webPageName: ('/remind'),
    isUserOnly: true,
  ));

  static const RoutePage vipLevel = const RoutePage.define(RouteInfo(
    id: RouteEnum.VIP,
    route: Routes.levelRoute,
    root: Routes.memberRoute,
  ));

  ///
  /// agent route
  ///
  // static const RoutePage agentFeatureOld = const RoutePage.define(RouteInfo(
  //   id: RouteEnum.AGENT,
  //   route: Routes.agentFeatureRoute,
  //   hideLanguageOption: true,
  //   isUserOnly: true,
  // ));
  //
  // static const RoutePage agentOld = const RoutePage.define(RouteInfo(
  //   id: RouteEnum.AGENT,
  //   route: Routes.agentRoute,
  //   root: Routes.memberRoute,
  //   hideLanguageOption: true,
  //   isUserOnly: true,
  // ));
  //
  // static const RoutePage agentLogin = const RoutePage.define(RouteInfo(
  //   id: RouteEnum.AGENT_LOGIN,
  //   route: Routes.agentLoginRoute,
  //   hideAppbarActions: true,
  // ));
  //
  // static const RoutePage agentRegister = const RoutePage.define(RouteInfo(
  //   id: RouteEnum.AGENT_REGISTER,
  //   route: Routes.agentRegisterRoute,
  //   root: Routes.agentLoginRoute,
  //   showDrawer: false,
  //   hideAppbarActions: true,
  // ));
  //
  // static const RoutePage agent = const RoutePage.define(RouteInfo(
  //   id: RouteEnum.AGENT,
  //   route: Routes.agentNewRoute,
  //   showDrawer: false,
  //   hideAppbarActions: true,
  //   bottomNavIndex: 10,
  // ));

  ///
  /// side menu route
  /// * important:
  /// change route name if duplicate
  ///
  static const RoutePage sideStore = const RoutePage.define(RouteInfo(
    id: RouteEnum.STORE,
    route: Routes.storeRoute,
    webPageName: ('/mall'),
    showDrawer: true,
    hideLanguageOption: true,
    isUserOnly: true,
  ));

  // static const RoutePage sideRoller = const RoutePage.define(RouteInfo(
  //   id: RouteEnum.ROLLER,
  //   route: Routes.rollerRoute,
  //   webPageName: ('/turntable'),
  //   showDrawer: true,
  //   hideLanguageOption: true,
  //   isUserOnly: true,
  // ));

  static const RoutePage sideDownload = const RoutePage.define(RouteInfo(
    id: RouteEnum.DOWNLOAD,
    route: Routes.downloadAreaRoute,
    showDrawer: true,
    hideLanguageOption: true,
  ));

  static const RoutePage sideNoticeBoard = const RoutePage.define(RouteInfo(
    id: RouteEnum.NOTICE,
    route: Routes.noticeRoute,
    showDrawer: true,
  ));

  static const RoutePage sideTutorial = const RoutePage.define(RouteInfo(
    id: RouteEnum.TUTORIAL,
    route: Routes.tutorialWebPage,
    routeArg: const WebRouteArguments(
      startUrl: '${Global.CURRENT_BASE}newbie',
      hideHtmlBars: true,
    ),
    webPageName: ('/newbie'),
    showDrawer: true,
    hideLanguageOption: true,
  ));

  static const RoutePage sideVipLevel = const RoutePage.define(RouteInfo(
    id: RouteEnum.VIP,
    route: Routes.levelRoute,
    showDrawer: true,
  ));

  static const RoutePage sideWallet = const RoutePage.define(RouteInfo(
    id: RouteEnum.WALLET,
    route: Routes.walletRoute,
    showDrawer: true,
    isUserOnly: true,
  ));

  ///
  /// test route
  ///
  // static const RoutePage template = const RoutePage.define(RouteInfo(
  //   id: RouteEnum.TEMPLATE,
  //   route: Routes.templateRoute,
  //   hideLanguageOption: true,
  //   bottomNavIndex: 5,
  // ));

  static const RoutePage testArea = const RoutePage.define(RouteInfo(
    id: RouteEnum.TEST_UI,
    route: Routes.testAreaRoute,
    hideLanguageOption: true,
  ));

  /// Used for defining cases
  const RoutePage.define(RouteInfo fromValue) : super.define(fromValue);

  /// Used for loading enum using value
  factory RoutePage(RouteInfo value) => Vnum.fromValue(value, RoutePage);

  /// Iterating cases
  /// All value needs to be constant for this to work
  static List<Vnum> get listAll => Vnum.allCasesFor(RoutePage);

  String get pageName => value.route;

  RouteEnum get pageId => value.id;

  String get pageTitle => value.id.title;

  String get pageRoot => value.root;

  bool get isUserOnly => value.isUserOnly;

  bool get hideBarAction => value.hideAppbarActions;

  int get navIndex => value.bottomNavIndex;

  bool get hasBottomNav => value.bottomNavIndex != -1;
}
