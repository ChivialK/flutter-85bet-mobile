import 'package:flutter_85bet_mobile/core/mobx_store_export.dart';
import 'package:flutter_85bet_mobile/features/event/data/repository/event_repository.dart';
import 'package:flutter_85bet_mobile/features/routes/subfeatures/service/data/model/service_model.dart';
import 'package:flutter_85bet_mobile/features/routes/subfeatures/service/data/service_data.dart';

part 'service_store.g.dart';

class ServiceStore = _ServiceStore with _$ServiceStore;

enum ServiceStoreState { initial, loading, loaded }

abstract class _ServiceStore with Store {
  final EventRepository _repository;

  _ServiceStore(this._repository) {
    data = ServiceData.data;
  }

  @observable
  ObservableFuture<Either<Failure, ServiceModel>> _dataFuture;

  @observable
  ServiceModel data;

  @observable
  String errorMessage;

  void setErrorMsg(
          {String msg, bool showOnce = false, FailureType type, int code}) =>
      errorMessage = getErrorMsg(
          from: FailureType.SERVICE,
          msg: msg,
          showOnce: showOnce,
          type: type,
          code: code);

  @computed
  ServiceStoreState get state {
    // If the user has not yet triggered a action or there has been an error
    if (data == null) {
      return ServiceStoreState.initial;
    }
    // Pending Future means "loading"
    // Fulfilled Future means "loaded"
    return (_dataFuture != null &&
                _dataFuture.status == FutureStatus.pending) ||
            data == null
        ? ServiceStoreState.loading
        : ServiceStoreState.loaded;
  }

  @action
  Future<void> getWebsiteList() async {
    try {
      // Reset the possible previous error message.
      errorMessage = null;
      // ObservableFuture extends Future - it can be awaited and exceptions will propagate as usual.
      _dataFuture = ObservableFuture(_repository.getWebsiteList());
      await _dataFuture.then((result) {
        debugPrint('service data result: $result');
        result.fold((failure) {
          setErrorMsg(msg: failure.message, showOnce: true);
          data = ServiceModel();
        }, (model) {
          ServiceData.data = model;
          data = model;
        });
      });
    } catch (e) {
      setErrorMsg(code: 1);
    }
  }
}
