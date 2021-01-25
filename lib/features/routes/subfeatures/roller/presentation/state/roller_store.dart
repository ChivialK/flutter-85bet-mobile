import 'package:flutter_85bet_mobile/core/mobx_store_export.dart';

import '../../data/entity/roller_data_entity.dart';
import '../../data/models/roller_order_model.dart';
import '../../data/models/roller_prize_model.dart';
import '../../data/models/roller_record_model.dart';
import '../../data/models/roller_requirement_model.dart';
import '../../data/repository/roller_repository.dart';

part 'roller_store.g.dart';

class RollerStore = _RollerStore with _$RollerStore;

enum RollerStoreState { initial, loading, loaded }

abstract class _RollerStore with Store {
  final RollerRepository _repository;

  final StreamController<List<RollerOrderModel>> _orderController =
      StreamController<List<RollerOrderModel>>.broadcast();
  final StreamController<List<RollerRecordModel>> _recordController =
      StreamController<List<RollerRecordModel>>.broadcast();
  final StreamController<RollerRequirementModel> _requirementController =
      StreamController<RollerRequirementModel>.broadcast();

  _RollerStore(this._repository) {
    _orderController.stream.listen((event) {
      print('roller orders: ${event?.length ?? 0}');
      orders = event;
    });
    _recordController.stream.listen((event) {
      print('roller records: ${event?.length ?? 0}');
      records = event;
    });
    _requirementController.stream.listen((event) {
      print('roller requirements types: ${event?.types ?? 0}');
      requirement = event;
    });
  }

  @observable
  ObservableFuture<Either<Failure, RollerDataEntity>> _dataFuture;

  Stream<List<RollerOrderModel>> get orderStream => _orderController.stream;

  Stream<List<RollerRecordModel>> get recordStream => _recordController.stream;

  Stream<RollerRequirementModel> get requirementStream =>
      _requirementController.stream;

  RollerDataEntity rollerData;
  List<RollerOrderModel> orders;
  List<RollerRecordModel> records;
  RollerRequirementModel requirement;

  @observable
  int count;

  @observable
  int prizeId;

  @observable
  bool waitForPrize = false;
  @observable
  bool waitForOrder = false;
  @observable
  bool waitForRecord = false;
  @observable
  bool waitForRequirement = false;

  @observable
  String errorMessage;

  void setErrorMsg(
          {String msg, bool showOnce = false, FailureType type, int code}) =>
      errorMessage = getErrorMsg(
          from: FailureType.ROLLER,
          msg: msg,
          showOnce: showOnce,
          type: type,
          code: code);

  bool get canRoll => count != null && count > 0;

  @computed
  RollerStoreState get state {
    // If the user has not yet triggered a action or there has been an error
    if (_dataFuture == null || _dataFuture.status == FutureStatus.rejected) {
      return RollerStoreState.initial;
    }
    // Pending Future means "loading"
    // Fulfilled Future means "loaded"
    return _dataFuture.status == FutureStatus.pending
        ? RollerStoreState.loading
        : RollerStoreState.loaded;
  }

  @action
  Future getInitData() async {
    try {
      // Reset the possible previous error message.
      errorMessage = null;
      // Fetch from the repository and wrap the regular Future into an observable.
      _dataFuture = ObservableFuture(_repository.getRollerData());
      // ObservableFuture extends Future - it can be awaited and exceptions will propagate as usual.
      await _dataFuture.then((result) {
//        print('roller init data result: $result');
        result.fold(
          (failure) => setErrorMsg(msg: failure.message, showOnce: true),
          (data) {
            print('roller prize data: ${data.prizes}');
            print('roller init data, prize: ${data.prizes.length}');
            rollerData = data;
          },
        );
      });
    } on Exception {
      setErrorMsg(code: 1);
    }
  }

  @action
  Future<void> getOrder() async {
    if (waitForOrder) return;
    try {
      // Reset the possible previous error message.
      errorMessage = null;
      waitForOrder = true;
      // ObservableFuture extends Future - it can be awaited and exceptions will propagate as usual.
      await _repository
          .getOrder()
          .then((result) => result.fold(
                (failure) {
                  _orderController.sink.add([]);
                  setErrorMsg(msg: failure.message, showOnce: true);
                },
                (list) {
                  if (list != null &&
                      list is List &&
                      list.every((element) => element is RollerOrderModel) &&
                      orders != list) {
                    _orderController.sink.add(list);
                  } else {
                    _orderController.sink.add([]);
                    errorMessage = Failure.dataType().message;
                  }
                },
              ))
          .whenComplete(() => waitForOrder = false);
    } on Exception {
      waitForOrder = false;
      setErrorMsg(code: 2);
    }
  }

