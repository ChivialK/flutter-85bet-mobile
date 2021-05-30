import 'package:flutter_85bet_mobile/core/data/hive_actions.dart';
import 'package:flutter_85bet_mobile/core/internal/global.dart';
import 'package:flutter_85bet_mobile/core/mobx_store_export.dart';
import 'package:flutter_85bet_mobile/features/general/data/error/error_message_map.dart';
import 'package:flutter_85bet_mobile/features/router/app_global_streams.dart';
import 'package:flutter_85bet_mobile/features/user/data/models/captcha_model.dart';
import 'package:hive/hive.dart';

import '../../../data/entity/login_status.dart';
import '../../../data/form/login_form.dart';
import '../../../data/models/user_model.dart';
import '../../../data/repository/user_repository.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

enum LoginStoreState { initial, loading, loaded }

enum LoginState { initial, loading, loaded }

abstract class _LoginStore with Store {
  final UserRepository _repository;
  final String tag = 'LoginStore';

  _LoginStore(this._repository);

  @observable
  ObservableFuture<List> _initFuture;

  @observable
  ObservableFuture<Either<Failure, UserModel>> _loginFuture;

  Box _box;

  @observable
  bool waitForHive = true;

  @observable
  CaptchaData captchaData;

  @observable
  LoginHiveForm hiveLoginForm;

  @observable
  bool waitForLogin = false;

  @observable
  String errorMessage;

  void setErrorMsg({
    String msg,
    bool showOnce = false,
    FailureType type,
    int code,
  }) =>
      errorMessage = getErrorMsg(
          from: FailureType.LOGIN,
          msg: msg,
          showOnce: showOnce,
          type: type,
          code: code);

  @computed
  LoginStoreState get state {
    // If the user has not yet triggered a action or there has been an error
    if (_initFuture == null || _initFuture.status == FutureStatus.rejected) {
      return LoginStoreState.initial;
    }
    // Pending Future means "loading"
    // Fulfilled Future means "loaded"
    return _initFuture.status == FutureStatus.pending
        ? LoginStoreState.loading
        : LoginStoreState.loaded;
  }

  @action
  Future<void> initBox() async {
    // Reset the possible previous error message.
    errorMessage = null;
    // Fetch from the repository and wrap the regular Future into an observable.
    _initFuture = ObservableFuture(Future.wait([
      if (waitForHive) _getLastLoginRecord(),
      getCaptcha(),
    ]));
  }

  @action
  Future<void> _getLastLoginRecord() async {
    try {
      // Reset the possible previous error message.
      errorMessage = null;
      // Fetch from the repository and wrap the regular Future into an observable.
      // ObservableFuture extends Future - it can be awaited and exceptions will propagate as usual.
      await getHiveBox(Global.CACHE_LOGIN_FORM).then((value) {
        _box = value;
        MyLogger.log(msg: 'User Box check: ${_box?.length}', tag: tag);
        if (_box != null && _box.isNotEmpty) {
          debugPrint('box login data: ${_box.values.last}');
          hiveLoginForm = _box.values.last;
          waitForHive = false;
        } else {
          waitForHive = false;
        }
      });
    } on Exception {
      waitForHive = false;
    }
  }

  @action
  Future<void> getCaptcha() async {
    try {
      // Reset the possible previous error message.
      errorMessage = null;
      captchaData = null;
      // Fetch from the repository and wrap the regular Future into an observable.
      // ObservableFuture extends Future - it can be awaited and exceptions will propagate as usual.
      await _repository.getCaptcha().then((result) {
        // debugPrint('login captcha result: $result');
        result.fold(
          (failure) => setErrorMsg(msg: failure.message),
          (model) => (model.statusCode == "200")
              ? captchaData = model.data
              : captchaData = CaptchaData(key: '', img: null, sensitive: false),
        );
      });
    } catch (e) {
      MyLogger.error(msg: '$tag has exception: $e');
      setErrorMsg(code: 2);
    }
  }

  @computed
  LoginState get loginState {
    // If the user has not yet triggered a action or there has been an error
    if (_loginFuture == null || _loginFuture.status == FutureStatus.rejected) {
      return LoginState.initial;
    }
    // Pending Future means "loading"
    // Fulfilled Future means "loaded"
    return _loginFuture.status == FutureStatus.pending
        ? LoginState.loading
        : LoginState.loaded;
  }

  @action
  Future<void> login(LoginForm form, bool saveForm, String captcha) async {
    try {
      // Reset the possible previous error message.
      errorMessage = null;
      waitForLogin = true;
      _loginFuture = null;
      // Fetch from the repository and wrap the regular Future into an observable.
      _loginFuture = ObservableFuture(_repository.login(form.copyWith(
        captchaKey: captchaData.key,
        captchaAns: captcha,
      )));
      // ObservableFuture extends Future - it can be awaited and exceptions will propagate as usual.
      await _loginFuture.then((value) => value.fold(
            (failure) {
              waitForLogin = false;
              setErrorMsg(
                msg: MessageMap.getErrorMessage(
                    failure.message, RouteEnum.LOGIN),
              );
            },
            (model) async {
              if (saveForm)
                await saveToBox(LoginHiveForm(
                  fastLogin: true,
                  account: form.account,
                  password: form.password,
                ));
              else
                await cleanBox();

              getAppGlobalStreams.updateUser(LoginStatus(
                loggedIn: true,
                currentUser: model.entity,
              ));

              waitForLogin = false;
            },
          ));
    } on Exception catch (e) {
      waitForLogin = false;
      MyLogger.error(msg: '$tag has exception: $e');
      setErrorMsg(code: 1);
    }
  }

  Future<void> saveToBox(LoginHiveForm form) async {
    if (_box == null) {
      MyLogger.warn(msg: 'User Box is NULL', tag: tag);
      return;
    }
    if (_box.isNotEmpty) {
      await _box
          .putAt(0, form)
          .whenComplete(() => debugPrint('form saved: $form'))
          .catchError((e) =>
              MyLogger.error(msg: 'Save error: $_box', error: e, tag: tag));
    } else {
      await _box
          .add(form)
          .whenComplete(() => debugPrint('form saved: $form'))
          .catchError((e) =>
              MyLogger.error(msg: 'Save error: $_box', error: e, tag: tag));
    }
  }

  Future<void> cleanBox() async {
    if (_box != null && _box.isNotEmpty) {
      await _box
          .clear()
          .whenComplete(() => debugPrint('hive cleared'))
          .catchError((e) => debugPrint('hive clear error: $e'));
    }
  }

  void close() {
    try {
      closeHiveBox(Global.CACHE_LOGIN_FORM);
    } catch (e) {
      MyLogger.warn(
          msg: 'close login stream error', error: e, tag: 'LoginStore');
      return null;
    }
  }
}
