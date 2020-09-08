import 'package:flutter/widgets.dart';

class TableCellSpanWidget extends StatelessWidget {
  final TextSpan span;
  final bool shrinkInset;

  TableCellSpanWidget({@required this.span, this.shrinkInset = true})
      : assert(span != null);

  @override
  Widget build(BuildContext context) {
    if (shrinkInset) {
      return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 2.0),
        child: RichText(text: span, textAlign: TextAlign.center),
      );
    } else {
      return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 1.0),
        child: RichText(text: span, textAlign: TextAlign.center),
      );
    }
  }
}
