import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/exports_for_display_widget.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/checkbox_widget.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/customize_dropdown_widget.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/customize_titled_container.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/horizontal_radio_group_widget.dart';

import '../../data/enum/agent_chart_time_enum.dart';
import '../../data/enum/agent_chart_type_enum.dart';
import '../../data/models/agent_chart_model.dart';
import '../state/agent_store.dart';
import 'agent_display_chart_content.dart';
import 'agent_inherit_widget.dart';

class AgentDisplayChart extends StatefulWidget {
  @override
  _AgentDisplayChartState createState() => _AgentDisplayChartState();
}

class _AgentDisplayChartState extends State<AgentDisplayChart> {
  final GlobalKey _streamKey = new GlobalKey(debugLabel: 'reportstream');
  final GlobalKey<CustomizeDropdownWidgetState> _selectorKey =
      new GlobalKey(debugLabel: 'selector');
  final GlobalKey<HorizontalRadioGroupWidgetState> _radiosKey =
      new GlobalKey(debugLabel: 'radios');
  final GlobalKey<CheckboxWidgetState> _fullKey =
      new GlobalKey(debugLabel: 'full');

  final List<String> _selectorStrings = [
    localeStr.agentTextChartMonthPrev,
    localeStr.agentTextChartMonth,
  ];

  final List<String> _radioLabels = [
    localeStr.agentTextChartPlatform,
    localeStr.agentTextChartCategory,
  ];

  AgentStore _store;
  AgentChartTime _dateSelected;
  bool query = false;

  @override
  void initState() {
    _dateSelected = AgentChartTime.THIS_MONTH;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _store ??= AgentStoreInheritedWidget.of(context).store;
    if (_store == null) {
      return Center(
        child: WarningDisplay(
          message:
              Failure.internal(FailureCode(type: FailureType.INHERIT)).message,
        ),
      );
    }
    return Container(
      padding: const EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 2.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          CustomizeDropdownWidget(
            key: _selectorKey,
            horizontalInset: 16.0,
            prefixText: localeStr.agentTextChartDate,
            optionValues: AgentChartTime.LIST,
            optionStrings: _selectorStrings,
            defaultValueIndex: 1,
            changeNotify: (data) {
              _dateSelected = data;
              debugPrint('selected: $data');
            },
          ),
          CustomizeTitledContainer(
            horizontalInset: 16.0,
            childAlignment: Alignment.centerLeft,
            prefixText: localeStr.agentTextChartOption,
            child: HorizontalRadioGroupWidget(
              _radiosKey,
              radioLabels: _radioLabels,
              radioValues: AgentChartType.LIST,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 2.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    child: Text(localeStr.agentTextChartQuery),
                    onPressed: () {
                      query = true;
                      _store.getReport(
                        time: _dateSelected,
                        type: _radiosKey.currentState.getSelected,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          CheckboxWidget(
            key: _fullKey,
            label: localeStr.agentTextChartCheckFull,
            initValue: true,
          ),

          /// report data stream
          StreamBuilder<List<AgentChartModel>>(
            key: _streamKey,
            stream: _store.reportStream,
            initialData: [],
            builder: (_, snapshot) {
              if (snapshot == null ||
                  snapshot.data == null ||
                  snapshot.data.isEmpty) {
                if (query)
                  return SizedBox(
                    height: Global.device.height / 4,
                    child: Center(
                      child: Text(localeStr.messageWarnNoHistoryData),
                    ),
                  );
                else
                  return SizedBox.shrink();
              } else {
                return AgentDisplayChartContent(
                  snapshot.data,
                  _fullKey.currentState.boxChecked,
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
