import 'package:flutter_85bet_mobile/features/router/route_page.dart';
import 'package:flutter_85bet_mobile/features/themes/icon_code.dart';
import 'package:vnum/vnum.dart';

import 'member_grid_data.dart';

export 'member_grid_data.dart' show MemberGridDataExtension;

@VnumDefinition
class MemberGridItem extends Vnum<MemberGridData> {
  static MemberGridItem deposit = MemberGridItem.define(MemberGridData(
    id: RouteEnum.DEPOSIT,
    iconData: IconCode.gridDeposit,
    route: RoutePage.deposit,
  ));
  static MemberGridItem transfer = MemberGridItem.define(MemberGridData(
    id: RouteEnum.TRANSFER,
    iconData: IconCode.gridTransfer,
    route: RoutePage.transfer,
  ));
  static MemberGridItem bankcard = MemberGridItem.define(MemberGridData(
    id: RouteEnum.BANKCARD,
    iconData: IconCode.gridBankcard,
    route: RoutePage.bankcard,
  ));
  static MemberGridItem withdraw = MemberGridItem.define(MemberGridData(
    id: RouteEnum.WITHDRAW,
    iconData: IconCode.gridWithdraw,
    route: RoutePage.withdraw,
  ));
  static MemberGridItem balance = MemberGridItem.define(MemberGridData(
    id: RouteEnum.BALANCE,
    iconData: IconCode.gridBalance,
    route: RoutePage.balance,
  ));
  static MemberGridItem wallet = MemberGridItem.define(MemberGridData(
    id: RouteEnum.WALLET,
    iconData: IconCode.gridWallet,
    route: RoutePage.wallet,
  ));
  static MemberGridItem stationMessages = MemberGridItem.define(MemberGridData(
    id: RouteEnum.MESSAGE,
    iconData: IconCode.gridMessage,
    route: RoutePage.message,
  ));
  static MemberGridItem accountCenter = MemberGridItem.define(MemberGridData(
    id: RouteEnum.CENTER,
    iconData: IconCode.gridCenter,
    route: RoutePage.center,
  ));
  static MemberGridItem transferRecord = MemberGridItem.define(MemberGridData(
    id: RouteEnum.TRANSFER_RECORD,
    iconData: IconCode.gridTransactions,
    route: RoutePage.transaction,
  ));
  static MemberGridItem betRecord = MemberGridItem.define(MemberGridData(
    id: RouteEnum.BETS,
    iconData: IconCode.gridBets,
    route: RoutePage.betRecord,
  ));
  static MemberGridItem dealRecord = MemberGridItem.define(MemberGridData(
    id: RouteEnum.DEALS,
    iconData: IconCode.gridDeals,
    route: RoutePage.deals,
  ));
  static MemberGridItem rollback = MemberGridItem.define(MemberGridData(
    id: RouteEnum.ROLLBACK,
    iconData: IconCode.gridFlows,
    route: RoutePage.rollback,
  ));

  /// Optional
  // static MemberGridItem agent = MemberGridItem.define(MemberGridData(
  //   id: RouteEnum.AGENT,
  //   iconData: IconCode.gridAgent,
  //   route: RoutePage.agent,
  // ));
  static MemberGridItem vip = MemberGridItem.define(MemberGridData(
    id: RouteEnum.VIP,
    iconData: IconCode.gridVip,
    route: RoutePage.vipLevel,
  ));
  static MemberGridItem notice = MemberGridItem.define(MemberGridData(
    id: RouteEnum.NOTICE,
    iconData: IconCode.gridNotice,
    route: RoutePage.noticeBoard,
  ));

  /// No Route
  static MemberGridItem logout = MemberGridItem.define(MemberGridData(
    id: RouteEnum.LOGOUT,
    iconData: IconCode.gridLogout,
  ));
  static MemberGridItem password = MemberGridItem.define(MemberGridData(
    id: RouteEnum.PASSWORD,
    iconData: IconCode.gridPassword,
  ));
  static MemberGridItem register = MemberGridItem.define(MemberGridData(
    id: RouteEnum.REGISTER,
    iconData: IconCode.gridRegister,
  ));

  /// Used for defining cases
  const MemberGridItem.define(MemberGridData fromValue)
      : super.define(fromValue);
}
