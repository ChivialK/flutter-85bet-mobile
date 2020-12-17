import 'package:flutter_85bet_mobile/core/internal/global.dart';
import 'package:flutter_85bet_mobile/core/mobx_store_export.dart';
import 'package:flutter_85bet_mobile/utils/datetime_format.dart';

import '../../data/repository/update_repository.dart';

part 'update_store.g.dart';

class UpdateStore = _UpdateStore with _$UpdateStore;

enum UpdateStoreState { initial, loading, loaded }

abstract class _UpdateStore with Store {
  final UpdateRepository _repository;

  _UpdateStore(this._repository);

  DateTime _lastCheck;

  String _updateUrl;

  String _updateVersion;

  bool _hasNewVersion = false;

  bool _dialogClosed = false;

  @observable
  String errorMessage;

  String get serverAppVersion => _updateVersion;

  String get serverAppUrl => _updateUrl;

  bool get showingUpdateDialog => !_dialogClosed;

  @action
  Future<bool> getVersion() async {
    if (_lastCheck != null && _lastCheck.isDayPassed() == false) return false;
    try {
      // Reset the possible previous error message.
      errorMessage = null;
      // ObservableFuture extends Future - it can be awaited and exceptions will propagate as usual.
      return await _repository.getVersion().then((result) {
        debugPrint('app version check result: $result');
        return result.fold(
          (fail) {
            errorMessage = fail.message;
            return false;
          },
          (data) {
            _lastCheck = DateTime.now();
            _updateVersion = data[0];
            _updateUrl = data[1];
            _hasNewVersion = isNewVersion();
            debugPrint('server app version: ${data[0]}');
            debugPrint('device app version: ${Global.device.appVersion}');
            debugPrint('app new version check: $_hasNewVersion');
            return _hasNewVersion;
          },
        );
      });
    } on Exception {
      errorMessage =
          Failure.internal(FailureCode(type: FailureType.UPDATE)).message;
      return false;
    }
  }

  bool isNewVersion() {
    // if contains chars that have not been replaced, current will be -1
    int current = Global.device.appVersion
        .replaceAll(RegExp(r'[.|+|R]'), '')
        .strToIntNoErrorStack;
    debugPrint('current version as int: $current');
    int server = _updateVersion
        .replaceAll('.', '')
        .replaceAll('+', '')
        .strToIntNoErrorStack;
    debugPrint('server version as int: $server');
    return (current == -1 || server == -1) ? false : current < server;
  }

  void dialogClosed() => _dialogClosed = true;
}
