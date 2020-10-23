import 'package:flutter_85bet_mobile/core/mobx_store_export.dart';
import 'package:flutter_85bet_mobile/features/router/app_global_streams.dart';
import 'package:flutter_85bet_mobile/features/user/data/entity/login_status.dart';
import 'package:flutter_85bet_mobile/features/user/data/entity/user_entity.dart';
import 'package:flutter_85bet_mobile/features/user/data/repository/user_info_repository.dart';

part 'member_credit_store.g.dart';

class MemberCreditStore = _MemberCreditStore with _$MemberCreditStore;

abstract class _MemberCreditStore with Store {
  final UserInfoRepository _infoRepository;

  _MemberCreditStore(this._infoRepository) {
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
  String credit = '';

  final String creditResetStr = '$creditSymbol---';

  void getUser() {
    user = getAppGlobalStreams.lastStatus.currentUser;
  }

  @observable
  String errorMessage;

  void setErrorMsg(
          {String msg, bool showOnce = false, FailureType type, int code}) =>
      errorMessage = getErrorMsg(
          from: FailureType.MEMBER,
          msg: msg,
          showOnce: showOnce,
          type: type,
          code: code);

  @action
  Future<void> getNewMessageCount() async {
    // Reset the possible previous error message.
    errorMessage = null;
    // ObservableFuture extends Future - it can be awaited and exceptions will propagate as usual.
    await _infoRepository.checkNewMessage().then((result) {
      debugPrint('new message result: $result');
      result.fold(
        (failure) => setErrorMsg(msg: failure.message, showOnce: true),
        (value) {
          getAppGlobalStreams.updateMessageState(value);
          hasNewMessage = value;
        },
      );
    });
  }

  @action
  Future<void> getUserCredit() async {
    try {
      if (user == null) return;
      credit = creditResetStr;
      // ObservableFuture extends Future - it can be awaited and exceptions will propagate as usual.
      await _infoRepository.updateCredit().then(
            (result) => result.fold(
              (failure) {
                setErrorMsg(msg: failure.message, showOnce: true);
                getAppGlobalStreams.resetCredit();
              },
              (value) {
                getAppGlobalStreams.updateCredit(value);
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
