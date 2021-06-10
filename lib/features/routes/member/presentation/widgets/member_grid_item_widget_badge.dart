import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/exports_for_route_widget.dart';
import 'package:flutter_85bet_mobile/features/routes/member/presentation/state/member_credit_store.dart';
import 'package:flutter_85bet_mobile/features/themes/theme_interface.dart';

import '../data/member_grid_data.dart';
import '../data/member_grid_item.dart';

typedef onMemberGridItemTap = void Function(MemberGridItem);

enum MemberGridItemBadgeType { NEW_MESSAGE }

class MemberGridItemWidgetBadge extends StatefulWidget {
  final MemberGridItem item;
  final double iconSize;
  final onMemberGridItemTap onItemTap;
  final MemberCreditStore store;
  final MemberGridItemBadgeType type;

  MemberGridItemWidgetBadge({
    @required this.item,
    @required this.onItemTap,
    this.iconSize,
    @required this.store,
    @required this.type,
  });

  @override
  _MemberGridItemWidgetBadgeState createState() =>
      _MemberGridItemWidgetBadgeState();
}

class _MemberGridItemWidgetBadgeState extends State<MemberGridItemWidgetBadge> {
  MemberGridData get itemData => widget.item.value;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onItemTap(widget.item),
      child: Container(
        margin: const EdgeInsets.all(4.0),
        child: DecoratedBox(
          decoration: ThemeInterface.gridItemShadowDecor,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 8.0),
                padding: const EdgeInsets.all(10.0),
                child: Observer(
                  builder: (_) => Badge(
                    showBadge: widget.store.hasNewMessage,
                    badgeColor: themeColor.hintHighlightRed,
                    badgeContent: Container(
                      margin: const EdgeInsets.all(1.0),
                      child: Icon(
                        const IconData(0xf129, fontFamily: 'FontAwesome'),
                        color: Colors.white,
                        size: 10.0,
                      ),
                    ),
                    padding: EdgeInsets.zero,
                    position: BadgePosition.topEnd(top: -2, end: -6),
                    child: Icon(
                      itemData.iconData,
                      size: widget.iconSize ?? 24.0,
                      color: themeColor.memberIconColor,
                    ),
                  ),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
                height: (FontSize.SUBTITLE.value - 1) * 2.75,
                child: Text(
                  itemData.label,
                  style: TextStyle(fontSize: FontSize.SUBTITLE.value),
                  maxLines: 2,
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
