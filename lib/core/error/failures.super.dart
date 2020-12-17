// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: return_of_invalid_type, constant_identifier_names, prefer_const_constructors_in_immutables, unnecessary_this, sort_unnamed_constructors_first, join_return_with_assignment, missing_return, lines_longer_than_80_chars

part of 'failures.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class Failure extends Equatable {
  const Failure(this._type);

  factory Failure.network() = Network.create;

  factory Failure.networkLocation() = NetworkLocation.create;

  factory Failure.server() = Server.create;

  factory Failure.jsonFormat() = JsonFormat.create;

  factory Failure.dataType() = DataType.create;

  factory Failure.cachedFile() = CachedFile.create;

  factory Failure.errorMessage({@required String msg}) = ErrorMessage.create;

  factory Failure.errorStatus(RequestStatusModel requestStatusModel) =
      RequestStatusModelWrapper;

  factory Failure.errorCode(RequestCodeModel requestCodeModel) =
      RequestCodeModelWrapper;

  factory Failure.internal(FailureCode failureCode) = FailureCodeWrapper;

  factory Failure.login(RequestStatusModel requestStatusModel) =
      RequestStatusModelWrapper;

  factory Failure.token(FailureType failureType) = FailureTypeWrapper;

  factory Failure.event() = Event.create;

  final _Failure _type;

  /// The [when] method is the equivalent to pattern matching.
  /// Its prototype depends on the _Failure [_type]s defined.
  R when<R extends Object>(
      {@required R Function() network,
      @required R Function() networkLocation,
      @required R Function() server,
      @required R Function() jsonFormat,
      @required R Function() dataType,
      @required R Function() cachedFile,
      @required R Function(ErrorMessage) errorMessage,
      @required R Function(RequestStatusModel) errorStatus,
      @required R Function(RequestCodeModel) errorCode,
      @required R Function(FailureCode) internal,
      @required R Function(RequestStatusModel) login,
      @required R Function(FailureType) token,
      @required R Function() event}) {
    assert(() {
      if (network == null ||
          networkLocation == null ||
          server == null ||
          jsonFormat == null ||
          dataType == null ||
          cachedFile == null ||
          errorMessage == null ||
          errorStatus == null ||
          errorCode == null ||
          internal == null ||
          login == null ||
          token == null ||
          event == null) {
        throw 'check for all possible cases';
      }
      return true;
    }());
    switch (this._type) {
      case _Failure.Network:
        return network();
      case _Failure.NetworkLocation:
        return networkLocation();
      case _Failure.Server:
        return server();
      case _Failure.JsonFormat:
        return jsonFormat();
      case _Failure.DataType:
        return dataType();
      case _Failure.CachedFile:
        return cachedFile();
      case _Failure.ErrorMessage:
        return errorMessage(this as ErrorMessage);
      case _Failure.ErrorStatus:
        return errorStatus(
            (this as RequestStatusModelWrapper).requestStatusModel);
      case _Failure.ErrorCode:
        return errorCode((this as RequestCodeModelWrapper).requestCodeModel);
      case _Failure.Internal:
        return internal((this as FailureCodeWrapper).failureCode);
      case _Failure.Login:
        return login((this as RequestStatusModelWrapper).requestStatusModel);
      case _Failure.Token:
        return token((this as FailureTypeWrapper).failureType);
      case _Failure.Event:
        return event();
    }
  }

  /// The [whenOrElse] method is equivalent to [when], but doesn't require
  /// all callbacks to be specified.
  ///
  /// On the other hand, it adds an extra orElse required parameter,
  /// for fallback behavior.
  R whenOrElse<R extends Object>(
      {R Function() network,
      R Function() networkLocation,
      R Function() server,
      R Function() jsonFormat,
      R Function() dataType,
      R Function() cachedFile,
      R Function(ErrorMessage) errorMessage,
      R Function(RequestStatusModel) errorStatus,
      R Function(RequestCodeModel) errorCode,
      R Function(FailureCode) internal,
      R Function(RequestStatusModel) login,
      R Function(FailureType) token,
      R Function() event,
      @required R Function(Failure) orElse}) {
    assert(() {
      if (orElse == null) {
        throw 'Missing orElse case';
      }
      return true;
    }());
    switch (this._type) {
      case _Failure.Network:
        if (network == null) break;
        return network();
      case _Failure.NetworkLocation:
        if (networkLocation == null) break;
        return networkLocation();
      case _Failure.Server:
        if (server == null) break;
        return server();
      case _Failure.JsonFormat:
        if (jsonFormat == null) break;
        return jsonFormat();
      case _Failure.DataType:
        if (dataType == null) break;
        return dataType();
      case _Failure.CachedFile:
        if (cachedFile == null) break;
        return cachedFile();
      case _Failure.ErrorMessage:
        if (errorMessage == null) break;
        return errorMessage(this as ErrorMessage);
      case _Failure.ErrorStatus:
        if (errorStatus == null) break;
        return errorStatus(
            (this as RequestStatusModelWrapper).requestStatusModel);
      case _Failure.ErrorCode:
        if (errorCode == null) break;
        return errorCode((this as RequestCodeModelWrapper).requestCodeModel);
      case _Failure.Internal:
        if (internal == null) break;
        return internal((this as FailureCodeWrapper).failureCode);
      case _Failure.Login:
        if (login == null) break;
        return login((this as RequestStatusModelWrapper).requestStatusModel);
      case _Failure.Token:
        if (token == null) break;
        return token((this as FailureTypeWrapper).failureType);
      case _Failure.Event:
        if (event == null) break;
        return event();
    }
    return orElse(this);
  }

  /// The [whenPartial] method is equivalent to [whenOrElse],
  /// but non-exhaustive.
  void whenPartial(
      {void Function() network,
      void Function() networkLocation,
      void Function() server,
      void Function() jsonFormat,
      void Function() dataType,
      void Function() cachedFile,
      void Function(ErrorMessage) errorMessage,
      void Function(RequestStatusModel) errorStatus,
      void Function(RequestCodeModel) errorCode,
      void Function(FailureCode) internal,
      void Function(RequestStatusModel) login,
      void Function(FailureType) token,
      void Function() event}) {
    assert(() {
      if (network == null &&
          networkLocation == null &&
          server == null &&
          jsonFormat == null &&
          dataType == null &&
          cachedFile == null &&
          errorMessage == null &&
          errorStatus == null &&
          errorCode == null &&
          internal == null &&
          login == null &&
          token == null &&
          event == null) {
        throw 'provide at least one branch';
      }
      return true;
    }());
    switch (this._type) {
      case _Failure.Network:
        if (network == null) break;
        return network();
      case _Failure.NetworkLocation:
        if (networkLocation == null) break;
        return networkLocation();
      case _Failure.Server:
        if (server == null) break;
        return server();
      case _Failure.JsonFormat:
        if (jsonFormat == null) break;
        return jsonFormat();
      case _Failure.DataType:
        if (dataType == null) break;
        return dataType();
      case _Failure.CachedFile:
        if (cachedFile == null) break;
        return cachedFile();
      case _Failure.ErrorMessage:
        if (errorMessage == null) break;
        return errorMessage(this as ErrorMessage);
      case _Failure.ErrorStatus:
        if (errorStatus == null) break;
        return errorStatus(
            (this as RequestStatusModelWrapper).requestStatusModel);
      case _Failure.ErrorCode:
        if (errorCode == null) break;
        return errorCode((this as RequestCodeModelWrapper).requestCodeModel);
      case _Failure.Internal:
        if (internal == null) break;
        return internal((this as FailureCodeWrapper).failureCode);
      case _Failure.Login:
        if (login == null) break;
        return login((this as RequestStatusModelWrapper).requestStatusModel);
      case _Failure.Token:
        if (token == null) break;
        return token((this as FailureTypeWrapper).failureType);
      case _Failure.Event:
        if (event == null) break;
        return event();
    }
  }

  @override
  List<Object> get props => const [];
}

