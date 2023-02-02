import 'package:flutter/material.dart';


class AppColors {

  final Color primary;
  final Color bar;
  final Color? bottomNav;
  final Color surface;
  final Color listTile;

  final Color text;
  final Color? textAlt;
  final Color hint;

  final Color divider;
  final Color splash;

  final bool isDark;

  AppColors({
    required this.primary,
    required this.text,
    required this.surface,
    required this.bar,

    this.isDark = false,

    this.divider = Colors.grey,
    this.hint = Colors.grey,
    this.splash = Colors.grey,
    this.listTile = Colors.white,
    this.bottomNav,
    this.textAlt,
  });


}


