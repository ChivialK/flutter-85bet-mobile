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
  ObservableFuture<Either<Failure, VipLevelModel>> _levelFuture;

  VipLevelModel levelModel;

  @observable
  String errorMessage;

  void setErrorMsg(
          {String msg, bool showOnce = false, FailureType type, int code}) =>
      errorMessage = getErrorMsg(
          from: FailureType.VIP_LEVEL,
          msg: msg,
          showOnce: showOnce,
          type: type,
          code: code);

  @computed
  VipLevelStoreState get state {
    // If the user has not yet triggered a action or there has been an error
    if (_levelFuture == null || _levelFuture.status == FutureStatus.rejected) {
      return VipLevelStoreState.initial;
    }
    // Pending Future means "loading"
    // Fulfilled Future means "loaded"
    return _levelFuture.status == FutureStatus.pending
        ? VipLevelStoreState.loading
        : VipLevelStoreState.loaded;
  }

  @action
  Future<void> getLevel() async {
    try {
      // Reset the possible previous error message.
      errorMessage = null;
      // Fetch from the repository and wrap the regular Future into an observable.
      _levelFuture = ObservableFuture(_repository.getLevel());
      // ObservableFuture extends Future - it can be awaited and exceptions will propagate as usual.
      await _levelFuture.then((result) {
//        debugPrint('vip level result: $result');
        result.fold(
          (failure) => setErrorMsg(msg: failure.message, showOnce: true),
          (model) => levelModel = model,
        );
      });
    } on Exception {
      //errorMessage = "Couldn't fetch description. Is the device online?";
      setErrorMsg(code: 1);
    }
  }

  void clearData() {
    _levelFuture = null;
    levelModel = null;
  }
}
