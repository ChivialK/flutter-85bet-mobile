import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/core/internal/global.dart';
import 'package:flutter_85bet_mobile/features/themes/theme_interface.dart';

import '../../data/models/agent_chart_model.dart';
import 'agent_display_chart_table.dart';

class AgentDisplayChartContent extends StatefulWidget {
  final List<AgentChartModel> dataList;
  final bool showAll;

  AgentDisplayChartContent(this.dataList, this.showAll);

  @override
  _AgentDisplayChartContentState createState() =>
      _AgentDisplayChartContentState();
}

class _AgentDisplayChartContentState extends State<AgentDisplayChartContent>
    with AfterLayoutMixin {
  final GlobalKey<AgentDisplayChartTableState> _tableKey =
      new GlobalKey(debugLabel: 'table');

  List<String> tabs;
  int _clicked = 0;

  void updateTable(int tabIndex) {
    debugPrint('table data: ${widget.dataList}');
    _clicked = tabIndex;
    if (widget.dataList != null && widget.dataList.isNotEmpty) {
      try {
        tabs ??= widget.dataList.map((e) => e.platform).toList();
        _tableKey.currentState.updateContent = widget.dataList
            .singleWhere((element) => element.platform == tabs[tabIndex]);
        setState(() {});
      } on Exception {}
    }
  }

  @override
  void didUpdateWidget(AgentDisplayChartContent oldWidget) {
    debugPrint('updating agent chart content widget');
    super.didUpdateWidget(oldWidget);
    updateTable(0);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.dataList.isEmpty) {
      if (tabs != null) tabs = null;
      return SizedBox.shrink();
    }
    tabs ??= widget.dataList.map((e) => e.platform).toList();
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          if (tabs != null && tabs.isNotEmpty)
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: Global.device.width - 12,
                maxHeight: 36,
              ),
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: tabs.length,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: RaisedButton(
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
                        updateTable(index);
                      },
                    ),
                  );
                },
              ),
            ),
          Center(
            child: Container(
              constraints: BoxConstraints(
                maxWidth: Global.device.width - 20,
                maxHeight: Global.device.height * 0.3,
              ),
              padding: const EdgeInsets.only(left: 4.0, top: 6.0),
              child: AgentDisplayChartTable(_tableKey, widget.showAll),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    debugPrint('layout agent chart content widget');
    updateTable(0);
  }
}
