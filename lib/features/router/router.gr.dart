// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_85bet_mobile/builders/autoroute/auto_route.dart';
import 'package:flutter_85bet_mobile/features/routes/home/presentation/home_route.dart';
import 'package:flutter_85bet_mobile/features/router/my_static_page_transition.dart';
import 'package:flutter_85bet_mobile/features/user/login/presentation/login_route.dart';
import 'package:flutter_85bet_mobile/features/user/register/presentation/register_route.dart';
import 'package:flutter_85bet_mobile/features/routes/subfeatures/service/presentation/service_route.dart';
import 'package:flutter_85bet_mobile/features/routes/web/web_route.dart';
import 'package:flutter_85bet_mobile/features/routes/member/presentation/member_route.dart';
import 'package:flutter_85bet_mobile/features/routes/promo/presentation/promo_route.dart';
import 'package:flutter_85bet_mobile/features/routes/subfeatures/deposit/presentation/deposit_route.dart';
import 'package:flutter_85bet_mobile/features/routes/subfeatures/transfer/presentation/transfer_route.dart';
import 'package:flutter_85bet_mobile/features/routes/subfeatures/bankcard/presentation/bankcard_route.dart';
import 'package:flutter_85bet_mobile/features/routes/subfeatures/balance/presentation/balance_route.dart';
import 'package:flutter_85bet_mobile/features/routes/subfeatures/wallet/presentation/wallet_route.dart';
import 'package:flutter_85bet_mobile/features/routes/subfeatures/message/presentation/message_route.dart';
import 'package:flutter_85bet_mobile/features/routes/subfeatures/accountcenter/presentation/center_route.dart';
import 'package:flutter_85bet_mobile/features/routes/subfeatures/accountcenter/presentation/widgets/center_display_account_pwd.dart';
import 'package:flutter_85bet_mobile/features/routes/subfeatures/accountcenter/presentation/state/center_store.dart';
import 'package:flutter_85bet_mobile/features/routes/subfeatures/transactions/presentation/transaction_route.dart';
import 'package:flutter_85bet_mobile/features/routes/subfeatures/betrecord/presentation/bet_record_route.dart';
import 'package:flutter_85bet_mobile/features/routes/subfeatures/deals/presentation/deals_route.dart';
import 'package:flutter_85bet_mobile/features/routes/subfeatures/rollback/presentation/rollback_route.dart';
import 'package:flutter_85bet_mobile/features/routes/subfeatures/downloadarea/download_area_route.dart';
import 'package:flutter_85bet_mobile/features/routes/subfeatures/notice/presentation/notice_route.dart';
import 'package:flutter_85bet_mobile/features/routes/subfeatures/viplevel/presentation/vip_level_route.dart';
import 'package:flutter_85bet_mobile/features/routes/subfeatures/store/presentation/store_route.dart';
import 'package:flutter_85bet_mobile/features/routes/subfeatures/roller/presentation/roller_route.dart';
import 'package:flutter_85bet_mobile/features/routes/subfeatures/about/presentation/about_route.dart';
import 'package:flutter_85bet_mobile/features/test_area_route.dart';

