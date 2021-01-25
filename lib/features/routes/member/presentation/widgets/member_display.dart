import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/exports_for_route_widget.dart';
import 'package:flutter_85bet_mobile/features/routes/member/presentation/widgets/member_grid_item_widget_bage.dart';
import 'package:flutter_85bet_mobile/features/screen/feature_screen_inherited_widget.dart';
import 'package:flutter_85bet_mobile/features/themes/theme_color_enum.dart';

import '../data/member_grid_item.dart';
import '../state/member_credit_store.dart';
import 'member_display_header.dart';
import 'member_grid_item_widget.dart';

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

  ThemeColorEnum _themeEnum;
  Gradient _itemGradient;
  Gradient _headerGradient;

  double _iconSize;
  double _textHeight;
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
    MemberGridItem.rollback,
    MemberGridItem.vip,
  ];

  void _itemTapped(MemberGridItem item) {
    debugPrint('item tapped: $item');
    if (item.value.route != null) {
      RouterNavigate.navigateToPage(item.value.route);
    } else {
      callToastInfo(localeStr.workInProgress);
    }
  }

  void _updateColor() {
    _themeEnum = ThemeInterface.theme.colorEnum;
    if (ThemeInterface.theme.isDefaultColor) {
      _headerGradient = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          themeColor.memberLinearColor3,
          themeColor.memberLinearColor2,
          themeColor.memberLinearColor1,
        ],
        stops: [0.1, 0.5, 1.0],
        tileMode: TileMode.clamp,
      );
      _itemGradient = _headerGradient;
    } else {
      _headerGradient = RadialGradient(
        colors: [
          themeColor.memberLinearColor2,
          themeColor.memberLinearColor3,
        ],
        stops: [0.1, 1.0],
        radius: 1.3,
        focal: Alignment.topCenter,
        focalRadius: 0.05,
        center: Alignment(0.0, -0.7),
        tileMode: TileMode.clamp,
      );
      _itemGradient = RadialGradient(
        colors: [
          themeColor.memberLinearColor2,
          themeColor.memberLinearColor3,
        ],
        stops: [0.3, 0.9],
        radius: 1.5,
        center: Alignment(0.7, -1.05),
        tileMode: TileMode.clamp,
      );
    }
  }

  @override
  void initState() {
    double gridItemWidth =
        ((Global.device.width - 32) - _itemSpace * (_itemPerRow + 2) - 12) /
            _itemPerRow;
    _iconSize = 32 * Global.device.widthScale;
    _textHeight = (Global.localeCode == 'zh')
        ? (FontSize.SUBTITLE.value - 1) * 1.5
        : (FontSize.SUBTITLE.value - 1) * 2.75;
    _gridRatio = gridItemWidth / (_iconSize * 1.75 + _textHeight + 16.0);
    debugPrint('grid item width: $gridItemWidth, gridRatio: $_gridRatio');
    super.initState();
    _updateColor();
  }

  @override
  void didUpdateWidget(MemberDisplay oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (ThemeInterface.theme.colorEnum != _themeEnum) {
      _updateColor();
    }
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
              widget.store.getUserCredit();
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
                decoration: ThemeInterface.pageIconContainerDecor,
                child: Icon(
                  const IconData(0xe947, fontFamily: 'IconMoon'),
                  size: _iconSize,
                  color: themeColor.iconColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  localeStr.pageTitleCenter,
                  style: TextStyle(
                      fontSize: FontSize.HEADER.value,
                      color: themeColor.defaultTitleColor),
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
            onRefresh: () => widget.store.getUserCredit(),
            headerGradient: _headerGradient,
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
                .map((item) => (item.value.id == RouteEnum.MESSAGE)
                    ? MemberGridItemBadgeWidget(
                        store: widget.store,
                        type: MemberGridItemBadgeType.NEW_MESSAGE,
                        item: item,
                        iconSize: _iconSize,
                        textHeight: _textHeight,
                        onItemTap: (gridItem) => _itemTapped(gridItem),
                        itemGradient: _itemGradient,
                      )
                    : MemberGridItemWidget(
                        item: item,
                        iconSize: _iconSize,
                        textHeight: _textHeight,
                        onItemTap: (gridItem) => _itemTapped(gridItem),
                        itemGradient: _itemGradient,
                      ))
                .toList(),
          ),
        ),
      ],
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    widget.store.getUserCredit();
  }
}
