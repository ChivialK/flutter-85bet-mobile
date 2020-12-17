part of 'table_fixed_widget.dart';

enum TableCellBgColor { PRIMARY, SECONDARY, CONTENT }

class TableFixedCellWidget extends StatelessWidget {
  TableFixedCellWidget.legend(
    this.text, {
    this.textStyle,
    this.cellDimensions = CellDimensions.base,
    this.colorBg = TableCellBgColor.PRIMARY,
    this.shrinkPadding = true,
    this.onTap,
  })  : cellWidth = cellDimensions.stickyLegendWidth,
        cellHeight = cellDimensions.stickyLegendHeight,
        thinBorder = false,
        thinTopBorder = false,
        _textAlign = TextAlign.start;

  TableFixedCellWidget.columnHeader(
    this.text, {
    this.textStyle,
    this.cellDimensions = CellDimensions.base,
    this.colorBg = TableCellBgColor.SECONDARY,
    this.shrinkPadding = true,
    this.onTap,
  })  : cellWidth = cellDimensions.contentCellWidth,
        cellHeight = cellDimensions.stickyLegendHeight,
        thinBorder = false,
        thinTopBorder = false,
        _textAlign = TextAlign.center;

  TableFixedCellWidget.rowHeader(
    this.text, {
    this.textStyle,
    this.cellDimensions = CellDimensions.base,
    this.colorBg = TableCellBgColor.PRIMARY,
    this.shrinkPadding = true,
    this.onTap,
  })  : cellWidth = cellDimensions.stickyLegendWidth,
        cellHeight = cellDimensions.contentCellHeight,
        thinBorder = false,
        thinTopBorder = true,
        _textAlign = TextAlign.start;

  TableFixedCellWidget.content(
    this.text, {
    this.textStyle,
    this.cellDimensions = CellDimensions.base,
    this.colorBg = TableCellBgColor.CONTENT,
    this.shrinkPadding = true,
    this.onTap,
  })  : cellWidth = cellDimensions.contentCellWidth,
        cellHeight = cellDimensions.contentCellHeight,
        thinBorder = true,
        thinTopBorder = false,
        _textAlign = TextAlign.center;

  final CellDimensions cellDimensions;

  final String text;
  final Function onTap;

  final double cellWidth;
  final double cellHeight;

  final bool thinBorder;
  final bool thinTopBorder;
  final double borderWidth = 0.8;

  final TableCellBgColor colorBg;

  final TextAlign _textAlign;
  final bool shrinkPadding;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    Color bgColor;
    switch (colorBg) {
      case TableCellBgColor.PRIMARY:
        bgColor = themeColor.chartPrimaryHeaderColor;
        break;
      case TableCellBgColor.SECONDARY:
        bgColor = themeColor.chartSecondaryHeaderColor;
        break;
      case TableCellBgColor.CONTENT:
        bgColor = themeColor.chartBgColor;
        break;
    }
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: cellWidth,
        height: cellHeight,
        decoration: BoxDecoration(
          color: bgColor,
          border: (thinTopBorder)
              ? Border(
                  left: BorderSide(
                    color: themeColor.chartBorderColor,
                    width: borderWidth,
                  ),
                  right: BorderSide(
                    color: themeColor.chartBorderColor,
                    width: borderWidth,
                  ),
                  bottom: BorderSide(
                    color: themeColor.chartBorderColor,
                    width: borderWidth,
                  ),
                  top: BorderSide(
                    color: themeColor.chartBorderColor,
                    width: borderWidth / 2,
                  ),
                )
              : Border.all(
                  color: themeColor.chartBorderColor,
                  width: (thinBorder) ? borderWidth / 2 : borderWidth,
                ),
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                alignment: Alignment.center,
                padding: (shrinkPadding)
                    ? const EdgeInsets.symmetric(vertical: 3.0, horizontal: 1.0)
                    : const EdgeInsets.symmetric(
                        vertical: 6.0, horizontal: 2.0),
                child: Text(
                  text,
                  style: (colorBg == TableCellBgColor.PRIMARY)
                      ? TextStyle(color: themeColor.chartPrimaryHeaderTextColor)
                      : null,
                  maxLines: 2,
                  textAlign: _textAlign,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
