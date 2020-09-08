import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

import 'dio_mock_adapter.dart';

void main() {
  Dio dio;

  setUp(() {
    dio = Dio();
    // dio.options.baseUrl = MockAdapter.mockBase;
    dio.options.headers = {'User-Agent': 'dartisan', 'XX': '8'};
    dio.httpClientAdapter = MockAdapter();
  });

  group("basic tests", () {
    test("base url in request options", () async {
      Response response;
      response = await dio.get(
        "/test",
        queryParameters: {"id": '12', "name": "wendu"},
        options: RequestOptions(baseUrl: MockAdapter.mockBase),
      );
      expect(response.data["errCode"], 0);
    });
  });
}
