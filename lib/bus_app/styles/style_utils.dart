import 'package:flutter/material.dart';
import 'package:flutterlearn/bus_app/styles/custom_colors.dart';
import 'package:flutterlearn/utils/AppColors.dart';

class CustomStyles {
  static const double padding = 18;
  static const double fsNormal = 18;
  static const double buttonHeight = 40;

  static const double borderRadius = 12;


  //kolor jasny
  static final AppColors colorsLight = AppColors(
    primary: CustomColors.primary,
    text: Colors.black,
    hint: Colors.grey,
    surface: Colors.white,
    bar: Colors.white,
  );

  //kolor ciemny
  static final AppColors colorsDark = AppColors(
    primary: CustomColors.primary,
    text: Colors.black,
    hint: Colors.grey,
    surface: Colors.white,
    bar: Colors.white,
  );

  //kolor jasny - admin
  static final AppColors adminColorsLight = AppColors(
    primary: CustomColors.primary,
    text: Colors.black,
    textAlt: Colors.white,
    hint: Colors.grey,
    surface: Colors.white,
    bar: CustomColors.primary,
    bottomNav: Colors.white,
  );

  //kolor ciemny - admin
  static final AppColors adminColorsDark = AppColors(
    primary: CustomColors.primary,
    text: Colors.black,
    textAlt: Colors.white,
    hint: Colors.grey,
    surface: Colors.white,
    bar: CustomColors.primary,
    bottomNav: Colors.white,
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

TextStyle header4() {
  return const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
}

TextStyle header4n() {
  return const TextStyle(
    fontSize: 16,
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

BoxDecoration border({Color color = Colors.black}) {
  return BoxDecoration(border: Border.all(color: color, width: 1));
}


