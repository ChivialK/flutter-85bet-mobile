import 'package:flutter/material.dart';

import '../state/center_store.dart';

///@author H.C.CHIANG
///@version 2020/5/4
class CenterStoreInheritedWidget extends InheritedWidget {
  final CenterStore store;

  const CenterStoreInheritedWidget({
    Key key,
    @required this.store,
    @required Widget child,
  })  : assert(child != null),
        super(key: key, child: child);

  static CenterStoreInheritedWidget of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<CenterStoreInheritedWidget>();
  }

  @override
  bool updateShouldNotify(CenterStoreInheritedWidget old) =>
      key != old.key || store != old.store;
}
