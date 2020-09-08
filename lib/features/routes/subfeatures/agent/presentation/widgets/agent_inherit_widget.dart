import 'package:flutter/material.dart';

import '../state/agent_store.dart';

///@author H.C.CHIANG
///@version 2020/5/21
class AgentStoreInheritedWidget extends InheritedWidget {
  final AgentStore store;

  const AgentStoreInheritedWidget({
    Key key,
    @required this.store,
    @required Widget child,
  })  : assert(child != null),
        super(key: key, child: child);

  static AgentStoreInheritedWidget of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<AgentStoreInheritedWidget>();
  }

  @override
  bool updateShouldNotify(AgentStoreInheritedWidget old) =>
      key != old.key || store != old.store;
}
