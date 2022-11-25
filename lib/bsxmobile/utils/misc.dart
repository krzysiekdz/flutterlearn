
import 'package:flutter/material.dart';

Route slideRoute(Widget page) {
  return PageRouteBuilder(
    transitionDuration: const Duration(milliseconds: 300),
    reverseTransitionDuration: const Duration(milliseconds: 300),
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var tween = Tween(begin: const Offset(1, 0), end: Offset.zero)
          .chain(CurveTween(curve: Curves.easeOut));

//      return SlideTransition(position: tween.animate(animation), child: child);

      return SlideTransition(
        position: animation.drive(tween), //tween.animate(animation);
        child: FadeTransition(
          opacity: animation,
          child: child,
        ),
      );
    },
  );
}