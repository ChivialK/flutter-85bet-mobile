import 'package:flutter/material.dart';
import 'package:flutter/services.dart'
    show
        LengthLimitingTextInputFormatter,
        TextInputFormatter,
        WhitelistingTextInputFormatter;
import 'package:flutter_85bet_mobile/core/internal/global.dart';
import 'package:flutter_85bet_mobile/core/internal/themes.dart';

typedef ValidCondition = bool Function(String);
typedef SuffixTapCall = void Function(String);

enum FieldType {
  Normal,
  ChineseOnly,
  NoChinese,
  NoEnglish,
  Numbers,
  Email,
  Date,
  Password
}

class SingleInputWidget extends StatefulWidget {
  final String hint;
  final bool persistHint;
  final String errorMsg;
  final double parentWidth;
  final double widgetHorInset;
  final EdgeInsetsGeometry widgetPadding;
  final EdgeInsetsGeometry fieldContentInset;
  final String prefixTitle;
  final double titleWidthFactor;
  final double spacing;
  final IconData prefixIconData;
  final double iconWidthFactor;
  final IconData suffixIconData;
  final String suffixText;
  final SuffixTapCall suffixAction;
  final ValidCondition validCondition;
  final FieldType fieldType;
  final int maxInputLength;
  final bool debug;

  SingleInputWidget({
    Key key,
    this.fieldType = FieldType.Normal,
    this.hint,
    this.persistHint = true,
    this.errorMsg,
    this.parentWidth,
    this.widgetHorInset = 32.0,
    this.widgetPadding,
    this.fieldContentInset,
    this.prefixTitle,
    this.titleWidthFactor = Themes.prefixTextWidthFactor,
    this.spacing = 12.0,
    this.prefixIconData,
    this.iconWidthFactor = Themes.prefixIconWidthFactor,
    this.suffixIconData,
    this.suffixText,
    this.suffixAction,
    this.validCondition,
    this.maxInputLength = 16,
    this.debug = false,
  }) : super(key: key);

  @override
  SingleInputWidgetState createState() => SingleInputWidgetState();
}

class SingleInputWidgetState extends State<SingleInputWidget> {
  final TextEditingController _controller = new TextEditingController();
  bool _isValid = true;
  double prefixWidth;
  double suffixWidth;
  Widget prefixWidget;
  Widget suffixWidget;
  BoxConstraints prefixConstraints;
  BoxConstraints suffixConstraints;

  double smallWidgetHeight;
  EdgeInsetsGeometry fieldInset;

  String get inputText => _controller.text;

  set setInput(String text) {
    _controller.text = text;
    setState(() {});
  }

