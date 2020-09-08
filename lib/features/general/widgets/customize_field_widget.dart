import 'package:flutter/material.dart';
import 'package:flutter/services.dart'
    show
        LengthLimitingTextInputFormatter,
        TextInputFormatter,
        WhitelistingTextInputFormatter;
import 'package:flutter_85bet_mobile/core/internal/global.dart';
import 'package:flutter_85bet_mobile/core/internal/themes.dart';
import 'package:flutter_85bet_mobile/utils/regex_util.dart' show RegexExtension;

part '../enum/input_field_type.dart';

typedef ValidCondition = bool Function(String);
typedef SuffixTapCall = void Function(String);

///
///
/// TODO separate prefix and suffix widget
///
class CustomizeFieldWidget extends StatefulWidget {
  /* Field Settings */
  final FieldType fieldType;
  final double fieldTextSize;
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
    this.horizontalInset = Themes.horizontalInset,
    this.minusHeight = Themes.minusSize,
    this.minusPrefixWidth = Themes.minusSize,
    this.padding,
    this.prefixText,
    this.prefixTextSize,
    this.prefixTextMaxLines,
    this.prefixIconData,
    this.prefixItemColor = Themes.fieldPrefixColor,
    this.prefixBgColor = Themes.fieldPrefixBgColor,
    this.suffixText,
    this.suffixIconData,
    this.suffixAction,
    this.suffixAction2,
    this.titleLetterSpacing = Themes.prefixTextSpacing,
    this.titleWidthFactor = Themes.prefixTextWidthFactor,
    this.iconWidthFactor = Themes.prefixIconWidthFactor,
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

  int _lastTextLength = 0;
  int _currentMaxLines;
  int _currentPrefixMaxLines;
  bool _isValid = true;

  String get getInput => _controller.text;

  set setInput(String text) {
    _controller.text = text;
    if (text.isNotEmpty) {
      // Android on change resets cursor position(cursor goes to 0)
      // so you have to check if it reset, then put in the end(just on android)
      // as IOS bugs if you simply put it in the end
      _controller.selection =
          new TextSelection.fromPosition(new TextPosition(offset: text.length));
    }
    setState(() {});
  }

