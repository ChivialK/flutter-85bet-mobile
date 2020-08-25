import 'package:flutter_85bet_mobile/template/mobx/data/repository/template_repository.dart';
import 'package:mobx/mobx.dart';

part 'template_store.g.dart';

class TemplateStore = _TemplateStore with _$TemplateStore;

enum StoreState { initial, loading, loaded }

abstract class _TemplateStore with Store {
  final TemplateRepository _templateRepository;

  _TemplateStore(this._templateRepository);

  @observable
  ObservableFuture<String> _descFuture;

  @observable
  String description = '';

  @observable
  String errorMessage;

  @computed
  StoreState get state {
    // If the user has not yet searched for a weather forecast or there has been an error
    if (_descFuture == null || _descFuture.status == FutureStatus.rejected) {
      return StoreState.initial;
    }
    // Pending Future means "loading"
    // Fulfilled Future means "loaded"
    return _descFuture.status == FutureStatus.pending
        ? StoreState.loading
        : StoreState.loaded;
  }

  @action
  Future<void> getDescription() async {
    try {
      // Reset the possible previous error message.
      errorMessage = null;
      // ObservableFuture extends Future - it can be awaited and exceptions will propagate as usual.
      _descFuture = ObservableFuture(_templateRepository.fetchString());
      description = await _descFuture;
    } on Exception {
      errorMessage = "Couldn't fetch description. Is the device online?";
    }
  }
}
