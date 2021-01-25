import 'package:flutter/material.dart';

import '../state/deposit_store.dart';
import 'deposit_page_storage.dart';

export 'deposit_page_storage.dart' show DepositPageStorageInterface;

///@author H.C.CHIANG
///@version 2020/12/23
class DepositPagesInheritedWidget extends InheritedWidget {
  final DepositStore store;
  final DepositPageStorage storage;

  const DepositPagesInheritedWidget({
    Key key,
    @required this.store,
    @required this.storage,
    @required Widget child,
  })  : assert(child != null),
        super(key: key, child: child);

  static DepositPagesInheritedWidget of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<DepositPagesInheritedWidget>();
  }

  @override
  bool updateShouldNotify(DepositPagesInheritedWidget old) =>
      key != old.key || store != old.store;
}