@immutable
abstract class Network extends Failure {
  const Network() : super(_Failure.Network);

  factory Network.create() = _NetworkImpl;
}

@immutable
class _NetworkImpl extends Network {
  const _NetworkImpl() : super();

  @override
  String toString() => 'Network()';
}

@immutable
abstract class NetworkLocation extends Failure {
  const NetworkLocation() : super(_Failure.NetworkLocation);

  factory NetworkLocation.create() = _NetworkLocationImpl;
}

@immutable
class _NetworkLocationImpl extends NetworkLocation {
  const _NetworkLocationImpl() : super();

  @override
  String toString() => 'NetworkLocation()';
}

@immutable
abstract class Server extends Failure {
  const Server() : super(_Failure.Server);

  factory Server.create() = _ServerImpl;
}

@immutable
class _ServerImpl extends Server {
  const _ServerImpl() : super();

  @override
  String toString() => 'Server()';
}

@immutable
abstract class JsonFormat extends Failure {
  const JsonFormat() : super(_Failure.JsonFormat);

  factory JsonFormat.create() = _JsonFormatImpl;
}

@immutable
class _JsonFormatImpl extends JsonFormat {
  const _JsonFormatImpl() : super();

  @override
  String toString() => 'JsonFormat()';
}

@immutable
abstract class DataType extends Failure {
  const DataType() : super(_Failure.DataType);

