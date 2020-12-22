import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/core/internal/global.dart';
import 'package:flutter_85bet_mobile/core/internal/local_strings.dart';
import 'package:flutter_85bet_mobile/features/themes/theme_interface.dart';
import 'package:flutter_85bet_mobile/mylogger.dart';

class CustomizeDropdownWidget extends StatefulWidget {
  /// [DropdownMenuItem]s text list
  final List<String> optionStrings;

  /// [DropdownMenuItem]s value list
  final List optionValues;

  /// Pass the option value back on item selected
  final ValueChanged changeNotify;

  /// Dropdown widget's selected index, default is 0.
  final int defaultValueIndex;

  /// Expand the dropdown button.
  /// notice: if set to true, do not wrap with [Expanded] widget.
  final bool fixedWidget;

  /// Parent widget width, default is Device.width
  final double parentWidth;

  /// Widget's padding, default is vertical 2.0
  final EdgeInsetsGeometry padding;

  /// Total margin between this widget and device screen, default is 32.
  final double horizontalInset;

  /// Text space between letters and words
  final double titleLetterSpacing;

  final String prefixText;
  final double prefixTextSize;
  final int prefixTextMaxLines;
  final IconData prefixIconData;
  final Color prefixItemColor;
  final Color prefixBgColor;
  final double titleWidthFactor;
  final double iconWidthFactor;
  final String suffixInitText;
  final Stream suffixTextStream;
  final double suffixWidthFactor;
  final double minusHeight;
  final double minusPrefixWidth;
  final bool clearValueOnMenuChanged;
  final bool subTheme;
  final bool scaleText;
  final bool roundCorner;
  final bool requiredInput;
  final bool debug;

  CustomizeDropdownWidget({
    key,
    @required this.optionValues,
    this.optionStrings,
    this.changeNotify,
    this.defaultValueIndex = 0,
    this.fixedWidget = false,
    this.parentWidth,
    this.padding,
    this.horizontalInset = ThemeInterface.horizontalInset,
    this.prefixText,
    this.prefixTextSize,
    this.prefixTextMaxLines,
    this.prefixIconData,
    this.prefixItemColor,
    this.prefixBgColor,
    this.titleWidthFactor = ThemeInterface.prefixTextWidthFactor,
    this.titleLetterSpacing = ThemeInterface.prefixTextSpacing,
    this.iconWidthFactor = ThemeInterface.prefixIconWidthFactor,
    this.suffixInitText,
    this.suffixTextStream,
    this.suffixWidthFactor = ThemeInterface.suffixWidthFactor,
    this.minusHeight = ThemeInterface.minusSize,
    this.minusPrefixWidth = ThemeInterface.minusSize,
    this.clearValueOnMenuChanged = false,
    this.subTheme = false,
    this.scaleText = false,
    this.roundCorner = false,
    this.requiredInput = false,
    this.debug = false,
  }) : super(key: key);

  @override
  CustomizeDropdownWidgetState createState() => CustomizeDropdownWidgetState();
}

class CustomizeDropdownWidgetState extends State<CustomizeDropdownWidget> {
  double _viewWidth;
  double _smallWidgetHeight;
  BoxDecoration dropdownDecor;

  double _prefixWidth;
  Widget _prefixWidget;
  BoxConstraints _prefixConstraints;
  int _currentPrefixMaxLines;

  double _postfixWidth;
  Widget _suffixWidget;
  BoxConstraints _suffixConstraints;

  Color _prefixColor;
  Color _prefixBgColor;

  dynamic _dropdownValue;

  dynamic get selected => _dropdownValue;

  set setSelected(value) {
    _dropdownValue = value;
    setState(() {});
  }

  set setSelectedIndex(index) {
    _dropdownValue = widget.optionValues[0];
    setState(() {});
  }

