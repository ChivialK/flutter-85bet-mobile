import 'package:dartz/dartz.dart' show Either, Left, Task;
import 'package:flutter_85bet_mobile/core/error/exceptions.dart';
import 'package:flutter_85bet_mobile/core/error/failures.dart';
import 'package:flutter_85bet_mobile/mylogger.dart';

///Catches [Failure] in a way like catching Exception
///[Failure] will show up as Left(Object) after throw from the Future task
///
/// No longer need to throw an [Exception] then catch and convert it into [Failure]
/// unless the task has the need to trace error stack.
extension TaskX<T extends Either<Object, U>, U> on Task<T> {
  Task<Either<Failure, U>> mapLeftToFailure() {
    return this.map(
      (either) => either.leftMap((obj) {
        try {
          return obj as Failure;
        } catch (e) {
          throw obj;
        }
      }),
    );
  }
}

/// Takes in [T] type [Future], and wrapped it with [Task] method's boilerplate.
/// Though the return type is [dynamic], the Right value type will be [T] when
/// call [Future].then(...) to get the task result.
Future<Either<Failure, dynamic>> runTypedTask<T>(Future<T> future) {
  return Task<T>(() => future)
      .attempt()
      .mapLeftToFailure()
      .run()
      .catchError((e, s) {
//    debugPrint('task has exception: $e');
    MyLogger.error(msg: 'task has exception: $e', tag: 'TaskX', stackTrace: s);
    return Left(Failure.internal(FailureCode(type: FailureType.TASK, code: 4)));
  });
}

/// Takes in [T] type [Future], and wrapped it with [Task] method's boilerplate.
/// Though the return type is [dynamic], the Right value type will be [T] when
/// call [Future].then(...) to get the task result.
///
/// Catch [LocationException] from [JsonUtil] when json data is html.
/// Catch [JsonFormatException] from [JsonUtil] when json decode has error.
/// Catch [MapJsonDataException] if the decoded json cannot be mapped into model entity.
/// Catch [FormatException] if [jsonToModel] returns data different then [T].
///
Future<Either<Failure, dynamic>> runTask(
  Future future, {
  String tag = 'runTask',
}) {
  return Task(() => future).attempt().mapLeftToFailure().run().catchError(
    (e, s) {
//      debugPrint('task has exception: $e, type: ${e.runtimeType}');
      switch (e.runtimeType) {
        case LocationException:
          MyLogger.error(msg: 'task has exception: $e', tag: 'TaskX');
          return Left(Failure.networkLocation());
        case JsonFormatException:
          MyLogger.error(
              msg: 'Json Format Failed!!', tag: tag, error: e, stackTrace: s);
          return Left(Failure.jsonFormat());
        case MapJsonDataException:
          MyLogger.error(
              msg: 'Json Decode Failed!!', tag: tag, error: e, stackTrace: s);
          return Left(Failure.jsonFormat());
        case FormatException:
          MyLogger.wtf(
              msg: 'Data format error!!', tag: tag, error: e, stackTrace: s);
          return Left(Failure.dataType());
        default:
          MyLogger.error(msg: 'task has exception: $e', tag: 'TaskX');
          return Left(
              Failure.internal(FailureCode(type: FailureType.TASK, code: 5)));
      }
    },
  );
}
