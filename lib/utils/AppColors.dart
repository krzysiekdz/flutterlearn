import 'package:flutter/material.dart';


class AppColors {

  final Color primary;
  final Color barColor;
  final Color surface;

  final Color textColor;
  final Color hintColor;

  final Color dividerColor;

  final bool isDark;

  AppColors({required this.primary, required this.textColor, required this.surface,
        required this.barColor, this.isDark = false, required this.hintColor, this.dividerColor = Colors.grey});


}


