import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/themes/font_size.dart';

import '../data/member_grid_data.dart';
import '../data/member_grid_item.dart';

typedef onMemberGridItemTap = void Function(MemberGridItem);

class MemberGridItemWidgetLinear extends StatelessWidget {
  final MemberGridItem item;
  final onMemberGridItemTap onItemTap;

  MemberGridItemWidgetLinear({@required this.item, @required this.onItemTap});

  MemberGridData get itemData => item.value;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onItemTap(item),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black45,
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        margin: const EdgeInsets.all(2.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      itemData.iconDecorColorStart,
                      itemData.iconDecorColorEnd
                    ],
                    tileMode: TileMode.clamp,
                  ),
                  shape: BoxShape.circle,
                ),
                child: Icon(itemData.iconData),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6.0),
              child: Text(
                itemData.label,
                style: TextStyle(fontSize: FontSize.SUBTITLE.value - 1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
