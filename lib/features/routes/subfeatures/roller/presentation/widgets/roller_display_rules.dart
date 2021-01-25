import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class RollerDisplayRules extends StatelessWidget {
  final String rules;
  final Function onButtonTap;

  RollerDisplayRules(this.rules, {this.onButtonTap});

  @override
  Widget build(BuildContext context) {
    // List<String> ruleTexts = rules
    //     .split('</p>')
    //     .map((e) => '$e'
    //         .replaceAll('<p class="MsoNormal" style="text-align: left;">', '')
    //         .replaceAll('<p style="text-align: left;">', '')
    //         .replaceAll('\n', ''))
    //     .toList()
    //       ..removeWhere((element) => element.contains('&nbsp;'));
    // return Column(
    //   mainAxisSize: MainAxisSize.min,
    //   crossAxisAlignment: CrossAxisAlignment.center,
    //   children: List.generate(
    //     ruleTexts.length,
    //     (index) => Row(
    //       mainAxisSize: MainAxisSize.max,
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         Expanded(child: _buildHtmlText(ruleTexts[index])),
    //       ],
    //     ),
    //   ),
    // );
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: HtmlWidget(rules),
    );
  }

  // Widget _buildHtmlText(String text) {
  //   debugPrint(
  //       'parsing html texts: $text, title: ${text.contains('color: #e60000;')}, highlight: ${text.contains('color: #f1c40f;')}');
  //   if (text.contains('color: #e60000;')) {
  //     return Html(
  //       data: """$text""",
  //       style: {
  //         "span": HtmlStyle.Style(
  //           fontSize: HtmlStyle.FontSize.xLarge,
  //           color: themeColor.rollerRuleTitleColor,
  //           alignment: Alignment.center,
  //           textAlign: TextAlign.center,
  //         ),
  //       },
  //     );
  //   } else if (text.contains('color: #f1c40f;')) {
  //     return Html(
  //       data: """$text""",
  //       style: {
  //         "span": HtmlStyle.Style(
  //           fontSize: HtmlStyle.FontSize.large,
  //           color: themeColor.rollerRuleHighlightColor,
  //         ),
  //       },
  //     );
  //   } else {
  //     return Html(
  //       data: """$text""",
  //       style: {
  //         "span": HtmlStyle.Style(
  //           fontSize: HtmlStyle.FontSize.large,
  //           color: themeColor.rollerRuleTextColor,
  //         ),
  //       },
  //     );
  //   }
  // }
//
// Widget _buildButtonGet() {
//   return Padding(
//     padding: const EdgeInsets.symmetric(vertical: 20.0),
//     child: ButtonTheme(
//       minWidth: Global.device.comfortButtonHeight * 0.9,
//       buttonColor: themeColor.rollerDialogTitleBgColor,
//       disabledColor: themeColor.buttonDisabledColorDark,
//       materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//       padding: const EdgeInsets.only(top: 6.0, bottom: 8.0),
//       shape: RoundedRectangleBorder(
//         borderRadius: new BorderRadius.circular(30.0),
//         side: BorderSide(
//           color: themeColor.hintHighlightDarkRed,
//           width: 3.0,
//         ),
//       ),
//       child: RaisedButton(
//         visualDensity: VisualDensity(vertical: -1.0),
//         elevation: 2.0,
//         onPressed: (onButtonTap != null) ? () => onButtonTap() : () => null,
//         child: Text(
//           localeStr.wheelTextTitleGet,
//           style: TextStyle(
//             color: themeColor.hintHighlightDarkRed,
//             fontSize: FontSize.TITLE.value,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//     ),
//   );
// }
}
