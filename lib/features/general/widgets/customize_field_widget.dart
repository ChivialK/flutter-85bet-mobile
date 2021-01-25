import 'package:flutter/material.dart';
import 'package:flutter/services.dart'
    show
        FilteringTextInputFormatter,
        LengthLimitingTextInputFormatter,
        TextInputFormatter;
import 'package:flutter_85bet_mobile/core/internal/global.dart';
import 'package:flutter_85bet_mobile/features/themes/theme_interface.dart';

part '../enum/input_field_type.dart';

typedef ValidCondition = bool Function(String);
typedef SuffixTapCall = void Function(String);

///
/// TODO integrate customized widget
/// TODO separate prefix and suffix widget
///
class CustomizeFieldWidget extends StatefulWidget {
  /* Field Settings */
  final FieldType fieldType;
  final double fieldTextSize;
  final Color fieldTextColor;
  final String hint;
  final bool persistHint;
  final bool coloredHint;
  final bool centerFieldText;
  final bool useSameBgColor;
  final bool subTheme;
  final bool readOnly;

  /* Field Validate Settings */
  final int maxInputLength;
  final ValidCondition validCondition;
  final String errorMsg;

  /* Container Settings */
  final double horizontalInset;
  final EdgeInsetsGeometry padding;
  final double minusHeight;
  final double minusPrefixWidth;

  /* Decoration Widget Settings */
  final String prefixText;
  final double prefixTextSize;
  final int prefixTextMaxLines;
  final IconData prefixIconData;
  final Color prefixItemColor;
  final Color prefixBgColor;
  final IconData suffixIconData;
  final String suffixText;
  final SuffixTapCall suffixAction;
  final SuffixTapCall suffixAction2;
  final double titleWidthFactor;
  final double titleLetterSpacing;
  final double iconWidthFactor;
  final double suffixLetterWidth;
  final int maxLines;
  final bool roundCorner;
  final bool requiredInput;

  final SuffixTapCall onInputChanged;

  /* Other Settings */
  final bool debug;

  CustomizeFieldWidget({
    Key key,
    this.fieldType = FieldType.Normal,
    this.fieldTextSize,
    this.fieldTextColor,
    this.hint = '',
    this.persistHint = true,
    this.coloredHint = false,
    this.centerFieldText = false,
    this.useSameBgColor = false,
    this.subTheme = false,
    this.readOnly = false,
    this.maxInputLength = 16,
    this.maxLines = 1,
    this.validCondition,
    this.errorMsg,
    this.horizontalInset = ThemeInterface.horizontalInset,
    this.minusHeight = ThemeInterface.minusSize,
    this.minusPrefixWidth = ThemeInterface.minusSize,
    this.padding,
    this.prefixText,
    this.prefixTextSize,
    this.prefixTextMaxLines,
    this.prefixIconData,
    this.prefixItemColor,
    this.prefixBgColor,
    this.suffixText,
    this.suffixIconData,
    this.suffixAction,
    this.suffixAction2,
    this.titleLetterSpacing = ThemeInterface.prefixTextSpacing,
    this.titleWidthFactor = ThemeInterface.prefixTextWidthFactor,
    this.iconWidthFactor = ThemeInterface.prefixIconWidthFactor,
    this.suffixLetterWidth = 2.4,
    this.roundCorner = false,
    this.onInputChanged,
    this.requiredInput = false,
    this.debug = false,
  }) : super(key: key);

  @override
  CustomizeFieldWidgetState createState() => CustomizeFieldWidgetState();
}

class CustomizeFieldWidgetState extends State<CustomizeFieldWidget> {
  final TextEditingController _controller = new TextEditingController();
  final GlobalKey<FormFieldState> _fieldKey = new GlobalKey();
  final FocusNode _focusNode = new FocusNode();

