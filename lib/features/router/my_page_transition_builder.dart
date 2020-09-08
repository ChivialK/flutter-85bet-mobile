import 'package:flutter/material.dart';

class MyPageTransitionBuilder extends PageTransitionsBuilder {
  @override
  Widget buildTransitions<T>(_, __, animation, ___, child) => SlideTransition(
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
//      FadeTransition(opacity: animation, child: child);
}
