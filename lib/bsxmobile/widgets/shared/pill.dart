
import 'package:flutter/material.dart';
import 'package:flutterlearn/bsxmobile/styles/colors.dart';

class Pill extends StatelessWidget {

  Color color;
  Widget child;
  Pill({ this.color = CustomColors.greyLightE0, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(24),
      ),
      padding: const EdgeInsets.fromLTRB(18, 4, 18, 4),
      child: child,
    );
  }
}