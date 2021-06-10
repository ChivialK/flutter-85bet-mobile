import 'dart:convert';

import 'package:flutter_85bet_mobile/features/user/data/models/captcha_model.dart';
import 'package:flutter_test/flutter_test.dart';

import 'fixtures/fixture_reader.dart';

void main() {
  final Map<String, dynamic> captchaJson = json.decode(fixture('captcha.json'));

  test('test decode captcha model', () {
    print('json: $captchaJson\n');
    CaptchaModel model = CaptchaModel.parseJson(captchaJson);
    print('model: $model');
  });
}
