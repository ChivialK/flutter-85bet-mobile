import 'package:flutter_85bet_mobile/core/mobx_store_export.dart';

import '../../data/models/flow_model.dart';
import '../../data/repository/flows_repository.dart';

part 'flows_store.g.dart';

class FlowsStore = _FlowsStore with _$FlowsStore;

abstract class _FlowsStore with Store {
  final FlowsRepository _repository;

  _FlowsStore(this._repository);

  @observable
  List<FlowModel> dataList;

  @observable
  bool waitForPageData = false;

  @observable
  String errorMessage;

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
              (failure) => errorMessage = failure.message,
              (list) {
                debugPrint('flow data result: $list');
                dataList = list;
              },
            ),
          )
          .whenComplete(() => waitForPageData = false);
    } on Exception {
      errorMessage =
          Failure.internal(FailureCode(type: FailureType.TRANSACTIONS)).message;
    }
  }
}
