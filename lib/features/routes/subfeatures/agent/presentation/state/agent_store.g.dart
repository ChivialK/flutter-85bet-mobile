// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AgentStore on _AgentStore, Store {
  Computed<AgentStoreState> _$stateComputed;

  @override
  AgentStoreState get state =>
      (_$stateComputed ??= Computed<AgentStoreState>(() => super.state,
              name: '_AgentStore.state'))
          .value;

  final _$_agentFutureAtom = Atom(name: '_AgentStore._agentFuture');

  @override
  ObservableFuture<Either<Failure, AgentModel>> get _agentFuture {
    _$_agentFutureAtom.reportRead();
    return super._agentFuture;
  }

  @override
  set _agentFuture(ObservableFuture<Either<Failure, AgentModel>> value) {
    _$_agentFutureAtom.reportWrite(value, super._agentFuture, () {
      super._agentFuture = value;
    });
  }

  final _$waitForAgentResponseAtom =
      Atom(name: '_AgentStore.waitForAgentResponse');

  @override
  bool get waitForAgentResponse {
    _$waitForAgentResponseAtom.reportRead();
    return super.waitForAgentResponse;
  }

  @override
  set waitForAgentResponse(bool value) {
    _$waitForAgentResponseAtom.reportWrite(value, super.waitForAgentResponse,
        () {
      super.waitForAgentResponse = value;
    });
  }

  final _$mergeAdResultAtom = Atom(name: '_AgentStore.mergeAdResult');

  @override
  dynamic get mergeAdResult {
    _$mergeAdResultAtom.reportRead();
    return super.mergeAdResult;
  }

  @override
  set mergeAdResult(dynamic value) {
    _$mergeAdResultAtom.reportWrite(value, super.mergeAdResult, () {
      super.mergeAdResult = value;
    });
  }

  final _$errorMessageAtom = Atom(name: '_AgentStore.errorMessage');

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  final _$getAgentDataAsyncAction = AsyncAction('_AgentStore.getAgentData');

  @override
  Future<void> getAgentData() {
    return _$getAgentDataAsyncAction.run(() => super.getAgentData());
  }

  final _$getAgentQrAsyncAction = AsyncAction('_AgentStore.getAgentQr');

  @override
  Future<void> getAgentQr() {
    return _$getAgentQrAsyncAction.run(() => super.getAgentQr());
  }

  final _$getCommissionAsyncAction = AsyncAction('_AgentStore.getCommission');

  @override
  Future<void> getCommission() {
    return _$getCommissionAsyncAction.run(() => super.getCommission());
  }

  final _$getReportAsyncAction = AsyncAction('_AgentStore.getReport');

  @override
  Future<void> getReport(
      {@required AgentChartTime time, @required AgentChartType type}) {
    return _$getReportAsyncAction
        .run(() => super.getReport(time: time, type: type));
  }

  final _$getLedgerAsyncAction = AsyncAction('_AgentStore.getLedger');

  @override
  Future<void> getLedger(
      {@required String agent,
      @required TransactionDateSelected dateSelected,
      int page = 1}) {
    return _$getLedgerAsyncAction.run(() =>
        super.getLedger(agent: agent, dateSelected: dateSelected, page: page));
  }

  final _$getAdsAsyncAction = AsyncAction('_AgentStore.getAds');

  @override
  Future<void> getAds({bool alsoRequestMergedAds = false}) {
    return _$getAdsAsyncAction
        .run(() => super.getAds(alsoRequestMergedAds: alsoRequestMergedAds));
  }

  final _$getMergedAdsAsyncAction = AsyncAction('_AgentStore.getMergedAds');

  @override
  Future<void> getMergedAds({bool force = false}) {
    return _$getMergedAdsAsyncAction
        .run(() => super.getMergedAds(force: force));
  }

  final _$postAdAsyncAction = AsyncAction('_AgentStore.postAd');

  @override
  Future<void> postAd(int id) {
    return _$postAdAsyncAction.run(() => super.postAd(id));
  }

  @override
  String toString() {
    return '''
waitForAgentResponse: ${waitForAgentResponse},
mergeAdResult: ${mergeAdResult},
errorMessage: ${errorMessage},
state: ${state}
    ''';
  }
}
