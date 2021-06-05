import 'package:flutter_85bet_mobile/core/mobx_store_export.dart';
import 'package:flutter_85bet_mobile/core/network/handler/request_status_model.dart';
import 'package:flutter_85bet_mobile/features/user/data/form/login_form.dart';
import 'package:flutter_85bet_mobile/features/user/data/models/captcha_model.dart';
import 'package:flutter_85bet_mobile/features/user/data/models/user_model.dart';
import 'package:flutter_85bet_mobile/features/user/data/repository/user_repository.dart';

import '../../../data/form/register_form.dart';

part 'register_store.g.dart';

class RegisterStore = _RegisterStore with _$RegisterStore;

enum RegisterStoreState { initial, loading, loaded }

abstract class _RegisterStore with Store {
  final UserRepository _repository;
  final StreamController _loginController = StreamController.broadcast();

  _RegisterStore(this._repository);

  Stream get loginStream => _loginController.stream;

  @observable
  ObservableFuture _initFuture;

  @observable
  CaptchaData captchaData;

  @observable
  RequestStatusModel registerResult;

  @observable
  bool waitForRegister = false;

  @observable
  String errorMessage;

  void setErrorMsg({
    String msg,
    bool showOnce = false,
    FailureType type,
    int code,
  }) =>
      errorMessage = getErrorMsg(
          from: FailureType.REGISTER,
          msg: msg,
          showOnce: showOnce,
          type: type,
          code: code);

  @computed
  RegisterStoreState get state {
    // If the user has not yet triggered a action or there has been an error
    if (_initFuture == null || _initFuture.status == FutureStatus.rejected) {
      return RegisterStoreState.initial;
    }
    // Pending Future means "loading"
    // Fulfilled Future means "loaded"
    return _initFuture.status == FutureStatus.pending
        ? RegisterStoreState.loading
        : RegisterStoreState.loaded;
  }

  @action
  Future<void> initialize() async {
    // Reset the possible previous error message.
    errorMessage = null;
    // Fetch from the repository and wrap the regular Future into an observable.
    _initFuture = ObservableFuture(getCaptcha());
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
      debugPrint("captcha key: ${captchaData.key}");
    } catch (e) {
      MyLogger.error(msg: 'Captcha has exception: $e', tag: 'RegisterStore');
      setErrorMsg(code: 2);
    }
  }

  @action
  Future<void> postRegister(RegisterForm form, String captcha) async {
    try {
      // Reset the possible previous error message.
      errorMessage = null;
      registerResult = null;
      waitForRegister = true;
      // ObservableFuture extends Future - it can be awaited and exceptions will propagate as usual.
      await _repository
          .postRegister(form.copyWith(
            captchaKey: captchaData.key,
            captchaAns: captcha,
          ))
          .then(
            (result) => result.fold(
              (failure) => setErrorMsg(msg: failure.message),
              (model) {
//                debugPrint('register result: $model');
                registerResult = model;
                if (model.isSuccess) {
                  // GaInterface.log?.logSignUp(signUpMethod: 'App');
                  Future.delayed(Duration(milliseconds: 500), () {
                    postLogin(LoginForm(
                      account: form.username,
                      password: form.confirmPassword,
                      captchaKey: captchaData.key,
                      captchaAns: captcha,
                    ));
                  });
                }
              },
            ),
          )
          .whenComplete(() => waitForRegister = false);
    } on Exception {
      waitForRegister = false;
      setErrorMsg(code: 1);
    }
  }

  @action
  Future<void> postLogin(LoginForm form) async {
    try {
      // Reset the possible previous error message.
      errorMessage = null;
      // ObservableFuture extends Future - it can be awaited and exceptions will propagate as usual.
      await _repository.login(form, true).then(
            (result) => result.fold(
              (failure) {
                debugPrint('auto login failed: $failure');
                _loginController.sink.add('');
              },
              (UserModel model) {
                debugPrint('login result: $model');
                _loginController.sink.add(model.entity);
              },
            ),
          );
    } on Exception {
      //errorMessage = "Couldn't fetch description. Is the device online?";
      setErrorMsg(code: 2);
    }
  }

  Future<void> closeStreams() {
    try {
      return Future.wait([
        _loginController.close(),
      ]);
    } catch (e) {
      MyLogger.warn(
          msg: 'close register stream error', error: e, tag: 'RegisterStore');
      return null;
    }
  }
}
