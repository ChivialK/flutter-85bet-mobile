import 'package:logging/logging.dart';
import 'package:meta/meta.dart' show required;

class MyLogger {
  const MyLogger();

  static MyLogger _instance;
  static MyLogger getInstance() {
    if (_instance == null) _instance = new MyLogger();
    return _instance;
  }

  static final Logger _log = Logger('LOG');

  static const String TAG = 'LOG';

  static void print({@required msg, String tag = ''}) =>
      _log.fine(createMessage(msg, tag));

  static void log({@required msg, String tag = ''}) =>
      _log.finer(createMessage(msg, tag));

  static void debug({@required msg, String tag = ''}) =>
      _log.finest(createMessage(msg, tag));

  static void info({@required msg, String tag = ''}) =>
      _log.info(createMessage(msg, tag));

  static void warn({@required msg, String tag = '', Object error}) =>
      _log.warning(createMessage(msg, tag), error);

  static void error({
    @required msg,
    String tag = '',
    Object error,
    StackTrace stackTrace,
  }) =>
      _log.severe(createMessage(msg, tag), error, stackTrace);

  static void wtf({
    @required msg,
    String tag = '',
    Object error,
    StackTrace stackTrace,
  }) =>
      _log.shout(createMessage(msg, tag), error, stackTrace);

  static String createMessage(msg, String tag) =>
      '[${tag.isEmpty ? TAG : tag}] $msg';
}
