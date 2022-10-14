import 'package:flutter/material.dart';
import 'package:flutterlearn/bus_app/config/app_config.dart';
import 'package:flutterlearn/bus_app/config/routes.dart';
import 'package:flutterlearn/bus_app/services/routes/AppRouter.dart';
import 'package:flutterlearn/bus_app/styles/custom_colors.dart';
import 'package:flutterlearn/bus_app/styles/style_utils.dart';
import 'package:flutterlearn/bus_app/ui/widgets/misc.dart';
import 'package:flutterlearn/core/widgets.dart';
import 'package:flutterlearn/styles/Styles.dart';

import 'dart:math' as math;

class HomeSchedule extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: CustomStyles.padding, left: CustomStyles.padding, right: CustomStyles.padding),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: CustomColors.greyLight,
      ),
      child: Column(
        children: [
          Text('Rozkłady jazdy', style: header2(),),
          linePrimary(),

          Container(
//            decoration: blackBorder(),
            height: 140,
            child: Stack(
              children: [

                Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton.icon(onPressed: (){ AppRouter().setUrl(UrlNames.scheduleSpySzcz); } , icon: const Text('Kurs Spychowo - Szczytno'), label:  const Icon(Icons.keyboard_arrow_right),),
                      gap(),
                      TextButton.icon(onPressed: (){ AppRouter().setUrl(UrlNames.scheduleSzczSpy); } , icon: const Text('Kurs Szczytno - Spychowo'), label:  const Icon(Icons.keyboard_arrow_right),),
                    ],
                  ),
                ),

                Align(alignment: Alignment.bottomRight, child: Opacity(opacity: 0.1, child: Transform(transform: Matrix4.rotationY(2.5), child: Image.asset(AppConfig.path_road_2, )))),

                Align(alignment: Alignment.bottomRight, child: Opacity(opacity: 0.1, child: Image.asset(AppConfig.path_road_2, ))),
              ],
            ),
          )

//          Row(
//              mainAxisAlignment: MainAxisAlignment.spaceBetween,
//              children: [
//                Expanded(
//                  flex: 3,
//                  child: Column(
//                    crossAxisAlignment: CrossAxisAlignment.center,
//                    children: [
//                      TextButton.icon(onPressed: (){ AppRouter().setUrl(UrlNames.scheduleSpySzcz); } , icon: const Text('Kurs Spychowo - Szczytno'), label:  const Icon(Icons.keyboard_arrow_right),),
//                      gap(),
//                      TextButton.icon(onPressed: (){ AppRouter().setUrl(UrlNames.scheduleSzczSpy); } , icon: const Text('Kurs Szczytno - Spychowo'), label:  const Icon(Icons.keyboard_arrow_right),),
//                    ],
//                  ),
//                ),
//                Expanded(flex: 1, child: Opacity(opacity: 0.1, child: Image.asset(AppConfig.path_road, height: 150,)),  )
//              ]
//          ),
        ]
      ),
    );
  }
}