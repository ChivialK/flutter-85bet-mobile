// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'roller_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RollerStore on _RollerStore, Store {
  Computed<RollerStoreState> _$stateComputed;

  @override
  RollerStoreState get state =>
      (_$stateComputed ??= Computed<RollerStoreState>(() => super.state,
              name: '_RollerStore.state'))
          .value;
  Computed<String> _$getPrizeAlertImgUrlComputed;

  @override
  String get getPrizeAlertImgUrl => (_$getPrizeAlertImgUrlComputed ??=
          Computed<String>(() => super.getPrizeAlertImgUrl,
              name: '_RollerStore.getPrizeAlertImgUrl'))
      .value;

  final _$_dataFutureAtom = Atom(name: '_RollerStore._dataFuture');

  @override
  ObservableFuture<Either<Failure, RollerDataEntity>> get _dataFuture {
    _$_dataFutureAtom.reportRead();
    return super._dataFuture;
  }

  @override
  set _dataFuture(ObservableFuture<Either<Failure, RollerDataEntity>> value) {
    _$_dataFutureAtom.reportWrite(value, super._dataFuture, () {
      super._dataFuture = value;
    });
  }

  final _$countAtom = Atom(name: '_RollerStore.count');

  @override
  int get count {
    _$countAtom.reportRead();
    return super.count;
  }

  @override
  set count(int value) {
    _$countAtom.reportWrite(value, super.count, () {
      super.count = value;
    });
  }

  final _$prizeIdAtom = Atom(name: '_RollerStore.prizeId');

  @override
  int get prizeId {
    _$prizeIdAtom.reportRead();
    return super.prizeId;
  }

  @override
  set prizeId(int value) {
    _$prizeIdAtom.reportWrite(value, super.prizeId, () {
      super.prizeId = value;
    });
  }

  final _$waitForPrizeAtom = Atom(name: '_RollerStore.waitForPrize');

  @override
  bool get waitForPrize {
    _$waitForPrizeAtom.reportRead();
    return super.waitForPrize;
  }

  @override
  set waitForPrize(bool value) {
    _$waitForPrizeAtom.reportWrite(value, super.waitForPrize, () {
      super.waitForPrize = value;
    });
  }

  final _$waitForOrderAtom = Atom(name: '_RollerStore.waitForOrder');

  @override
  bool get waitForOrder {
    _$waitForOrderAtom.reportRead();
    return super.waitForOrder;
  }

  @override
  set waitForOrder(bool value) {
    _$waitForOrderAtom.reportWrite(value, super.waitForOrder, () {
      super.waitForOrder = value;
    });
  }

  final _$waitForRecordAtom = Atom(name: '_RollerStore.waitForRecord');

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

  final _$waitForRequirementAtom =
      Atom(name: '_RollerStore.waitForRequirement');

  @override
  bool get waitForRequirement {
    _$waitForRequirementAtom.reportRead();
    return super.waitForRequirement;
  }

  @override
  set waitForRequirement(bool value) {
    _$waitForRequirementAtom.reportWrite(value, super.waitForRequirement, () {
      super.waitForRequirement = value;
    });
  }

  final _$errorMessageAtom = Atom(name: '_RollerStore.errorMessage');

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

  final _$getInitDataAsyncAction = AsyncAction('_RollerStore.getInitData');

  @override
  Future<dynamic> getInitData() {
    return _$getInitDataAsyncAction.run(() => super.getInitData());
  }

  final _$getOrderAsyncAction = AsyncAction('_RollerStore.getOrder');

  @override
  Future<void> getOrder() {
    return _$getOrderAsyncAction.run(() => super.getOrder());
  }

  final _$getRecordAsyncAction = AsyncAction('_RollerStore.getRecord');

  @override
  Future<void> getRecord() {
    return _$getRecordAsyncAction.run(() => super.getRecord());
  }

  final _$getRequirementAsyncAction =
      AsyncAction('_RollerStore.getRequirement');

  @override
  Future<void> getRequirement() {
    return _$getRequirementAsyncAction.run(() => super.getRequirement());
  }

  final _$getCountAsyncAction = AsyncAction('_RollerStore.getCount');

  @override
  Future<void> getCount() {
    return _$getCountAsyncAction.run(() => super.getCount());
  }

  final _$applyCountAsyncAction = AsyncAction('_RollerStore.applyCount');

  @override
  Future<bool> applyCount(int questId) {
    return _$applyCountAsyncAction.run(() => super.applyCount(questId));
  }

  final _$getPrizeAsyncAction = AsyncAction('_RollerStore.getPrize');

  @override
  Future<void> getPrize() {
    return _$getPrizeAsyncAction.run(() => super.getPrize());
  }

  @override
  String toString() {
    return '''
count: ${count},
prizeId: ${prizeId},
waitForPrize: ${waitForPrize},
waitForOrder: ${waitForOrder},
waitForRecord: ${waitForRecord},
waitForRequirement: ${waitForRequirement},
errorMessage: ${errorMessage},
state: ${state},
getPrizeAlertImgUrl: ${getPrizeAlertImgUrl}
    ''';
  }
}
