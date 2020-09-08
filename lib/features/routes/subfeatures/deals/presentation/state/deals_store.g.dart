// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deals_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DealsStore on _DealsStore, Store {
  final _$dataListAtom = Atom(name: '_DealsStore.dataList');

  @override
  List<DealsData> get dataList {
    _$dataListAtom.reportRead();
    return super.dataList;
  }

  @override
  set dataList(List<DealsData> value) {
    _$dataListAtom.reportWrite(value, super.dataList, () {
      super.dataList = value;
    });
  }

  final _$waitForPageDataAtom = Atom(name: '_DealsStore.waitForPageData');

  @override
  bool get waitForPageData {
    _$waitForPageDataAtom.reportRead();
    return super.waitForPageData;
  }

  @override
  set waitForPageData(bool value) {
    _$waitForPageDataAtom.reportWrite(value, super.waitForPageData, () {
      super.waitForPageData = value;
    });
  }

  final _$errorMessageAtom = Atom(name: '_DealsStore.errorMessage');

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

  final _$getRecordAsyncAction = AsyncAction('_DealsStore.getRecord');

  @override
  Future<dynamic> getRecord(DealsForm form) {
    return _$getRecordAsyncAction.run(() => super.getRecord(form));
  }

  @override
  String toString() {
    return '''
dataList: $dataList,
waitForPageData: $waitForPageData,
errorMessage: $errorMessage
    ''';
  }
}
