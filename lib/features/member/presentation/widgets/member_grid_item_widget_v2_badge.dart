import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/core/internal/themes.dart';
import 'package:flutter_85bet_mobile/features/exports_for_route_widget.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/cached_network_image.dart';

import '../data/member_grid_item_v2.dart';
import '../state/member_credit_store.dart';

typedef onMemberGridItemV2Tap = void Function(MemberGridItemV2);

enum MemberGridItemBadgeType { NEW_MESSAGE }

class MemberGridItemWidgetV2Badge extends StatefulWidget {
  final MemberGridItemV2 item;
  final onMemberGridItemV2Tap onItemTap;
  final MemberCreditStore store;
  final MemberGridItemBadgeType type;

  MemberGridItemWidgetV2Badge({
    @required this.item,
    @required this.onItemTap,
    @required this.store,
    @required this.type,
  });

  @override
  _MemberGridItemWidgetV2BadgeState createState() =>
      _MemberGridItemWidgetV2BadgeState();
}

class _MemberGridItemWidgetV2BadgeState
    extends State<MemberGridItemWidgetV2Badge> {
  RouteListItem get itemData => widget.item.value;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Themes.defaultGridColor,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      margin: const EdgeInsets.all(2.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 6.0),
            child: Observer(
              builder: (_) => Badge(
                showBadge: widget.store.hasNewMessage,
                badgeColor: Themes.hintHighlightRed,
                badgeContent: Container(
                  margin: const EdgeInsets.all(1.0),
                  child: Icon(
                    const IconData(0xf129, fontFamily: 'FontAwesome'),
                    color: Colors.white,
                    size: 10.0,
                  ),
                ),
                padding: EdgeInsets.zero,
                position: BadgePosition.topRight(top: -2, right: -6),
                child: networkImageBuilder(
                  itemData.imageName,
                  imgScale: 2.0,
                  imgColor: Themes.memberIconColor,
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 2.0),
            height: (FontSize.SUBTITLE.value - 1) * 2.5,
            child: Text(
              itemData.title ?? itemData.route?.pageTitle ?? '?',
              style: TextStyle(
                fontSize: FontSize.SUBTITLE.value - 1,
                color: Themes.iconTextColor,
              ),
              maxLines: 2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
