import 'package:flutter_85bet_mobile/core/mobx_store_export.dart';

import '../../data/models/message_model.dart';
import '../../data/repository/message_repository.dart';

part 'message_store.g.dart';

class MessageStore = _MessageStore with _$MessageStore;

enum MessageStoreState { initial, loading, loaded }

abstract class _MessageStore with Store {
  final MessageRepository _repository;

  _MessageStore(this._repository);

  @observable
  ObservableFuture<Either<Failure, List<MessageModel>>> _dataFuture;

  List<MessageModel> messageList;

  @observable
  String errorMessage;

  @computed
  MessageStoreState get state {
    // If the user has not yet triggered a action or there has been an error
    if (_dataFuture == null || _dataFuture.status == FutureStatus.rejected) {
      return MessageStoreState.initial;
    }
    // Pending Future means "loading"
    // Fulfilled Future means "loaded"
    return _dataFuture.status == FutureStatus.pending
        ? MessageStoreState.loading
        : MessageStoreState.loaded;
  }

  @action
  Future getData() async {
    try {
      // Reset the possible previous error message.
      errorMessage = null;
      // Fetch from the repository and wrap the regular Future into an observable.
      _dataFuture = ObservableFuture(_repository.getMessageList());
      // ObservableFuture extends Future - it can be awaited and exceptions will propagate as usual.
      await _dataFuture.then(
        (result) => result.fold(
          (failure) => errorMessage = failure.message,
          (list) {
            messageList = list;
            debugPrint('message list: $messageList');
          },
        ),
      );
    } on Exception {
      //errorMessage = "Couldn't fetch description. Is the device online?";
      errorMessage =
          Failure.internal(FailureCode(type: FailureType.MESSAGE)).message;
    }
  }

  @action
  Future updateMessageStatus(int id) async {
    try {
      // Reset the possible previous error message.
      errorMessage = null;
      // Fetch from the repository and wrap the regular Future into an observable.
      // ObservableFuture extends Future - it can be awaited and exceptions will propagate as usual.
      await _repository.updateMessageStatus(id).then(
            (result) => result.fold(
              (failure) => errorMessage = failure.message,
              (data) => debugPrint('$id update result: $data'),
            ),
          );
    } on Exception {
      //errorMessage = "Couldn't fetch description. Is the device online?";
      errorMessage =
          Failure.internal(FailureCode(type: FailureType.MESSAGE)).message;
    }
  }
}
