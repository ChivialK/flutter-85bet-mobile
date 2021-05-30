import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/themes/theme_interface.dart';
import 'package:meta/meta.dart' show required;

///
/// Separate checkbox widget to prevent screen flash
///

typedef CheckBoxCallBack = void Function(bool);

class CheckboxWidget extends StatefulWidget {
  final String label;
  final int maxLines;
  final Color labelColor;
  final bool initValue;
  final bool mustCheck;
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
    this.initValue = false,
    this.mustCheck = false,
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
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Container(
                    child: Theme(
                      data: ThemeData(
                        unselectedWidgetColor: widget.labelColor,
                      ),
                      child: Transform.scale(
                        scale: widget.scale,
                        child: Checkbox(
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          visualDensity: VisualDensity.compact,
                          value: boxChecked,
                          onChanged: (value) {
                            setChecked = value;
                            if (widget.onChecked != null)
                              widget.onChecked(value);
                          },
                        ),
                      ),
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
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Container(
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
                ),
                Expanded(
                  child: Padding(
                    padding: widget.textPadding,
                    child: RichText(
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: widget.textSize ?? FontSize.NORMAL.value,
                          color: themeColor.defaultTextColor,
                        ),
                        children: [
                          if (widget.mustCheck)
                            TextSpan(
                              text: '* ',
                              style: TextStyle(
                                fontSize:
                                    widget.textSize ?? FontSize.NORMAL.value,
                                color: themeColor.hintHighlightRed,
                              ),
                            ),
                          TextSpan(text: widget.label),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
