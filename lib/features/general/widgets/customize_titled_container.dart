import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/core/internal/global.dart';
import 'package:flutter_85bet_mobile/features/themes/theme_interface.dart';

///
///
/// TODO separate prefix widget (and add suffix widget?)
///
class CustomizeTitledContainer extends StatefulWidget {
  /// Parent widget width, default is Device.width
  final double parentWidth;

  /// Widget's padding, default is vertical 2.0
  final EdgeInsetsGeometry padding;

  /// Total margin between this widget and device screen, default is 32.
  final double horizontalInset;

  final double heightFactor;

  final AlignmentGeometry childAlignment;

  /// Text space between letters and words
  final double titleLetterSpacing;

  final Color backgroundColor;
  final bool roundCorner;

  final String prefixText;
  final double prefixTextSize;
  final int prefixTextMaxLines;
  final IconData prefixIconData;
  final Color prefixItemColor;
  final Color prefixBgColor;
  final double titleWidthFactor;
  final double iconWidthFactor;
  final double minusHeight;
  final double minusPrefixWidth;
  final bool requiredInput;
  final bool debug;

  final Widget child;

  CustomizeTitledContainer({
    Key key,
    this.child,
    this.childAlignment = Alignment.centerLeft,
    this.parentWidth,
    this.padding,
    this.horizontalInset = ThemeInterface.horizontalInset,
    this.heightFactor = 1,
    this.roundCorner = false,
    this.backgroundColor,
    this.prefixText,
    this.prefixTextSize,
    this.prefixTextMaxLines,
    this.prefixIconData,
    this.prefixItemColor,
    this.prefixBgColor,
    this.titleWidthFactor = ThemeInterface.prefixTextWidthFactor,
    this.titleLetterSpacing = ThemeInterface.prefixTextSpacing,
    this.iconWidthFactor = ThemeInterface.prefixIconWidthFactor,
    this.minusHeight = ThemeInterface.minusSize,
    this.minusPrefixWidth = ThemeInterface.minusSize,
    this.requiredInput = false,
    this.debug = false,
  }) : super(key: key);

  @override
  _CustomizeTitledContainerState createState() =>
      _CustomizeTitledContainerState();
}

class _CustomizeTitledContainerState extends State<CustomizeTitledContainer> {
  double _viewWidth;
  double _smallWidgetHeight;
  double _prefixWidth;
  Widget _prefixWidget;
  BoxConstraints _prefixConstraints;
  int _currentPrefixMaxLines;

  Color _fieldBgColor;
  Color _prefixBgColor;
  Color _prefixColor;

  void updateVariables() {
    _viewWidth = (widget.parentWidth ?? Global.device.width).roundToDouble() -
        widget.horizontalInset;

    // update size limit
    _prefixWidth = ((widget.prefixText != null)
            ? _viewWidth * widget.titleWidthFactor
            : _viewWidth * widget.iconWidthFactor) -
        widget.minusPrefixWidth;
    if (_prefixWidth < 56.0) _prefixWidth = 56.0;

    _smallWidgetHeight = ((Global.device.isIos)
                ? ThemeInterface.fieldHeight + 8
                : ThemeInterface.fieldHeight) *
            widget.heightFactor -
        widget.minusHeight;
    if (widget.prefixIconData != null) _smallWidgetHeight += 8.0;

    // update constraints
    _prefixConstraints = BoxConstraints(
      minWidth: _prefixWidth,
      maxWidth: _prefixWidth,
      minHeight: _smallWidgetHeight,
    );

    // update text max lines
    _currentPrefixMaxLines = (widget.prefixTextMaxLines != null)
        ? widget.prefixTextMaxLines
        : (Global.lang.isChinese)
            ? 1
            : 2;

    if (widget.debug) {
      debugPrint('screen width: ${Global.device.width}');
      debugPrint('field prefix width: $_prefixWidth');
    }
  }

  @override
  void initState() {
    updateVariables();
    super.initState();
    _fieldBgColor = widget.backgroundColor ?? themeColor.fieldInputBgColor;
    _prefixColor = widget.prefixItemColor ?? themeColor.fieldPrefixColor;
    _prefixBgColor = widget.prefixBgColor ?? themeColor.fieldPrefixBgColor;
  }

  @override
  void didUpdateWidget(CustomizeTitledContainer oldWidget) {
    super.didUpdateWidget(oldWidget);
    updateVariables();
    if (oldWidget.prefixText != widget.prefixText) {
      _prefixWidget = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_prefixWidget == null &&
        (widget.prefixText != null || widget.prefixIconData != null)) {
      _buildPrefix();
    }

    return Container(
      padding: widget.padding ?? const EdgeInsets.symmetric(vertical: 2.0),
      constraints: BoxConstraints.tightFor(
        width: _viewWidth,
        height: _smallWidgetHeight,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          if (_prefixWidget != null)
            Container(
              constraints: _prefixConstraints,
              decoration: BoxDecoration(
                color: _prefixBgColor,
                borderRadius: (widget.roundCorner)
                    ? BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        bottomLeft: Radius.circular(4.0),
                      )
                    : BorderRadius.zero,
              ),
              child: _prefixWidget,
            ),
          Expanded(
            child: Container(
              alignment: widget.childAlignment,
              decoration: BoxDecoration(
                color: _fieldBgColor,
                borderRadius: (widget.roundCorner)
                    ? BorderRadius.only(
                        topRight: Radius.circular(4.0),
                        bottomRight: Radius.circular(4.0),
                      )
                    : BorderRadius.zero,
              ),
              child: widget.child,
            ),
          ),
        ],
      ),
    );
  }

  void _buildPrefix() {
    if (widget.prefixText != null && widget.prefixIconData != null) {
      _prefixWidget = Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0),
            child: Icon(
              widget.prefixIconData,
              size: ThemeInterface.fieldIconSize,
              color: _prefixColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 6.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: RichText(
                overflow: TextOverflow.ellipsis,
                maxLines: _currentPrefixMaxLines,
                text: TextSpan(
                  style: TextStyle(
                    fontSize: widget.prefixTextSize ?? FontSize.NORMAL.value,
                    wordSpacing: widget.titleLetterSpacing,
                    letterSpacing: widget.titleLetterSpacing,
                    color: _prefixColor,
                  ),
                  children: [
                    TextSpan(text: widget.prefixText),
                    if (widget.requiredInput)
                      TextSpan(
                        text: ' *',
                        style: TextStyle(
                          fontSize:
                              widget.prefixTextSize ?? FontSize.NORMAL.value,
                          color: themeColor.hintHighlightRed,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    } else if (widget.prefixText != null) {
      _prefixWidget = Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: RichText(
            overflow: TextOverflow.ellipsis,
            maxLines: _currentPrefixMaxLines,
            text: TextSpan(
              style: TextStyle(
                fontSize: widget.prefixTextSize ?? FontSize.NORMAL.value,
                wordSpacing: widget.titleLetterSpacing,
                letterSpacing: widget.titleLetterSpacing,
                color: _prefixColor,
              ),
              children: [
                TextSpan(text: widget.prefixText),
                if (widget.requiredInput)
                  TextSpan(
                    text: ' *',
                    style: TextStyle(
                      fontSize: widget.prefixTextSize ?? FontSize.NORMAL.value,
                      color: themeColor.hintHighlightRed,
                    ),
                  ),
              ],
            ),
          ),
        ),
      );
    } else if (widget.prefixIconData != null) {
      _prefixWidget = Center(
        child: Icon(
          widget.prefixIconData,
          size: ThemeInterface.fieldIconSize,
          color: _prefixColor,
        ),
      );
    }
  }
}
