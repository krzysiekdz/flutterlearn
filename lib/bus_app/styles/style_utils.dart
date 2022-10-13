import 'package:flutter/material.dart';
import 'package:flutterlearn/bus_app/styles/custom_colors.dart';
import 'package:flutterlearn/core/AppColors.dart';

class CustomStyles {
  static const double padding = 18;
  static const double fsNormal = 18;


  //kolor jasny
  static final AppColors colorsLight = AppColors(
    primary: CustomColors.primary,
    textColor: Colors.black,
    hintColor: Colors.grey,
    surface: Colors.white,
    barColor: Colors.white,
  );

  //kolor ciemny
  static final AppColors colorsDark = AppColors(
    primary: CustomColors.primary,
    textColor: Colors.black,
    hintColor: Colors.grey,
    surface: Colors.white,
    barColor: Colors.white,
  );

//  static final AppColors colorsDark = AppColors(
//    primary: CustomColors.primary,
//    textColor: Colors.white70,
//    hintColor: Colors.white70,
//    surface: CustomColors.dark,
//    barColor: CustomColors.darken,
//    isDark: true,
//  );

}

TextStyle header() {
  return const TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
  );
}

TextStyle header2() {
  return const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );
}

TextStyle header2n() {
  return const TextStyle(
    fontSize: 24,
  );
}

TextStyle header3() {
  return const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
}

TextStyle header3n() {
  return const TextStyle(
    fontSize: 20,
  );
}


BoxDecoration boxDecoration() {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(12),
    border: Border.all(color: Colors.grey, width: 1),
    boxShadow: const [
      BoxShadow(
        color: Colors.grey,
        offset: Offset(2, 2),
        blurRadius: 2,
        spreadRadius: 0.5,
      ),
      BoxShadow(
        color: Colors.white,
        offset: Offset(0, 0),
        blurRadius: 0,
        spreadRadius: 0,
      ),
    ],
  );
}


