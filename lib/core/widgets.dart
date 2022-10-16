
import 'package:flutter/material.dart';

Widget gap({double? h, double? w}) {
  return SizedBox(height: h ?? 12, width: w ?? 12,);
}

Widget TextStroke({required String text, required Color fillColor, required Color strokeColor, double strokeWidth = 1 , double fontSize = 18}) {
  return Stack(
    children: [
      Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          foreground: Paint()
              ..style = PaintingStyle.fill
              ..color = fillColor,
        ),
      ),

      Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          foreground: Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = strokeWidth
            ..color = strokeColor,
        ),
      ),
    ],
  );
}
