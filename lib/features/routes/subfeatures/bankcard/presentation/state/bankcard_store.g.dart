// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bankcard_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BankcardStore on _BankcardStore, Store {
  Computed<BankcardStoreState> _$stateComputed;

  @override
  BankcardStoreState get state =>
      (_$stateComputed ??= Computed<BankcardStoreState>(() => super.state,
              name: '_BankcardStore.state'))
          .value;

  final _$_bankcardFutureAtom = Atom(name: '_BankcardStore._bankcardFuture');

  @override
  ObservableFuture<Either<Failure, BankcardModel>> get _bankcardFuture {
    _$_bankcardFutureAtom.reportRead();
    return super._bankcardFuture;
  }

  @override
  set _bankcardFuture(ObservableFuture<Either<Failure, BankcardModel>> value) {
    _$_bankcardFutureAtom.reportWrite(value, super._bankcardFuture, () {
      super._bankcardFuture = value;
    });
  }

  final _$bankcardAtom = Atom(name: '_BankcardStore.bankcard');

  @override
  BankcardModel get bankcard {
    _$bankcardAtom.reportRead();
    return super.bankcard;
  }

  @override
  set bankcard(BankcardModel value) {
    _$bankcardAtom.reportWrite(value, super.bankcard, () {
      super.bankcard = value;
    });
  }

  final _$provinceMapAtom = Atom(name: '_BankcardStore.provinceMap');

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

  final _$banksMapAtom = Atom(name: '_BankcardStore.banksMap');

  @override
  Map<String, String> get banksMap {
    _$banksMapAtom.reportRead();
    return super.banksMap;
  }

  @override
  set banksMap(Map<String, String> value) {
    _$banksMapAtom.reportWrite(value, super.banksMap, () {
      super.banksMap = value;
    });
  }

  final _$cityMapAtom = Atom(name: '_BankcardStore.cityMap');

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

  final _$areaMapAtom = Atom(name: '_BankcardStore.areaMap');

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

  final _$waitForNewCardResultAtom =
      Atom(name: '_BankcardStore.waitForNewCardResult');

  @override
  bool get waitForNewCardResult {
    _$waitForNewCardResultAtom.reportRead();
    return super.waitForNewCardResult;
  }

  @override
  set waitForNewCardResult(bool value) {
    _$waitForNewCardResultAtom.reportWrite(value, super.waitForNewCardResult,
        () {
      super.waitForNewCardResult = value;
    });
  }

  final _$newCardResultAtom = Atom(name: '_BankcardStore.newCardResult');

  @override
  RequestCodeModel get newCardResult {
    _$newCardResultAtom.reportRead();
    return super.newCardResult;
  }

  @override
  set newCardResult(RequestCodeModel value) {
    _$newCardResultAtom.reportWrite(value, super.newCardResult, () {
      super.newCardResult = value;
    });
  }

  final _$errorMessageAtom = Atom(name: '_BankcardStore.errorMessage');

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

  final _$getBankcardAsyncAction = AsyncAction('_BankcardStore.getBankcard');

  @override
  Future<void> getBankcard(bool isWithdraw) {
    return _$getBankcardAsyncAction.run(() => super.getBankcard(isWithdraw));
  }

  final _$getBanksAsyncAction = AsyncAction('_BankcardStore.getBanks');

  @override
  Future<void> getBanks() {
    return _$getBanksAsyncAction.run(() => super.getBanks());
  }

  final _$getProvincesAsyncAction = AsyncAction('_BankcardStore.getProvinces');

  @override
  Future<void> getProvinces() {
    return _$getProvincesAsyncAction.run(() => super.getProvinces());
  }

  final _$getCitiesAsyncAction = AsyncAction('_BankcardStore.getCities');

  @override
  Future<void> getCities(String provinceCode, {bool showError = true}) {
    return _$getCitiesAsyncAction
        .run(() => super.getCities(provinceCode, showError: showError));
  }

  final _$getAreasAsyncAction = AsyncAction('_BankcardStore.getAreas');

  @override
  Future<void> getAreas(String cityCode) {
    return _$getAreasAsyncAction.run(() => super.getAreas(cityCode));
  }

  final _$sendRequestAsyncAction = AsyncAction('_BankcardStore.sendRequest');

  @override
  Future<void> sendRequest(BankcardForm form) {
    return _$sendRequestAsyncAction.run(() => super.sendRequest(form));
  }

  @override
  String toString() {
    return '''
bankcard: ${bankcard},
provinceMap: ${provinceMap},
banksMap: ${banksMap},
cityMap: ${cityMap},
areaMap: ${areaMap},
waitForNewCardResult: ${waitForNewCardResult},
newCardResult: ${newCardResult},
errorMessage: ${errorMessage},
state: ${state}
    ''';
  }
}
