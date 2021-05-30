import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/export_internal_file.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/dialog_widget.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/table_cell_text_widget.dart';

import '../../data/models/roller_record_model.dart';

class RollerDisplayRecord extends StatefulWidget {
  final List<RollerRecordModel> initRecord;
  final Stream recordStream;

  RollerDisplayRecord({
    @required this.recordStream,
    this.initRecord,
  });

  @override
  _RollerDisplayRecordState createState() => _RollerDisplayRecordState();
}

class _RollerDisplayRecordState extends State<RollerDisplayRecord> {
  final double dialogHeightFactor = 0.75;
  final double dialogTitleHeight = 54.0;

  final List<String> _headerRowTexts = [
    localeStr.wheelRecordTableTextTime,
    localeStr.wheelRecordTableTextOperate,
    localeStr.wheelRecordTableTextCount,
    localeStr.wheelRecordTableTextContent,
  ];

  ScrollController _scrollController;
  Widget contentWidget;
  List<RollerRecordModel> currentData;

  double backIconSize;
  double tableMinHeight;
  double tableWidth;
  Map<int, TableColumnWidth> _tableWidthMap;
  BorderSide tableBorder;

  @override
  void initState() {
    backIconSize = 32.0 * Global.device.widthScale;
    double availableWidth = Global.device.width - 32;
    // double availableHeight =
    //     Global.device.height * dialogHeightFactor - dialogTitleHeight;

    // FontSize.NORMAL.value * 2 = font size * 2 line + space
    tableMinHeight = FontSize.NORMAL.value * 2.15 * 2;
    tableWidth = availableWidth - 16;
    _tableWidthMap ??= {
      //指定索引及固定列宽
      0: FixedColumnWidth(tableWidth * 0.4),
      1: FixedColumnWidth(tableWidth * 0.2),
      2: FixedColumnWidth(tableWidth * 0.2),
      3: FixedColumnWidth(tableWidth * 0.2),
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
      constraints: BoxConstraints.tightFor(
        width: Global.device.width,
        height: Global.device.height,
      ),
      padding: EdgeInsets.zero,
      customBg: HexColor.fromHex('#de4d41'),
      canClose: false,
      children: <Widget>[
        Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              height: dialogTitleHeight,
              color: HexColor.fromHex('#d2080e'),
              margin: const EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16.0, 2.0, 8.0, 0.0),
                      child: GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: themeColor.dialogCloseIconColor,
                          size: backIconSize,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(right: backIconSize),
                      child: Text(
                        localeStr.wheelTextTitleRecord,
                        style: TextStyle(
                          color: themeColor.rollerRuleTextColor,
                          fontSize: FontSize.TITLE.value,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: StreamBuilder<List<RollerRecordModel>>(
                  stream: widget.recordStream,
                  initialData: widget.initRecord,
                  builder: (context, snapshot) {
                    if (snapshot != null && currentData != snapshot.data) {
                      currentData = snapshot.data;
                      contentWidget = _buildTable();
                    }
                    contentWidget ??= Center(
                      child: CircularProgressIndicator(),
                    );
                    return contentWidget;
                  }),
            ),
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
        minHeight: tableMinHeight,
        // maxHeight: tableHeight,
      ),
      margin: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 8.0,
      ),
      child: Scrollbar(
        controller: _scrollController,
        isAlwaysShown: true,
        child: SingleChildScrollView(
          controller: _scrollController,
          physics: const BouncingScrollPhysics(),
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
    List<TableRow> rows = new List();
    if (currentData != null && currentData.length > 0) {
      rows.addAll(_buildContentRows());
      rows.insert(0, _buildHeaderRow());
    } else {
      rows.add(_buildHeaderRow());
    }
    return rows;
  }

  List<TableRow> _buildContentRows() {
    return List.generate(currentData.length, (index) {
      RollerRecordModel data = currentData[index];
      List<dynamic> dataTexts = [
        data.date,
        data.methodCh,
        data.count,
        data.name,
      ];
      /* generate cell text */
      return TableRow(
        // decoration: BoxDecoration(color: themeColor.chartBgColor),
        children: List.generate(
          dataTexts.length,
          (index) => TableCellTextWidget(
            text: '${dataTexts[index]}',
            textStyle: TextStyle(
              color: themeColor.hintHighlightOrangeStrong,
              fontSize: FontSize.MESSAGE.value,
            ),
          ),
        ),
      );
    });
  }

  TableRow _buildHeaderRow() {
    return TableRow(
      children: List.generate(
        _headerRowTexts.length,
        (index) => TableCellTextWidget(
          text: _headerRowTexts[index],
          textStyle: TextStyle(
            color: themeColor.rollerRuleTextColor,
            fontSize: FontSize.SUBTITLE.value,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}