abstract class Routes {
  static const homeRoute = '/';
  static const loginRoute = '/login-route';
  static const registerRoute = '/register-route';
  static const serviceRoute = '/service-route';
  static const serviceWebRoute = '/service-web-route';
  static const memberRoute = '/member-route';
  static const promoRoute = '/promo-route';
  static const depositRoute = '/deposit-route';
  static const depositFeatureRoute = '/deposit-feature-route';
  static const depositWebPage = '/deposit-web-page';
  static const transferRoute = '/transfer-route';
  static const bankcardRoute = '/bankcard-route';
  static const withdrawRoute = '/withdraw-route';
  static const balanceRoute = '/balance-route';
  static const walletRoute = '/wallet-route';
  static const messageRoute = '/message-route';
  static const centerRoute = '/center-route';
  static const centerPasswordPage = '/center-password-page';
  static const centerWebPage = '/center-web-page';
  static const transactionRoute = '/transaction-route';
  static const betRecordRoute = '/bet-record-route';
  static const dealsRoute = '/deals-route';
  static const rollbackRoute = '/rollback-route';
  static const moreWebPage = '/more-web-page';
  static const downloadAreaRoute = '/download-area-route';
  static const noticeRoute = '/notice-route';
  static const levelRoute = '/level-route';
  static const storeRoute = '/store-route';
  static const rollerRoute = '/roller-route';
  static const aboutRoute = '/about-route';
  static const testAreaRoute = '/test-area-route';
  static const all = {
    homeRoute,
    loginRoute,
    registerRoute,
    serviceRoute,
    serviceWebRoute,
    memberRoute,
    promoRoute,
    depositRoute,
    depositFeatureRoute,
    depositWebPage,
    transferRoute,
    bankcardRoute,
    withdrawRoute,
    balanceRoute,
    walletRoute,
    messageRoute,
    centerRoute,
    centerPasswordPage,
    centerWebPage,
    transactionRoute,
    betRecordRoute,
    dealsRoute,
    rollbackRoute,
    moreWebPage,
    downloadAreaRoute,
    noticeRoute,
    levelRoute,
    storeRoute,
    rollerRoute,
    aboutRoute,
    testAreaRoute,
  };
}

class FeatureRouter extends RouterBase {
  @override
  Set<String> get allRoutes => Routes.all;

  @Deprecated('call ExtendedNavigator.ofRouter<Router>() directly')
  static ExtendedNavigatorState get navigator =>
      ExtendedNavigator.ofRouter<FeatureRouter>();

