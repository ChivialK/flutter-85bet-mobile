import 'package:flutter_85bet_mobile/core/mobx_store_export.dart';

import '../../data/models/promo_freezed.dart';
import '../../data/repository/promo_repository.dart';

part 'promo_store.g.dart';

class PromoStore = _PromoStore with _$PromoStore;

enum PromoStoreState { initial, loading, loaded }

abstract class _PromoStore with Store {
  final PromoRepository _repository;

  _PromoStore(this._repository);

  @observable
  ObservableFuture<Either<Failure, List<PromoEntity>>> _promoFuture;

  @observable
  List<PromoEntity> promos;

  @observable
  String errorMessage;

  String _lastError;

  void setErrorMsg({String msg, bool showOnce, FailureType type, int code}) {
    if (showOnce && _lastError != null && msg == _lastError) return;
    if (msg.isNotEmpty) _lastError = msg;
    errorMessage = msg ??
        Failure.internal(FailureCode(
          type: type ?? FailureType.PROMO,
          code: code,
        )).message;
  }

  @computed
  PromoStoreState get state {
    // If the user has not yet searched for a weather forecast or there has been an error
    if (_promoFuture == null || _promoFuture.status == FutureStatus.rejected) {
      return PromoStoreState.initial;
    }
    // Pending Future means "loading"
    // Fulfilled Future means "loaded"
    return _promoFuture.status == FutureStatus.pending
        ? PromoStoreState.loading
        : PromoStoreState.loaded;
  }

  @action
  Future<void> getPromoList() async {
    if (promos != null) return;
    try {
      // Reset the possible previous error message.
      errorMessage = null;
      // Fetch from the repository and wrap the regular Future into an observable.
      _promoFuture = ObservableFuture(_repository.getPromos());
      // ObservableFuture extends Future - it can be awaited and exceptions will propagate as usual.
      await _promoFuture.then((result) {
//        debugPrint('promo store result: $result');
        result.fold(
          (failure) {
            setErrorMsg(msg: failure.message, showOnce: true);
          },
          (list) {
            if (list.isNotEmpty) {
              // sort with normal sort value
              list.sort((a, b) => a.sort.compareTo(b.sort)); // 1, 2, 3...
              // sort with higher top value
              list.sort((b, a) => a.top.compareTo(b.top)); // 2, 1, 0...
            }
            promos = list;
          },
        );
      });
    } on Exception {
      setErrorMsg(code: 1);
    }
  }
}
