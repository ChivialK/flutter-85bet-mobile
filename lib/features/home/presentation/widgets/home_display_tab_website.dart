import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/exports_for_route_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeDisplayTabWebsite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FlatButton(
          onPressed: () {
            // open web site
            launch(Global.CURRENT_SERVICE);
          },
          child: RichText(
            maxLines: 3,
            textAlign: TextAlign.center,
            text: TextSpan(
              text: localeStr.gameCategoryWebHint,
              style: TextStyle(
                color: Themes.hintHyperLink,
                fontSize: FontSize.MESSAGE.value,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
