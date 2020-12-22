import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';

FirebaseAnalytics _analytics;

abstract class GaInterface {
  static set setAnalytics(FirebaseAnalytics ga) => _analytics = ga;

  static FirebaseAnalyticsObserver get getObserver =>
      FirebaseAnalyticsObserver(analytics: _analytics);

  static bool get isAnalyzing => _analytics != null;

  static FirebaseAnalytics get log => _analytics;
}
