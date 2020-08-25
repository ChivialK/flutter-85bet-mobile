import 'package:flutter/foundation.dart' show debugPrint;
import 'package:flutter_85bet_mobile/core/base/data_operator.dart';
import 'package:flutter_85bet_mobile/core/error/exceptions.dart';
import 'package:flutter_85bet_mobile/mylogger.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart' show required;

export 'package:hive/hive.dart' show Box;

const String HIVE_ACTION_TAG = 'HIVE action';

Future<Box> getHiveBox(String boxName) async {
  if (!Hive.isBoxOpen(boxName))
    return await Hive.openBox(boxName);
  else
    return Hive.box(boxName);
}

void closeHiveBox(String boxName) {
  if (!Hive.isBoxOpen(boxName)) Hive.box(boxName).close();
}

extension HiveBoxExtension on Box {
  bool hasData() {
    return this.length > 0;
  }

  void debug() {
    debugPrint('debug hive box data: ${this.name}, length:${this.length}');
    if (hasData()) {
      this.toMap().forEach((key, value) {
        debugPrint('$key, $value\n');
      });
    }
  }

  List<T> getData<T>({String logKeyword = 'hive data'}) {
    if (this.hasData() == false) throw HiveDataException();
    try {
      var list = List<T>();
      for (var index = 0; index < length; index++) {
        list.add(getAt(index) as T);
      }
      MyLogger.print(
          msg: 'get cached $logKeyword : $list', tag: HIVE_ACTION_TAG);
      return list;
    } on Exception catch (e) {
      MyLogger.error(
          msg: 'get $logKeyword from hive has exception!!',
          tag: HIVE_ACTION_TAG,
          error: e);
      throw HiveDataException();
    }
  }
}

extension AddListToHiveExtension on List {
  void addAllToHive({
    @required Box box,
    @required String identifier,
  }) {
    try {
      forEach((data) {
//        debugPrint('writing $identifier to hive: $data');
        box.add(data);
      });
    } on Exception catch (e, s) {
      MyLogger.error(
          msg: 'add $identifier list to HIVE has error!! Data: $this',
          tag: HIVE_ACTION_TAG,
          error: e,
          stackTrace: s);
    }
  }

  void addNewToHive<T extends DataOperator>({
    @required Box box,
    @required String identifier,
    @required String filterKey,
  }) {
    var leftovers = this;
    for (var index = 0; index < box.length; index++) {
      var oldData = box.getAt(index) as T;
      var newData = firstWhere(
        // gets the first data that it's id is equal to the old ones
        (data) => data[filterKey] == oldData[filterKey],
        orElse: () => null,
      );
      if (newData == null) {
        box.deleteAt(index);
      } else if (newData != oldData) {
        // if data has changed, replace old data in box
//        debugPrint('replacing hive $identifier: $newData');
        box.putAt(index, newData);
      }
      // remove data from leftovers after processed
      leftovers.remove(newData);
    }
//    debugPrint('checking new data: $leftovers');
    // if the list still has new data, add to hive
    if (leftovers.isNotEmpty)
      leftovers.addAllToHive(box: box, identifier: identifier);
  }
}
