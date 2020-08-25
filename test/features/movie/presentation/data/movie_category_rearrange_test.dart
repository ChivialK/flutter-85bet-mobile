//import 'package:flutter_85bet_mobile/features/movie/data/models/movie_category_model.dart';
//import 'package:flutter_85bet_mobile/features/movie/presentation/data/movie_category_enum.dart';
//import 'package:flutter_test/flutter_test.dart';
//
//void main() {
//  List headers = [
//    MovieCategoryEnum.COLLECT,
//    MovieCategoryEnum.BUY,
//    MovieCategoryEnum.EXPAND,
//  ];
//
//  List<MovieCategoryModel> categories = [
//    MovieCategoryModel(tid: 1, name: '知名女优', status: '1', sort: 1, count: 0),
//    MovieCategoryModel(tid: 24, name: '重咸系列', status: '1', sort: 2, count: 0),
//    MovieCategoryModel(tid: 25, name: '强暴系列', status: '1', sort: 3, count: 0),
//    MovieCategoryModel(tid: 26, name: '偷拍系列', status: '1', sort: 4, count: 0),
//    MovieCategoryModel(tid: 27, name: '近亲系列', status: '1', sort: 5, count: 0),
//  ];
//
//  void _rearrange4move1(List oldHeaders, int headerCategoryTid) {
//    List newHeaders = oldHeaders;
//    newHeaders.removeAt(2);
//    print('\nafter removed: $newHeaders');
////    int removeCategoryIndex;
//    var category = categories.singleWhere(
//        (element) => element.tid == headerCategoryTid,
//        orElse: () => null);
//    if (category != null) {
////      removeCategoryIndex = categories.indexOf(category);
//      newHeaders.insert(2, category);
//      print('\nnew headers: $newHeaders');
////      var newContent = categories
////        ..removeAt(removeCategoryIndex);
//      var newContent = categories
//        ..retainWhere((element) => element.tid != headerCategoryTid);
//      print('\ncontent list: $newContent');
//    }
//  }
//
//  void _rearrange5move2(List oldHeaders, int headerCategoryTid) {
//    List newHeaders = oldHeaders;
//    newHeaders.removeRange(2, 4);
//    print('\nafter removed: $newHeaders');
//    var category = categories.singleWhere(
//        (element) => element.tid == headerCategoryTid,
//        orElse: () => null);
//    if (category != null) {
//      newHeaders.insert(2, category);
//      var remain = categories
//        ..retainWhere((element) => element.tid != headerCategoryTid);
//      print('\nremain list: $remain');
//      newHeaders.insert(3, remain.first);
//      print('\nnew headers: $newHeaders');
//      var newContent = remain..removeAt(0);
//      print('\ncontent list: $newContent');
//    }
//  }
//
//  test('test movie category rearrange 4', () {
//    List initHeader = new List();
//    initHeader = headers;
//    initHeader.insert(2, categories.first);
//    print('\ninitialized: $initHeader');
//    _rearrange4move1(initHeader, 25);
//  });
//
//  test('test movie category rearrange 5', () {
//    List initHeader = new List();
//    initHeader = headers;
//    initHeader.insertAll(2, categories.take(2));
//    print('\ninitialized: $initHeader');
//    _rearrange5move2(initHeader, 25);
//  });
//}
