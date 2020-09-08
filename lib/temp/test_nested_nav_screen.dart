import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/temp/test_router.gr.dart';

class TestNestedNavScreen extends StatefulWidget {
  TestNestedNavScreen();

  @override
  _TestNestedNavScreenState createState() => _TestNestedNavScreenState();
}

class _TestNestedNavScreenState extends State<TestNestedNavScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
//        appBar: ScreenMenuBar(),
//        drawer: new ScreenDrawer(),
//        bottomNavigationBar: ScreenNavigationBar(),
        /* Main Content (switch placeholder with Router) */
        body: ExtendedNavigator<TestRouter>(
          initialRoute: TestRoutes.testScreenInnerView,
          router: TestRouter(),
        ),
//          body: Navigator(
//            key: TestRouter.navigator.key,
//            onGenerateRoute: TestRouter.onGenerateRoute,
//            initialRoute: TestRouter.testScreenInnerView,
//          ),
      ),
    );
  }
}
