import 'package:flutter_85bet_mobile/core/mobx_store_export.dart';

import '../../data/models/notice_model.dart';
import '../../data/repository/notice_repository.dart';

part 'notice_store.g.dart';

class NoticeStore = _NoticeStore with _$NoticeStore;

enum NoticeStoreState { initial, loading, loaded }

abstract class _NoticeStore with Store {
  final NoticeRepository _repository;

  _NoticeStore(this._repository);

  @observable
  ObservableFuture<Either<Failure, NoticeModel>> _dataFuture;

  NoticeModel dataModel;

  @observable
  String errorMessage;

  void setErrorMsg({
    String msg,
    bool showOnce = false,
    FailureType type,
    int code,
  }) =>
      errorMessage = getErrorMsg(
          from: FailureType.NOTICE,
          msg: msg,
          showOnce: showOnce,
          type: type,
          code: code);

  @computed
  NoticeStoreState get state {
    // If the user has not yet triggered a action or there has been an error
    if (_dataFuture == null || _dataFuture.status == FutureStatus.rejected) {
      return NoticeStoreState.initial;
    }
    // Pending Future means "loading"
    // Fulfilled Future means "loaded"
    return _dataFuture.status == FutureStatus.pending
        ? NoticeStoreState.loading
        : NoticeStoreState.loaded;
  }

  @action
  Future<void> getData() async {
    try {
      // Reset the possible previous error message.
      errorMessage = null;
      // Fetch from the repository and wrap the regular Future into an observable.
      _dataFuture = ObservableFuture(_repository.getRemind());
      // ObservableFuture extends Future - it can be awaited and exceptions will propagate as usual.
      await _dataFuture.then(
        (result) => result.fold(
          (failure) => setErrorMsg(msg: failure.message, showOnce: true),
          (model) {
            dataModel = model;
            debugPrint('notice data: $dataModel');
          },
        ),
      );
    } on Exception {
      //errorMessage = "Couldn't fetch description. Is the device online?";
      setErrorMsg(code: 1);
    }
  }

  List<NoticeData> get getMaintenanceList => dataModel.data.maintenanceList;
  List<NoticeData> get getMarqueeList => dataModel.data.marqueeList;
}
