import 'package:flutter/foundation.dart' show debugPrint;
import 'package:flutter_85bet_mobile/core/error/failures.dart';
import 'package:flutter_85bet_mobile/features/router/app_global_streams.dart'
    show getAppGlobalStreams;
import 'package:meta/meta.dart' show required;

export 'dart:async' show Stream, StreamController, StreamSubscription;

export 'package:dartz/dartz.dart' show Either, Left, Right;
export 'package:flutter/foundation.dart' show debugPrint;
export 'package:flutter_85bet_mobile/core/error/failures.dart';
export 'package:flutter_85bet_mobile/core/internal/local_strings.dart'
    show localeStr;
export 'package:flutter_85bet_mobile/mylogger.dart';
export 'package:flutter_85bet_mobile/utils/value_util.dart';
export 'package:mobx/mobx.dart';

FailureType _errorFrom;

/// error message from repository
String _lastError;

String getErrorMsg({
  @required FailureType from,
  String msg = '',
  bool showOnce = false,
  FailureType type,
  int code = 0,
}) {
  debugPrint('failure from: ${from.value}, type: ${type?.value}');
  if (msg.contains('code: 82')) {
    String code =
        msg.substring(msg.indexOf('code:')).replaceAll(RegExp('[^0-9]'), '');
    debugPrint('error msg code: $code');
    if (int.parse(code) >= 8200) {
      Future.delayed(Duration(milliseconds: 3000), () {
        getAppGlobalStreams.logout(force: true, navToLogin: true);
      });
      return msg;
    }
  }

  if (showOnce &&
      _errorFrom == from &&
      _lastError != null &&
      msg == _lastError) {
    return null;
  }

  _errorFrom = from;
  if (msg.isNotEmpty) {
    _lastError = msg;
  }
  return msg ??
      Failure.internal(FailureCode(
        type: type ?? from,
        code: code,
      )).message;
}
