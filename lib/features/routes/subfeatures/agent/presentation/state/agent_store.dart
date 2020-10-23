import 'package:flutter_85bet_mobile/core/mobx_store_export.dart';
import 'package:flutter_85bet_mobile/features/routes/subfeatures/transactions/data/enum/transaction_date_enum.dart';
import 'package:meta/meta.dart' show required;

import '../../data/enum/agent_chart_time_enum.dart';
import '../../data/enum/agent_chart_type_enum.dart';
import '../../data/models/agent_ad_model.dart';
import '../../data/models/agent_chart_model.dart';
import '../../data/models/agent_commission_model.dart';
import '../../data/models/agent_ledger_model.dart';
import '../../data/models/agent_model.dart';
import '../../data/repository/agent_repository.dart';

part 'agent_store.g.dart';

class AgentStore = _AgentStore with _$AgentStore;

enum AgentStoreState { initial, loading, loaded }

abstract class _AgentStore with Store {
  final AgentRepository _repository;
  final StreamController<AgentModel> _agentController =
      StreamController<AgentModel>.broadcast();
  final StreamController<List<AgentCommissionModel>> _commissionController =
      StreamController<List<AgentCommissionModel>>.broadcast();
  final StreamController<List<AgentChartModel>> _reportController =
      StreamController<List<AgentChartModel>>.broadcast();
  final StreamController<AgentLedgerModel> _ledgerController =
      StreamController<AgentLedgerModel>.broadcast();
  final StreamController<List<AgentAdModel>> _adController =
      StreamController<List<AgentAdModel>>.broadcast();
  final StreamController<List<AgentAdModel>> _mergeAdController =
      StreamController<List<AgentAdModel>>.broadcast();

  _AgentStore(this._repository) {
    _agentController.stream.listen((event) {
      debugPrint('agent data: $event');
      if (event == null)
        errorMessage = Failure.jsonFormat().message;
      else
        agentData = event;
    });
    _commissionController.stream.listen((event) {
//      debugPrint('commission data: $event');
      if (event == null) errorMessage = Failure.jsonFormat().message;
    });
    _reportController.stream.listen((event) {
//      debugPrint('report data: $event');
      if (event == null) errorMessage = Failure.jsonFormat().message;
    });
    _ledgerController.stream.listen((event) {
//      debugPrint('ledger data: $event');
      if (event == null) errorMessage = Failure.jsonFormat().message;
    });
    _adController.stream.listen((event) {
//      debugPrint('ad data: $event');
      if (event == null) errorMessage = Failure.jsonFormat().message;
    });
    _mergeAdController.stream.listen((event) {
//      debugPrint('merge ad data: $event');
      if (event == null) errorMessage = Failure.jsonFormat().message;
    });
  }

  @observable
  ObservableFuture<Either<Failure, AgentModel>> _agentFuture;

  Stream<AgentModel> get agentStream => _agentController.stream;
  Stream<List<AgentCommissionModel>> get commissionStream =>
      _commissionController.stream;
  Stream<List<AgentChartModel>> get reportStream => _reportController.stream;
  Stream<AgentLedgerModel> get ledgerStream => _ledgerController.stream;
  Stream<List<AgentAdModel>> get adStream => _adController.stream;
  Stream<List<AgentAdModel>> get mergeAdStream => _mergeAdController.stream;

  @observable
  bool waitForAgentResponse = false;

  @observable
  dynamic mergeAdResult;

  AgentModel agentData;

  @observable
  String errorMessage;

  void setErrorMsg(
          {String msg, bool showOnce = false, FailureType type, int code}) =>
      errorMessage = getErrorMsg(
          from: FailureType.AGENT,
          msg: msg,
          showOnce: showOnce,
          type: type,
          code: code);

  @computed
  AgentStoreState get state {
    // If the user has not yet triggered a action or there has been an error
    if (_agentFuture == null || _agentFuture.status == FutureStatus.rejected) {
      return AgentStoreState.initial;
    }
    // Pending Future means "loading"
    // Fulfilled Future means "loaded"
    return _agentFuture.status == FutureStatus.pending
        ? AgentStoreState.loading
        : AgentStoreState.loaded;
  }

  @action
  Future<void> getAgentData() async {
    if (waitForAgentResponse) return;
    try {
      // Reset the possible previous error message.
      errorMessage = null;
      // Fetch from the repository and wrap the regular Future into an observable.
      _agentFuture = ObservableFuture(_repository.getAgentDetail());
      // ObservableFuture extends Future - it can be awaited and exceptions will propagate as usual.
      await _agentFuture.then((result) {
        debugPrint('agent result: $result');
        result.fold(
          (failure) => setErrorMsg(msg: failure.message, showOnce: true),
          (data) => _agentController.sink.add(data),
        );
      }).whenComplete(() => waitForAgentResponse = false);
    } on Exception {
      waitForAgentResponse = false;
      //errorMessage = "Couldn't fetch description. Is the device online?";
      setErrorMsg(code: 1);
    }
  }

  @action
  Future<void> getAgentQr() async {
    if (waitForAgentResponse) return;
    try {
      // Reset the possible previous error message.
      errorMessage = null;
      waitForAgentResponse = true;
      // ObservableFuture extends Future - it can be awaited and exceptions will propagate as usual.
      await _repository.postAgentStatus().then((result) {
        debugPrint('agent qr result: $result');
        result.fold(
          (failure) => setErrorMsg(msg: failure.message, showOnce: true),
          (data) => _agentController.sink.add(data),
        );
      }).whenComplete(() => waitForAgentResponse = false);
    } on Exception {
      waitForAgentResponse = false;
      //errorMessage = "Couldn't fetch description. Is the device online?";
      setErrorMsg(code: 2);
    }
  }