  factory DataType.create() = _DataTypeImpl;
}

@immutable
class _DataTypeImpl extends DataType {
  const _DataTypeImpl() : super();

  @override
  String toString() => 'DataType()';
}

@immutable
abstract class CachedFile extends Failure {
  const CachedFile() : super(_Failure.CachedFile);

  factory CachedFile.create() = _CachedFileImpl;
}

@immutable
class _CachedFileImpl extends CachedFile {
  const _CachedFileImpl() : super();

  @override
  String toString() => 'CachedFile()';
}

@immutable
abstract class ErrorMessage extends Failure {
  const ErrorMessage({@required this.msg}) : super(_Failure.ErrorMessage);

  factory ErrorMessage.create({@required String msg}) = _ErrorMessageImpl;

  final String msg;

  /// Creates a copy of this ErrorMessage but with the given fields
  /// replaced with the new values.
  ErrorMessage copyWith({String msg});
}

@immutable
class _ErrorMessageImpl extends ErrorMessage {
  const _ErrorMessageImpl({@required this.msg}) : super(msg: msg);

  @override
  final String msg;

  @override
  _ErrorMessageImpl copyWith({Object msg = superEnum}) => _ErrorMessageImpl(
        msg: msg == superEnum ? this.msg : msg as String,
      );
  @override
  String toString() => 'ErrorMessage(msg: ${this.msg})';
  @override
  List<Object> get props => [msg];
}

@immutable
class RequestStatusModelWrapper extends Failure {
  const RequestStatusModelWrapper(this.requestStatusModel)
      : super(_Failure.ErrorStatus);

  final RequestStatusModel requestStatusModel;

  @override
  String toString() => 'RequestStatusModelWrapper($requestStatusModel)';
  @override
  List<Object> get props => [requestStatusModel];
}

@immutable
class RequestCodeModelWrapper extends Failure {
  const RequestCodeModelWrapper(this.requestCodeModel)
      : super(_Failure.ErrorCode);

  final RequestCodeModel requestCodeModel;

  @override
  String toString() => 'RequestCodeModelWrapper($requestCodeModel)';
  @override
  List<Object> get props => [requestCodeModel];
}

@immutable
class FailureCodeWrapper extends Failure {
  const FailureCodeWrapper(this.failureCode) : super(_Failure.Internal);

  final FailureCode failureCode;

  @override
  String toString() => 'FailureCodeWrapper($failureCode)';
  @override
  List<Object> get props => [failureCode];
}

@immutable
class FailureTypeWrapper extends Failure {
  const FailureTypeWrapper(this.failureType) : super(_Failure.Token);

  final FailureType failureType;

  @override
  String toString() => 'FailureTypeWrapper($failureType)';
  @override
  List<Object> get props => [failureType];
}

@immutable
abstract class Event extends Failure {
  const Event() : super(_Failure.Event);

  factory Event.create() = _EventImpl;
}

@immutable
class _EventImpl extends Event {
  const _EventImpl() : super();

  @override
  String toString() => 'Event()';
}