  bool _focusListener = false;
  double _viewWidth;
  EdgeInsetsGeometry _fieldInset;
  TextStyle _fieldTextStyle;
  Color _fieldColor;
  double _smallWidgetHeight;
  double _prefixWidth;
  Widget _prefixWidget;
  BoxConstraints _prefixConstraints;
  double _suffixWidth;
  Widget _suffixWidget;
  BoxConstraints _suffixConstraints;

  int _currentMaxLines;
  int _currentPrefixMaxLines;
  bool _isValid = true;

  Color _prefixColor;
  Color _prefixBgColor;

  String get getInput => _controller.text;

  set setInput(String text) {
    _controller.text = text;
    if (text.isNotEmpty) {
      // Android on change resets cursor position(cursor goes to 0)
      // so you have to check if it had been reset, then put in the end(just on android)
      // as IOS bugs if you simply put it in the end
      _controller.selection =
          new TextSelection.fromPosition(new TextPosition(offset: text.length));
    }
    setState(() {});
  }

  void _onDateInputChanged() {
    String input = _controller.text;
    int pos = input.length;
    String newText = input;
    if (pos == 5 && input[pos - 1] != '-') {
      newText = input.replaceRange(pos - 1, pos, '-' + input[pos - 1]);
    } else if (pos == 8 && input[pos - 1] != '-') {
      newText = input.replaceRange(pos - 1, pos, '-' + input[pos - 1]);
    }
    if (newText != input) {
      _controller.text = newText;
      _controller.selection =
          TextSelection.fromPosition(new TextPosition(offset: newText.length));
    }
  }

  void _onInputChanged(String value) {
    if (widget.debug) {
      debugPrint('input value: $value');
      debugPrint('controller text: ${_controller.text}');
      debugPrint('controller selection: ${_controller.selection}');
    }

    // fix cursor position
    if (_controller.selection.baseOffset ==
            _controller.selection.extentOffset &&
        _controller.selection.baseOffset != _controller.text.length) {
      _controller.selection = new TextSelection.fromPosition(
          new TextPosition(offset: value.length));
      debugPrint('fixed controller selection: ${_controller.selection}');
    }

    setState(() {
      _isValid = widget.validCondition(value) ?? true;
    });

    if (widget.onInputChanged != null && widget.debug) {
      debugPrint(
          '${widget.hint} input: $value, code: ${value.codeUnits}, valid: $_isValid');
    }
  }

  void _updateFieldStyle() {
    Color textColor = (widget.fieldTextColor != null)
        ? widget.fieldTextColor
        : (widget.useSameBgColor)
            ? themeColor.fieldInputHintSubColor
            : (widget.readOnly)
                ? themeColor.defaultTextColor
                : (widget.subTheme)
                    ? themeColor.fieldInputSubColor
                    : themeColor.fieldInputColor;

    _fieldTextStyle = TextStyle(
      fontSize: (widget.fieldTextSize != null)
          ? widget.fieldTextSize
          : (widget.readOnly)
              ? FontSize.NORMAL.value
              : FontSize.SUBTITLE.value,
      color: textColor,
      decorationColor: textColor,
    );

    _fieldColor = (widget.useSameBgColor)
        ? widget.prefixBgColor ?? themeColor.fieldPrefixBgColor
        : (widget.subTheme)
            ? (widget.readOnly)
                ? themeColor.fieldReadOnlySubBgColor
                : themeColor.fieldInputSubBgColor
            : (widget.readOnly)
                ? themeColor.fieldReadOnlyBgColor
                : themeColor.fieldInputBgColor;
  }

