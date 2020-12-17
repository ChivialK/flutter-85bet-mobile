import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/exports_for_display_widget.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/table_cell_text_widget.dart';

import '../../data/models/agent_commission_model.dart';
import '../state/agent_store.dart';
import 'agent_inherit_widget.dart';

class AgentDisplayCommission extends StatefulWidget {
  final double availableHeight;

  AgentDisplayCommission(this.availableHeight);

  @override
  _AgentDisplayCommissionState createState() => _AgentDisplayCommissionState();
}

class _AgentDisplayCommissionState extends State<AgentDisplayCommission>
    with AfterLayoutMixin {
  static final Key _streamKey = new Key('commstream');

  double _availableWidth;
  double _tableHeight;
  Map<int, TableColumnWidth> _tableWidthMap;

  AgentStore _store;
  List<AgentCommissionModel> _dataList;
  Widget tableWidget;
  bool tableHasNoData = true;

  List<String> _headerRowTexts;
  TableRow _headerRow;
  List<String> _totalRowTexts;
  TableRow _totalRow;

  double totalDirectFee = 0;
  double totalTeamFee = 0;
  double totalFee = 0;
  double totalPlatformFee = 0;
  double totalSummary = 0;

  void countTotal() {
    totalDirectFee = 0;
    totalTeamFee = 0;
    totalFee = 0;
    totalPlatformFee = 0;
    totalSummary = 0;
    if (_dataList != null && _dataList.isNotEmpty) {
      _dataList.forEach((data) {
        totalDirectFee += data.direct.strToDouble;
        totalTeamFee += data.team.strToDouble;
        totalFee += data.fee.strToDouble;
        totalPlatformFee += data.platformFee.strToDouble;
        totalSummary += data.summary.strToDouble;
      });
    }
    _totalRow = updateTotalRow();
  }

  TableRow updateTotalRow() {
    _totalRowTexts = [
      localeStr.rollbackHeaderTextTotal,
      formatValue(totalDirectFee),
      formatValue(totalTeamFee),
      formatValue(totalFee),
      formatValue(totalPlatformFee),
      formatValue(totalSummary),
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

  @override
  void initState() {
    int availableRows =
        ((widget.availableHeight - 20) / (FontSize.NORMAL.value * 2.35))
            .floor();
    debugPrint('max height: ${widget.availableHeight}, '
        'available rows: $availableRows');
    // FontSize.NORMAL.value * 2 = font size * 2 line + space
    _tableHeight = FontSize.NORMAL.value * 2.15 * availableRows;

    _availableWidth = Global.device.width - 16;
    _tableWidthMap = {
      //指定索引及固定列宽
      0: FixedColumnWidth(_availableWidth * 0.15),
      1: FixedColumnWidth(_availableWidth * 0.175),
      2: FixedColumnWidth(_availableWidth * 0.175),
      3: FixedColumnWidth(_availableWidth * 0.175),
      4: FixedColumnWidth(_availableWidth * 0.15),
      5: FixedColumnWidth(_availableWidth * 0.175),
    };
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

    _headerRowTexts ??= [
      localeStr.agentCommissionHeaderMonth,
      localeStr.agentCommissionHeaderLowLine,
      localeStr.agentCommissionHeaderGroup,
      localeStr.agentCommissionHeaderAdmin,
      localeStr.agentCommissionHeaderPlatform,
      localeStr.agentCommissionHeaderReceive,
    ];
    _headerRow ??= TableRow(
      children: List.generate(
        _headerRowTexts.length,
        (index) => TableCellTextWidget(
          text: _headerRowTexts[index],
          shrinkInset: false,
        ),
      ),
    );

    _totalRow ??= updateTotalRow();

    return Container(
      padding: const EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 4.0),
      constraints: BoxConstraints(
        maxWidth: _availableWidth,
        maxHeight: _tableHeight,
      ),
      child: StreamBuilder<List<AgentCommissionModel>>(
        key: _streamKey,
        stream: _store.commissionStream,
        builder: (context, snapshot) {
          if (_dataList != snapshot.data) {
            _dataList = snapshot.data;
            debugPrint('agent commission length: ${_dataList.length}');
            if ((_dataList == null || _dataList.isEmpty) && tableHasNoData) {
              // skip rebuild
            } else {
              countTotal();
              tableWidget = _buildTable();
            }
          }
          tableWidget ??= _buildTable();
          return tableWidget;
        },
      ),
    );
  }

  Widget _buildTable() {
    tableHasNoData = _dataList == null || _dataList.isEmpty;
    if (tableHasNoData) {
      /// No Data UI
      return SingleChildScrollView(
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
            children: <TableRow>[_headerRow, _totalRow],
          ),
        ),
      );
    } else {
      /// Normal UI
      return SingleChildScrollView(
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
            children: <TableRow>[_headerRow] +
                List.generate(_dataList.length, (index) {
                  AgentCommissionModel data = _dataList[index];
                  List<dynamic> dataTexts = [
                    '${data.key}',
                    formatValue(data.direct),
                    formatValue(data.team),
                    formatValue(data.fee),
                    formatValue(data.platformFee),
                    formatValue(data.summary),
                  ];
                  /* generate cell text */
                  return TableRow(
                    children: List.generate(
                      dataTexts.length,
                      (index) => TableCellTextWidget(
                        text: '${dataTexts[index]}',
                        shrinkInset: false,
                      ),
                    ),
                  );
                }) +
                <TableRow>[_totalRow],
          ),
        ),
      );
    }
  }

  @override
  void afterFirstLayout(BuildContext context) {
    if (_store != null) _store.getCommission();
  }
}
