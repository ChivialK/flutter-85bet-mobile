import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/exports_for_display_widget.dart';

import '../../data/models/vip_level_model.dart';

class VipLevelDisplay extends StatelessWidget {
  final VipLevelModel data;

  VipLevelDisplay(this.data);

  final MemberGridItem pageItem = MemberGridItem.vip;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Global.device.width - 24.0,
      child: Align(
        alignment: Alignment.topCenter,
        child: ListView(
          primary: true,
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(4.0, 20.0, 4.0, 12.0),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: themeColor.memberIconColor,
                          boxShadow: ThemeInterface.iconBottomShadow,
                        ),
                        child: Icon(
                          pageItem.value.iconData,
                          size: 32 * Global.device.widthScale,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          pageItem.value.label,
                          style: TextStyle(fontSize: FontSize.HEADER.value),
                        ),
                      )
                    ],
                  ),
                ),
              ] +
              List<Widget>.generate(
                data.levels.length,
                (index) => _buildLevel(data.levels[index]),
              ).toList(),
        ),
      ),
    );
  }

  Widget _buildLevel(VipLevelName level) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 12.0),
      decoration: BoxDecoration(
        color: themeColor.defaultLayeredBackgroundColor,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 2.15,
            blurRadius: 3.0,
            offset: Offset(3, 3), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 20.0, 12.0, 24.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Left Content (Vip badge and name)
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  networkImageBuilder(
                    'images/vip/${level.img}.png',
                    imgScale: 1.75,
                  ),
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: FontSize.NORMAL.value * 4,
                    ),
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Text(
                      level.title,
                      style: TextStyle(
                        color: themeColor.vipTitleColor,
//                        fontSize: FontSize.SMALL.value,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: (level.title.length > 4) ? 2 : 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),

            /// Right Content (level conditions)
            Expanded(
              child: Container(
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.fromLTRB(4.0, 2.0, 4.0, 0.0),
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  separatorBuilder: (context, _) {
                    // add divider between options
                    return Divider(
                      color: themeColor.vipTitleColor,
                      height: 10.0,
                    );
                  },
                  itemCount: data.options.length + 1,
                  itemBuilder: (_, optionIndex) {
                    if (optionIndex == data.options.length) {
                      // will add separator on the bottom
                      return SizedBox.shrink();
                    }

                    VipLevelOption option = data.options[optionIndex];
                    dynamic rule = data.rules[option.key][level.key];
                    if (option.type == 'switch')
                      rule = ('$rule' == '0') ? 'X' : '√';
//                    debugPrint('rule:$rule');

                    return Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          flex: 7,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 4.0,
                            ),
                            child: Text(
                              option.ch,
                              style: TextStyle(
                                color: themeColor.vipTitleColor,
                                fontSize: FontSize.SUBTITLE.value,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.visible,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 4.0,
                            ),
                            child: Text(
                              '$rule',
                              style: TextStyle(
                                color: (rule == '√')
                                    ? themeColor.hintHighlightDarkRed
                                    : themeColor.vipLevelTextColor,
                                fontSize: FontSize.SUBTITLE.value,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
