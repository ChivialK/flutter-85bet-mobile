import 'package:flutter/foundation.dart' show compute;
import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/exports_for_route_widget.dart';

import '../../data/entity/marquee_entity.dart';
import 'marquee_widget.dart';

class HomeDisplayMarquee extends StatelessWidget {
  final List<MarqueeEntity> marquees;

  HomeDisplayMarquee({this.marquees});

  @override
  Widget build(BuildContext context) {
    if (marquees == null || marquees.isEmpty) return SizedBox.shrink();
    return Container(
      constraints: BoxConstraints.tight(
        Size(Global.device.width, 34.0),
      ),
      color: Themes.defaultMarqueeBarColor,
      padding: const EdgeInsets.fromLTRB(6.0, 3.0, 6.0, 0.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: FutureBuilder(
              future: compute(_marqueeToString, marquees),
              builder: (context, snapshot) {
//        debugPrint('marquee display state: ${snapshot.connectionState}, '
//            'error: ${snapshot.hasError}');
                if (snapshot.connectionState == ConnectionState.done &&
                    !snapshot.hasError) {
                  return MarqueeWidget(
                    text: snapshot.data,
                    style: TextStyle(
                      fontSize: FontSize.NORMAL.value,
                      color: Themes.defaultMarqueeTextColor,
                    ),
                    loop: true,
                    velocity: 0.8,
                    height: 32.0,
                    padding: EdgeInsets.fromLTRB(4.0, 0.0, 4.0, 4.0),
                  );
                } else {
                  if (snapshot.hasError) {
                    MyLogger.warn(
                        msg: 'snapshot error: ${snapshot.error}',
                        tag: 'MarqueeDisplay');
                  }
                  return Icon(Icons.sync_problem);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

/// Process [MarqueeEntity] content to string
String _marqueeToString(List<dynamic> list) {
  if (list == null || list.isEmpty) return '';
  String separator = '        ';
  List<String> contents = new List();
  list.forEach((item) {
    try {
      contents.add(item.content.replaceAll('\n', '\t'));
//      debugPrint('add marquee content to list: ${item.id}');
    } catch (e) {
      debugPrint(e);
    }
  });
//  debugPrint('computed list: $contents');
  if (list.isNotEmpty && contents.isEmpty) {
    MyLogger.warn(
        msg: 'error marquee type condition!! item: $list',
        tag: 'MarqueeDisplay');
  }
  return '$separator${contents.join(separator)}';
}
