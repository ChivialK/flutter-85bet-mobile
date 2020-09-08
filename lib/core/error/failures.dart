import 'package:flutter_85bet_mobile/core/internal/local_strings.dart';
import 'package:flutter_85bet_mobile/core/network/handler/request_code_model.dart';
import 'package:flutter_85bet_mobile/core/network/handler/request_status_model.dart'
    show RequestStatusModel;
import 'package:super_enum/super_enum.dart';

import 'failure_code.dart';

export 'failure_code.dart';

part 'failures.g.dart';

@superEnum
enum _Failure {
  @object
  Network,
  @object
  NetworkLocation,
  @object
  Server,
  @object
  JsonFormat,
  @object
  DataType,
  @object
  CachedFile,
  @Data(fields: [
    DataField<String>('msg'),
  ])
  ErrorMessage,
  @UseClass(RequestStatusModel)
  ErrorStatus,
  @UseClass(RequestCodeModel)
  ErrorCode,
  @UseClass(FailureCode)
  Internal,
  @UseClass(RequestStatusModel)
  Login,
  @UseClass(FailureType)
  Token,
  @object
  Event,
}

extension FailureExtension on Failure {
  int get typeIndex => this._type.index;

  String get message {
    switch (this._type) {
      case _Failure.Network:
        return localeStr.messageErrorNoNetwork;
      case _Failure.NetworkLocation:
        return localeStr.messageWarnNetworkLocation;
      case _Failure.Server:
        return localeStr.messageErrorNoServerConnection;
      case _Failure.JsonFormat:
        return localeStr.messageErrorServerData;
      case _Failure.Login:
        return localeStr.messageLoginFailed + '(${this.props.first.msg})';
      case _Failure.Token:
        return localeStr.messageErrorToken +
            '(code: ${this.props.first.value})';
      case _Failure.Event:
        return localeStr.messageErrorEvent;
      case _Failure.CachedFile:
        return localeStr.messageErrorCachedFile;
      case _Failure.Internal:
        return localeStr.messageErrorInternal +
            '(${this.props.first.errorCode})';
      case _Failure.ErrorMessage:
        return '${this.props.first}';
      case _Failure.ErrorStatus:
        return '${this.props.first.msg}';
      case _Failure.ErrorCode:
        return '${this.props.first.msg}(code: ${this.props.first.code})';
      case _Failure.DataType:
        return localeStr.messageErrorServerData;
      default:
        return _OTHER_FAILURE_MESSAGE;
    }
  }
}

const String _OTHER_FAILURE_MESSAGE = 'Unexpected error';
