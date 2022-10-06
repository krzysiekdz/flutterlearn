import 'package:flutter/material.dart';

import 'package:flutterlearn/bus_app/config/routes.dart';
import 'package:flutterlearn/bus_app/services/routes/AppRouter.dart';
import 'package:flutterlearn/bus_app/styles/style_utils.dart';
import 'package:flutterlearn/core/Functions.dart';

class HomeNews extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding:   const EdgeInsets.all(CustomStyles.padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Uwaga, opóźnienie!', style: CustomStyles.header2(),),
          linePrimary(),
          const Text('Dzisiejszy kurs (2022-09-29) o godzinie 11:45 ma opóźnienie 15 min. Za utrudenienia serdecznie przepraszamy!',
            style:  TextStyle(fontSize: CustomStyles.fsNormal, fontWeight: FontWeight.bold),),
          gap(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
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