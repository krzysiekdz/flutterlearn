
import 'package:flutter/material.dart';
import 'package:flutterlearn/bsxmobile/styles/colors.dart';

class CircleImage extends StatelessWidget {

  double radius;
  double border;
  Color borderColor;
  String imgAsset;
  CircleImage({ this.radius = 26, this.border = 2, this.borderColor = CustomColors.greyLightE0, required this.imgAsset });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: borderColor,
      child: CircleAvatar(
        radius: radius-border,
        backgroundImage: Image.asset(imgAsset, fit: BoxFit.fill,).image,
      ),
    );
  }
}