  @override
  void initState() {
    _viewWidth = Global.device.width.roundToDouble() - widget.horizontalInset;

    _prefixWidth = (widget.prefixText != null)
        ? _viewWidth * widget.titleWidthFactor
        : _viewWidth * widget.iconWidthFactor - widget.minusPrefixWidth;
    if (_prefixWidth < 56.0) _prefixWidth = 56.0;

    _suffixWidth = FontSize.NORMAL.value * widget.suffixLetterWidth;
    if (Global.device.isIos) _suffixWidth += 8.0;

    _currentMaxLines = widget.maxLines;
    _currentPrefixMaxLines = (widget.prefixTextMaxLines != null)
        ? widget.prefixTextMaxLines
        : (Global.lang.isChinese)
            ? 1
            : 2;

    _smallWidgetHeight = ((Global.device.isIos)
            ? ThemeInterface.fieldHeight + 8
            : ThemeInterface.fieldHeight) -
        widget.minusHeight;
    if (widget.prefixIconData != null) _smallWidgetHeight += 8.0;

    double fieldInsetHeight =
        (widget.persistHint) ? 4 : (_smallWidgetHeight - 21.6) / 2;

    _fieldInset = (widget.centerFieldText)
        ? EdgeInsets.only(left: 2.0)
        : EdgeInsets.symmetric(horizontal: 8.0, vertical: fieldInsetHeight);

    _updateFieldStyle();

    if (widget.debug) {
      debugPrint('screen width: ${Global.device.width}');
      debugPrint('field prefix width: $_prefixWidth');
      debugPrint('field height: $_smallWidgetHeight');
    }

    super.initState();
    _prefixColor = widget.prefixItemColor ?? themeColor.fieldPrefixColor;
    _prefixBgColor = widget.prefixBgColor ?? themeColor.fieldPrefixBgColor;
    if (!_focusListener) {
      _focusNode.addListener(() {
        // debugPrint('field ${widget.key} has focus ${_focusNode.hasFocus}');
        if (_controller.selection.baseOffset ==
                _controller.selection.extentOffset &&
            _controller.selection.baseOffset != _controller.text.length) {
          _controller.selection = new TextSelection.fromPosition(
              new TextPosition(offset: _controller.text.length));
          debugPrint('fixed controller selection: ${_controller.selection}');
        }
      });
      _focusListener = true;
    }
    if (widget.onInputChanged != null) {
      _controller.addListener(() {
        widget.onInputChanged(_controller.text);
      });
    }
    if (widget.fieldType == FieldType.Date) {
      _controller.addListener(() => _onDateInputChanged());
    }
  }

