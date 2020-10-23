// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flows_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FlowsStore on _FlowsStore, Store {
  final _$dataListAtom = Atom(name: '_FlowsStore.dataList');

  @override
  List<FlowModel> get dataList {
    _$dataListAtom.reportRead();
    return super.dataList;
  }

  @override
  set dataList(List<FlowModel> value) {
    _$dataListAtom.reportWrite(value, super.dataList, () {
      super.dataList = value;
    });
  }

  final _$waitForPageDataAtom = Atom(name: '_FlowsStore.waitForPageData');

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

  final _$errorMessageAtom = Atom(name: '_FlowsStore.errorMessage');

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

  final _$getRecordAsyncAction = AsyncAction('_FlowsStore.getRecord');

  @override
  Future<dynamic> getRecord({int page = 1}) {
    return _$getRecordAsyncAction.run(() => super.getRecord(page: page));
  }

  @override
  String toString() {
    return '''
dataList: ${dataList},
waitForPageData: ${waitForPageData},
errorMessage: ${errorMessage}
    ''';
  }
}
