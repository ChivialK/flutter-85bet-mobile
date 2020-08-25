import 'package:flutter_85bet_mobile/mylogger.dart';
import 'package:mobx/mobx.dart';

part 'web_route_store.g.dart';

class WebRouteStore = _WebRouteStore with _$WebRouteStore;

enum WebRouteStoreState { initial, loading, loaded }

abstract class _WebRouteStore with Store {
  _WebRouteStore();

  @observable
  ObservableFuture<String> _descFuture;

  @observable
  String desc = '';

  @observable
  String errorMessage;

  @computed
  WebRouteStoreState get state {
    if (_descFuture == null || _descFuture.status == FutureStatus.rejected) {
      return WebRouteStoreState.initial;
    }
    return _descFuture.status == FutureStatus.pending
        ? WebRouteStoreState.loading
        : WebRouteStoreState.loaded;
  }

  @action
  Future getDesc() async {
    try {
      errorMessage = null;
//      _descFuture = ObservableFuture(_repository.updateCredit());
//      // ObservableFuture extends Future - it can be awaited and exceptions will propagate as usual.
//      desc = await _descFuture.then((value) => value.trimValue(floorIfInt: true, creditSign: true));
//      debugPrint('web store: $desc');
    } on Exception catch (e) {
      errorMessage = "Couldn't fetch description. Is the device online?";
      MyLogger.error(msg: 'web desc has exception', error: e);
    }
  }
}