  @override
  void didUpdateWidget(CustomizeFieldWidget oldWidget) {
    if (widget.debug) debugPrint('update custom field: ${widget.prefixText}');
    // update prefix widget
    if ((widget.prefixText == null && widget.prefixIconData == null) ||
        widget.prefixText != oldWidget.prefixText) _prefixWidget = null;
    // update suffix widget
    if (widget.suffixText == null && widget.suffixIconData == null)
      _suffixWidget = null;
    // update constraints if max line has changed
    if (widget.maxLines != _currentMaxLines) {
      _currentMaxLines = widget.maxLines;
      _smallWidgetHeight = ((Global.device.isIos)
              ? ThemeInterface.fieldHeight + 8
              : ThemeInterface.fieldHeight) -
          widget.minusHeight;
      _prefixConstraints = BoxConstraints(
        minWidth: _prefixWidth,
        maxWidth: _prefixWidth,
        minHeight: _smallWidgetHeight,
      );
      _suffixConstraints = BoxConstraints(
        minWidth: _suffixWidth,
        maxWidth: _suffixWidth,
        minHeight: _smallWidgetHeight,
      );
    }
    _currentPrefixMaxLines = (widget.prefixTextMaxLines != null)
        ? widget.prefixTextMaxLines
        : (Global.lang.isChinese)
            ? 1
            : 2;
    _updateFieldStyle();
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    _prefixConstraints ??= BoxConstraints(
      minWidth: _prefixWidth,
      maxWidth: _prefixWidth,
      minHeight: _smallWidgetHeight,
    );
    _suffixConstraints ??= BoxConstraints(
      minWidth: _suffixWidth,
      maxWidth: _suffixWidth,
      minHeight: _smallWidgetHeight,
    );
    if (_prefixWidget == null &&
        (widget.prefixText != null || widget.prefixIconData != null)) {
      _buildPrefix();
    }
    if (_suffixWidget == null &&
        (widget.suffixText != null || widget.suffixIconData != null)) {
      _buildSuffix();
    }
    if (_prefixWidget == null && _suffixWidget == null) {
      return ClipRRect(
        borderRadius: (widget.roundCorner)
            ? BorderRadius.circular(8.0)
            : BorderRadius.circular(0.0),
        child: Container(
          padding: widget.padding ?? const EdgeInsets.symmetric(vertical: 2.0),
          constraints: BoxConstraints(
            maxWidth: _viewWidth,
            minHeight: _smallWidgetHeight,
            maxHeight: _smallWidgetHeight,
          ),
          child: new TextFormField(
            key: _fieldKey,
            controller: _controller,
            focusNode: _focusNode,
            enableInteractiveSelection: false,
            keyboardType: _keyboardType(),
            inputFormatters: _formatterList(),
            obscureText: widget.fieldType == FieldType.Password,
            readOnly: widget.readOnly,
            onChanged: (value) => _onInputChanged(value),
            style: _fieldTextStyle,
            cursorColor: (widget.subTheme)
                ? themeColor.fieldCursorSubColor
                : themeColor.fieldCursorColor,
            textAlign:
                (widget.centerFieldText) ? TextAlign.center : TextAlign.start,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              labelText: (widget.persistHint) ? widget.hint : null,
              hintText: (widget.persistHint) ? null : widget.hint,
              hintStyle: (widget.coloredHint)
                  ? TextStyle(color: themeColor.hintHighlight)
                  : TextStyle(color: themeColor.fieldInputHintColor),
              fillColor: _fieldColor,
              isDense: true,
              contentPadding: _fieldInset,
              errorText: (_isValid) ? null : widget.errorMsg,
            ),
            minLines: widget.fieldType == FieldType.Password ? 1 : null,
            maxLines: widget.fieldType == FieldType.Password ? 1 : null,
            expands: widget.fieldType != FieldType.Password,
          ),
        ),
      );
    } else {
      return ClipRRect(
        borderRadius: (widget.roundCorner)
            ? BorderRadius.circular(8.0)
            : BorderRadius.circular(0.0),
        child: Container(
          padding: widget.padding ?? const EdgeInsets.symmetric(vertical: 2.0),
          constraints: BoxConstraints(
            maxWidth: _viewWidth,
            minHeight: _smallWidgetHeight,
          ),
          child: new TextFormField(
            key: _fieldKey,
            controller: _controller,
            focusNode: _focusNode,
            enableInteractiveSelection: false,
            keyboardType: _keyboardType(),
            inputFormatters: _formatterList(),
            obscureText: widget.fieldType == FieldType.Password,
            readOnly: widget.readOnly,
            onChanged: (value) => _onInputChanged(value),
            style: _fieldTextStyle,
            cursorColor: (widget.subTheme)
                ? themeColor.fieldCursorSubColor
                : themeColor.fieldCursorColor,
            textAlign:
                (widget.centerFieldText) ? TextAlign.center : TextAlign.start,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              labelText: (widget.persistHint) ? widget.hint : null,
              hintText: (widget.persistHint) ? null : widget.hint,
              hintStyle: (widget.coloredHint)
                  ? TextStyle(color: themeColor.hintHighlight)
                  : TextStyle(color: themeColor.fieldInputHintColor),
              isDense: true,
              fillColor: _fieldColor,
              contentPadding: _fieldInset,
              prefixIconConstraints: (_prefixWidget != null)
                  ? _prefixConstraints
                  : BoxConstraints.tightFor(width: 6, height: 0),
              prefixIcon: (_prefixWidget != null)
                  ? Container(
                      margin: const EdgeInsets.only(right: 8.0),
                      color: _prefixBgColor,
                      child: _prefixWidget,
                    )
                  : SizedBox.shrink(),
              suffixIconConstraints: (_suffixWidget != null)
                  ? _suffixConstraints
                  : BoxConstraints.tightFor(width: 6, height: 0),
              suffixIcon:
                  (_suffixWidget != null) ? _suffixWidget : SizedBox.shrink(),
              errorText: (_isValid) ? null : widget.errorMsg,
            ),
            maxLines: _currentMaxLines,
          ),
        ),
      );
    }
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
                    wordSpacing: widget.titleLetterSpacing / 2,
                    letterSpacing: widget.titleLetterSpacing / 4,
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
    if (widget.suffixIconData != null && widget.suffixText != null) {
      _suffixWidget = Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            GestureDetector(
              child: Text(
                widget.suffixText,
                style: TextStyle(
                  color: (widget.useSameBgColor)
                      ? themeColor.fieldInputSubColor
                      : themeColor.fieldSuffixColor,
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.visible,
                maxLines: 2,
              ),
              onTap: () => (widget.suffixAction != null)
                  ? widget.suffixAction(_controller.text)
                  : debugPrint(_controller.text),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 6.0, right: 4.0),
              child: GestureDetector(
                child: Icon(
                  widget.suffixIconData,
                  size: ThemeInterface.fieldIconSize * 0.625,
                  color: (widget.useSameBgColor)
                      ? themeColor.fieldInputSubColor
                      : themeColor.fieldSuffixColor,
                ),
                onTap: () => (widget.suffixAction2 != null)
                    ? widget.suffixAction2(_controller.text)
                    : debugPrint(_controller.text),
              ),
            ),
          ],
        ),
      );
    } else if (widget.suffixIconData != null) {
      _suffixWidget = Center(
        child: GestureDetector(
          child: Icon(
            widget.suffixIconData,
            size: ThemeInterface.fieldIconSize * 0.625,
            color: (widget.useSameBgColor)
                ? themeColor.fieldInputSubColor
                : themeColor.fieldSuffixColor,
          ),
          onTap: () => (widget.suffixAction != null)
              ? widget.suffixAction(_controller.text)
              : debugPrint(_controller.text),
        ),
      );
    } else if (widget.suffixText != null) {
      _suffixWidget = Center(
        child: Container(
          margin: const EdgeInsets.only(right: 4.0),
          child: GestureDetector(
            child: Text(
              widget.suffixText,
              style: TextStyle(
                color: (widget.useSameBgColor)
                    ? themeColor.fieldInputSubColor
                    : themeColor.fieldSuffixColor,
              ),
              textAlign: TextAlign.center,
              overflow: TextOverflow.visible,
              maxLines: 2,
            ),
            onTap: () => (widget.suffixAction != null)
                ? widget.suffixAction(_controller.text)
                : debugPrint(_controller.text),
          ),
        ),
      );
    }
  }

  TextInputType _keyboardType() {
    switch (widget.fieldType) {
      case FieldType.Numbers:
        return TextInputType.number;
      case FieldType.Email:
        return TextInputType.emailAddress;
      case FieldType.Date:
        return TextInputType.datetime;
      default:
        return TextInputType.text;
    }
  }

  List<TextInputFormatter> _formatterList() {
    switch (widget.fieldType) {
      case FieldType.Numbers:
        return [
          _numbersInputFormatter,
          LengthLimitingTextInputFormatter(widget.maxInputLength),
        ];
      case FieldType.Date:
        return [
          _dateInputFormatter,
          LengthLimitingTextInputFormatter(widget.maxInputLength),
        ];
      case FieldType.Email:
        return [
          _emailInputFormatter,
          LengthLimitingTextInputFormatter(widget.maxInputLength),
        ];
      case FieldType.Account:
        return [
          _accountInputFormatter,
          LengthLimitingTextInputFormatter(widget.maxInputLength),
        ];
      case FieldType.Password:
        return [
          _withoutChineseInputFormatter,
          LengthLimitingTextInputFormatter(widget.maxInputLength),
        ];
      default:
        return [
//          _normalInputFormatter,
          LengthLimitingTextInputFormatter(widget.maxInputLength),
        ];
    }
  }
}
