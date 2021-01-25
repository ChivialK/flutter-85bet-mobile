import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/export_internal_file.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/dialog_widget.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/table_cell_text_widget.dart';

import '../../data/models/roller_requirement_current.dart';
import '../../data/models/roller_requirement_model.dart';
import '../../data/models/roller_requirement_target.dart';

typedef RollerApplyCountFunction = Future<bool> Function(int id);

class RollerDisplayRequirement extends StatefulWidget {
  final RollerRequirementModel initRequirement;
  final Stream requirementStream;
  final RollerApplyCountFunction onApplyCount;

  RollerDisplayRequirement({
    @required this.requirementStream,
    this.initRequirement,
    this.onApplyCount,
  });

  @override
  _RollerDisplayRequirementState createState() =>
      _RollerDisplayRequirementState();
}

class _RollerDisplayRequirementState extends State<RollerDisplayRequirement> {
  final double dialogHeightFactor = 0.75;
  final double dialogTitleHeight = 54.0;

  final List<String> _headerRowTexts = [
    localeStr.wheelApplyTableTextContent,
    localeStr.wheelApplyTableTextProgress,
    localeStr.wheelApplyTableTextCount,
    localeStr.wheelApplyTableTextStatus,
  ];

  ScrollController _scrollController;
  Widget contentWidget;
  RollerRequirementModel currentData;

  double tableHeight;
  double tableWidth;
  Map<int, TableColumnWidth> _tableWidthMap;
  BorderSide tableBorder;
  bool lockApplied = false;

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
      0: FixedColumnWidth(tableWidth * 0.25),
      1: FixedColumnWidth(tableWidth * 0.25),
      2: FixedColumnWidth(tableWidth * 0.25),
      3: FixedColumnWidth(tableWidth * 0.25),
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
            StreamBuilder<RollerRequirementModel>(
                stream: widget.requirementStream,
                initialData: widget.initRequirement,
                builder: (context, snapshot) {
                  if (snapshot != null && currentData != snapshot.data) {
                    currentData = snapshot.data;
                    if (currentData != null && currentData.hasData != null) {
                      if (currentData.hasData)
                        contentWidget = _buildTable();
                      else if (currentData.hasData == false)
                        contentWidget = SizedBox(
                          width: tableHeight / 3,
                          height: tableHeight / 3,
                        );
                    }
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
    List<TableRow> rows = new List();
    currentData.targets.forEach((key, value) {
      var current = currentData.current
          .singleWhere((data) => '${data.key}' == key, orElse: null);
      if (current == null)
        current = RollerRequirementCurrent(day: 0, week: 0, month: 0);
      rows.addAll(_buildContentRows(value, current));
    });
    rows.insert(0, _buildHeaderRow());
    return rows;
  }

  List<TableRow> _buildContentRows(
    List<RollerRequirementTarget> targets,
    RollerRequirementCurrent current,
  ) {
    return List.generate(targets.length, (index) {
      RollerRequirementTarget data = targets[index];
      int progress = current.getValue(data.time);
      bool canComplete = progress >= data.require;
      bool applied = data.valid == false;
      List<dynamic> dataTexts = [
        data.name,
        '$progress / ${data.require}',
        data.count,
        (canComplete)
            ? (applied)
                ? localeStr.wheelApplyTableTextStatus2
                : localeStr.wheelApplyTableTextStatus1
            : localeStr.wheelApplyTableTextStatus0,
      ];
      /* generate cell text */
      return TableRow(
        children: List.generate(
          dataTexts.length,
          (index) => (index == 3)
              ? RaisedButton(
                  child: Text(
                    dataTexts[index],
                    style: TextStyle(
                      fontSize: FontSize.NORMAL.value,
                      color: themeColor.buttonTextPrimaryColor,
                    ),
                  ),
                  disabledColor: themeColor.buttonDisabledColor,
                  visualDensity:
                      VisualDensity(horizontal: -2.0, vertical: -3.0),
                  onPressed: (applied || !canComplete)
                      ? null
                      : () async {
                          if (lockApplied) return;
                          lockApplied = true;
                          bool result = await widget.onApplyCount(data.id);
                          lockApplied = result;
                        })
              : TableCellTextWidget(
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
