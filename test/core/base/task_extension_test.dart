import 'package:dartz/dartz.dart';
import 'package:flutter_85bet_mobile/core/base/task_extension.dart';
import 'package:flutter_85bet_mobile/core/error/failures.dart';
import 'package:flutter_test/flutter_test.dart';

Future<String> testFuture() async {
  return Future.delayed(Duration(seconds: 1), () => 'fetch success');
}

Future<int> testFutureInt() async {
  return Future.delayed(Duration(seconds: 1), () => 9);
}

Future<String> testFutureFailure() async {
  return Future.delayed(Duration(seconds: 1), () => throw Failure.network());
}

void main() {
  test('test task extension', () async {
    await Task(() => testFuture())
        .attempt()
        .mapLeftToFailure()
        .run()
        .then((value) => print('test success: $value'));
  });

  test('test task extension failure', () async {
    await Task(() => testFutureFailure())
        .attempt()
        .mapLeftToFailure()
        .run()
        .then((value) => print('test failure: $value'));
  });

  test('test runTask', () async {
    await runTask(testFuture()).then((value) =>
        print('test string task: $value, type: ${value.runtimeType}'));
    await runTask(testFutureInt()).then(
        (value) => print('test int task: $value, type: ${value.runtimeType}'));
    await runTask(testFutureFailure()).then(
        (value) => print('test failure: $value, type: ${value.runtimeType}'));
  });
}
