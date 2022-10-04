import 'package:flutter/material.dart';


class AppColors {

  final Color primary;
  final Color textColor;
  final Color hintColor;
  final Color surface;
  final Color barColor;
//  late final Color? topBarColor;
  final bool isDark;

  AppColors({required this.primary, required this.textColor, required this.surface,
        required this.barColor, this.isDark = false, required this.hintColor})
  {
//    topBarColor ??= barColor; //tutaj nie mozna nadpisywac zmiennej, bo jest juz za pozno, nalezy to zrobic
  //w sekcji inicjalizycyjnej, przed nawiasami {}
  }



}


