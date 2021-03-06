import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/event/event_inject.dart';

import 'feature_screen_store.dart';

///@author H.C.CHIANG
///@version 2020/2/26
class FeatureScreenInheritedWidget extends InheritedWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final FeatureScreenStore store;
  final EventStore eventStore;

  const FeatureScreenInheritedWidget({
    Key key,
    @required this.scaffoldKey,
    @required this.store,
    @required this.eventStore,
    @required Widget child,
  })  : assert(child != null),
        super(key: key, child: child);

  static FeatureScreenInheritedWidget of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<FeatureScreenInheritedWidget>();
  }

  @override
  bool updateShouldNotify(FeatureScreenInheritedWidget old) =>
      scaffoldKey != old.scaffoldKey ||
      store != old.store ||
      eventStore != old.eventStore;
}
