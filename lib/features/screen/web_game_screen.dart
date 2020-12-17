import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/core/internal/orientation_helper.dart';
import 'package:flutter_85bet_mobile/features/export_internal_file.dart';
import 'package:flutter_85bet_mobile/features/router/app_navigate.dart';
import 'package:flutter_85bet_mobile/injection_container.dart';
import 'package:flutter_85bet_mobile/utils/regex_util.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'web_game_screen_float_button.dart';
import 'web_game_screen_store.dart';

class WebGameScreen extends StatefulWidget {
  final String startUrl;

  WebGameScreen({this.startUrl = Global.CURRENT_BASE});

  @override
  _WebGameScreenState createState() => _WebGameScreenState();
}

class _WebGameScreenState extends State<WebGameScreen> with AfterLayoutMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey =
      new GlobalKey<ScaffoldState>(debugLabel: 'webgame');
  final GlobalKey<WebGameScreenFloatButtonState> _toolKey =
      new GlobalKey<WebGameScreenFloatButtonState>(debugLabel: 'webtool');
  final GlobalKey _webviewKey = new GlobalKey(debugLabel: 'webview');

  WebGameScreenStore _store;
  Future<void> _floatFuture;

  String parsedHtml;
  bool isForm = false;
  bool showToolHint = true;
  bool showVisibleHint = true;

  void _returnHome() {
    ScreenNavigate.switchScreen(
      force: true,
      screen: ScreenEnum.Feature,
    );
    _store.stopSensor();
  }

  ///
  /// Used in BB games
  ///
  void _rewriteHtml(String htmlStr) {
    String formStr =
        htmlStr.substring(htmlStr.indexOf('<form'), htmlStr.indexOf('</form>'));
    formStr = formStr.substring(0, formStr.indexOf('>'));
    String formName = formStr
        .substring(formStr.indexOf('name='), formStr.indexOf(' method='))
        .replaceAll('\'', '');
    debugPrint('form button id: $formName');

    parsedHtml = htmlStr.replaceAll(
        '</head>',
        '<script type="text/javascript">' +
            'function submitForm() { document.$formName.submit(); }' +
            'setTimeout(submitForm, 300);' +
            '</script>' +
            '</head>');
    debugPrint('rewrite html form complete');
    debugPrint(parsedHtml);
  }

  @override
  void initState() {
    debugPrint('web url: ${widget.startUrl}');
    _store ??= sl.get<WebGameScreenStore>();

    isForm =
        widget.startUrl.contains('</form>') && widget.startUrl.isHtmlFormat;
    debugPrint('web url is form: $isForm');
    if (isForm) _rewriteHtml(widget.startUrl);

    _floatFuture =
        Future.delayed(Duration(seconds: (showToolHint) ? 5 : 2), () => true);

    super.initState();
  }

  @override
  void dispose() {
    MyLogger.debug(msg: 'dispose web game screen', tag: 'WebGameScreen');
    try {
      _store.stopSensor();
      OrientationHelper.restoreUI();
    } catch (e) {}
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        MyLogger.debug(msg: 'pop web game screen', tag: 'WebGameScreen');
        return Future(() => true);
      },
      child: Scaffold(
        key: _scaffoldKey,
//          drawer: WebGameScreenDrawer(
//            scaffoldKey: _scaffoldKey,
//            store: _store,
//          ),
        floatingActionButton: FutureBuilder(
          future: _floatFuture,
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (showToolHint) {
                showToolHint = false;
                Future.delayed(Duration(milliseconds: 1500), () {
                  callToast(localeStr.gameToolHintUsage);
                });
              }
              return GestureDetector(
                onLongPress: () {
                  if (showVisibleHint) {
                    showVisibleHint = false;
                    Future.delayed(Duration(milliseconds: 300), () {
                      callToast(localeStr.gameToolHintRestore);
                    });
                  }
                  _toolKey.currentState?.hideTool();
                },
                child: WebGameScreenFloatButton(
                  key: _toolKey,
                  scaffoldKey: _scaffoldKey,
                  store: _store,
                  onReturnHome: () => _returnHome(),
                ),
              );
            } else {
              return SizedBox.shrink();
            }
          },
        ),
        body: GestureDetector(
//            onDoubleTap: () => _scaffoldKey.currentState.openDrawer(),
          onDoubleTap: () => _toolKey.currentState?.showTool(),
          child: InAppWebView(
            key: _webviewKey,
            initialUrl: (isForm)
                ? Uri.dataFromString(
                    parsedHtml,
                    mimeType: Global.WEB_MIMETYPE,
                    encoding: Global.webEncoding,
                  ).toString()
                : widget.startUrl,
            // initialHeaders: {},
            initialOptions: InAppWebViewGroupOptions(
              crossPlatform: InAppWebViewOptions(supportZoom: false),
              android: AndroidInAppWebViewOptions(useWideViewPort: true),
            ),
            onWebViewCreated: (InAppWebViewController controller) async {
              controller.addJavaScriptHandler(
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
            },
            onLoadError: (InAppWebViewController controller, String url,
                int code, String message) async {
              String pageTitle = await controller.getTitle();
              debugPrint(
                  'web page title: $pageTitle, code: $code, message: $message');
              // Error 500 Title: 500 Internal Server Error
              if (pageTitle.contains('Error') ||
                  pageTitle.contains('Exception')) {
                controller.loadUrl(
                  url: Uri.dataFromString(
                    '<p>${localeStr.messageErrorLoadingPay}. <br>Code: $code. Message: $message. <br>URL: $url</p>',
                    mimeType: Global.WEB_MIMETYPE,
                    encoding: Global.webEncoding,
                  ).toString(),
                );
              } else if (url.isUrl == false) {
                controller.loadUrl(
                  url: Uri.dataFromString(
                    '<p>URL is not valid. <br>Code: $code. Message: $message. <br>URL: $url</p>',
                    mimeType: Global.WEB_MIMETYPE,
                    encoding: Global.webEncoding,
                  ).toString(),
                );
              }
            },
            // onProgressChanged: (InAppWebViewController controller, int progress) {
            //   setState(() {
            //     this.progress = progress / 100;
            //   });
            // },
            onEnterFullscreen: (InAppWebViewController controller) {
              debugPrint("webview is fullscreen");
            },
            onExitFullscreen: (InAppWebViewController controller) {
              debugPrint("webview exit fullscreen");
            },
            onConsoleMessage: (InAppWebViewController controller,
                ConsoleMessage consoleMessage) {
              if (consoleMessage.messageLevel.toValue() >= 4) {
                debugPrint("webview console debug: ${consoleMessage.message}");
              } else if (consoleMessage.messageLevel.toValue() > 2) {
                MyLogger.warn(
                    msg: 'webview console: ${consoleMessage.message}, '
                        'level: ${consoleMessage.messageLevel}',
                    tag: 'WebGameScreen');
              }
            },
          ),
        ),
      ),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    try {
      _store.initSensorStream();
    } catch (e, s) {
      callToastError('Cannot Enable Sensor');
      debugPrint('init sensor error: $e\n$s');
    }
  }
}