  void updateVariables() {
    _viewWidth = Global.device.width.roundToDouble() - widget.horizontalInset;

    // update size limit
    _prefixWidth = ((widget.prefixText != null)
            ? _viewWidth * widget.titleWidthFactor
            : _viewWidth * widget.iconWidthFactor) -
        widget.minusPrefixWidth;
    if (_prefixWidth < 56.0) _prefixWidth = 56.0;

    _postfixWidth = _viewWidth * widget.suffixWidthFactor;

    _smallWidgetHeight = ((Global.device.isIos)
            ? ThemeInterface.fieldHeight + 8
            : ThemeInterface.fieldHeight) -
        widget.minusHeight;
    if (widget.prefixIconData != null) _smallWidgetHeight += 8.0;

    // update constraints
    _prefixConstraints = BoxConstraints(
      minWidth: _prefixWidth,
      maxWidth: _prefixWidth,
      minHeight: _smallWidgetHeight,
    );
    _suffixConstraints = BoxConstraints(
      minWidth: _postfixWidth,
      maxWidth: _postfixWidth,
      minHeight: _smallWidgetHeight,
    );

    // update text max lines
    _currentPrefixMaxLines = (widget.prefixTextMaxLines != null)
        ? widget.prefixTextMaxLines
        : (Global.localeCode == 'zh')
            ? 1
            : 2;

    if (widget.debug) {
      debugPrint(
          'screen width: ${Global.device.width}, view width: ${widget.parentWidth}');
      debugPrint('field prefix width: $_prefixWidth');
      debugPrint('option values: ${widget.optionValues}');
      debugPrint('option strings: ${widget.optionStrings}');
    }
  }

  @override
  void initState() {
    updateVariables();
    if (widget.optionStrings != null &&
        widget.optionStrings.length != widget.optionValues.length) {
      MyLogger.warn(
          msg: 'option string list length not match.'
              ' values: ${widget.optionValues.length},'
              ' strings: ${widget.optionStrings.length}',
          tag: 'TestDropdown');
    }
    if (widget.optionValues != null && widget.optionValues.isNotEmpty) {
      if (widget.clearValueOnMenuChanged)
        _dropdownValue = null;
      else if (widget.optionValues.length > widget.defaultValueIndex)
        _dropdownValue = widget.optionValues[widget.defaultValueIndex];
      else
        _dropdownValue = widget.optionValues[0];
    }

    super.initState();
    _prefixColor = widget.prefixItemColor ?? themeColor.fieldPrefixColor;
    _prefixBgColor = widget.prefixBgColor ?? themeColor.fieldPrefixBgColor;
  }

