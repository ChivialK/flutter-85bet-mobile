import 'package:flutter_85bet_mobile/builders/autoroute/auto_route_annotations.dart';
import 'package:flutter_85bet_mobile/features/routes/subfeatures/store/presentation/store_route.dart';

import '../routes/home/presentation/home_route.dart';
import '../routes/member/presentation/member_route.dart';
import '../routes/promo/presentation/promo_route.dart';
import '../routes/subfeatures/accountcenter/presentation/center_route.dart';
import '../routes/subfeatures/accountcenter/presentation/widgets/center_display_account_pwd.dart';
import '../routes/subfeatures/balance/presentation/balance_route.dart';
import '../routes/subfeatures/bankcard/presentation/bankcard_route.dart';
import '../routes/subfeatures/betrecord/presentation/bet_record_route.dart';
import '../routes/subfeatures/deals/presentation/deals_route.dart';
import '../routes/subfeatures/deposit/presentation/deposit_route.dart';
import '../routes/subfeatures/downloadarea/download_area_route.dart';
import '../routes/subfeatures/rollback/presentation/rollback_route.dart';
import '../routes/subfeatures/message/presentation/message_route.dart';
import '../routes/subfeatures/notice/presentation/notice_route.dart';
import '../routes/subfeatures/service/presentation/service_route.dart';
import '../routes/subfeatures/transactions/presentation/transaction_route.dart';
import '../routes/subfeatures/transfer/presentation/transfer_route.dart';
import '../routes/subfeatures/viplevel/presentation/vip_level_route.dart';
import '../routes/subfeatures/wallet/presentation/wallet_route.dart';
import '../routes/web/web_route.dart';
import '../test_area_route.dart';
import '../user/login/presentation/login_route.dart';
import '../user/register/presentation/register_route.dart';
import 'my_static_page_transition.dart';

@CustomAutoRouter(
  transitionsBuilder: MyStaticPageTransition.slide,
  durationInMilliseconds: 400,
)
class $FeatureRouter {
  @initial
  HomeRoute homeRoute;
  LoginRoute loginRoute;
  RegisterRoute registerRoute;
  ServiceRoute serviceRoute;
  WebRoute serviceWebRoute;
  MemberRoute memberRoute;
  PromoRoute promoRoute;
  DepositRoute depositRoute;
  DepositRoute depositFeatureRoute;
  WebRoute depositWebPage;
  TransferRoute transferRoute;
  BankcardRoute bankcardRoute;
  BankcardRoute withdrawRoute;
  BalanceRoute balanceRoute;
  WalletRoute walletRoute;
  MessageRoute messageRoute;
  CenterRoute centerRoute;
  CenterDisplayAccountPassword centerPasswordPage;
  WebRoute centerWebPage;
  TransactionRoute transactionRoute;
  BetRecordRoute betRecordRoute;
  DealsRoute dealsRoute;
  RollbackRoute rollbackRoute;
  WebRoute tutorialWebPage;
  DownloadAreaRoute downloadAreaRoute;
  NoticeRoute noticeRoute;
  VipLevelRoute levelRoute;
  StoreRoute storeRoute;

  /// test route
  TestAreaRoute testAreaRoute;
//  @MaterialRoute(fullscreenDialog: true)
//  TemplateRoute templateRoute;
//  @CustomRoute(
//    transitionsBuilder: TransitionsBuilders.zoomIn,
//    durationInMilliseconds: 200,
//  )
}
