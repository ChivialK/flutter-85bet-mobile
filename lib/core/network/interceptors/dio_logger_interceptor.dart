import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioLoggerInterceptor extends PrettyDioLogger {
  @override
  bool get request => true;

  @override
  bool get requestHeader => false;

  @override
  bool get requestBody => false;

  @override
  bool get responseHeader => false;

  @override
  bool get responseBody => true;

  @override
  bool get compact => true;

  @override
  bool get error => true;

  @override
  int get maxWidth => 60;
}
