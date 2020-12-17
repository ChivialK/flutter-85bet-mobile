import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/themes/theme_interface.dart';

import '../data/member_grid_data.dart';
import '../data/member_grid_item.dart';

typedef onMemberGridItemTap = void Function(MemberGridItem);

class MemberGridItemWidget extends StatelessWidget {
  final MemberGridItem item;
  final onMemberGridItemTap onItemTap;
  final double iconSize;

  MemberGridItemWidget(
      {@required this.item, @required this.onItemTap, this.iconSize});

  MemberGridData get itemData => item.value;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onItemTap(item),
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
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: itemData.iconDecorColor ?? themeColor.memberIconColor,
                ),
                child: Icon(itemData.iconData, size: iconSize ?? 24.0),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
                height: (FontSize.SUBTITLE.value - 1) * 2.75,
                child: Text(
                  itemData.label,
                  style: TextStyle(fontSize: FontSize.SUBTITLE.value - 1),
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
