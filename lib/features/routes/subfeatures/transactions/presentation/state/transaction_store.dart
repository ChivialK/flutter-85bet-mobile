import 'package:flutter_85bet_mobile/core/mobx_store_export.dart';

import '../../data/enum/transaction_date_enum.dart';
import '../../data/models/transaction_model.dart';
import '../../data/repository/transaction_repository.dart';

part 'transaction_store.g.dart';

class TransactionStore = _TransactionStore with _$TransactionStore;

abstract class _TransactionStore with Store {
  final TransactionRepository _repository;

  _TransactionStore(this._repository);

  TransactionModel dataModel;

  @observable
  List<TransactionData> dataList;

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
          from: FailureType.TRANSACTIONS,
          msg: msg,
          showOnce: showOnce,
          type: type,
          code: code);

  @action
  Future getRecord({
    int page = 1,
    TransactionDateSelected selection = TransactionDateSelected.all,
  }) async {
    debugPrint('waiting: $waitForPageData');
    if (waitForPageData) return;
    try {
      // Reset the possible previous error message.
      errorMessage = null;
      waitForPageData = true;
      // ObservableFuture extends Future - it can be awaited and exceptions will propagate as usual.
      await _repository
          .getDataModel(page, selection)
          .then(
            (result) => result.fold(
              (failure) => setErrorMsg(msg: failure.message, showOnce: true),
              (model) {
                debugPrint('transaction data result: $model');
                dataModel = model;
                dataList = model.data;
              },
            ),
          )
          .whenComplete(() => waitForPageData = false);
    } on Exception {
      waitForPageData = false;
      setErrorMsg(code: 1);
    }
  }
}
