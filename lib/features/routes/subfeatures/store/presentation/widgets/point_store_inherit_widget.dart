import 'package:flutter/material.dart';

import '../state/point_store.dart';

///
///@author H.C.CHIANG
///@version 2020/6/5
///
class PointStoreInheritedWidget extends InheritedWidget {
  final PointStore store;
  final Widget pointWidget;

  const PointStoreInheritedWidget({
    Key key,
    @required this.store,
    @required Widget child,
    @required this.pointWidget,
  })  : assert(child != null),
        super(key: key, child: child);

  static PointStoreInheritedWidget of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<PointStoreInheritedWidget>();
  }

  @override
  bool updateShouldNotify(PointStoreInheritedWidget old) =>
      key != old.key || store != old.store || pointWidget != old.pointWidget;
}
