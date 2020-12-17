import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/core/internal/global.dart';
import 'package:flutter_85bet_mobile/core/internal/local_strings.dart';
import 'package:flutter_85bet_mobile/features/themes/theme_interface.dart';

import '../state/agent_store.dart';
import 'agent_display_chart.dart';
import 'agent_display_commission.dart';
import 'agent_display_info.dart';
import 'agent_display_ledger.dart';
import 'agent_inherit_widget.dart';

class AgentDisplay extends StatefulWidget {
  final AgentStore store;

  AgentDisplay(this.store);

  @override
  _AgentDisplayState createState() => _AgentDisplayState();
}

class _AgentDisplayState extends State<AgentDisplay> {
  final GlobalKey routeKey = new GlobalKey();
  final List<String> tabs = [
    localeStr.agentTabTitleInfo,
    localeStr.agentTabTitleChart,
    localeStr.agentTabTitleCommission,
    localeStr.agentTabTitleLedger,
//    localeStr.agentTabTitleAds,
  ];

  double gridRatio;
  double contentMaxHeight;
  int _clicked = 0;

  @override
  void initState() {
    double gridItemWidth = (Global.device.width - 6 * 7 - 16) / 5;
    gridRatio = gridItemWidth / 36 / Global.device.widthScale;
    if (gridRatio > 1.75) gridRatio = 1.75;
    print('grid item width: $gridItemWidth, gridRatio: $gridRatio');
    contentMaxHeight = Global.device.height -
        Global.APP_BARS_HEIGHT -
        24 -
        gridItemWidth / gridRatio;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              crossAxisSpacing: 6,
              childAspectRatio: gridRatio,
            ),
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: tabs.length,
            itemBuilder: (_, index) {
              return RaisedButton(
                color: (_clicked == index)
                    ? themeColor.buttonPrimaryColor
                    : themeColor.buttonSecondaryColor,
                child: Text(
                  tabs[index],
                  style: TextStyle(
                      color: (_clicked == index)
                          ? themeColor.buttonTextPrimaryColor
                          : themeColor.defaultTextColor),
                ),
                onPressed: () {
                  if (_clicked == index) return;
                  setState(() {
                    _clicked = index;
                  });
                },
              );
            },
          ),
          Expanded(
            child: AgentStoreInheritedWidget(
              key: routeKey,
              store: widget.store,
              child: IndexedStack(
                index: _clicked,
                children: <Widget>[
                  AgentDisplayInfo(),
                  AgentDisplayChart(),
                  AgentDisplayCommission(contentMaxHeight),
                  AgentDisplayLedger(contentMaxHeight),
//                  AgentDisplayAds(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
