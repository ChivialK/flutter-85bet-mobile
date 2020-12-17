import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/exports_for_display_widget.dart';
import 'package:flutter_85bet_mobile/utils/regex_util.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebDisplay extends StatefulWidget {
  // final JwtInterface _jwtInterface;
  final String url;
  final bool showUrl;
  final bool hideHtmlBars;

  const WebDisplay(
      {@required this.url,
      @required this.showUrl,
      @required this.hideHtmlBars});

  @override
  _WebDisplayState createState() => _WebDisplayState();
}

class _WebDisplayState extends State<WebDisplay> {
  InAppWebViewController _controller;
  double progress = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (widget.showUrl)
          Container(
            margin: EdgeInsets.all(16.0),
            color: themeColor.defaultAppbarColor,
            child: Text(
              '${widget.url}',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: FontSize.SMALLER.value),
            ),
          ),
        if (progress < 1.0)
          Container(
              height: 8.0,
              child: progress < 1.0
                  ? LinearProgressIndicator(value: progress)
                  : SizedBox.shrink()),
        Expanded(
          child: InAppWebView(
            initialUrl: widget.url,
            // initialUrl: (widget.startUrl == Global.currentService)
            //     ? widget.startUrl + '?token=${_jwtInterface?.token ?? ''}'
            //     : widget.startUrl,
            // initialHeaders: {},
            initialOptions: InAppWebViewGroupOptions(
              crossPlatform: InAppWebViewOptions(supportZoom: false),
              android: AndroidInAppWebViewOptions(useWideViewPort: true),
            ),
            onWebViewCreated: (InAppWebViewController controller) async {
              _controller = controller;
              _controller.addJavaScriptHandler(
                  handlerName: 'Toaster',
                  callback: (args) {
                    // Here you receive all the arguments from the JavaScript side
                    // that is a List<dynamic>
                    debugPrint('JS handler: $args');
                    // Scaffold.of(context).showSnackBar(
                    //   SnackBar(
                    //       content: Text(
                    //           'message: ${args.reduce((curr, next) => curr + next)}')),
                    // );
                  });
            },
            onLoadStart: (InAppWebViewController controller, String url) {
              debugPrint('webview start loading: $url');
            },
            onLoadStop: (InAppWebViewController controller, String url) async {
              debugPrint('web page loaded: $url');
              if (widget.hideHtmlBars) {
                debugPrint('hiding web page bars');
                _controller.evaluateJavascript(
                    source:
                        "document.getElementsByClassName('el-header')[0].remove();");
                _controller.evaluateJavascript(
                    source:
                        "document.getElementsByClassName('el-footer')[0].remove();");
                _controller.evaluateJavascript(
                    source:
                        "document.getElementsByClassName('footer_bg')[0].remove();");
                _controller.evaluateJavascript(
                    source:
                        "document.getElementsByClassName('header_bg')[0].remove();");
                _controller.evaluateJavascript(
                    source:
                        "document.getElementsByClassName('aside_bars')[0].remove();");
                _controller.evaluateJavascript(
                    source:
                        "document.getElementsByClassName('page_title')[0].remove();");
                _controller.evaluateJavascript(
                    source:
                        "document.getElementsByClassName('content')[0].style.paddingTop = '0';");
              }
            },
            onLoadError: (InAppWebViewController controller, String url,
                int code, String message) async {
              String pageTitle = await _controller.getTitle();
              debugPrint(
                  'web page title: $pageTitle, code: $code, message: $message');
              // Error 500 Title: 500 Internal Server Error
              if (pageTitle.contains('Error') ||
                  pageTitle.contains('Exception')) {
                _controller.loadUrl(
                  url: Uri.dataFromString(
                    '<p>${localeStr.messageErrorLoadingPay}. <br>Code: $code. Message: $message. <br>URL: $url</p>',
                    mimeType: Global.WEB_MIMETYPE,
                    encoding: Global.webEncoding,
                  ).toString(),
                );
              } else if (url.isUrl == false) {
                _controller.loadUrl(
                  url: Uri.dataFromString(
                    '<p>URL is not valid. <br>Code: $code. Message: $message. <br>URL: $url</p>',
                    mimeType: Global.WEB_MIMETYPE,
                    encoding: Global.webEncoding,
                  ).toString(),
                );
              }
            },
            onProgressChanged:
                (InAppWebViewController controller, int progress) {
              setState(() {
                this.progress = progress / 100;
              });
            },
            onConsoleMessage: (InAppWebViewController controller,
                ConsoleMessage consoleMessage) {
              if (consoleMessage.messageLevel.toValue() >= 4) {
                debugPrint("console debug: ${consoleMessage.message}");
              } else if (consoleMessage.messageLevel.toValue() > 2) {
                MyLogger.warn(
                    msg: 'console: ${consoleMessage.message}, '
                        'level: ${consoleMessage.messageLevel}',
                    tag: 'WebGameScreen');
              }
            },
          ),
        ),
      ],
    );
  }
}