  @override
  void initState() {
    double viewWidth =
        (widget.parentWidth ?? Global.device.width).roundToDouble() -
            widget.widgetHorInset;

    prefixWidth = (widget.prefixTitle != null)
        ? viewWidth * widget.titleWidthFactor
        : viewWidth * widget.iconWidthFactor;

    suffixWidth = (widget.suffixIconData != null)
        ? viewWidth * (widget.iconWidthFactor * 0.65)
        : FontSize.NORMAL.value * 2.4;

    smallWidgetHeight = Themes.fieldHeight + 2;
    double fieldInsetHeight =
        (widget.persistHint) ? 8 : (smallWidgetHeight - 21.6) / 2;
    fieldInset =
        EdgeInsets.symmetric(horizontal: 8.0, vertical: fieldInsetHeight);

    if (widget.debug) {
      debugPrint(
          'screen width: ${Global.device.width}, view width: ${widget.parentWidth}');
      debugPrint('field prefix width: $prefixWidth');
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    prefixConstraints ??= BoxConstraints(
      minWidth: prefixWidth,
      maxWidth: prefixWidth,
      minHeight: smallWidgetHeight,
    );
    suffixConstraints ??= BoxConstraints(
      minWidth: suffixWidth,
      maxWidth: suffixWidth,
      minHeight: smallWidgetHeight,
    );
    if (prefixWidget == null &&
        (widget.prefixTitle != null || widget.prefixIconData != null)) {
      _buildPrefix();
    }
    if (suffixWidget == null &&
        (widget.suffixText != null || widget.suffixIconData != null)) {
      _buildSuffix();
    }
    if (prefixWidget == null && suffixWidget == null) {
      return Padding(
        padding:
            widget.widgetPadding ?? const EdgeInsets.symmetric(vertical: 4),
        child: new TextFormField(
          controller: _controller,
          keyboardType: _keyboardType(),
          inputFormatters: _formatterList(),
          obscureText: widget.fieldType == FieldType.Password,
          onChanged: (value) {
            _isValid = widget.validCondition(value) ?? true;
            if (widget.debug)
              debugPrint('${widget.hint} input: $value, valid: $_isValid');
            setState(() {});
          },
          decoration: InputDecoration(
            labelText: (widget.persistHint) ? widget.hint : null,
            hintText: (widget.persistHint) ? null : widget.hint,
            isDense: true,
            contentPadding: fieldInset,
            errorText: (_isValid) ? null : widget.errorMsg,
          ),
        ),
      );
    } else {
      return Padding(
        padding:
            widget.widgetPadding ?? const EdgeInsets.symmetric(vertical: 4),
        child: new TextFormField(
          controller: _controller,
          keyboardType: _keyboardType(),
          inputFormatters: _formatterList(),
          obscureText: widget.fieldType == FieldType.Password,
          onChanged: (value) {
            _isValid = widget.validCondition(value) ?? true;
            if (widget.debug)
              debugPrint('${widget.hint} input: $value, valid: $_isValid');
            setState(() {});
          },
          decoration: InputDecoration(
            labelText: (widget.persistHint) ? widget.hint : null,
            hintText: (widget.persistHint) ? null : widget.hint,
            isDense: true,
            contentPadding: fieldInset,
            prefixIconConstraints: (prefixWidget != null)
                ? prefixConstraints
                : BoxConstraints.tightFor(width: 6, height: 0),
            prefixIcon: (prefixWidget != null)
                ? Container(
                    margin: const EdgeInsets.only(right: 8.0),
                    color: Themes.defaultWidgetBgColor,
                    child: prefixWidget,
                  )
                : SizedBox.shrink(),
            suffixIconConstraints: (suffixWidget != null)
                ? suffixConstraints
                : BoxConstraints.tightFor(width: 6, height: 0),
            suffixIcon:
                (suffixWidget != null) ? suffixWidget : SizedBox.shrink(),
            errorText: (_isValid) ? null : widget.errorMsg,
          ),
        ),
      );
    }
  }

  void _buildPrefix() {
    if (widget.prefixTitle != null && widget.prefixIconData != null) {
      prefixWidget = Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0),
            child: Icon(
              widget.prefixIconData,
              size: Themes.fieldIconSize,
              color: Themes.iconSubColor1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 6.0),
            child: Text(
              widget.prefixTitle,
              style: TextStyle(
//                fontSize: FontSize.SUBTITLE.value,
                wordSpacing: widget.spacing / 2,
                letterSpacing: widget.spacing / 4,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      );
    } else if (widget.prefixTitle != null) {
      prefixWidget = Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
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
          ),
        ],
      );
    } else if (widget.prefixIconData != null) {
      prefixWidget = Center(
        child: Icon(
          widget.prefixIconData,
          size: Themes.fieldIconSize,
          color: Themes.iconSubColor1,
        ),
      );
    }
  }

  void _buildSuffix() {
    if (widget.suffixIconData != null) {
      suffixWidget = Center(
        child: GestureDetector(
          child: Icon(
            widget.suffixIconData,
            size: Themes.fieldIconSize * 0.625,
            color: Themes.dialogTitleColor,
          ),
          onTap: () => (widget.suffixAction != null)
              ? widget.suffixAction(_controller.text)
              : debugPrint(_controller.text),
        ),
      );
    } else if (widget.suffixText != null) {
      suffixWidget = Center(
        child: Container(
          margin: const EdgeInsets.only(right: 4.0),
          child: GestureDetector(
            child: Text(
              widget.suffixText,
              style: TextStyle(color: Themes.dialogTitleColor),
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
          WhitelistingTextInputFormatter(RegExp("[\u4e00-\u9fa5]")),
          LengthLimitingTextInputFormatter(widget.maxInputLength ~/ 2),
        ];
      case FieldType.NoEnglish:
        return [
          WhitelistingTextInputFormatter(RegExp("[\u4e00-\u9fa5]|[0-9]")),
          LengthLimitingTextInputFormatter(widget.maxInputLength ~/ 2),
        ];
      case FieldType.Numbers:
        return [
          WhitelistingTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(widget.maxInputLength),
        ];
      case FieldType.NoChinese:
      case FieldType.Password:
        return [
          WhitelistingTextInputFormatter(RegExp("[a-zA-Z]|[0-9]")),
          LengthLimitingTextInputFormatter(widget.maxInputLength),
        ];
      default:
        return [
          WhitelistingTextInputFormatter(
              RegExp("[a-zA-Z]|[\u4e00-\u9fa5]|[0-9]")),
          LengthLimitingTextInputFormatter(widget.maxInputLength),
        ];
    }
  }
}