  @override
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.homeRoute:
        return PageRouteBuilder<dynamic>(
          pageBuilder: (context, animation, secondaryAnimation) => HomeRoute(),
          settings: settings,
          transitionsBuilder: MyStaticPageTransition.slide,
          transitionDuration: const Duration(milliseconds: 400),
        );
      case Routes.loginRoute:
        if (hasInvalidArgs<LoginRouteArguments>(args)) {
          return misTypedArgsRoute<LoginRouteArguments>(args);
        }
        final typedArgs = args as LoginRouteArguments ?? LoginRouteArguments();
        return PageRouteBuilder<dynamic>(
          pageBuilder: (context, animation, secondaryAnimation) => LoginRoute(
              returnHomeAfterLogin: typedArgs.returnHomeAfterLogin,
              isDialog: typedArgs.isDialog),
          settings: settings,
          transitionsBuilder: MyStaticPageTransition.slide,
          transitionDuration: const Duration(milliseconds: 400),
        );
      case Routes.registerRoute:
        if (hasInvalidArgs<RegisterRouteArguments>(args)) {
          return misTypedArgsRoute<RegisterRouteArguments>(args);
        }
        final typedArgs =
            args as RegisterRouteArguments ?? RegisterRouteArguments();
        return PageRouteBuilder<dynamic>(
          pageBuilder: (context, animation, secondaryAnimation) =>
              RegisterRoute(isDialog: typedArgs.isDialog),
          settings: settings,
          transitionsBuilder: MyStaticPageTransition.slide,
          transitionDuration: const Duration(milliseconds: 400),
        );
      case Routes.serviceRoute:
        return PageRouteBuilder<dynamic>(
          pageBuilder: (context, animation, secondaryAnimation) =>
              ServiceRoute(),
          settings: settings,
          transitionsBuilder: MyStaticPageTransition.slide,
          transitionDuration: const Duration(milliseconds: 400),
        );
      case Routes.serviceWebRoute:
        if (hasInvalidArgs<WebRouteArguments>(args, isRequired: true)) {
          return misTypedArgsRoute<WebRouteArguments>(args);
        }
        final typedArgs = args as WebRouteArguments;
        return PageRouteBuilder<dynamic>(
          pageBuilder: (context, animation, secondaryAnimation) => WebRoute(
              startUrl: typedArgs.startUrl,
              showUrl: typedArgs.showUrl,
              hideHtmlBars: typedArgs.hideHtmlBars),
          settings: settings,
          transitionsBuilder: MyStaticPageTransition.slide,
          transitionDuration: const Duration(milliseconds: 400),
        );
      case Routes.memberRoute:
        if (hasInvalidArgs<MemberRouteArguments>(args)) {
          return misTypedArgsRoute<MemberRouteArguments>(args);
        }
        final typedArgs =
            args as MemberRouteArguments ?? MemberRouteArguments();
        return PageRouteBuilder<dynamic>(
          pageBuilder: (context, animation, secondaryAnimation) =>
              MemberRoute(key: typedArgs.key),
          settings: settings,
          transitionsBuilder: MyStaticPageTransition.slide,
          transitionDuration: const Duration(milliseconds: 400),
        );
      case Routes.promoRoute:
        if (hasInvalidArgs<PromoRouteArguments>(args)) {
          return misTypedArgsRoute<PromoRouteArguments>(args);
        }
        final typedArgs = args as PromoRouteArguments ?? PromoRouteArguments();
        return PageRouteBuilder<dynamic>(
          pageBuilder: (context, animation, secondaryAnimation) =>
              PromoRoute(openPromoId: typedArgs.openPromoId),
          settings: settings,
          transitionsBuilder: MyStaticPageTransition.slide,
          transitionDuration: const Duration(milliseconds: 400),
        );
      case Routes.depositRoute:
        return PageRouteBuilder<dynamic>(
          pageBuilder: (context, animation, secondaryAnimation) =>
              DepositRoute(),
          settings: settings,
          transitionsBuilder: MyStaticPageTransition.slide,
          transitionDuration: const Duration(milliseconds: 400),
        );
      case Routes.depositFeatureRoute:
        return PageRouteBuilder<dynamic>(
          pageBuilder: (context, animation, secondaryAnimation) =>
              DepositRoute(),
          settings: settings,
          transitionsBuilder: MyStaticPageTransition.slide,
          transitionDuration: const Duration(milliseconds: 400),
        );
      case Routes.depositWebPage:
        if (hasInvalidArgs<WebRouteArguments>(args, isRequired: true)) {
          return misTypedArgsRoute<WebRouteArguments>(args);
        }
        final typedArgs = args as WebRouteArguments;
        return PageRouteBuilder<dynamic>(
          pageBuilder: (context, animation, secondaryAnimation) => WebRoute(
              startUrl: typedArgs.startUrl,
              showUrl: typedArgs.showUrl,
              hideHtmlBars: typedArgs.hideHtmlBars),
          settings: settings,
          transitionsBuilder: MyStaticPageTransition.slide,
          transitionDuration: const Duration(milliseconds: 400),
        );
      case Routes.transferRoute:
        return PageRouteBuilder<dynamic>(
          pageBuilder: (context, animation, secondaryAnimation) =>
              TransferRoute(),
          settings: settings,
          transitionsBuilder: MyStaticPageTransition.slide,
          transitionDuration: const Duration(milliseconds: 400),
        );
      case Routes.bankcardRoute:
        if (hasInvalidArgs<BankcardRouteArguments>(args)) {
          return misTypedArgsRoute<BankcardRouteArguments>(args);
        }
        final typedArgs =
            args as BankcardRouteArguments ?? BankcardRouteArguments();
        return PageRouteBuilder<dynamic>(
          pageBuilder: (context, animation, secondaryAnimation) =>
              BankcardRoute(withdraw: typedArgs.withdraw),
          settings: settings,
          transitionsBuilder: MyStaticPageTransition.slide,
          transitionDuration: const Duration(milliseconds: 400),
        );
      case Routes.withdrawRoute:
        if (hasInvalidArgs<BankcardRouteArguments>(args)) {
          return misTypedArgsRoute<BankcardRouteArguments>(args);
        }
        final typedArgs =
            args as BankcardRouteArguments ?? BankcardRouteArguments();
        return PageRouteBuilder<dynamic>(
          pageBuilder: (context, animation, secondaryAnimation) =>
              BankcardRoute(withdraw: typedArgs.withdraw),
          settings: settings,
          transitionsBuilder: MyStaticPageTransition.slide,
          transitionDuration: const Duration(milliseconds: 400),
        );
      case Routes.balanceRoute:
        return PageRouteBuilder<dynamic>(
          pageBuilder: (context, animation, secondaryAnimation) =>
              BalanceRoute(),
          settings: settings,
          transitionsBuilder: MyStaticPageTransition.slide,
          transitionDuration: const Duration(milliseconds: 400),
        );
      case Routes.walletRoute:
        return PageRouteBuilder<dynamic>(
          pageBuilder: (context, animation, secondaryAnimation) =>
              WalletRoute(),
          settings: settings,
          transitionsBuilder: MyStaticPageTransition.slide,
          transitionDuration: const Duration(milliseconds: 400),
        );
      case Routes.messageRoute:
        return PageRouteBuilder<dynamic>(
          pageBuilder: (context, animation, secondaryAnimation) =>
              MessageRoute(),
          settings: settings,
          transitionsBuilder: MyStaticPageTransition.slide,
          transitionDuration: const Duration(milliseconds: 400),
        );
      case Routes.centerRoute:
        return PageRouteBuilder<dynamic>(
          pageBuilder: (context, animation, secondaryAnimation) =>
              CenterRoute(),
          settings: settings,
          transitionsBuilder: MyStaticPageTransition.slide,
          transitionDuration: const Duration(milliseconds: 400),
        );
      case Routes.centerPasswordPage:
        if (hasInvalidArgs<CenterDisplayAccountPasswordArguments>(args,
            isRequired: true)) {
          return misTypedArgsRoute<CenterDisplayAccountPasswordArguments>(args);
        }
        final typedArgs = args as CenterDisplayAccountPasswordArguments;
        return PageRouteBuilder<dynamic>(
          pageBuilder: (context, animation, secondaryAnimation) =>
              CenterDisplayAccountPassword(store: typedArgs.store),
          settings: settings,
          transitionsBuilder: MyStaticPageTransition.slide,
          transitionDuration: const Duration(milliseconds: 400),
        );
      case Routes.centerWebPage:
        if (hasInvalidArgs<WebRouteArguments>(args, isRequired: true)) {
          return misTypedArgsRoute<WebRouteArguments>(args);
        }
        final typedArgs = args as WebRouteArguments;
        return PageRouteBuilder<dynamic>(
          pageBuilder: (context, animation, secondaryAnimation) => WebRoute(
              startUrl: typedArgs.startUrl,
              showUrl: typedArgs.showUrl,
              hideHtmlBars: typedArgs.hideHtmlBars),
          settings: settings,
          transitionsBuilder: MyStaticPageTransition.slide,
          transitionDuration: const Duration(milliseconds: 400),
        );
      case Routes.transactionRoute:
        return PageRouteBuilder<dynamic>(
          pageBuilder: (context, animation, secondaryAnimation) =>
              TransactionRoute(),
          settings: settings,
          transitionsBuilder: MyStaticPageTransition.slide,
          transitionDuration: const Duration(milliseconds: 400),
        );
      case Routes.betRecordRoute:
        return PageRouteBuilder<dynamic>(
          pageBuilder: (context, animation, secondaryAnimation) =>
              BetRecordRoute(),
          settings: settings,
          transitionsBuilder: MyStaticPageTransition.slide,
          transitionDuration: const Duration(milliseconds: 400),
        );
      case Routes.dealsRoute:
        return PageRouteBuilder<dynamic>(
          pageBuilder: (context, animation, secondaryAnimation) => DealsRoute(),
          settings: settings,
          transitionsBuilder: MyStaticPageTransition.slide,
          transitionDuration: const Duration(milliseconds: 400),
        );
      case Routes.rollbackRoute:
        return PageRouteBuilder<dynamic>(
          pageBuilder: (context, animation, secondaryAnimation) =>
              RollbackRoute(),
          settings: settings,
          transitionsBuilder: MyStaticPageTransition.slide,
          transitionDuration: const Duration(milliseconds: 400),
        );
      case Routes.moreWebPage:
        if (hasInvalidArgs<WebRouteArguments>(args, isRequired: true)) {
          return misTypedArgsRoute<WebRouteArguments>(args);
        }
        final typedArgs = args as WebRouteArguments;
        return PageRouteBuilder<dynamic>(
          pageBuilder: (context, animation, secondaryAnimation) => WebRoute(
              startUrl: typedArgs.startUrl,
              showUrl: typedArgs.showUrl,
              hideHtmlBars: typedArgs.hideHtmlBars),
          settings: settings,
          transitionsBuilder: MyStaticPageTransition.slide,
          transitionDuration: const Duration(milliseconds: 400),
        );
      case Routes.downloadAreaRoute:
        return PageRouteBuilder<dynamic>(
          pageBuilder: (context, animation, secondaryAnimation) =>
              DownloadAreaRoute(),
          settings: settings,
          transitionsBuilder: MyStaticPageTransition.slide,
          transitionDuration: const Duration(milliseconds: 400),
        );
      case Routes.noticeRoute:
        return PageRouteBuilder<dynamic>(
          pageBuilder: (context, animation, secondaryAnimation) =>
              NoticeRoute(),
          settings: settings,
          transitionsBuilder: MyStaticPageTransition.slide,
          transitionDuration: const Duration(milliseconds: 400),
        );
      case Routes.levelRoute:
        return PageRouteBuilder<dynamic>(
          pageBuilder: (context, animation, secondaryAnimation) =>
              VipLevelRoute(),
          settings: settings,
          transitionsBuilder: MyStaticPageTransition.slide,
          transitionDuration: const Duration(milliseconds: 400),
        );
      case Routes.storeRoute:
        if (hasInvalidArgs<StoreRouteArguments>(args)) {
          return misTypedArgsRoute<StoreRouteArguments>(args);
        }
        final typedArgs = args as StoreRouteArguments ?? StoreRouteArguments();
        return PageRouteBuilder<dynamic>(
          pageBuilder: (context, animation, secondaryAnimation) =>
              StoreRoute(showProductId: typedArgs.showProductId),
          settings: settings,
          transitionsBuilder: MyStaticPageTransition.slide,
          transitionDuration: const Duration(milliseconds: 400),
        );
      case Routes.rollerRoute:
        return PageRouteBuilder<dynamic>(
          pageBuilder: (context, animation, secondaryAnimation) =>
              RollerRoute(),
          settings: settings,
          transitionsBuilder: MyStaticPageTransition.slide,
          transitionDuration: const Duration(milliseconds: 400),
        );
      case Routes.aboutRoute:
        return PageRouteBuilder<dynamic>(
          pageBuilder: (context, animation, secondaryAnimation) => AboutRoute(),
          settings: settings,
          transitionsBuilder: MyStaticPageTransition.slide,
          transitionDuration: const Duration(milliseconds: 400),
        );
      case Routes.testAreaRoute:
        return PageRouteBuilder<dynamic>(
          pageBuilder: (context, animation, secondaryAnimation) =>
              TestAreaRoute(),
          settings: settings,
          transitionsBuilder: MyStaticPageTransition.slide,
          transitionDuration: const Duration(milliseconds: 400),
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}

// *************************************************************************
// Arguments holder classes
// **************************************************************************

//LoginRoute arguments holder class
class LoginRouteArguments {
  final bool returnHomeAfterLogin;
  final bool isDialog;
  LoginRouteArguments(
      {this.returnHomeAfterLogin = false, this.isDialog = false});
}

//RegisterRoute arguments holder class
class RegisterRouteArguments {
  final bool isDialog;
  RegisterRouteArguments({this.isDialog = false});
}

//WebRoute arguments holder class
class WebRouteArguments {
  final String startUrl;
  final bool showUrl;
  final bool hideHtmlBars;
  const WebRouteArguments(
      {@required this.startUrl,
      this.showUrl = false,
      this.hideHtmlBars = false});
}

//MemberRoute arguments holder class
class MemberRouteArguments {
  final Key key;
  MemberRouteArguments({this.key});
}

//PromoRoute arguments holder class
class PromoRouteArguments {
  final int openPromoId;
  PromoRouteArguments({this.openPromoId = -1});
}

//BankcardRoute arguments holder class
class BankcardRouteArguments {
  final bool withdraw;
  const BankcardRouteArguments({this.withdraw = false});
}

//CenterDisplayAccountPassword arguments holder class
class CenterDisplayAccountPasswordArguments {
  final CenterStore store;
  CenterDisplayAccountPasswordArguments({@required this.store});
}

//StoreRoute arguments holder class
class StoreRouteArguments {
  final int showProductId;
  StoreRouteArguments({this.showProductId});
}
