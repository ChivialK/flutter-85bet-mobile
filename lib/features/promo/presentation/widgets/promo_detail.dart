import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/exports_for_display_widget.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/dialog_widget.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../data/models/promo_freezed.dart';

///
/// Show promo detail with [Html]
/// [promo] = detail view data
/// @version 2020/6/9
///
class PromoDetail extends StatefulWidget {
  final PromoEntity promo;

  PromoDetail(this.promo);

  @override
  _PromoDetailState createState() => _PromoDetailState();
}

class _PromoDetailState extends State<PromoDetail> {
  final GlobalKey<DialogWidgetState> _dialogKey =
      new GlobalKey(debugLabel: 'dialog');

  final double dialogWidth = Global.device.width - 24;
  final double dialogHeight = Global.device.height - 32;

  final String htmlBgColor = Themes.dialogBgColor.toHexNoAlpha();
  final String htmlTextColor = Themes.dialogTextColor.toHexNoAlpha();
  final String htmlTitleColor = Themes.dialogTitleColor.toHexNoAlpha();
  final String htmlBorderColor = Themes.defaultDisabledColor.toHexNoAlpha();

  WebViewController _controller;
  double _viewHeight = 1;
  double _viewMinHeight = 0;
  bool _pageLoaded = false;
  int _stackIndex = 0;

  @override
  Widget build(BuildContext context) {
    String html = _buildHtmlText();
    return DialogWidget(
      key: _dialogKey,
      heightFactor: (_stackIndex == 1) ? 0.85 : 0.25,
      children: [
        if (_stackIndex == 0)
          Container(
            alignment: Alignment.center,
            child: SizedBox(
              width: 30.0,
              height: 30.0,
              child: CircularProgressIndicator(
                strokeWidth: 3.0,
              ),
            ),
          ),
        if (html.isNotEmpty)
          Container(
            margin: const EdgeInsets.fromLTRB(8.0, 24.0, 30.0, 4.0),
            constraints: BoxConstraints(
              maxWidth: Global.device.width - 64,
              minHeight: _viewMinHeight,
              maxHeight: _viewHeight,
            ),
            alignment: Alignment.center,
            /* Use Stack to hide web view on create */
            child: IndexedStack(
              index: _stackIndex,
              children: [
                SizedBox.shrink(),
                WebView(
                  javascriptMode: JavascriptMode.unrestricted,
                  onWebViewCreated: (WebViewController controller) async {
                    _controller = controller;
                    _controller.loadUrl(Uri.dataFromString(
                      html,
                      mimeType: Global.WEB_MIMETYPE,
                      encoding: Global.webEncoding,
                    ).toString());
                  },
                  onPageFinished: (_) async {
                    if (!_pageLoaded) {
                      // set container height when web page was loaded
                      double height = double.parse(
                          await _controller.evaluateJavascript(
                              "document.documentElement.scrollHeight;"));
                      _viewMinHeight = dialogHeight / 3;
                      _viewHeight = (height > dialogHeight)
                          ? dialogHeight
                          : (height < _viewMinHeight) ? _viewMinHeight : height;
                      debugPrint('view height: $_viewHeight');
                      Future.delayed(
                        Duration(milliseconds: 150),
                        () => setState(() {
                          _stackIndex = 1;
                          _dialogKey.currentState.updateHeightFactor(0.85);
                        }),
                      );
                      // set to true when ready to change ui widget
                      _pageLoaded = true;
                    }
                  },
                ),
              ],
            ),
          ),
        if (html.isEmpty)
          WarningDisplay(
            message: Failure.internal(FailureCode(
              type: FailureType.PROMO,
              code: 1,
            )).message,
          ),
      ],
    );
  }

  String _buildHtmlText() {
    var detail = [
      _htmlPromoPlatform(),
      _htmlPromoContent(),
      _htmlPromoApply(),
      _htmlPromoRules(),
    ].join('<br>');
    debugPrint('promo detail:\n$detail');

    return '<html>'
        '<head><meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"></head>'
        '<body bgcolor="$htmlBgColor" text="$htmlTextColor" style="line-height:1.2;">'
        '$detail'
        '</html>';
  }

  String _htmlPromoPlatform() {
    StringBuffer buffer = StringBuffer();
    buffer.write('<h3><font color=\"$htmlTitleColor\">');
    buffer.write(localeStr.promoDetailPlatform);
    buffer.write('</font></h3>');
    buffer.write('<p>');
    buffer.write(widget.promo.textContent);
    buffer.write('</p>');
    return buffer.toString();
  }

  String _htmlPromoContent() {
    StringBuffer buffer = StringBuffer();
    buffer.write('<h3><font color=\"$htmlTitleColor\">');
    buffer.write(localeStr.promoDetailContent);
    buffer.write('</font></h3>');
    buffer.write(widget.promo.placeContent);
//    var bufferStr = buffer.toString();
//    if (bufferStr.endsWith('<p>&nbsp;</p>')) {
//      int pos = bufferStr.lastIndexOf('<p>&nbsp;</p>');
//      return Future.value(bufferStr.substring(0, pos));
//    }
    return buffer.toString().replaceAll('<p>&nbsp;</p>', '');
  }

  String _htmlPromoApply() {
    StringBuffer buffer = StringBuffer();
    buffer.write('<h3><font color=\"$htmlTitleColor\">');
    buffer.write(localeStr.promoDetailApply);
    buffer.write('</font></h3>');
    buffer.write('<p>');
    buffer.write(widget.promo.applyContent);
    buffer.write('</p>');
    return buffer.toString();
  }

  String _htmlPromoRules() {
    StringBuffer buffer = StringBuffer();
    buffer.write("<h3><font color=\"$htmlTitleColor\">");
    buffer.write(localeStr.promoDetailRules);
    buffer.write("</font></h3>");
    buffer.write("<p>");
    buffer.write(widget.promo.ruleContent);
    buffer.write("</p>");
    return buffer.toString();
  }
}
