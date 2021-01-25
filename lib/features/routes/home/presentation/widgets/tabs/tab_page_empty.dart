import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/export_internal_file.dart';

class TabPageEmpty extends StatelessWidget {
  final Function onTap;

  TabPageEmpty({this.onTap});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(children: [
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: IconButton(
                icon: Icon(
                  Icons.refresh,
                  size: 48,
                  color: themeColor.homeTabSelectedTextColor,
                ),
                onPressed: onTap,
              ),
            ),
          ),
          TextSpan(
            text: '\n${localeStr.messageWarnNoHistoryData}',
            style: TextStyle(
              fontSize: FontSize.MESSAGE.value,
              color: themeColor.defaultTextColor,
            ),
          )
        ]),
      ),
    );
  }
}
