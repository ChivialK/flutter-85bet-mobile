import 'dart:async';
import 'dart:io' show Cookie, HttpClient, X509Certificate;

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:dio_flutter_transformer/dio_flutter_transformer.dart';
import 'package:flutter/foundation.dart' show debugPrint;
import 'package:flutter_85bet_mobile/core/error/exceptions.dart';
import 'package:flutter_85bet_mobile/core/internal/global.dart';
import 'package:flutter_85bet_mobile/core/network/interceptors/dio_logger_interceptor.dart';
import 'package:flutter_85bet_mobile/mylogger.dart';

class DioApiService {
  static DioApiService _instance;
  static CookieJar _cookieJar;

  Dio _dio;
  BaseOptions _options;
  CancelToken _cancelToken = new CancelToken();
  static const TAG = 'DioApiService';

  static DioApiService getInstance() {
    if (_instance == null) _instance = new DioApiService();
    return _instance;
  }

  static List<Cookie> loadCookies(Uri uri) => _cookieJar.loadForRequest(uri);

  DioApiService() {
    _options = createOptions(Global.CURRENT_BASE);
    _dio = new Dio(_options);
    _dio.transformer = FlutterTransformer(); // replace dio default transformer
    _dio.interceptors.add(DioLoggerInterceptor());
//    _dio.interceptors.add(createDebugInterceptor());
    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) {
        MyLogger.warn(
          msg: 'host: $host, port: $port, bad X509Certificate:\n'
              'issuer: ${cert.issuer}\n'
              'validity start: ${cert.startValidity}\n'
              'validity end: ${cert.endValidity}\n'
              'sha1: ${cert.sha1}\n',
          tag: TAG,
        );
//        debugPrint('pem: ${cert.pem}\n');
//        debugPrint('der: ${cert.der}\n');
//        debugPrint('subject: ${cert.subject}\n');
//        debugPrint('user agent: ${client.userAgent}\n');
        return true;
      };
      return client;
    };

    _cookieJar = CookieJar();
    _dio.interceptors.add(CookieManager(_cookieJar));
  }

  BaseOptions createOptions(String serviceUrl) {
    return new BaseOptions(
      // 請求基地址,可以包含子路徑
      baseUrl: serviceUrl,
      headers: {
        'Cache-Control': 'no-cache',
        'content-type': 'application/json, text/plain, */*',
      },
      // 連線伺服器超時時間，單位是毫秒.
      connectTimeout: 1000 * 60,
      // 響應流上前後兩次接受到數據的間隔，單位為毫秒。
      receiveTimeout: 1000 * 10,
      // 表示期望以那種格式(方式)接受響應數據。接受4種類型 `json`, `stream`, `plain`, `bytes`. 預設值是 `json`,
      responseType: ResponseType.json,
    );
  }

  InterceptorsWrapper createDebugInterceptor() {
    return InterceptorsWrapper(onRequest: (RequestOptions options) {
      debugPrint("請求之前");
      // Do something before request is sent
      return options; //continue
    }, onResponse: (Response response) {
      debugPrint("響應之前");
      // Do something with response data
      return response; // continue
    }, onError: (DioError e) {
      debugPrint("錯誤之前");
      // Do something with response error
      return e; //continue
    });
  }

  /// GET請求
  /// [url]：請求地址
  /// [data]：請求參數
  /// [options]：請求配置
  /// [cancelToken]：取消標識
  Future<Response<dynamic>> get(
    url, {
    data,
    options,
    cancelToken,
    String userToken,
    String agentToken,
    Map<String, dynamic> headers,
  }) async {
    try {
      return await _dio.get(url,
          queryParameters: data,
          options: (userToken != null)
              ? Options(headers: {'JWT-TOKEN': userToken})
              : (agentToken != null)
                  ? Options(headers: {'JWT-TOKEN-AGENT': agentToken})
                  : (headers != null) ? Options(headers: headers) : options,
          cancelToken: cancelToken);
    } on DioError catch (e) {
      throw getErrorType(e);
    }
  }

  /// POST請求
  /// [url]：請求地址
  /// [data]：請求參數
  /// [options]：請求配置
  /// [cancelToken]：取消標識
  Future<Response<dynamic>> post(
    url, {
    param,
    data,
    options,
    cancelToken,
    String userToken,
    String agentToken,
  }) async {
    try {
      return await _dio.post(url,
          queryParameters: param,
          data: data,
          options: (userToken != null)
              ? Options(headers: {'JWT-TOKEN': userToken})
              : (agentToken != null)
                  ? Options(headers: {'JWT-TOKEN-AGENT': agentToken})
                  : options,
          cancelToken: cancelToken);
    } on DioError catch (e) {
      throw getErrorType(e);
    }
  }

  /// POST多請求
  /// [url]：請求地址
  /// [dataList]：多請求參數
  /// [options]：請求配置
  /// [cancelToken]：取消標識
  Future<Map<String, dynamic>> postList(
    url, {
    List dataList,
    List keyList,
    options,
    cancelToken,
    String userToken,
    StreamController<String> stream,
  }) async {
    try {
      for (int i = 0; i < keyList.length; i++) {
        debugPrint('$i: ${keyList[i]}');
      }
      Map<String, dynamic> resultMap = new Map();
      int index = 0;
      debugPrint(
          'start posting ${dataList.length} request. length match: ${dataList.length == keyList.length}');
      await Future.forEach(dataList, (data) async {
        // update progress
        if (stream != null && stream.isClosed == false) {
          stream.sink.add('${index + 1} / ${keyList.length} ${keyList[index]}');
        }
        Response response = await _dio
            .post(url,
                data: data,
                options: (userToken != null)
                    ? Options(headers: {
                        'JWT-TOKEN': userToken,
                      })
                    : options,
                cancelToken: cancelToken)
            .catchError((error) {
          debugPrint('Error ${index + 1}: ${keyList[index]} - $error');
          resultMap[keyList[index].toString()] = 500;
          return null;
        });
        if (response != null) {
          debugPrint('Data $index: ${keyList[index]} - ${response.data}');
          // write result to map
          resultMap[keyList[index].toString()] = response.statusCode;
        }
        index += 1;
      });
      debugPrint('DIO Multi results: $resultMap');
      return resultMap;
    } on DioError catch (e) {
      throw getErrorType(e);
    }
  }

  /// FORM請求
  /// [formMap]：表單資料
  Future<Response<dynamic>> postForm(url, Map<dynamic, dynamic> formMap) async {
    FormData formData = new FormData.fromMap(formMap);
    try {
      return await _dio.post(url, data: formData);
    } on DioError catch (e) {
      throw getErrorType(e);
    }
  }

  void cancelRequests(CancelToken token) {
    try {
      token.cancel("cancelled");
    } on DioError catch (e) {
      throw getErrorType(e);
    }
  }

  /// DOWNLOAD請求
  /// [urlPath]：下載地址
  /// [savePath]：下載目的地
  /// [progressCallback]：下載進度通知
  Future<Response<dynamic>> downloadFile(
      String urlPath, savePath, ProgressCallback progressCallback) async {
    try {
      return await _dio.download(
        urlPath,
        savePath,
        onReceiveProgress: progressCallback,
        cancelToken: _cancelToken,
      );
    } on DioError catch (e) {
      throw getErrorType(e);
    }
  }

  void cancelDownloads() {
    cancelRequests(_cancelToken);
  }

  ServerException getErrorType(DioError e) {
    MyLogger.error(msg: 'request error: ${e.type}', tag: TAG, error: e.error);
    switch (e.type) {
      case DioErrorType.CONNECT_TIMEOUT:
      case DioErrorType.SEND_TIMEOUT:
      case DioErrorType.RECEIVE_TIMEOUT:
        return RequestTimeoutException(e.type.toString());
      case DioErrorType.RESPONSE:
        return ResponseException();
      case DioErrorType.CANCEL:
        return RequestCanceledException();
      case DioErrorType.DEFAULT:
      default:
        return UnknownException();
    }
  }
}
