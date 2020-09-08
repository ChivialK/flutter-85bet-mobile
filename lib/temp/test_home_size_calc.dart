import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/core/internal/device.dart';
import 'package:flutter_85bet_mobile/features/exports_for_route_widget.dart';
import 'package:flutter_85bet_mobile/features/routes/home/presentation/widgets/home_display_size_calc.dart';

class TestHomeSizeCalc extends StatefulWidget {
  @override
  _TestHomeSizeCalcState createState() => _TestHomeSizeCalcState();
}

class _TestHomeSizeCalcState extends State<TestHomeSizeCalc>
    with AfterLayoutMixin {
//  final GlobalKey<ScaffoldState> _scaffoldKey =
//      new GlobalKey<ScaffoldState>(debugLabel: 'testcalc');
//  final GlobalKey<WebGameScreenFloatButtonState> _toolKey =
//      new GlobalKey<WebGameScreenFloatButtonState>(debugLabel: 'floattool');

  Device device;
  HomeDisplaySizeCalc calc;
//  WebGameScreenStore _store;
//
//  Future<void> _floatFuture;
//  bool showToolHint = true;
//  bool showVisibleHint = true;

//  void _returnHome() {
//    ScreenNavigate.switchScreen(
//      force: true,
//      screen: ScreenEnum.Feature,
//    );
//    _store.stopSensor();
//  }

  @override
  void initState() {
    device = Global.device;
    calc = HomeDisplaySizeCalc();
//    _store ??= sl.get<WebGameScreenStore>();
    super.initState();
//    _floatFuture =
//        Future.delayed(Duration(seconds: (showToolHint) ? 5 : 2), () => true);
  }

  @override
  void dispose() {
//    try {
//      _store.stopSensor();
//      OrientationHelper.restoreUI();
//    } catch (e) {}
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      floatingActionButton: FutureBuilder(
//        future: _floatFuture,
//        builder: (_, snapshot) {
//          if (snapshot.connectionState == ConnectionState.done) {
//            if (showToolHint) {
//              showToolHint = false;
//              Future.delayed(Duration(milliseconds: 1500), () {
//                callToast('单击显示，长按隐藏 ↗');
//              });
//            }
//            return GestureDetector(
//              onLongPress: () {
//                if (showVisibleHint) {
//                  showVisibleHint = false;
//                  Future.delayed(Duration(milliseconds: 300), () {
//                    callToast('双击可恢复显示');
//                  });
//                }
//                _toolKey.currentState?.hideTool();
//              },
//              child: WebGameScreenFloatButton(
//                key: _toolKey,
//                scaffoldKey: _scaffoldKey,
//                store: _store,
//                onReturnHome: () => _returnHome(),
//              ),
//            );
//          } else {
//            return SizedBox.shrink();
//          }
//        },
//      ),
      body: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                  height: Global.APP_BAR_HEIGHT,
                  color: Colors.black26,
                  alignment: Alignment.topCenter,
                  child: Text('app bar height: ${Global.APP_BAR_HEIGHT}'),
                ),
              ),
            ],
          ),
          Container(
            height: Global.device.featureContentHeight,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue, width: 3.0),
            ),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      height: calc.bannerHeight,
                      color: Colors.blue.withOpacity(0.3),
                      alignment: Alignment.bottomRight,
                      child: Text('calc banner: ${calc.bannerHeight}'),
                    ),
                    Container(
                      height: calc.shortcutMaxHeight,
                      color: Colors.orange.withOpacity(0.3),
                      alignment: Alignment.bottomRight,
                      child: Text('calc shortcut: ${calc.shortcutMaxHeight}'),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      height: calc.pageMaxHeight - 16,
                      color: Colors.green.withOpacity(0.3),
                      alignment: Alignment.bottomRight,
                      child: Stack(
                        children: [
                          Text('calc page:${calc.pageMaxHeight} + top: 10.0'),
                          Container(
                            alignment: Alignment.bottomRight,
                            padding: EdgeInsets.only(right: 8.0, bottom: 8.0),
                            child: FloatingActionButton(
                              backgroundColor: Colors.black54,
                              mini: true,
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              child: FittedBox(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 4.0),
                                      child: Icon(Icons.arrow_back),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          4.0, 0.0, 4.0, 4.0),
                                      child: Text(localeStr.btnBack),
                                    ),
                                  ],
                                ),
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: calc.bannerHeight + calc.shortcutMaxHeight + 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text('padding \n: ${device.query.padding}\n\n'),
                      Text('view padding \n: ${device.query.viewPadding}\n\n'),
                      Text('view inset \n: ${device.query.viewInsets}\n\n\n'),
                      Text('other data\n:${MediaQuery.of(context)}'),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                      'feature height: ${Global.device.featureContentHeight}\n'),
                ),
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                  height: Global.APP_TOOLS_HEIGHT - Global.APP_BAR_HEIGHT,
                  color: Colors.black26,
                  alignment: Alignment.topCenter,
                  child: Text(
                      'nav bar height: ${Global.APP_TOOLS_HEIGHT - Global.APP_BAR_HEIGHT}'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {}
}
