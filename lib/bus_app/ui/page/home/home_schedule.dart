import 'package:flutter/material.dart';
import 'package:flutterlearn/bus_app/config/app_config.dart';
import 'package:flutterlearn/bus_app/config/routes.dart';
import 'package:flutterlearn/bus_app/services/routes/AppRouter.dart';
import 'package:flutterlearn/bus_app/styles/custom_colors.dart';
import 'package:flutterlearn/bus_app/styles/style_utils.dart';

class HomeSchedule extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(CustomStyles.padding),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: CustomColors.greyLight,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Rozkłady jazdy', style: CustomStyles.header2(),),
                line(),
                TextButton.icon(onPressed: (){ AppRouter().setUrl(UrlNames.schedule); } , icon: const Text('Kurs Spychowo - Szczytno'), label:  const Icon(Icons.keyboard_arrow_right),),
                TextButton.icon(onPressed: (){ AppRouter().setUrl(UrlNames.schedule); } , icon: const Text('Kurs Szczytno - Spychowo'), label:  const Icon(Icons.keyboard_arrow_right),),
              ],
            ),
          ),
          Expanded(flex: 1, child: Image.asset(AppConfig.path_road,  ),  )
        ]
      ),
    );
  }
}