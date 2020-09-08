import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/core/internal/themes.dart';
import 'package:url_launcher/url_launcher.dart';

class TestAreaRoute extends StatefulWidget {
  @override
  _TestAreaRouteState createState() => _TestAreaRouteState();
}

class _TestAreaRouteState extends State<TestAreaRoute> with AfterLayoutMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlatButton(
        onPressed: () {
          launch('tel://0926908818');
        },
        child: Text(
          '0926908818',
          style: TextStyle(
            color: Themes.hintHyperLink,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    debugPrint('after first layout');
  }
}
