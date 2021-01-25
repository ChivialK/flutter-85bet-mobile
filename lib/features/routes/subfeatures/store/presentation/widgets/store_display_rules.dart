import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/exports_for_display_widget.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/table_cell_text_widget.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

import '../state/point_store.dart';
import 'point_store_inherit_widget.dart';

class StoreDisplayRules extends StatefulWidget {
  final double maxViewHeight;

  StoreDisplayRules(this.maxViewHeight);

  @override
  _StoreDisplayRulesState createState() => _StoreDisplayRulesState();
}

class _StoreDisplayRulesState extends State<StoreDisplayRules> {
  final String htmlBgColor = themeColor.defaultBackgroundColor.toHexNoAlpha();
  final String htmlTextColor = themeColor.storeRuleTextColor.toHexNoAlpha();

  PointStore _store;
  Widget _pointWidget;

  Map<int, TableColumnWidth> _tableWidthMap;
  double _tableCellWidth;
  double _tableHeight;
  BorderSide _tableBorder;
  List<String> _headerRowTexts;
  TableRow _headerRow;
  String _htmlContent;

  // List<String> _htmlTexts;

  void updateContent() {
    _tableCellWidth = (1.0 / _store.rulesModel.platformRules.length)
        .toStringAsFixed(3)
        .strToDouble;
    print('table cell width: $_tableCellWidth');

    _tableWidthMap = {
      //指定索引及固定列宽
      0: FixedColumnWidth(_tableCellWidth),
      1: FixedColumnWidth(_tableCellWidth),
      2: FixedColumnWidth(_tableCellWidth),
      3: FixedColumnWidth(_tableCellWidth),
      4: FixedColumnWidth(_tableCellWidth),
      5: FixedColumnWidth(_tableCellWidth),
    };

    _headerRowTexts = List.generate(
      6,
      (index) =>
          '${_getCategoryLabel(_store.rulesModel.platformRules[index].platform)}',
    );
    _headerRow = TableRow(
      children: List.generate(
        _headerRowTexts.length,
        (index) => TableCellTextWidget(text: _headerRowTexts[index]),
      ),
    );
    _htmlContent = _store.rulesModel?.rules[0]?.content ?? '';
    // _splitRuleText();
  }

  // void _splitRuleText() {
  //   _htmlTexts = new List();
  //   _htmlTexts = _store.rulesModel.rules[0].content
  //       .split(RegExp('</p>|<br />|<br/>'))
  //       .map((e) => e
  //           .replaceAll('<p>', '')
  //           .replaceAll('&nbsp;', '')
  //           .replaceAll('\n', ''))
  //       .toList()
  //         ..removeWhere((element) => element.isEmpty);
  //   _htmlTexts.forEach((element) {
  //     debugPrint('html text: $element');
  //   });
  // }

  @override
  void initState() {
    _tableHeight = FontSize.NORMAL.value * 1.8 * 3.5;
    _tableBorder = BorderSide(
      color: themeColor.chartBorderColor,
      width: 1.0,
      style: BorderStyle.solid,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _store ??= PointStoreInheritedWidget.of(context).store;
    _pointWidget ??= PointStoreInheritedWidget.of(context).pointWidget;
    if (_store == null) {
      return Center(
        child: WarningDisplay(
          message:
              Failure.internal(FailureCode(type: FailureType.STORE)).message,
        ),
      );
    }

    if (_store.rulesModel == null)
      return WarningDisplay(
        message: localeStr.messageErrorServerData,
      );

    if (_htmlContent == null) updateContent();

    return ListView(
      primary: true,
      shrinkWrap: true,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
          child: _pointWidget,
        ),
        Divider(
            height: 4.0,
            thickness: 2.0,
            color: themeColor.defaultWidgetBgColor),
        Container(
          padding: const EdgeInsets.fromLTRB(12.0, 16.0, 12.0, 0.0),
          constraints: BoxConstraints.tightFor(width: Global.device.width - 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                decoration: BoxDecoration(
                  color: themeColor.chartHeaderBgColor,
                  border: Border(
                    left: _tableBorder,
                    right: _tableBorder,
                    top: _tableBorder,
                  ),
                ),
                child: Center(
                    child: Text(
                  localeStr.storeRuleTableHeader,
                  style: TextStyle(
                    color: themeColor.chartPrimaryHeaderColor,
                  ),
                )),
              ),
              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: _tableHeight),
                child: Table(
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  columnWidths: _tableWidthMap,
                  border: TableBorder.all(
                    color: themeColor.chartBorderColor,
                    width: 1.0,
                    style: BorderStyle.solid,
                  ),
                  /* create table header and generate rows */
                  children: <TableRow>[
                    _headerRow,
                    TableRow(
                      children: List.generate(
                        6,
                        (index) => TableCellTextWidget(
                            bgColor: Colors.black26,
                            text:
                                '${_store.rulesModel.platformRules[index].dollar}'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
            padding: const EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 8.0),
            child: (_htmlContent.isEmpty)
                ? SizedBox.shrink()
                : HtmlWidget(_htmlContent)
            // : Column(
            //     mainAxisSize: MainAxisSize.min,
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     children: List.generate(
            //       _htmlTexts.length,
            //       (index) => Row(
            //         mainAxisSize: MainAxisSize.max,
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: [
            //           Expanded(child: _buildHtmlText2(_htmlTexts[index])),
            //         ],
            //       ),
            //     ),
            //   ),
            ),
      ],
    );
  }

  // String _buildHtmlText() {
  //   return '<html>'
  //       '<head><meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"></head>'
  //       '<body bgcolor="$htmlBgColor" text="$htmlTextColor" style="line-height:1.2;">'
  //       '${_store.rulesModel.rules[0].content}'
  //       '</html>';
  // }

  // Widget _buildHtmlText2(String text) {
  //   debugPrint(
  //       'parsing html texts: $text, title: ${text.contains('color: #3598db;')}, highlight: ${text.contains('color: #e03e2d;')}');
  //   if (text.contains('color: #3598db;')) {
  //     return Html(
  //       data: """$text""",
  //       style: {
  //         "span": HtmlStyle.Style(
  //           fontSize: HtmlStyle.FontSize.large,
  //           color: themeColor.storeRuleTitleColor,
  //           alignment: Alignment.center,
  //           textAlign: TextAlign.center,
  //         ),
  //       },
  //     );
  //   } else if (text.contains('color: #e03e2d;')) {
  //     return Html(
  //       data: """$text""",
  //       style: {
  //         "span": HtmlStyle.Style(
  //           fontSize: HtmlStyle.FontSize.medium,
  //           color: themeColor.storeRuleHighlightColor,
  //         ),
  //       },
  //     );
  //   } else {
  //     return Html(
  //       data: """$text""",
  //       style: {
  //         "span": HtmlStyle.Style(
  //           fontSize: HtmlStyle.FontSize.medium,
  //           color: themeColor.storeRuleTextColor,
  //         ),
  //       },
  //     );
  //   }
  // }

  String _getCategoryLabel(String type) {
    switch (type) {
      case 'casino':
        return localeStr.gameCategoryCasino;
      case 'slot':
        return localeStr.gameCategorySlot;
      case 'sport':
        return localeStr.gameCategorySport;
      case 'fish':
        return localeStr.gameCategoryFish;
      case 'lottery':
        return localeStr.gameCategoryLottery;
      case 'card':
        return localeStr.gameCategoryCard;
      default:
        return type;
    }
  }
}
