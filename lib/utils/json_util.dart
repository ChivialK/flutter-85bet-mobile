import 'dart:convert';

import 'package:flutter/foundation.dart' show debugPrint;
import 'package:flutter_85bet_mobile/core/error/exceptions.dart';
import 'package:flutter_85bet_mobile/mylogger.dart';
import 'package:flutter_85bet_mobile/utils/regex_util.dart';

class JsonUtil {
  static const String debugTag = 'JsonDecodeUtil';

  static String getRawJson(dynamic jsonStr) =>
      (jsonStr != null) ? '$jsonStr' : '';

  /// trim json [str] to prevent data error while decoding
  static String trimJson(dynamic str) {
    final trimRegex = RegExp(r"\s+\b|\b\s|\n|\r\n|\r|\s|\t");
    final trimRegexSimple = RegExp('r"\n|\r\n|\r|\t"');
    final tagRegex = RegExp('>\\s*<');
    String jsonStr = """$str""";
    bool hasHtmlTag = jsonStr.contains(tagRegex);
    String strBody = (hasHtmlTag)
        ? jsonStr.replaceAll(trimRegexSimple, "").replaceAll('> <', "><")
        : jsonStr.replaceAll(trimRegex, "");
//    debugPrint("trimmed: $strBody");
    if (strBody.isHtmlFormat) throw LocationException();
    return strBody;
  }

  /// Decode json array [str] into [dynamic] List
  static List decodeArray(
    dynamic str, {
    bool returnNullOnError = false,
    bool trim = true,
    String tag = debugTag,
  }) {
    if (str is List) return str;
    final trimmed = (trim) ? trimJson(str) : str;
    if (trimmed.isEmpty) return [];
    try {
      List decoded = jsonDecode(trimmed);
//      debugPrint("Decoded type: ${decoded.runtimeType} Json: $decoded");
      if (decoded.isEmpty && trimmed.isNotEmpty)
        MyLogger.warn(msg: 'decoded data list is empty!!', tag: tag);
      return decoded;
    } catch (e, s) {
      debugPrint('exception: $e');
      if (returnNullOnError) {
        MyLogger.error(msg: 'decode json array error!!', tag: tag);
        return null;
      } else {
        MyLogger.error(
            msg: 'decode json array error!!', stackTrace: s, tag: tag);
        throw JsonFormatException(trimmed);
      }
    }
  }

  ///
  /// Decode json array into list of [T]
  ///
  /// [data] = json data, can be a decoded list or json string
  /// [jsonToModel] = function that transforms the mapped json to model
  /// [tag] = logger tag
  ///
  static List<T> decodeArrayToModel<T>(
    dynamic data,
    Function(Map<String, dynamic> jsonMap) jsonToModel, {
    bool trim = true,
    String tag = debugTag,
  }) {
    MyLogger.print(msg: 'start decoding array data to $T...', tag: tag);
    MyLogger.print(
        msg: 'data type: ${data.runtimeType}, data is List: ${data is List}',
        tag: tag);

    List<dynamic> list;
    if (data is List)
      list = data;
    else if (data is String)
      list = decodeArray(data, trim: trim, tag: tag);
    else
      throw UnknownConditionException();

    // mapped decoded data to model data list
    final dataList = (list.isEmpty)
        ? new List<T>()
        : list.map((model) => jsonToModel(model) as T).toList();

    if (dataList.isEmpty && list.isNotEmpty) {
      MyLogger.error(
          msg: 'mapped model list error!!'
              'data: $data\nmapped json: $list',
          tag: tag);
      throw MapJsonDataException();
    } else {
//      for (int index = 0; index < dataList.length; index++) {
//        debugPrint('mapped data $index: ${dataList[index]}');
//      }
      return dataList;
    }
  }

  ///
  /// Decode json array into list of [T]
  ///
  /// [data] = json data, can be a decoded list or json string
  /// [jsonToModel] = function that transforms the mapped json to model
  /// [tag] = logger tag
  ///
  static List<T> decodeMapToModelList<T>(
    dynamic map,
    Function(Map<String, dynamic> jsonMap) jsonToModel, {
    bool trim = true,
    bool addKey = true,
    String tag = debugTag,
  }) {
//    debugPrint('decodeMapToModelList: $map, type: ${map.runtimeType}');
    if (map == null || map is Map == false) return [];
    MyLogger.debug(msg: 'start decoding map to $T list...', tag: tag);
    List<T> dataList = new List();
    map.forEach((key, value) {
      dataList.add((addKey)
          ? jsonToModel(value).copyWith(key: key)
          : jsonToModel(value));
    });
    if (dataList.isEmpty) {
      MyLogger.error(
          msg: 'mapped model list error!! mapped json: $map', tag: tag);
      throw MapJsonDataException();
    } else {
//      for (int index = 0; index < dataList.length; index++) {
//        debugPrint('mapped data $index: ${dataList[index]}');
//      }
      return dataList;
    }
  }

  ///
  /// Decode json into data [T]
  ///
  /// [str] = json string
  /// [jsonToModel] = function that transforms the mapped json to model
  /// [tag] = logger tag
  ///
  static T decodeToModel<T>(
    dynamic str,
    Function(Map<String, dynamic> jsonMap) jsonToModel, {
    bool trim = true,
    String tag = debugTag,
  }) {
    MyLogger.debug(
        msg: 'start decoding ${str.runtimeType} to model $T...', tag: tag);
    Map<String, dynamic> map;
    if (str is Map == false) {
      var trimmed = (trim) ? trimJson(str) : str;
      map = jsonDecode(trimmed);
    } else {
      map = str;
    }
    // transfer decoded data to model data
    try {
      return jsonToModel(map) as T;
    } catch (e, s) {
      debugPrint('decode to model error: $e, stack:\n$s');
      MyLogger.error(
          msg: 'mapped model error!! data: $str\nmapped json: $map',
          stackTrace: s,
          tag: tag);
      throw MapJsonDataException();
    }
  }

  static List encodeToJsonArray(List<dynamic> list) {
    List jsonList = List();
    list.map((item) => jsonList.add(jsonEncode(item))).toList();
    return jsonList;
  }
}
