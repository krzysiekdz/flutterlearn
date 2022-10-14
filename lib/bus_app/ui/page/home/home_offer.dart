import 'package:flutter/material.dart';
import 'package:flutterlearn/bus_app/styles/style_utils.dart';
import 'package:flutterlearn/bus_app/ui/widgets/misc.dart';
import 'package:flutterlearn/styles/Styles.dart';

class HomeOffer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding:   const EdgeInsets.all(CustomStyles.padding),
      child: Column(
        children: [
          Text('Autobusy', style: header2(),),
          linePrimary(),
        ],
      ),
    );
  }
}