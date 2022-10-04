import 'package:flutter/material.dart';
import 'package:flutterlearn/bus_app/config/app_config.dart';
import 'package:flutterlearn/core/Functions.dart';

class HomeSlider extends StatelessWidget {

   @override
  Widget build(BuildContext context) {
     return Container(
       height: 150,
       width: double.infinity,
       padding: const EdgeInsets.all(12),
       decoration: BoxDecoration(
         image: DecorationImage(
           image: Image.asset(AppConfig.path_slider).image,
           fit: BoxFit.fitHeight
         )
       ),
       child: Column(
         mainAxisAlignment: MainAxisAlignment.end,
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           textStroke(text: 'Usługi dla ludności', fillColor: Colors.white, strokeColor: Colors.black, strokeWidth: 0.5, fontSize: 28),
           gap(h:6),
           textStroke(text: 'Przewóz osób', fillColor: Colors.white, strokeColor: Colors.black, strokeWidth: 0.5, fontSize: 20),
           gap(h:6),
           textStroke(text: 'Stanisław Gołaś', fillColor: Colors.white, strokeColor: Colors.black, strokeWidth: 0.5, fontSize: 24),
         ],
       ),
     );
  }
}