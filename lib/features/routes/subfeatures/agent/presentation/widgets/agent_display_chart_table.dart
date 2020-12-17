import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/core/internal/local_strings.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/table_fixed_widget.dart';
import 'package:flutter_85bet_mobile/features/themes/font_size.dart';
import 'package:flutter_85bet_mobile/utils/value_util.dart';

import '../../data/models/agent_chart_model.dart';

class AgentDisplayChartTable extends StatefulWidget {
  final bool showAll;

  AgentDisplayChartTable(Key key, this.showAll) : super(key: key);

  @override
  AgentDisplayChartTableState createState() => AgentDisplayChartTableState();
}

class AgentDisplayChartTableState extends State<AgentDisplayChartTable> {
  final CellDimensions cellDimensions = CellDimensions(
    contentCellWidth: FontSize.NORMAL.value * 5,
    contentCellHeight: FontSize.NORMAL.value * 1.5 + 6,
    stickyLegendWidth: FontSize.NORMAL.value * 7,
    stickyLegendHeight: FontSize.NORMAL.value * 1.5 + 6,
  );

  final List<String> columnHeaders = [
    localeStr.agentChartHeaderWager,
    localeStr.agentChartHeaderBet,
    localeStr.agentChartHeaderValid,
    localeStr.agentChartHeaderPayout,
    localeStr.agentChartHeaderTotalWager,
    localeStr.agentChartHeaderTotalBet,
    localeStr.agentChartHeaderTotalValid,
    localeStr.agentChartHeaderTotalPayout,
  ];

  List<String> rowHeaders = [
    localeStr.rollbackHeaderTextTotal,
  ];

  AgentChartModel tableData;
  List<num> sumRow;

  set updateContent(AgentChartModel data) {
    debugPrint('called agent report table update, data valid: ${data != null}');
    if (data == null || data.dataList.isEmpty) {
      debugPrint('reset report table');
      tableData = null;
      setState(() {});
    } else if (tableData != data) {
      debugPrint('report table platform: ${data.platform}');
      tableData = data;

      if (widget.showAll)
        rowHeaders = tableData.dataList.map((e) => e.key).toList()
          ..add(localeStr.rollbackHeaderTextTotal);
      else
        rowHeaders = [localeStr.rollbackHeaderTextTotal];

      sumRow = tableData.sumEachColumn;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    if (tableData == null) return SizedBox.shrink();
    return TableFixedWidget(
      cellDimensions: cellDimensions,
      columnsLength: columnHeaders.length,
      rowsLength: rowHeaders.length,
      columnsTitleBuilder: (i) => TableFixedCellWidget.content(
        columnHeaders[i],
        cellDimensions: cellDimensions,
      ),
      rowsTitleBuilder: (i) => TableFixedCellWidget.rowHeader(
        rowHeaders[i],
        cellDimensions: cellDimensions,
      ),
      contentCellBuilder: (i, j) {
//        print('i:$i, j:$j');
        if (j == rowHeaders.length - 1)
          return TableFixedCellWidget.content(
            formatNum(sumRow[i]),
            cellDimensions: cellDimensions,
          );
        else if (widget.showAll)
          return TableFixedCellWidget.content(
            formatNum(tableData[j][i]),
            cellDimensions: cellDimensions,
          );
        else
          return SizedBox.shrink();
      },
      legendCell: TableFixedCellWidget.legend(
        localeStr.agentChartHeaderAccount,
        cellDimensions: cellDimensions,
      ),
    );
  }
}
