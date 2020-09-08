import 'package:vnum/vnum.dart';

@VnumDefinition
class ToastDuration extends Vnum<Duration> {
  /// duration = 2000ms
  static const ToastDuration SHORT =
      const ToastDuration.define(const Duration(milliseconds: 2000));

  /// duration = 3000ms
  static const ToastDuration DEFAULT =
      const ToastDuration.define(const Duration(milliseconds: 3000));

  /// duration = 5000ms
  static const ToastDuration LONG =
      const ToastDuration.define(const Duration(milliseconds: 5000));

  /// Used for defining cases
  const ToastDuration.define(Duration fromValue) : super.define(fromValue);
}
