import 'package:flutter/widgets.dart';

class MyStaticPageTransition {
  static const RouteTransitionsBuilder slide = _slide;

  static Widget _slide(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: Offset(1, 0),
        end: Offset(0, 0),
      ).animate(
        CurvedAnimation(
            curve: Interval(0, 0.5, curve: Curves.easeOutCubic),
            parent: animation),
      ),
      child: child,
    );
  }
}
