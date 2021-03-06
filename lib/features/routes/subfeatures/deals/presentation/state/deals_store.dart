import 'package:flutter_85bet_mobile/core/mobx_store_export.dart';

import '../../data/form/deals_form.dart';
import '../../data/models/deals_model.dart';
import '../../data/repository/deals_repository.dart';

part 'deals_store.g.dart';

class DealsStore = _DealsStore with _$DealsStore;

abstract class _DealsStore with Store {
  final DealsRepository _repository;

  _DealsStore(this._repository);

  DealsModel dataModel;

  @observable
  List<DealsData> dataList;

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
          from: FailureType.DEALS,
          msg: msg,
          showOnce: showOnce,
          type: type,
          code: code);

  @action
  Future getRecord(DealsForm form) async {
    debugPrint('waiting: $waitForPageData');
    if (waitForPageData) return;
    try {
      // Reset the possible previous error message.
      errorMessage = null;
      waitForPageData = true;
      // ObservableFuture extends Future - it can be awaited and exceptions will propagate as usual.
      await _repository
          .getDataModel(form)
          .then(
            (result) => result.fold(
              (failure) => setErrorMsg(msg: failure.message, showOnce: true),
              (model) {
                debugPrint('deals data result: $model');
                dataModel = model;
                dataList = model.data;
              },
            ),
          )
          .whenComplete(() => waitForPageData = false);
    } on Exception {
      setErrorMsg(code: 1);
    }
  }
}