  @action
  Future<void> getCommission() async {
    if (waitForAgentResponse) return;
    try {
      // Reset the possible previous error message.
      errorMessage = null;
      waitForAgentResponse = true;
      // ObservableFuture extends Future - it can be awaited and exceptions will propagate as usual.
      await _repository.getCommission().then((result) {
        debugPrint('agent commission result: $result');
        result.fold(
          (failure) => setErrorMsg(msg: failure.message, showOnce: true),
          (data) => _commissionController.sink.add(data),
        );
      }).whenComplete(() => waitForAgentResponse = false);
    } on Exception {
      waitForAgentResponse = false;
      //errorMessage = "Couldn't fetch description. Is the device online?";
      setErrorMsg(code: 3);
    }
  }

  @action
  Future<void> getReport({
    @required AgentChartTime time,
    @required AgentChartType type,
  }) async {
    if (waitForAgentResponse) return;
    try {
      // Reset the possible previous error message.
      errorMessage = null;
      _reportController.sink.add([]);
      waitForAgentResponse = true;
      // ObservableFuture extends Future - it can be awaited and exceptions will propagate as usual.
      await _repository.getReport(time: time, type: type).then((result) {
//        debugPrint('agent report result: $result');
        result.fold(
          (failure) => setErrorMsg(msg: failure.message, showOnce: true),
          (data) => _reportController.sink.add(data),
        );
      }).whenComplete(() => waitForAgentResponse = false);
    } on Exception {
      waitForAgentResponse = false;
      //errorMessage = "Couldn't fetch description. Is the device online?";
      setErrorMsg(code: 4);
    }
  }

  @action
  Future<void> getLedger({
    @required String agent,
    @required TransactionDateSelected dateSelected,
    int page = 1,
  }) async {
    if (waitForAgentResponse) return;
    try {
      // Reset the possible previous error message.
      errorMessage = null;
      waitForAgentResponse = true;
      // ObservableFuture extends Future - it can be awaited and exceptions will propagate as usual.
      await _repository
          .getLedger(agent: agent, page: page, dateSelected: dateSelected)
          .then((result) {
        debugPrint('agent ledger result: $result');
        result.fold(
          (failure) => setErrorMsg(msg: failure.message, showOnce: true),
          (data) => _ledgerController.sink.add(data),
        );
      }).whenComplete(() => waitForAgentResponse = false);
    } on Exception {
      waitForAgentResponse = false;
      //errorMessage = "Couldn't fetch description. Is the device online?";
      setErrorMsg(code: 5);
    }
  }

  @action
  Future<void> getAds({bool alsoRequestMergedAds = false}) async {
    if (waitForAgentResponse) return;
    try {
      // Reset the possible previous error message.
      errorMessage = null;
      waitForAgentResponse = true;
      // ObservableFuture extends Future - it can be awaited and exceptions will propagate as usual.
      await _repository.getAds().then((result) {
        debugPrint('agent available ad data: $result');
        result.fold(
          (failure) => setErrorMsg(msg: failure.message, showOnce: true),
          (data) => _adController.sink.add(data),
        );
      }).whenComplete(() {
        if (alsoRequestMergedAds)
          getMergedAds(force: true);
        else
          waitForAgentResponse = false;
      });
    } on Exception {
      waitForAgentResponse = false;
      //errorMessage = "Couldn't fetch description. Is the device online?";
      setErrorMsg(code: 6);
    }
  }

  @action
  Future<void> getMergedAds({bool force = false}) async {
    if (waitForAgentResponse && !force) return;
    try {
      // Reset the possible previous error message.
      errorMessage = null;
      waitForAgentResponse = true;
      // ObservableFuture extends Future - it can be awaited and exceptions will propagate as usual.
      await _repository.getMergeAds().then((result) {
        debugPrint('agent merged ads data: $result');
        result.fold(
          (failure) => setErrorMsg(msg: failure.message, showOnce: true),
          (data) => _mergeAdController.sink.add(data),
        );
      }).whenComplete(() => waitForAgentResponse = false);
    } on Exception {
      waitForAgentResponse = false;
      //errorMessage = "Couldn't fetch description. Is the device online?";
      setErrorMsg(code: 7);
    }
  }

  @action
  Future<void> postAd(int id) async {
    if (waitForAgentResponse) return;
    try {
      // Reset the possible previous error message.
      errorMessage = null;
      waitForAgentResponse = true;
      // ObservableFuture extends Future - it can be awaited and exceptions will propagate as usual.
      await _repository.postAgentAd(id).then((result) {
        debugPrint('merge ad result: $result');
        result.fold(
          (failure) => setErrorMsg(msg: failure.message, showOnce: true),
          (data) {
            if (data.isSuccess) {
              mergeAdResult = data;
              getMergedAds(force: true);
            } else {
              waitForAgentResponse = false;
              errorMessage = data.msg;
            }
          },
        );
      });
    } on Exception {
      waitForAgentResponse = false;
      //errorMessage = "Couldn't fetch description. Is the device online?";
      setErrorMsg(code: 8);
    }
  }

  Future<void> closeStreams() {
    try {
      return Future.wait([
        _agentController.close(),
        _reportController.close(),
        _commissionController.close(),
        _ledgerController.close(),
        _adController.close(),
        _mergeAdController.close(),
      ]);
    } catch (e) {
      MyLogger.warn(
          msg: 'close agent stream error', error: e, tag: 'AgentStore');
      return null;
    }
  }
}
