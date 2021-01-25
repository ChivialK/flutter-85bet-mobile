import 'package:flutter/widgets.dart';

export 'package:provider/provider.dart';

abstract class TabControlInterface with ChangeNotifier {
  int get getTabIndex;

  set setTabIndex(int index);
}

class TabControl with ChangeNotifier implements TabControlInterface {
  int _tabIndex = 0;

  @override
  int get getTabIndex => _tabIndex;

  @override
  set setTabIndex(int index) {
    _tabIndex = index;
    notifyListeners();
  }
}
