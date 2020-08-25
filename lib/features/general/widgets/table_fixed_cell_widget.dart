part of 'table_fixed_widget.dart';

class TableFixedCellWidget extends StatelessWidget {
  TableFixedCellWidget.legend(
    this.text, {
    this.textStyle = const TextStyle(color: Themes.chartPrimaryHeaderTextColor),
    this.cellDimensions = CellDimensions.base,
    this.colorBg = Themes.chartPrimaryHeaderColor,
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
    this.colorBg = Themes.chartSecondaryHeaderColor,
    this.shrinkPadding = true,
    this.onTap,
  })  : cellWidth = cellDimensions.contentCellWidth,
        cellHeight = cellDimensions.stickyLegendHeight,
        thinBorder = false,
        thinTopBorder = false,
        _textAlign = TextAlign.center;

  TableFixedCellWidget.rowHeader(
    this.text, {
    this.textStyle = const TextStyle(color: Themes.chartPrimaryHeaderTextColor),
    this.cellDimensions = CellDimensions.base,
    this.colorBg = Themes.chartPrimaryHeaderColor,
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
    this.colorBg = Themes.chartBgColor,
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

  final Color colorBg;

  final TextAlign _textAlign;
  final bool shrinkPadding;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: cellWidth,
        height: cellHeight,
        decoration: BoxDecoration(
          color: colorBg,
          border: (thinTopBorder)
              ? Border(
                  left: BorderSide(
                    color: Themes.chartBorderColor,
                    width: borderWidth,
                  ),
                  right: BorderSide(
                    color: Themes.chartBorderColor,
                    width: borderWidth,
                  ),
                  bottom: BorderSide(
                    color: Themes.chartBorderColor,
                    width: borderWidth,
                  ),
                  top: BorderSide(
                    color: Themes.chartBorderColor,
                    width: borderWidth / 2,
                  ),
                )
              : Border.all(
                  color: Themes.chartBorderColor,
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
                  style: textStyle,
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
