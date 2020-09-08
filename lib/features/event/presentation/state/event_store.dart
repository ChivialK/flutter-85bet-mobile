import 'package:flutter_85bet_mobile/core/data/hive_actions.dart';
import 'package:flutter_85bet_mobile/core/internal/global.dart';
import 'package:flutter_85bet_mobile/core/mobx_store_export.dart';

import '../../data/models/ad_model.dart';
import '../../data/repository/event_repository.dart';

part 'event_store.g.dart';

class EventStore = _EventStore with _$EventStore;

enum EventStoreState { initial, loading, loaded }

abstract class _EventStore with Store {
  final EventRepository _repository;

  final StreamController<List<AdModel>> _adsController =
      StreamController<List<AdModel>>.broadcast();

  _EventStore(this._repository) {
    _adsController.stream.listen((event) {
//      print('home stream ads: ${event.length}');
      ads = event;
    });
  }

  /// Message
  @observable
  bool hasNewMessage = false;

  /// Ads
  Stream<List<AdModel>> get adsStream => _adsController.stream;

  List<AdModel> ads;

  final String skipAdsKey = 'skipAds';

  bool _skipAds = false;

  bool _showOnStartup = true;

  bool _showingAds = false;

  bool get canShowAds => !_showingAds;

  bool get checkSkip => _skipAds;

  bool get autoShowAds => !_showingAds && _showOnStartup && !_skipAds;

  set setAutoShowAds(bool auto) => _showOnStartup = auto;

  @observable
  String errorMessage;

  String _lastError;

  void setErrorMsg({String msg, bool showOnce, FailureType type, int code}) {
    if (showOnce && _lastError != null && msg == _lastError) return;
    if (msg.isNotEmpty) _lastError = msg;
    errorMessage = msg ??
        Failure.internal(FailureCode(
          type: type ?? FailureType.EVENT,
          code: code,
        )).message;
  }

  @action
  Future<void> getWebsiteList() async {
    // Reset the possible previous error message.
    errorMessage = null;
    // ObservableFuture extends Future - it can be awaited and exceptions will propagate as usual.
    await _repository.getWebsiteList().then((result) {
      debugPrint('website list result: $result');
      result.fold(
        (failure) => setErrorMsg(msg: failure.message, showOnce: true),
        (value) {},
      );
    });
  }

  @action
  Future<void> getNewMessageCount() async {
    try {
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
    } on Exception {
      //errorMessage = "Couldn't fetch description. Is the device online?";
      setErrorMsg(code: 1);
    }
  }

  @action
  Future<void> getAds() async {
    if (ads != null && ads.isNotEmpty) return;
    try {
      // Reset the possible previous error message.
      errorMessage = null;
      // Read setting
      Box box = await Future.value(getHiveBox(Global.CACHE_APP_DATA));
      if (box != null && box.isNotEmpty) {
        _skipAds = (box.containsKey(skipAdsKey)) ? box.get(skipAdsKey) : false;
      }
      // Fetch from the repository and wrap the regular Future into an observable.
      await _repository.getAds().then(
            (result) => result.fold(
              (failure) => setErrorMsg(msg: failure.message, showOnce: true),
              (list) => _adsController.sink.add(List.from(list)),
            ),
          );
    } on Exception {
      //errorMessage = "Couldn't fetch description. Is the device online?";
      setErrorMsg(code: 2);
    }
  }

  void setSkipAd(bool value) {
    if (_skipAds == value) return;
    _skipAds = value;
    Future.microtask(() async {
      bool saveValue = _skipAds;
      if (saveValue) {
        Box box = await Future.value(getHiveBox(Global.CACHE_APP_DATA));
        if (box != null) {
          await box.putAll({skipAdsKey: saveValue});
          print('box ads: ${box.get(skipAdsKey)}');
        }
      }
      print('box saved: $skipAdsKey - $saveValue');
    });
  }

  void adsDialogClose() => _showingAds = false;

  Future<void> closeStreams() {
    try {
      return Future.wait([
        _adsController.close(),
      ]);
    } catch (e) {
      MyLogger.warn(
          msg: 'close event stream error', error: e, tag: 'EventStore');
      return null;
    }
  }
}