  void _updateFieldStyle() {
    Color textColor = (widget.useSameBgColor)
        ? Themes.fieldInputHintSubColor
        : (widget.readOnly)
            ? Themes.defaultTextColor
            : (widget.subTheme)
                ? Themes.fieldInputSubColor
                : Themes.fieldInputColor;

    _fieldTextStyle = TextStyle(
      fontSize: (widget.fieldTextSize != null)
          ? widget.fieldTextSize
          : (widget.readOnly) ? FontSize.NORMAL.value : FontSize.SUBTITLE.value,
      color: textColor,
      decorationColor: textColor,
    );

    _fieldColor = (widget.useSameBgColor)
        ? widget.prefixBgColor
        : (widget.subTheme)
            ? (widget.readOnly)
                ? Themes.fieldReadOnlySubBgColor
                : Themes.fieldInputSubBgColor
            : (widget.readOnly)
                ? Themes.fieldReadOnlyBgColor
                : Themes.fieldInputBgColor;
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
    _currentPrefixMaxLines =
        widget.prefixTextMaxLines ?? (Global.lang == 'zh') ? 1 : 2;

    _smallWidgetHeight =
        ((Global.device.isIos) ? Themes.fieldHeight + 8 : Themes.fieldHeight) -
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
    if (widget.onInputChanged != null) {
      _controller.addListener(() {
        widget.onInputChanged(_controller.text);
      });
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
              ? Themes.fieldHeight + 8
              : Themes.fieldHeight) -
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
    _currentPrefixMaxLines =
        widget.prefixTextMaxLines ?? (Global.lang == 'zh') ? 1 : 2;
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
            enableInteractiveSelection: false,
            keyboardType: _keyboardType(),
            inputFormatters: _formatterList(),
            obscureText: widget.fieldType == FieldType.Password,
            readOnly: widget.readOnly,
            onChanged: (value) {
              setState(() {
                _isValid = widget.validCondition(value) ?? true;
              });
              if (widget.debug)
                debugPrint('${widget.hint} input: $value, valid: $_isValid');
            },
            style: _fieldTextStyle,
            cursorColor: (widget.subTheme)
                ? Themes.fieldCursorSubColor
                : Themes.defaultAccentColor,
            textAlign:
                (widget.centerFieldText) ? TextAlign.center : TextAlign.start,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              labelText: (widget.persistHint) ? widget.hint : null,
              hintText: (widget.persistHint) ? null : widget.hint,
              hintStyle: (widget.coloredHint)
                  ? TextStyle(color: Themes.hintHighlight)
                  : null,
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
            enableInteractiveSelection: false,
            keyboardType: _keyboardType(),
            inputFormatters: _formatterList(),
            obscureText: widget.fieldType == FieldType.Password,
            readOnly: widget.readOnly,
            onChanged: (value) {
              if (widget.fieldType == FieldType.Date) {
                if (_dateInputChecked(value) == false) return;
              }
              setState(() {
                _isValid = widget.validCondition(value) ?? true;
              });
              if (widget.onInputChanged != null) if (widget.debug) {
                debugPrint(
                    '${widget.hint} input: $value, code: ${value.codeUnits}, valid: $_isValid');
              }
            },
            style: _fieldTextStyle,
            cursorColor: (widget.subTheme)
                ? Themes.fieldCursorSubColor
                : Themes.defaultAccentColor,
            textAlign:
                (widget.centerFieldText) ? TextAlign.center : TextAlign.start,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              labelText: (widget.persistHint) ? widget.hint : null,
              hintText: (widget.persistHint) ? null : widget.hint,
              hintStyle: (widget.coloredHint)
                  ? TextStyle(color: Themes.hintHighlight)
                  : null,
              isDense: true,
              fillColor: _fieldColor,
              contentPadding: _fieldInset,
              prefixIconConstraints: (_prefixWidget != null)
                  ? _prefixConstraints
                  : BoxConstraints.tightFor(width: 6, height: 0),
              prefixIcon: (_prefixWidget != null)
                  ? Container(
                      margin: const EdgeInsets.only(right: 8.0),
                      color: widget.prefixBgColor,
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
                    wordSpacing: widget.titleLetterSpacing / 2,
                    letterSpacing: widget.titleLetterSpacing / 4,
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
                      ? Themes.fieldInputSubColor
                      : Themes.fieldSuffixColor,
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
                  size: Themes.fieldIconSize * 0.625,
                  color: (widget.useSameBgColor)
                      ? Themes.fieldInputSubColor
                      : Themes.fieldSuffixColor,
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
            size: Themes.fieldIconSize * 0.625,
            color: (widget.useSameBgColor)
                ? Themes.fieldInputSubColor
                : Themes.fieldSuffixColor,
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
                    ? Themes.fieldInputSubColor
                    : Themes.fieldSuffixColor,
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
      case FieldType.ChineseOnly:
        return [
          _chineseInputFormatter,
          LengthLimitingTextInputFormatter(widget.maxInputLength ~/ 2),
        ];
      case FieldType.NoEnglish:
        return [
          _withoutEngInputFormatter,
          LengthLimitingTextInputFormatter(widget.maxInputLength ~/ 2),
        ];
      case FieldType.TextOnly:
        return [
          _textOnlyInputFormatter,
          LengthLimitingTextInputFormatter(widget.maxInputLength),
        ];
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
      case FieldType.NoChinese:
      case FieldType.Password:
        return [
          _withoutChineseInputFormatter,
          LengthLimitingTextInputFormatter(widget.maxInputLength),
        ];
      default:
        return [
          _normalInputFormatter,
          LengthLimitingTextInputFormatter(widget.maxInputLength),
        ];
    }
  }

  final dateMask = 'xxxx-xx-xx';

  final dateSeparator = '-';

  bool _dateInputChecked(String input) {
    if (input.isValidDate || input.length < 4) {
      _lastTextLength = input.length;
      debugPrint('field date checked');
      return true;
    }
    if (input.length < _lastTextLength) {
      // is deleting
      debugPrint('date helper deleting: $input');
      // delete separator
      if (input.endsWith(dateSeparator)) {
        _controller.text = input.substring(0, input.length - 1);
      }
      debugPrint('date helper new text: ${_controller.text}');
    } else if (input.length > _lastTextLength) {
      // is typing
      debugPrint('date helper typing: $input');
      var position = input.length;

      if (position < dateMask.length && dateMask[position] == dateSeparator) {
        _controller.text = input + dateSeparator;
        debugPrint('date helper new text: ${_controller.text}');
      }
      if (position == 5 && input.contains(dateSeparator) == false) {
        _controller.text = input.replaceRange(
            position - 1, position, dateSeparator + input[position - 1]);
      }
    }
    _lastTextLength = _controller.text.length;
    if (input == _controller.text) return true;
    try {
      _fieldKey.currentState.didChange(_controller.text);
      setInput = _controller.text;
    } on Exception catch (e) {
      debugPrint('field state error: $e');
      setState(() {});
    }
    return false;
  }
}