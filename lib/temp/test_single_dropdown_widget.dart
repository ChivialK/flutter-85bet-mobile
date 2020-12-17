import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/core/internal/global.dart';
import 'package:flutter_85bet_mobile/features/themes/theme_interface.dart';

import '../mylogger.dart';

class SingleDropdownWidget extends StatefulWidget {
  /// [DropdownMenuItem]s text list
  final List<String> optionStrings;

  /// [DropdownMenuItem]s value list
  final List optionValues;

  /// Pass the option value back on item selected
  final ValueChanged changeNotify;

  /// Dropdown widget's selected index, default is 0.
  final int defaultValueIndex;

  /// Expand the dropdown to fit the row, default is true.
  final bool expandWidget;

  /// Parent widget width, default is Device.width
  final double parentWidth;

  /// Total margin between this widget and device screen, default is 32.
  final double widgetHorInset;

  /// Text space between letters and words
  final double spacing;

  final String prefixTitle;
  final IconData prefixIconData;
  final double titleWidthFactor;
  final double iconWidthFactor;
  final bool debug;

  SingleDropdownWidget({
    key,
    @required this.optionValues,
    this.optionStrings,
    this.changeNotify,
    this.defaultValueIndex = 0,
    this.expandWidget = true,
    this.parentWidth,
    this.widgetHorInset = 32.0,
    this.prefixTitle,
    this.titleWidthFactor = ThemeInterface.prefixTextWidthFactor,
    this.spacing = 12.0,
    this.prefixIconData,
    this.iconWidthFactor = ThemeInterface.prefixIconWidthFactor,
    this.debug = false,
  }) : super(key: key);

  @override
  SingleDropdownWidgetState createState() => SingleDropdownWidgetState();
}

class SingleDropdownWidgetState extends State<SingleDropdownWidget> {
  dynamic _dropdownValue;

  double _viewWidth;
  double _smallWidgetHeight;
  double _prefixWidth;
  Widget _prefixWidget;
  BoxConstraints _prefixConstraints;

  dynamic get selected => _dropdownValue;

  set setSelected(value) {
    _dropdownValue = value;
    setState(() {});
  }

  @override
  void initState() {
    _viewWidth = (widget.parentWidth ?? Global.device.width).roundToDouble() -
        widget.widgetHorInset;

    _prefixWidth = ((widget.prefixTitle != null)
            ? _viewWidth * widget.titleWidthFactor
            : _viewWidth * widget.iconWidthFactor) -
        8;

    _smallWidgetHeight = ThemeInterface.fieldHeight - 12;

    if (widget.debug) {
      debugPrint(
          'screen width: ${Global.device.width}, view width: ${widget.parentWidth}');
      debugPrint('field prefix width: $_prefixWidth');
    }

    if (widget.optionStrings != null &&
        widget.optionStrings.length != widget.optionValues.length) {
      MyLogger.warn(
          msg: 'option string list length not match.'
              ' values: ${widget.optionValues.length},'
              ' strings: ${widget.optionStrings.length}',
          tag: 'TestDropdown');
    }

    _dropdownValue = widget.optionValues[widget.defaultValueIndex];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _prefixConstraints ??= BoxConstraints(
      minWidth: _prefixWidth,
      maxWidth: _prefixWidth,
      minHeight: _smallWidgetHeight,
    );

    if (_prefixWidget == null &&
        (widget.prefixTitle != null || widget.prefixIconData != null)) {
      _buildPrefix();
    }

    return Container(
      constraints: BoxConstraints.tightFor(
        width: _viewWidth,
        height: _smallWidgetHeight,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          if (_prefixWidget != null) _prefixWidget,
          Expanded(
            child: Container(
              color: themeColor.fieldInputBgColor,
              padding: const EdgeInsets.symmetric(horizontal: 6.0),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  value: _dropdownValue,
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 24,
                  elevation: 0,
                  isExpanded: widget.expandWidget,
                  isDense: true,
                  style: TextStyle(
                    color: themeColor.defaultTextColor,
                    fontSize: FontSize.SUBTITLE.value,
                  ),
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
                        return Text(
                          item,
                          style: TextStyle(
                            color: themeColor.secondaryTextColor1,
                          ),
                        );
                      }).toList();
                    } else {
                      return widget.optionValues.map<Widget>((item) {
                        return Text(
                          item,
                          style: TextStyle(
                            color: themeColor.secondaryTextColor1,
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
                        itemText,
                        style: TextStyle(
                          color: (_dropdownValue == item)
                              ? themeColor.defaultAccentColor
                              : themeColor.defaultTextColor,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _buildPrefix() {
    if (widget.prefixTitle != null && widget.prefixIconData != null) {
      _prefixWidget = Container(
        color: themeColor.defaultWidgetBgColor,
        constraints: _prefixConstraints,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2.0),
              child: Icon(
                widget.prefixIconData,
                size: ThemeInterface.fieldIconSize,
                color: themeColor.iconSubColor1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 6.0),
              child: Text(
                widget.prefixTitle,
                style: TextStyle(
//              fontSize: FontSize.SUBTITLE.value,
                  wordSpacing: widget.spacing / 2,
                  letterSpacing: widget.spacing / 4,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      );
    } else if (widget.prefixTitle != null) {
      _prefixWidget = Container(
        color: themeColor.defaultWidgetBgColor,
        constraints: _prefixConstraints,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: 6.0),
        child: Text(
          widget.prefixTitle,
          style: TextStyle(
//              fontSize: FontSize.SUBTITLE.value,
            wordSpacing: widget.spacing,
            letterSpacing: widget.spacing,
          ),
          overflow: TextOverflow.ellipsis,
        ),
      );
    } else if (widget.prefixIconData != null) {
      _prefixWidget = Container(
        color: themeColor.defaultWidgetBgColor,
        constraints: _prefixConstraints,
        child: Center(
          child: Icon(
            widget.prefixIconData,
            size: ThemeInterface.fieldIconSize,
            color: themeColor.iconSubColor1,
          ),
        ),
      );
    }
  }
}
