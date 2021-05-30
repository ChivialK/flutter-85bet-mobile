import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/export_internal_file.dart';

import '../state/point_store.dart';

class PointWidget extends StatefulWidget {
  final PointStore store;

  PointWidget(this.store, {Key key}) : super(key: key);

  @override
  _PointWidgetState createState() => _PointWidgetState();
}

class _PointWidgetState extends State<PointWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Text(
          localeStr.storeTextTitlePoint,
          style: TextStyle(
              color: themeColor.defaultHintColor,
              fontSize: FontSize.MESSAGE.value,
              fontWeight: FontWeight.bold),
        ),
        StreamBuilder<num>(
          stream: widget.store.pointStream,
          initialData: widget.store.memberPoints,
          builder: (_, snapshot) {
            debugPrint('store point stream: ${snapshot?.data}');
            if (snapshot == null || snapshot.data == null)
              return SizedBox.shrink();
            return Padding(
              padding: const EdgeInsets.only(left: 3.0, top: 2.0),
              child: Text(
                '${snapshot.data}',
                style: TextStyle(
                    color: themeColor.storeHighlightTextColor,
                    fontSize: FontSize.MESSAGE.value,
                    fontWeight: FontWeight.bold),
              ),
            );
          },
        ),
      ],
    );
  }
}
