import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/export_internal_file.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/dialog_widget.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/table_cell_text_widget.dart';

import '../../data/models/roller_order_model.dart';

class RollerDisplayOrder extends StatefulWidget {
  final List<RollerOrderModel> initOrders;
  final Stream orderStream;

  RollerDisplayOrder({
    @required this.orderStream,
    this.initOrders,
  });

  @override
  _RollerDisplayOrderState createState() => _RollerDisplayOrderState();
}

class _RollerDisplayOrderState extends State<RollerDisplayOrder> {
  final double dialogHeightFactor = 0.75;
  final double dialogTitleHeight = 54.0;

  final List<String> _headerRowTexts = [
    localeStr.wheelOrderTableTextTime,
    localeStr.wheelOrderTableTextPrize,
    localeStr.wheelOrderTableTextStatus,
  ];

  ScrollController _scrollController;
  Widget contentWidget;
  List<RollerOrderModel> currentData;

  double tableHeight;
  double tableWidth;
  Map<int, TableColumnWidth> _tableWidthMap;
  BorderSide tableBorder;

  @override
  void initState() {
    double availableWidth = Global.device.width - 32;
    double availableHeight =
        Global.device.height * dialogHeightFactor - dialogTitleHeight;

    int availableRows =
        (availableHeight / (FontSize.NORMAL.value * 2.35)).floor();
    debugPrint('max height: $availableHeight, available rows: $availableRows');

    // FontSize.NORMAL.value * 2 = font size * 2 line + space
    tableHeight = FontSize.NORMAL.value * 2.15 * availableRows;
    tableWidth = availableWidth - 16;
    _tableWidthMap ??= {
      //指定索引及固定列宽
      0: FixedColumnWidth(tableWidth * 0.4),
      1: FixedColumnWidth(tableWidth * 0.4),
      2: FixedColumnWidth(tableWidth * 0.2),
    };

    tableBorder ??= BorderSide(
      color: HexColor.fromHex('#d2080e'),
      width: 1.0,
      style: BorderStyle.solid,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DialogWidget(
      heightFactor: dialogHeightFactor,
      customBg: HexColor.fromHex('#de4d41'),
      children: <Widget>[
        Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  child: Container(
                    height: dialogTitleHeight,
                    decoration: BoxDecoration(
                      color: HexColor.fromHex('#d2080e'),
                      borderRadius: const BorderRadius.only(
                        topLeft: const Radius.circular(16.0),
                        topRight: const Radius.circular(16.0),
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      localeStr.wheelTextTitlePrize,
                      style: TextStyle(
                        color: themeColor.defaultAccentColor,
                        fontSize: FontSize.TITLE.value,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            StreamBuilder<List<RollerOrderModel>>(
                stream: widget.orderStream,
                initialData: widget.initOrders,
                builder: (context, snapshot) {
                  if (snapshot != null && currentData != snapshot.data) {
                    currentData = snapshot.data;
                    if (currentData != null && currentData.isNotEmpty)
                      contentWidget = _buildTable();
                    else if (currentData.isEmpty)
                      contentWidget = SizedBox(
                        width: tableHeight / 3,
                        height: tableHeight / 3,
                      );
                  }
                  contentWidget ??= Container(
                    width: tableHeight / 3,
                    height: tableHeight / 3,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                  return contentWidget;
                }),
          ],
        ),
      ],
    );
  }

  Widget _buildTable() {
    _scrollController = new ScrollController();
    return Container(
      constraints: BoxConstraints(
        maxWidth: tableWidth,
        minHeight: tableHeight / 3,
        maxHeight: tableHeight,
      ),
      margin: const EdgeInsets.symmetric(
        vertical: 12.0,
        horizontal: 8.0,
      ),
      child: Scrollbar(
        controller: _scrollController,
        isAlwaysShown: true,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            columnWidths: _tableWidthMap,
            border: TableBorder(
              horizontalInside: tableBorder,
              bottom: tableBorder,
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
    return rows;
  }

  List<TableRow> _buildContentRows() {
    return List.generate(currentData.length, (index) {
      RollerOrderModel data = currentData[index];
      List<dynamic> dataTexts = [
        data.date,
        data.name,
        (data.status == 0)
            ? localeStr.wheelOrderTableTextStatus0
            : localeStr.wheelOrderTableTextStatus1,
      ];
      /* generate cell text */
      return TableRow(
        children: List.generate(
          dataTexts.length,
          (index) => TableCellTextWidget(
            text: '${dataTexts[index]}',
            textColor: themeColor.hintHighlightOrangeStrong,
          ),
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
}
