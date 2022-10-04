import 'package:flutter/material.dart';
import '../core/AppColors.dart';
import 'CustomTheme.dart';

class Styles {

  static TextStyle header() {
    return const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
    );
  }

  static ThemeData getTheme(BuildContext context, AppColors c) {
    return CustomTheme.getTheme(context, c);
  }

}

BoxDecoration blackBorder() {
  return BoxDecoration(border: Border.all(color: Colors.black, width: 1));
}