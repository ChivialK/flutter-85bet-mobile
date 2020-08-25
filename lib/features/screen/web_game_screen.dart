import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/core/internal/global.dart';
import 'package:flutter_85bet_mobile/core/internal/orientation_helper.dart';
import 'package:flutter_85bet_mobile/features/export_internal_file.dart';
import 'package:flutter_85bet_mobile/features/router/app_navigate.dart';
import 'package:flutter_85bet_mobile/features/screen/web_game_screen_store.dart';
import 'package:flutter_85bet_mobile/injection_container.dart';
import 'package:flutter_85bet_mobile/mylogger.dart';
import 'package:flutter_85bet_mobile/utils/regex_util.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'web_game_screen_float_button.dart';

class WebGameScreen extends StatefulWidget {
  final String startUrl;

  WebGameScreen({this.startUrl = 'https://www.eg990.com/'});

  @override
  _WebGameScreenState createState() => _WebGameScreenState();
}

class _WebGameScreenState extends State<WebGameScreen> with AfterLayoutMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey =
      new GlobalKey<ScaffoldState>(debugLabel: 'webgame');
  final GlobalKey<WebGameScreenFloatButtonState> _toolKey =
      new GlobalKey<WebGameScreenFloatButtonState>(debugLabel: 'webtool');

  WebViewController _controller;
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
    // edit the source code in FlutterWebView
    // (under external lib -> webview_flutter -> android
    // -> src.main -> java.io.flutter.plugins.webviewflutter)
//    @Override
//    public void dispose() {
//    if(webView != null){
//    webView.clearCache(true);
//    webView.removeAllViews();
//    }
//    methodChannel.setMethodCallHandler(null);
//    webView.dispose();
//    webView.destroy();
//    }
//    /// Load empty page and clear cache
//    await _store.stopSensor();
//    _controller.loadUrl(Uri.dataFromString(
//      '',
//      mimeType: Global.WEB_MIMETYPE,
//      encoding: Global.webEncoding,
//    ).toString());
//    await _controller.clearCache();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
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
                  callToast('单击显示，长按隐藏 ↗');
                });
              }
              return GestureDetector(
                onLongPress: () {
                  if (showVisibleHint) {
                    showVisibleHint = false;
                    Future.delayed(Duration(milliseconds: 300), () {
                      callToast('双击可恢复显示');
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
          child: WebView(
            initialUrl: widget.startUrl,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController controller) async {
              _controller = controller;
              if (isForm) {
                _controller.loadUrl(Uri.dataFromString(
                  parsedHtml,
                  mimeType: Global.WEB_MIMETYPE,
                  encoding: Global.webEncoding,
                ).toString());
              } else if (widget.startUrl.isUrl == false) {
                _controller.loadUrl(Uri.dataFromString(
                  widget.startUrl,
                  mimeType: Global.WEB_MIMETYPE,
                  encoding: Global.webEncoding,
                ).toString());
              }
            },
            onPageFinished: (String url) async {
              debugPrint('web page loaded: $url');
              if (url.isUrl == false) return;
              if (isForm) isForm = false;

              String pageTitle = await _controller.getTitle();
              debugPrint('web page title: $pageTitle');
              //TODO check the normal page title or 404
              // Error 500 Title: 500 Internal Server Error
              if (pageTitle.contains('Error') ||
                  pageTitle.contains('Exception')) {
                if (pageTitle.startsWith('500')) {
                  _controller.loadUrl(Uri.dataFromString(
                    pageTitle,
                    mimeType: Global.WEB_MIMETYPE,
                    encoding: Global.webEncoding,
                  ).toString());
                }
              }
            },
          ),
        ),
      ),
      onWillPop: () async {
        MyLogger.debug(msg: 'pop web game screen', tag: 'WebGameScreen');
        return Future(() => true);
      },
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