  @override
  void didUpdateWidget(CustomizeDropdownWidget oldWidget) {
    if (widget.debug) debugPrint('update custom field: ${widget.prefixText}');
    // update prefix widget
    if ((widget.prefixText == null && widget.prefixIconData == null) ||
        widget.prefixText != oldWidget.prefixText) {
      _prefixWidget = null;
    }

    // update suffix widget
    if (widget.suffixInitText == null && widget.suffixTextStream == null) {
      _suffixWidget = null;
    }

    updateVariables();
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    if (_prefixWidget == null &&
        (widget.prefixText != null || widget.prefixIconData != null)) {
      _buildPrefix();
    }

    if (_suffixWidget == null &&
        widget.suffixInitText != null &&
        widget.suffixTextStream != null) {
      _buildSuffix();
    }

    if (_suffixWidget == null && _prefixWidget != null) {
      dropdownDecor = BoxDecoration(
        color: (widget.subTheme)
            ? themeColor.fieldInputSubBgColor
            : themeColor.fieldInputBgColor,
        borderRadius: (widget.roundCorner)
            ? BorderRadius.only(
                topRight: Radius.circular(4.0),
                bottomRight: Radius.circular(4.0),
              )
            : BorderRadius.circular(0.0),
      );
    } else {
      dropdownDecor = BoxDecoration(
        color: (widget.subTheme)
            ? themeColor.fieldInputSubBgColor
            : themeColor.fieldInputBgColor,
        borderRadius: (widget.roundCorner)
            ? BorderRadius.circular(2.0)
            : BorderRadius.circular(0.0),
      );
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
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4.0),
                  bottomLeft: Radius.circular(4.0),
                ),
              ),
              child: _prefixWidget,
            ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              decoration: dropdownDecor,
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  hint: FittedBox(
                    fit: (widget.scaleText) ? BoxFit.fitHeight : BoxFit.none,
                    child: Text(
                      localeStr.hintActionSelect,
                      style: TextStyle(
                        color: (widget.subTheme)
                            ? themeColor.fieldInputHintSubColor
                            : themeColor.fieldInputHintColor,
                      ),
                    ),
                  ),
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: themeColor.fieldInputColor,
                  ),
                  iconSize: 24,
                  elevation: 0,
                  isExpanded: widget.fixedWidget == false,
                  isDense: true,
                  style: TextStyle(
                    color: (widget.subTheme)
                        ? themeColor.fieldInputSubColor
                        : themeColor.defaultTextColor,
                    fontSize: FontSize.NORMAL.value,
                  ),
                  dropdownColor: (widget.subTheme)
                      ? themeColor.fieldInputSubBgColor
                      : themeColor.fieldInputBgColor,
                  iconEnabledColor: (widget.subTheme)
                      ? themeColor.iconColor
                      : themeColor.buttonPrimaryColor,
                  value: _dropdownValue,
                  onChanged: (data) {
                    if (widget.changeNotify != null) widget.changeNotify(data);
                    if (widget.debug) debugPrint('selected: $data');
                    _dropdownValue = data;
                    setState(() {});
                  },
                  selectedItemBuilder: (context) {
                    if (widget.optionStrings != null &&
                        widget.optionStrings.isNotEmpty) {
                      return widget.optionStrings.map<Widget>((item) {
                        return FittedBox(
                          fit: (widget.scaleText)
                              ? BoxFit.fitHeight
                              : BoxFit.none,
                          child: Text(
                            '$item',
                            style: TextStyle(
                              color: (widget.subTheme)
                                  ? themeColor.secondaryTextColor1
                                  : themeColor.secondaryTextColor2,
                            ),
                          ),
                        );
                      }).toList();
                    } else {
                      return widget.optionValues.map<Widget>((item) {
                        return FittedBox(
                          fit: (widget.scaleText)
                              ? BoxFit.fitHeight
                              : BoxFit.none,
                          child: Text(
                            '$item',
                            style: TextStyle(
                              color: (widget.subTheme)
                                  ? themeColor.secondaryTextColor1
                                  : themeColor.secondaryTextColor2,
                            ),
                          ),
                        );
                      }).toList();
                    }
                  },
                  items: widget.optionValues.map((item) {
                    int index = widget.optionValues.indexOf(item);
                    String itemText = (widget.optionStrings != null &&
                            widget.optionStrings.length > index &&
                            widget.optionStrings.elementAt(index) != null)
                        ? widget.optionStrings[index]
                        : item.toString();
                    return DropdownMenuItem(
                      value: item,
                      child: Text(
                        '$itemText',
                        style: TextStyle(
                          color: (_dropdownValue == item)
                              ? themeColor.defaultAccentColor
                              : (widget.subTheme)
                                  ? themeColor.secondaryTextColor2
                                  : themeColor.defaultTextColor,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
          if (_suffixWidget != null) _suffixWidget,
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

  void _buildSuffix() {
    _suffixWidget ??= Container(
      constraints: _suffixConstraints,
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      decoration: BoxDecoration(
        color: themeColor.fieldInputBgColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(4.0),
          bottomRight: Radius.circular(4.0),
        ),
      ),
      alignment: Alignment.centerLeft,
      child: StreamBuilder<String>(
          stream: widget.suffixTextStream,
          builder: (context, snapshot) {
            bool reset = snapshot.data == null || snapshot.data.isEmpty;
            String text = (reset) ? widget.suffixInitText : snapshot.data;
            if (widget.debug)
              debugPrint('${widget.prefixText} postText: $text');
            return Text(
              text,
              style: TextStyle(
                color: (reset)
                    ? themeColor.defaultHintSubColor
                    : themeColor.fieldSuffixColor,
              ),
            );
          }),
    );
  }
}
