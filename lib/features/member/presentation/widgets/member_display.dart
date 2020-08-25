import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/exports_for_route_widget.dart';
import 'package:flutter_85bet_mobile/features/member/presentation/widgets/member_grid_item_widget.dart';
import 'package:flutter_85bet_mobile/features/screen/feature_screen_inherited_widget.dart';

import '../data/member_grid_item.dart';
import '../state/member_credit_store.dart';
import 'member_display_header.dart';

class MemberDisplay extends StatefulWidget {
  final MemberCreditStore store;

  MemberDisplay(this.store);

  @override
  _MemberDisplayState createState() => _MemberDisplayState();
}

class _MemberDisplayState extends State<MemberDisplay> with AfterLayoutMixin {
  List<ReactionDisposer> _disposers;
  final GlobalKey<MemberDisplayHeaderState> _headerKey =
      new GlobalKey<MemberDisplayHeaderState>(debugLabel: 'header');

  final int _itemPerRow = 3;
  final double _itemSpace = 12.0;
  double _gridRatio;

  static final List<MemberGridItem> _gridItems = [
    MemberGridItem.notice,
    MemberGridItem.deposit,
    MemberGridItem.transfer,
    MemberGridItem.bankcard,
    MemberGridItem.withdraw,
    MemberGridItem.balance,
    MemberGridItem.wallet,
    MemberGridItem.stationMessages,
    MemberGridItem.accountCenter,
    MemberGridItem.transferRecord,
    MemberGridItem.betRecord,
    MemberGridItem.dealRecord,
    MemberGridItem.flowRecord,
    MemberGridItem.vip,
  ];

  void _itemTapped(MemberGridItem item) {
    debugPrint('item tapped: $item');
    if (item == MemberGridItem.withdraw && item.value.route != null) {
      RouterNavigate.navigateToPage(
        item.value.route,
        arg: BankcardRouteArguments(withdraw: true),
      );
    } else if (item.value.route != null) {
      RouterNavigate.navigateToPage(item.value.route);
    } else {
      callToastInfo(localeStr.workInProgress);
    }
  }

  @override
  void initState() {
    double gridItemWidth =
        ((Global.device.width - 32) - _itemSpace * (_itemPerRow + 2) - 12) /
            _itemPerRow;
    _gridRatio =
        (Global.lang == 'zh') ? gridItemWidth / 96 : gridItemWidth / 108;
    debugPrint('grid item width: $gridItemWidth, gridRatio: $_gridRatio');
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _disposers ??= [
      /* Reaction on error message changed */
      reaction(
        // Observe in page
        // Tell the reaction which observable to observe
        (_) => widget.store.errorMessage,
        // Run some logic with the content of the observed field
        (String msg) {
          if (msg != null && msg.isNotEmpty) {
            callToastError(msg);
          }
        },
      ),
      /* Reaction on user credit changed */
      reaction(
        // Tell the reaction which observable to observe
        (_) => widget.store.credit,
        // Run some logic with the content of the observed field
        (credit) {
          debugPrint('reaction on credit update');
          _headerKey.currentState.updateCredit = credit;
        },
      ),
    ];
  }

  @override
  void dispose() {
    _disposers.forEach((d) => d());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      primary: true,
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      children: <Widget>[
        /// update new message count and member credit
        /// triggered by navigate back and user login/logout
        StreamBuilder<bool>(
          stream: RouterNavigate.routerStreams.recheckUserStream,
          initialData: false,
          builder: (context, snapshot) {
            if (snapshot.data) {
              widget.store.getCredit();
              widget.store.getNewMessageCount();
              try {
                final featureInherit =
                    FeatureScreenInheritedWidget.of(context)?.store ?? null;
                debugPrint('found feature inherit: ${featureInherit != null}');
                if (featureInherit != null) featureInherit.getNewMessageCount();
              } on Exception {}
            }
            return SizedBox.shrink();
          },
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(4.0, 20.0, 4.0, 12.0),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Themes.memberIconColor,
                  boxShadow: Themes.roundIconShadow,
                ),
                child: Icon(
                  const IconData(0xe961, fontFamily: 'IconMoon'),
                  size: 32 * Global.device.widthScale,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  localeStr.pageTitleCenter,
                  style: TextStyle(fontSize: FontSize.HEADER.value),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(4.0, 20.0, 4.0, 6.0),
          child: MemberDisplayHeader(
            key: _headerKey,
            userName: widget.store.user.account,
            vipLevel: widget.store.user.vip,
            onRefresh: () => widget.store.getCredit(),
          ),
        ),
        /* Features Grid */
        Padding(
          padding: const EdgeInsets.only(top: 12.0, bottom: 4.0),
          child: GridView.count(
            primary: false,
            physics: BouncingScrollPhysics(),
            crossAxisCount: _itemPerRow,
            mainAxisSpacing: _itemSpace,
            crossAxisSpacing: _itemSpace,
            childAspectRatio: _gridRatio,
            shrinkWrap: true,
            children: _gridItems
                .map((item) => MemberGridItemWidget(
                      item: item,
                      iconSize: 32 * Global.device.widthScale,
                      onItemTap: (gridItem) => _itemTapped(gridItem),
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    widget.store.getCredit();
  }
}
