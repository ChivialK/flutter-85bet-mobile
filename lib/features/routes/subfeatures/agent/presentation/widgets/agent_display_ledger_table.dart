import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/export_internal_file.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/table_cell_text_widget.dart';
import 'package:flutter_85bet_mobile/utils/value_util.dart';

import '../../data/models/agent_ledger_model.dart';

class AgentDisplayLedgerTable extends StatelessWidget {
  final List<AgentLedgerData> dataList;
  final List<num> sumColumn;
  final double availableHeight;

  AgentDisplayLedgerTable({
    @required this.dataList,
    @required this.sumColumn,
    @required this.availableHeight,
  });

  final List<String> _headerRowTexts = [
    localeStr.agentLedgerHeaderAccount,
    localeStr.agentLedgerHeaderDeposit,
    localeStr.agentLedgerHeaderWithdraw,
    localeStr.agentLedgerHeaderPromo,
    localeStr.agentLedgerHeaderRefund,
  ];

  @override
  Widget build(BuildContext context) {
    int availableRows =
        (availableHeight / (FontSize.NORMAL.value * 2.35)).floor();
    debugPrint('max height: $availableHeight, available rows: $availableRows');
    // FontSize.NORMAL.value * 2 = font size * 2 line + space
    double tableHeight = FontSize.NORMAL.value * 2.15 * availableRows;
    double availableWidth = Global.device.width - 16;
    Map<int, TableColumnWidth> _tableWidthMap = {
      //指定索引及固定列宽
      0: FixedColumnWidth(availableWidth * 0.2),
      1: FixedColumnWidth(availableWidth * 0.2),
      2: FixedColumnWidth(availableWidth * 0.2),
      3: FixedColumnWidth(availableWidth * 0.2),
      4: FixedColumnWidth(availableWidth * 0.2),
    };

    return Container(
      constraints: BoxConstraints(
        maxWidth: availableWidth,
        maxHeight: tableHeight,
      ),
      child: SingleChildScrollView(
        child: ColoredBox(
          color: themeColor.chartBgColor,
          child: Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            columnWidths: _tableWidthMap,
            border: TableBorder.all(
              color: themeColor.chartBorderColor,
              width: 2.0,
              style: BorderStyle.solid,
            ),
            /* create table header and generate rows */
            children: _buildContent(),
          ),
        ),
      ),
    );
  }

  List<TableRow> _buildContent() {
    List<TableRow> rows = _buildContentRows();
    rows.insert(0, _buildHeaderRow());
    rows.add(_buildTotalRow());
    return rows;
  }

  List<TableRow> _buildContentRows() {
    return List.generate(dataList.length, (index) {
      AgentLedgerData data = dataList[index];
      List<dynamic> dataTexts = [
        data.account,
        formatNum(data.deposit),
        formatNum(data.withdraw),
        formatNum(data.preferential),
        formatNum(data.rolling),
      ];
      /* generate cell text */
      return TableRow(
        children: List.generate(
          dataTexts.length,
          (index) => TableCellTextWidget(text: '${dataTexts[index]}'),
        ),
      );
    });
  }

  TableRow _buildHeaderRow() {
    return TableRow(
      children: List.generate(
        _headerRowTexts.length,
        (index) => TableCellTextWidget(text: _headerRowTexts[index]),
      ),
    );
  }

  TableRow _buildTotalRow() {
    List<String> _totalRowTexts;
    if (sumColumn.isEmpty) {
      _totalRowTexts = [localeStr.rollbackHeaderTextTotal] +
          List.generate(4, (index) => formatValue(0));
    } else
      _totalRowTexts = [
        localeStr.rollbackHeaderTextTotal,
        formatValue(sumColumn[0]),
        formatValue(sumColumn[1]),
        formatValue(sumColumn[2]),
        formatValue(sumColumn[3]),
      ];
    return TableRow(
      children: List.generate(
        _totalRowTexts.length,
        (index) => TableCellTextWidget(
          text: _totalRowTexts[index],
          shrinkInset: false,
        ),
      ),
    );
  }
}
