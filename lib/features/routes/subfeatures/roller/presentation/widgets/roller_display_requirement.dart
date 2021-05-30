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
  RollerRequirementModel rollerTask;

  double backIconSize;
  double tableWidth;
  Map<int, TableColumnWidth> _tableWidthMap;
  BorderSide tableBorder;
  bool lockApplied = false;

  @override
  void initState() {
    backIconSize = 32.0 * Global.device.widthScale;
    double availableWidth = Global.device.width - 32;
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
      // heightFactor: dialogHeightFactor,
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
                        localeStr.wheelTextTitleGet,
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
              child: StreamBuilder<RollerRequirementModel>(
                  stream: widget.requirementStream,
                  initialData: widget.initRequirement ??
                      RollerRequirementModel(hasData: null),
                  builder: (context, snapshot) {
                    if (snapshot != null && rollerTask != snapshot.data) {
                      rollerTask = snapshot.data;
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
      constraints: BoxConstraints(maxWidth: tableWidth),
      margin: const EdgeInsets.symmetric(
        vertical: 8.0,
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
    if (rollerTask != null && rollerTask?.hasData == true) {
      rollerTask.targets.forEach((key, value) {
        var current = rollerTask.current
            .singleWhere((data) => '${data.key}' == key, orElse: null);
        if (current == null)
          current = RollerRequirementCurrent(day: 0, week: 0, month: 0);
        rows.addAll(_buildContentRows(value, current));
      });
      rows.insert(0, _buildHeaderRow());
    } else {
      rows.add(_buildHeaderRow());
    }
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
        // decoration: BoxDecoration(color: themeColor.chartBgColor),
        children: List.generate(
          dataTexts.length,
          (index) => (index == 3)
              ? Padding(
                  padding: const EdgeInsets.only(right: 4.0),
                  child: RaisedButton(
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
                            }),
                )
              : TableCellTextWidget(
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
