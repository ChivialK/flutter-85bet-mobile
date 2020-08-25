import 'package:flutter/material.dart';

import '../state/home_store.dart';

///@author H.C.CHIANG
///@version 2020/6/20
class HomeStoreInheritedWidget extends InheritedWidget {
  final HomeStore store;

  const HomeStoreInheritedWidget({
    Key key,
    @required this.store,
    @required Widget child,
  })  : assert(child != null),
        super(key: key, child: child);

  static HomeStoreInheritedWidget of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<HomeStoreInheritedWidget>();
  }

  @override
  bool updateShouldNotify(HomeStoreInheritedWidget old) =>
      key != old.key || store != old.store;
}
