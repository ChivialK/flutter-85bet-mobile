import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/core/internal/themes.dart';

///
/// Separate checkbox widget to prevent screen flash
///

typedef CheckBoxCallBack = void Function(bool);

class CheckboxWidget extends StatefulWidget {
  final String label;
  final int maxLines;
  final Color labelColor;
  final Color boxBackgroundColor;
  final bool initValue;
  final double scale;
  final double textSize;
  final EdgeInsets widgetPadding;
  final EdgeInsets textPadding;
  final CheckBoxCallBack onChecked;

  CheckboxWidget({
    Key key,
    @required this.label,
    this.maxLines = 1,
    this.labelColor,
    this.boxBackgroundColor,
    this.initValue = false,
    this.scale = 1.0,
    this.textSize,
    this.widgetPadding = const EdgeInsets.only(top: 2.0),
    this.textPadding = const EdgeInsets.only(bottom: 2.0, left: 2.0),
    this.onChecked,
  }) : super(key: key);

  @override
  CheckboxWidgetState createState() => CheckboxWidgetState();
}

class CheckboxWidgetState extends State<CheckboxWidget> {
  bool boxChecked;

  set setChecked(bool checked) {
    boxChecked = checked;
    setState(() {});
  }

  @override
  void initState() {
    boxChecked = widget.initValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.widgetPadding,
      child: (widget.labelColor != null)
          ? Row(
              crossAxisAlignment: (widget.maxLines > 1 && widget.scale != 1)
                  ? CrossAxisAlignment.start
                  : CrossAxisAlignment.center,
              children: <Widget>[
                Theme(
                  data: ThemeData(
                    unselectedWidgetColor: widget.labelColor,
                  ),
                  child: Transform.scale(
                    scale: widget.scale,
                    child: Checkbox(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      visualDensity: VisualDensity.compact,
                      value: boxChecked,
                      onChanged: (value) {
                        setChecked = value;
                        if (widget.onChecked != null) widget.onChecked(value);
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: widget.textPadding,
                    child: Text(
                      widget.label,
                      style: TextStyle(
                        color: widget.labelColor,
                        fontSize: widget.textSize ?? FontSize.NORMAL.value,
                      ),
                      maxLines: widget.maxLines,
                    ),
                  ),
                ),
              ],
            )
          : Row(
              crossAxisAlignment: (widget.maxLines > 1 && widget.scale == 1)
                  ? CrossAxisAlignment.start
                  : CrossAxisAlignment.center,
              children: <Widget>[
                Transform.scale(
                  scale: widget.scale,
                  child: Checkbox(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    visualDensity: VisualDensity.compact,
                    value: boxChecked,
                    onChanged: (value) {
                      setChecked = value;
                      if (widget.onChecked != null) widget.onChecked(value);
                    },
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: widget.textPadding,
                    child: Text(
                      widget.label,
                      style: TextStyle(
                        color: Themes.defaultTextColor,
                        fontSize: widget.textSize ?? FontSize.NORMAL.value,
                      ),
                      maxLines: widget.maxLines,
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
