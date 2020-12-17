import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/cached_network_image.dart';
import 'package:flutter_85bet_mobile/features/themes/theme_interface.dart';

import '../data/member_grid_item_v2.dart';

typedef onMemberGridItemV2Tap = void Function(MemberGridItemV2);

class MemberGridItemWidgetV2 extends StatelessWidget {
  final MemberGridItemV2 item;
  final onMemberGridItemV2Tap onItemTap;

  MemberGridItemWidgetV2({@required this.item, @required this.onItemTap});

  RouteListItem get itemData => item.value;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: themeColor.defaultGridColor,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      margin: const EdgeInsets.all(2.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 6.0),
              child: networkImageBuilder(
                itemData.imageName,
                imgScale: 2.0,
                imgColor: themeColor.memberIconColor,
              )),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 2.0),
            height: (FontSize.SUBTITLE.value - 1) * 2.5,
            child: Text(
              itemData.title ?? itemData.route?.pageTitle ?? '?',
              style: TextStyle(
                fontSize: FontSize.SUBTITLE.value - 1,
                color: themeColor.iconTextColor,
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
