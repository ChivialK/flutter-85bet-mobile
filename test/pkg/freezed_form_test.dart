import 'package:flutter_test/flutter_test.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'freezed_form.dart';

void main() {
  test('test freezed form class [equality] and [copy]', () {
    final FreezedForm form1 = FreezedForm('user1', '1234');
    final FreezedForm form2 = FreezedForm('user1', '1234');
    @late
    final FreezedForm form3 = FreezedForm('user2', '1234');

    expect(form1 == form2, true);
    expect(form1 == form3, false);
    print(form1.toString());
    print(form3.copyWith(password: '3456'));
  });

  test('test freezed form class [json]', () {
    final FreezedForm form = FreezedForm('user1', '1234');
    final formJson = {
      "accountcode": "user1",
      "password": "1234",
    };
    expect(FreezedForm.fromJson(formJson), equals(form));
    print(FreezedForm.fromJson(formJson));
    print(form.toJson());
  });

  test('test freezed form class [public operation]', () {
    String performOperation(int operand, FreezedOperation operation) {
      return operation.when(
        add: (value) => '${operand + value}',
        subtract: (value) => '${operand - value}',
        error: (msg) => 'Error: $msg',
      );
    }

    expect(performOperation(5, Add(5)), '10');
    expect(performOperation(5, Subtract(5)), '0');
    expect(performOperation(5, Error('test error')), 'Error: test error');
  });

  test('test freezed form class [nested operation]', () {
    int performOperation(int operand, FreezedNested nested) {
      return nested.when(
          add: (value) => operand + value,
          subtract: (value) => operand - value);
    }

    expect(performOperation(5, FreezedNested.add(5)), 10);
    expect(performOperation(5, FreezedNested.subtract(5)), 0);
  });

  test('test freezed form class [maybe] operation', () {
    int performOperation(int operand, FreezedOperation nested) {
      return nested.maybeWhen(
        add: (value) => operand + value,
        orElse: () => operand,
      );
    }

    expect(performOperation(5, Add(5)), 10);
    expect(performOperation(5, Subtract(5)), 5);
  });

  test('test freezed form class [case] operation', () {
    int performOperation(int operand, FreezedOperation nested) {
      return nested.map(
        add: (caseClass) => operand + caseClass.value,
        subtract: (caseClass) => operand - caseClass.value,
        error: (_) => -1,
      );
    }

    expect(performOperation(5, Add(5)), 10);
    expect(performOperation(5, Subtract(5)), 0);
  });
}
