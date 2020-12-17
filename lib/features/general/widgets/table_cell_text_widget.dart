import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TableCellTextWidget extends StatelessWidget {
  final String text;
  final bool shrinkInset;
  final Color textColor;
  final Color bgColor;

  TableCellTextWidget({
    @required this.text,
    this.shrinkInset = true,
    this.textColor,
    this.bgColor,
  }) : assert(text is String);

  @override
  Widget build(BuildContext context) {
    if (text.isEmpty) return SizedBox.shrink();

    Text textWidget;
    if (textColor != null)
      textWidget = Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(color: textColor),
      );
    else
      textWidget = Text(text, textAlign: TextAlign.center);

    if (shrinkInset) {
      return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 2.0),
        color: bgColor ?? Colors.transparent,
        child: textWidget,
      );
    } else {
      return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 1.0),
        color: bgColor ?? Colors.transparent,
        child: textWidget,
      );
    }
  }
}