  @action
  Future<void> getRecord() async {
    if (waitForRecord) return;
    try {
      // Reset the possible previous error message.
      errorMessage = null;
      waitForRecord = true;
      // ObservableFuture extends Future - it can be awaited and exceptions will propagate as usual.
      await _repository
          .getRecord()
          .then((result) => result.fold(
                (failure) {
                  _recordController.sink.add([]);
                  setErrorMsg(msg: failure.message, showOnce: true);
                },
                (list) {
                  if (list != null &&
                      list is List &&
                      list.every((element) => element is RollerRecordModel) &&
                      records != list) {
                    _recordController.sink.add(list);
                  } else {
                    _recordController.sink.add([]);
                    errorMessage = Failure.dataType().message;
                  }
                },
              ))
          .whenComplete(() => waitForRecord = false);
    } on Exception {
      waitForRecord = false;
      setErrorMsg(code: 3);
    }
  }

  @action
  Future<void> getRequirement() async {
    if (waitForRequirement) return;
    try {
      // Reset the possible previous error message.
      errorMessage = null;
      waitForRequirement = true;
      // ObservableFuture extends Future - it can be awaited and exceptions will propagate as usual.
      await _repository
          .getRequirement()
          .then((result) => result.fold(
                (failure) {
                  _requirementController.sink
                      .add(RollerRequirementModel(hasData: false));
                  setErrorMsg(msg: failure.message, showOnce: true);
                },
                (data) {
                  if (data != null && requirement != data) {
                    _requirementController.sink.add(data);
                  } else {
                    _requirementController.sink
                        .add(RollerRequirementModel(hasData: false));
                    errorMessage = Failure.dataType().message;
                  }
                },
              ))
          .whenComplete(() => waitForRequirement = false);
    } on Exception {
      waitForRequirement = false;
      setErrorMsg(code: 4);
    }
  }

  @action
  Future<void> getCount() async {
    try {
      // Reset the possible previous error message.
      errorMessage = null;
      // ObservableFuture extends Future - it can be awaited and exceptions will propagate as usual.
      await _repository.getCount().then(
            (result) => result.fold(
              (failure) => setErrorMsg(msg: failure.message, showOnce: true),
              (value) => count = value,
            ),
          );
    } on Exception {
      setErrorMsg(code: 5);
    }
  }

  @action
  Future<bool> applyCount(int questId) async {
    try {
      // Reset the possible previous error message.
      errorMessage = null;
      // ObservableFuture extends Future - it can be awaited and exceptions will propagate as usual.
      return await _repository.applyCount(questId).then(
            (result) => result.fold(
              (failure) {
                setErrorMsg(msg: failure.message, showOnce: true);
                return false;
              },
              (result) {
                if (result.isSuccess)
                  return true;
                else {
                  errorMessage = result.msg;
                  return false;
                }
              },
            ),
          );
    } on Exception {
      setErrorMsg(code: 6);
      return false;
    }
  }

  @action
  Future<void> getPrize() async {
    try {
      // Reset the possible previous error message.
      errorMessage = null;
      prizeId = null;
      waitForPrize = true;
      // ObservableFuture extends Future - it can be awaited and exceptions will propagate as usual.
      await _repository
          .getWheelPrize()
          .then(
            (result) => result.fold(
              (failure) => setErrorMsg(msg: failure.message, showOnce: true),
              (value) {
                prizeId = value;
                count -= 1;
              },
            ),
          )
          .whenComplete(() => waitForPrize = false);
    } on Exception {
      waitForPrize = false;
      setErrorMsg(code: 7);
    }
  }

  @computed
  String get getPrizeAlertImgUrl {
    RollerPrizeModel prize = rollerData.prizes
        .singleWhere((element) => element.id == prizeId, orElse: () => null);
    return (prize != null)
        ? (prize.alertPicUrl != null && prize.alertPicUrl.isNotEmpty)
            ? prize.alertPicUrl
            : 'images/turntable/${prize.alertPic}.png'
        : '';
  }

  int getPrizeIndex(int id) {
    RollerPrizeModel prize = rollerData.prizes
        .singleWhere((element) => element.id == id, orElse: () => null);
    return rollerData.prizes.indexOf(prize);
  }

  void clearPrize() => prizeId = null;

  Future<void> closeStreams() {
    try {
      return Future.wait([
        _orderController.close(),
        _recordController.close(),
        _requirementController.close(),
      ]);
    } catch (e) {
      MyLogger.warn(
          msg: 'close roller stream error', error: e, tag: 'RollerStore');
      return null;
    }
  }
}
