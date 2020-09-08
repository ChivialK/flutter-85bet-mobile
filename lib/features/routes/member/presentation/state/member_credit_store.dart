import 'package:flutter_85bet_mobile/core/mobx_store_export.dart';
import 'package:flutter_85bet_mobile/features/router/app_global_streams.dart';
import 'package:flutter_85bet_mobile/features/user/data/entity/login_status.dart';
import 'package:flutter_85bet_mobile/features/user/data/entity/user_entity.dart';

import '../../data/repository/member_repository.dart';

part 'member_credit_store.g.dart';

class MemberCreditStore = _MemberCreditStore with _$MemberCreditStore;

abstract class _MemberCreditStore with Store {
  final MemberRepository _repository;

  _MemberCreditStore(this._repository) {
    _userStream = ObservableStream(getAppGlobalStreams.userStream);
    _userStream.listen((event) {
      user = event.currentUser;
      credit = user?.credit ?? '';
      debugPrint('member store user: $user, credit: $credit');
    });
  }

  @observable
  ObservableStream<LoginStatus> _userStream;

  @observable
  UserEntity user;

  @observable
  bool hasNewMessage = false;

  @observable
  ObservableFuture<Either<Failure, String>> _creditFuture;

  @observable
  String credit = '';

  final String creditResetStr = '$creditSymbol---';

  void getUser() {
    user = getAppGlobalStreams.lastStatus.currentUser;
  }

  @observable
  String errorMessage;

  String _lastError;

  void setErrorMsg({String msg, bool showOnce, FailureType type, int code}) {
    if (showOnce && _lastError != null && msg == _lastError) return;
    if (msg.isNotEmpty) _lastError = msg;
    errorMessage = msg ??
        Failure.internal(FailureCode(
          type: type ?? FailureType.CREDIT,
          code: code,
        )).message;
  }

  @action
  Future<void> getNewMessageCount() async {
    // Reset the possible previous error message.
    errorMessage = null;
    // ObservableFuture extends Future - it can be awaited and exceptions will propagate as usual.
    await _repository.checkNewMessage().then((result) {
      debugPrint('new message result: $result');
      result.fold(
        (failure) => setErrorMsg(msg: failure.message, showOnce: true),
        (value) => hasNewMessage = value,
      );
    });
  }

  @action
  Future<void> getCredit() async {
    try {
      if (user == null) return;
      credit = creditResetStr;
      _creditFuture = ObservableFuture(_repository.updateCredit(user.account));
      // ObservableFuture extends Future - it can be awaited and exceptions will propagate as usual.
      await _creditFuture.then(
        (result) => result.fold(
          (failure) => setErrorMsg(msg: failure.message, showOnce: true),
          (value) {
            getAppGlobalStreams.lastStatus.currentUser.updateCredit(value);
            credit = value;
          },
        ),
      );
      debugPrint('member store credit: $credit');
    } on Exception catch (e) {
      MyLogger.error(msg: 'member credit has exception', error: e);
    }
  }
}
