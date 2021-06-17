import 'package:flutter_85bet_mobile/core/mobx_store_export.dart';

import '../../data/models/vip_level_model.dart';
import '../../data/repository/vip_repository.dart';

part 'vip_level_store.g.dart';

class VipLevelStore = _VipLevelStore with _$VipLevelStore;

enum VipLevelStoreState { initial, loading, loaded }

abstract class _VipLevelStore with Store {
  final VipLevelRepository _repository;

  _VipLevelStore(this._repository);

  @observable
  ObservableFuture<List> _initFuture;

  VipLevelModel levelModel;
  String ruleData;

  @observable
  String errorMessage;

  void setErrorMsg({
    String msg,
    bool showOnce = false,
    FailureType type,
    int code,
  }) =>
      errorMessage = getErrorMsg(
          from: FailureType.VIP_LEVEL,
          msg: msg,
          showOnce: showOnce,
          type: type,
          code: code);

  @computed
  VipLevelStoreState get state {
    // If the user has not yet triggered a action or there has been an error
    if (_initFuture == null || _initFuture.status == FutureStatus.rejected) {
      return VipLevelStoreState.initial;
    }
    // Pending Future means "loading"
    // Fulfilled Future means "loaded"
    return _initFuture.status == FutureStatus.pending
        ? VipLevelStoreState.loading
        : VipLevelStoreState.loaded;
  }

  @action
  Future<void> initialize() async {
    try {
      // Reset the possible previous error message.
      errorMessage = null;
      // Fetch from the repository and wrap the regular Future into an observable.
      _initFuture = ObservableFuture(Future.wait([
        if (levelModel == null) Future.value(getLevel()),
        if (ruleData == null || ruleData.isEmpty) Future.value(getRules()),
      ]));
      // ObservableFuture extends Future - it can be awaited and exceptions will propagate as usual.
      await _initFuture;
    } on Exception {
      setErrorMsg(code: 1);
    }
  }

  @action
  Future<void> getLevel() async {
    try {
      // Reset the possible previous error message.
      errorMessage = null;
      // Fetch from the repository and wrap the regular Future into an observable.
      // ObservableFuture extends Future - it can be awaited and exceptions will propagate as usual.
      await _repository.getLevel().then((result) {
//        debugPrint('vip level result: $result');
        result.fold(
          (failure) => setErrorMsg(msg: failure.message, showOnce: true),
          (model) => levelModel = model,
        );
      });
    } on Exception {
      //errorMessage = "Couldn't fetch description. Is the device online?";
      setErrorMsg(code: 2);
    }
  }

  @action
  Future<void> getRules() async {
    try {
      // Reset the possible previous error message.
      errorMessage = null;
      // ObservableFuture extends Future - it can be awaited and exceptions will propagate as usual.
      await _repository.getRules().then((result) {
//        debugPrint('vip level result: $result');
        result.fold(
          (failure) => setErrorMsg(msg: failure.message, showOnce: true),
          (model) => (model.isSuccess) ? ruleData = model.data : ruleData = "",
        );
      });
    } on Exception {
      //errorMessage = "Couldn't fetch description. Is the device online?";
      setErrorMsg(code: 3);
    }
  }

  void clearData() {
    _initFuture = null;
    levelModel = null;
    ruleData = "";
  }
}
