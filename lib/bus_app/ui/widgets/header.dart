import 'package:flutter/material.dart';
import 'package:flutterlearn/bus_app/styles/custom_colors.dart';
import 'package:flutterlearn/bus_app/styles/style_utils.dart';

class Header extends StatelessWidget {

  final String title;

  const Header({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: CustomColors.greyLight),
      height: 120,
      width: double.infinity,
      padding: const EdgeInsets.only(left: CustomStyles.padding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: CustomStyles.header(),),
          line(),
        ],
      ),
    );
  }

}