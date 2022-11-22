import 'package:flutter/material.dart';
import 'package:flutterlearn/bsxmobile/styles/colors.dart';
import 'package:flutterlearn/utils/AppColors.dart';

class CustomStyles {
  static const double padding = 18;
  static const double fsNormal = 18;

  static const double buttonHeight = 60;
  static const double borderRadius = 12;
  static const double gap = 18;


  //kolor jasny
  static final AppColors colorsLight = AppColors(
    primary: Colors.blueAccent,
    textColor: Colors.black,
    hintColor: Colors.grey,
    surface: Colors.white,
    barColor: Colors.white,
  );

  //kolor ciemny
  static final AppColors colorsDark = AppColors(
    primary: Colors.blueAccent,
    textColor: Colors.white70,
    hintColor: Colors.white70,
    surface: CustomColors.dark,
    barColor: CustomColors.darken,
    isDark: true,
  );

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

TextStyle bold() {
  return const TextStyle(fontWeight: FontWeight.bold);
}

Widget gap({double h = CustomStyles.gap, double w = CustomStyles.gap}) {
  return SizedBox(height: h, width: w,);
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


