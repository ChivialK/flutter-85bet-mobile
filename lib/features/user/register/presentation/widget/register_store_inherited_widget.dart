import 'package:flutter/material.dart';

import '../state/register_store.dart';

///@author H.C.CHIANG
///@version 2020/5/4
class RegisterStoreInheritedWidget extends InheritedWidget {
  final RegisterStore store;

  const RegisterStoreInheritedWidget({
    Key key,
    @required this.store,
    @required Widget child,
  })  : assert(child != null),
        super(key: key, child: child);

  static RegisterStoreInheritedWidget of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<RegisterStoreInheritedWidget>();
  }

  @override
  bool updateShouldNotify(RegisterStoreInheritedWidget old) =>
      key != old.key || store != old.store;
}
