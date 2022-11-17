import 'package:flutter/material.dart';

import 'package:flutterlearn/bus_app/config/routes.dart';
import 'package:flutterlearn/bus_app/services/routes/AppRouter.dart';
import 'package:flutterlearn/bus_app/styles/style_utils.dart';
import 'package:flutterlearn/bus_app/ui/widgets/misc.dart';
import 'package:flutterlearn/utils/widgets.dart';

class HomeNews extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding:   const EdgeInsets.all(CustomStyles.padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Uwaga!', style: header2(),),
          linePrimary(),
          const Text('Dzisiejszy kurs (2022-09-29) o godzinie 11:45 ma opóźnienie 15 min. Za utrudenienia serdecznie przepraszamy!',
            style:  TextStyle(fontSize: CustomStyles.fsNormal, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
          gap(h:18),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(onPressed: (){ AppRouter().setUrl(UrlNames.news); }, child: Row(
                children: const [
                  Text('Zobacz Aktualności'),
                  Icon(Icons.keyboard_arrow_right),
                ],
              ))
            ],
          ),
        ],
      ),
    );
  }




}