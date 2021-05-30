import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/export_internal_file.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class RollerDisplayRules extends StatelessWidget {
  final double buttonWidgetWidth = Global.device.width - 16;
  final double buttonWidgetHeight = Global.device.comfortButtonHeight * 1.35;
  final Color secondBlockColor = HexColor.fromHex('#e7c080');
  final Color titleColor = HexColor.fromHex('#f06666');
  final Color contentColor = HexColor.fromHex('#cce0f5');
  final String rules;
  final Function onButtonTap;

  RollerDisplayRules(this.rules, {this.onButtonTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: HtmlWidget(rules)),
            ],
          ),
        ),
//        /// Debug Widget
//        Padding(
//          padding: const EdgeInsets.only(top: 12.0),
//          child: Row(
//            mainAxisSize: MainAxisSize.max,
//            mainAxisAlignment: MainAxisAlignment.center,
//            children: [
//              Expanded(
//                child: Text(rules),
//              )
//            ],
//          ),
//        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: ButtonTheme(
            minWidth: buttonWidgetWidth / 3,
            height: buttonWidgetHeight * 0.85,
            buttonColor: Colors.transparent,
            disabledColor: themeColor.buttonDisabledColorDark,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            padding: const EdgeInsets.only(top: 6.0, bottom: 8.0),
            shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0),
              side: BorderSide(
                color: themeColor.hintHighlightDarkRed,
                width: 3.0,
              ),
            ),
            child: RaisedButton(
              elevation: 2.0,
              onPressed:
                  (onButtonTap != null) ? () => onButtonTap() : () => null,
              child: Text(
                localeStr.wheelTextTitleGet,
                style: TextStyle(
                  color: themeColor.hintHighlightDarkRed,
                  fontSize: FontSize.TITLE.value,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
