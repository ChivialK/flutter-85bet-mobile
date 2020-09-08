import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/core/internal/global.dart';
import 'package:flutter_85bet_mobile/core/internal/themes.dart';

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
    this.horizontalInset = Themes.horizontalInset,
    this.heightFactor = 1,
    this.roundCorner = false,
    this.backgroundColor = Themes.fieldInputBgColor,
    this.prefixText,
    this.prefixTextSize,
    this.prefixTextMaxLines,
    this.prefixIconData,
    this.prefixItemColor = Themes.fieldPrefixColor,
    this.prefixBgColor = Themes.fieldPrefixBgColor,
    this.titleWidthFactor = Themes.prefixTextWidthFactor,
    this.titleLetterSpacing = Themes.prefixTextSpacing,
    this.iconWidthFactor = Themes.prefixIconWidthFactor,
    this.minusHeight = Themes.minusSize,
    this.minusPrefixWidth = Themes.minusSize,
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

  void updateVariables() {
    _viewWidth = (widget.parentWidth ?? Global.device.width).roundToDouble() -
        widget.horizontalInset;

    // update size limit
    _prefixWidth = ((widget.prefixText != null)
            ? _viewWidth * widget.titleWidthFactor
            : _viewWidth * widget.iconWidthFactor) -
        widget.minusPrefixWidth;
    if (_prefixWidth < 56.0) _prefixWidth = 56.0;

    _smallWidgetHeight =
        ((Global.device.isIos) ? Themes.fieldHeight + 8 : Themes.fieldHeight) *
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
        : (Global.lang == 'zh') ? 1 : 2;

    if (widget.debug) {
      debugPrint('screen width: ${Global.device.width}');
      debugPrint('field prefix width: $_prefixWidth');
    }
  }

  @override
  void initState() {
    updateVariables();
    super.initState();
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
                color: widget.prefixBgColor,
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
                color: widget.backgroundColor,
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
              size: Themes.fieldIconSize,
              color: widget.prefixItemColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 6.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: RichText(
                overflow: TextOverflow.ellipsis,
                text: TextSpan(
                  style: TextStyle(
                    fontSize: widget.prefixTextSize ?? FontSize.NORMAL.value,
                    wordSpacing: widget.titleLetterSpacing,
                    letterSpacing: widget.titleLetterSpacing,
                    color: widget.prefixItemColor,
                  ),
                  children: [
                    TextSpan(text: widget.prefixText),
                    if (widget.requiredInput)
                      TextSpan(
                        text: ' *',
                        style: TextStyle(
                          fontSize:
                              widget.prefixTextSize ?? FontSize.NORMAL.value,
                          color: Themes.hintHighlightRed,
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
        padding: (_currentPrefixMaxLines > 1)
            ? EdgeInsets.only(left: 4.0, right: 4.0)
            : EdgeInsets.only(right: 4.0),
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
                color: widget.prefixItemColor,
              ),
              children: [
                TextSpan(text: widget.prefixText),
                if (widget.requiredInput)
                  TextSpan(
                    text: ' *',
                    style: TextStyle(
                      fontSize: widget.prefixTextSize ?? FontSize.NORMAL.value,
                      color: Themes.hintHighlightRed,
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
          size: Themes.fieldIconSize,
          color: widget.prefixItemColor,
        ),
      );
    }
  }
}
