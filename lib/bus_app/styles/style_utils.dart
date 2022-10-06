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
    textColor: Colors.white70,
    hintColor: Colors.white70,
    surface: CustomColors.dark,
    barColor: CustomColors.darken,
    isDark: true,
  );

  static TextStyle header() {
    return const TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle header2() {
    return const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle header2n() {
    return const TextStyle(
      fontSize: 24,
    );
  }
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

Widget linePrimary() {
  return Container(
    width: 60,
    height: 4,
    margin: const EdgeInsets.only(top: 12, bottom: 12),
    decoration: const BoxDecoration(
      color: CustomColors.primary,
    ),
  );
}

Widget lineThin({double margin = 12}) {
  return Container(
    width: 100,
    height: 1,
    margin: EdgeInsets.only(top: margin, bottom: margin),
    decoration: const BoxDecoration(
      color: CustomColors.greyLight2,
    ),
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

class CPadding extends StatelessWidget {
  final Widget child;
  const CPadding({super.key,  required this.child });

  @override
  Widget build(BuildContext context) =>  Padding(padding: const EdgeInsets.all(CustomStyles.padding), child: child);
}

Widget buttonLink({required String text, required VoidCallback action }) => OutlinedButton.icon(
    onPressed: (){ action(); },
    icon: Text(text),
    label: const Icon(Icons.keyboard_arrow_right)
);

Widget link({required String text, required VoidCallback action }) => TextButton.icon(
    onPressed: (){ action(); },
    icon: Text(text),
    label: const Icon(Icons.keyboard_arrow_right)
);
