// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'point_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PointStore on _PointStore, Store {
  Computed<PointStoreState> _$stateComputed;

  @override
  PointStoreState get state =>
      (_$stateComputed ??= Computed<PointStoreState>(() => super.state,
              name: '_PointStore.state'))
          .value;

  final _$_initFutureAtom = Atom(name: '_PointStore._initFuture');

  @override
  ObservableFuture<List<dynamic>> get _initFuture {
    _$_initFutureAtom.reportRead();
    return super._initFuture;
  }

  @override
  set _initFuture(ObservableFuture<List<dynamic>> value) {
    _$_initFutureAtom.reportWrite(value, super._initFuture, () {
      super._initFuture = value;
    });
  }

  final _$provinceMapAtom = Atom(name: '_PointStore.provinceMap');

  @override
  Map<String, String> get provinceMap {
    _$provinceMapAtom.reportRead();
    return super.provinceMap;
  }

  @override
  set provinceMap(Map<String, String> value) {
    _$provinceMapAtom.reportWrite(value, super.provinceMap, () {
      super.provinceMap = value;
    });
  }

  final _$cityMapAtom = Atom(name: '_PointStore.cityMap');

  @override
  Map<String, String> get cityMap {
    _$cityMapAtom.reportRead();
    return super.cityMap;
  }

  @override
  set cityMap(Map<String, String> value) {
    _$cityMapAtom.reportWrite(value, super.cityMap, () {
      super.cityMap = value;
    });
  }

  final _$areaMapAtom = Atom(name: '_PointStore.areaMap');

  @override
  Map<String, String> get areaMap {
    _$areaMapAtom.reportRead();
    return super.areaMap;
  }

  @override
  set areaMap(Map<String, String> value) {
    _$areaMapAtom.reportWrite(value, super.areaMap, () {
      super.areaMap = value;
    });
  }

  final _$waitForInitializeDataAtom =
      Atom(name: '_PointStore.waitForInitializeData');

  @override
  bool get waitForInitializeData {
    _$waitForInitializeDataAtom.reportRead();
    return super.waitForInitializeData;
  }

  @override
  set waitForInitializeData(bool value) {
    _$waitForInitializeDataAtom.reportWrite(value, super.waitForInitializeData,
        () {
      super.waitForInitializeData = value;
    });
  }

  final _$waitForExchangeAtom = Atom(name: '_PointStore.waitForExchange');

  @override
  bool get waitForExchange {
    _$waitForExchangeAtom.reportRead();
    return super.waitForExchange;
  }

  @override
  set waitForExchange(bool value) {
    _$waitForExchangeAtom.reportWrite(value, super.waitForExchange, () {
      super.waitForExchange = value;
    });
  }

  final _$exchangeResultAtom = Atom(name: '_PointStore.exchangeResult');

  @override
  dynamic get exchangeResult {
    _$exchangeResultAtom.reportRead();
    return super.exchangeResult;
  }

  @override
  set exchangeResult(dynamic value) {
    _$exchangeResultAtom.reportWrite(value, super.exchangeResult, () {
      super.exchangeResult = value;
    });
  }

  final _$waitForRecordAtom = Atom(name: '_PointStore.waitForRecord');

  @override
  bool get waitForRecord {
    _$waitForRecordAtom.reportRead();
    return super.waitForRecord;
  }

  @override
  set waitForRecord(bool value) {
    _$waitForRecordAtom.reportWrite(value, super.waitForRecord, () {
      super.waitForRecord = value;
    });
  }

  final _$errorMessageAtom = Atom(name: '_PointStore.errorMessage');

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

  final _$getInitializeDataAsyncAction =
      AsyncAction('_PointStore.getInitializeData');

  @override
  Future<void> getInitializeData() {
    return _$getInitializeDataAsyncAction.run(() => super.getInitializeData());
  }

  final _$getProvincesAsyncAction = AsyncAction('_PointStore.getProvinces');

  @override
  Future<void> getProvinces() {
    return _$getProvincesAsyncAction.run(() => super.getProvinces());
  }

  final _$getCitiesAsyncAction = AsyncAction('_PointStore.getCities');

  @override
  Future<void> getCities(String provinceCode, {bool showError = true}) {
    return _$getCitiesAsyncAction
        .run(() => super.getCities(provinceCode, showError: showError));
  }

  final _$getAreasAsyncAction = AsyncAction('_PointStore.getAreas');

  @override
  Future<void> getAreas(String cityCode) {
    return _$getAreasAsyncAction.run(() => super.getAreas(cityCode));
  }

  final _$exchangeProductAsyncAction =
      AsyncAction('_PointStore.exchangeProduct');

  @override
  Future<void> exchangeProduct(StoreExchangeForm form) {
    return _$exchangeProductAsyncAction.run(() => super.exchangeProduct(form));
  }

  final _$getRulesAsyncAction = AsyncAction('_PointStore.getRules');

  @override
  Future<void> getRules() {
    return _$getRulesAsyncAction.run(() => super.getRules());
  }

  final _$getRecordAsyncAction = AsyncAction('_PointStore.getRecord');

  @override
  Future<void> getRecord({StoreExchangeHistoryForm form}) {
    return _$getRecordAsyncAction.run(() => super.getRecord(form: form));
  }

  @override
  String toString() {
    return '''
provinceMap: ${provinceMap},
cityMap: ${cityMap},
areaMap: ${areaMap},
waitForInitializeData: ${waitForInitializeData},
waitForExchange: ${waitForExchange},
exchangeResult: ${exchangeResult},
waitForRecord: ${waitForRecord},
errorMessage: ${errorMessage},
state: ${state}
    ''';
  }
}
