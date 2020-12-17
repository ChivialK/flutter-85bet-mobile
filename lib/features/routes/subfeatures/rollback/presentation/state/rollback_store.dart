import 'package:flutter_85bet_mobile/core/mobx_store_export.dart';

import '../../data/models/rollback_model.dart';
import '../../data/repository/rollback_repository.dart';

part 'rollback_store.g.dart';

class RollbackStore = _RollbackStore with _$RollbackStore;

abstract class _RollbackStore with Store {
  final RollbackRepository _repository;

  _RollbackStore(this._repository);

  @observable
  List<RollbackModel> dataList;

  @observable
  bool waitForPageData = false;

  @observable
  String errorMessage;

  void setErrorMsg({
    String msg,
    bool showOnce = false,
    FailureType type,
    int code,
  }) =>
      errorMessage = getErrorMsg(
          from: FailureType.ROLLBACK,
          msg: msg,
          showOnce: showOnce,
          type: type,
          code: code);

  @action
  Future getRecord({
    int page = 1,
  }) async {
    debugPrint('waiting: $waitForPageData');
    if (waitForPageData) return;
    try {
      // Reset the possible previous error message.
      errorMessage = null;
      waitForPageData = true;
      // ObservableFuture extends Future - it can be awaited and exceptions will propagate as usual.
      await _repository
          .getDataModel(page)
          .then(
            (result) => result.fold(
              (failure) => setErrorMsg(msg: failure.message, showOnce: true),
              (list) {
                debugPrint('flow data result: $list');
                dataList = list;
              },
            ),
          )
          .whenComplete(() => waitForPageData = false);
    } on Exception {
      setErrorMsg(code: 1);
    }
  }
}
