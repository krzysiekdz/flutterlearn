import 'package:flutter/material.dart';
import 'package:flutterlearn/bus_app/config/app_config.dart';
import 'package:flutterlearn/bus_app/styles/custom_colors.dart';
import 'package:flutterlearn/bus_app/styles/style_utils.dart';
import 'package:flutterlearn/core/widgets.dart';
import 'package:flutterlearn/styles/Styles.dart';

class HomeSlider extends StatelessWidget {

   @override
  Widget build(BuildContext context) {
     return Container(
       height: 200,
       width: double.infinity,
       padding: const EdgeInsets.all(12),
       decoration: BoxDecoration(
         image: DecorationImage(
           image: Image.asset(AppConfig.path_slider).image,
           fit: BoxFit.fitHeight
         )
       ),
       child: Stack(
         children: [

           Align(alignment: Alignment.bottomLeft, child: Opacity(opacity: 0.4, child: Container(width: 250, height: 140, decoration: BoxDecoration(color: Colors.black),))),

           Padding(
             padding: const EdgeInsets.only(left: 8, bottom: 8),
             child: Column(
               mainAxisAlignment: MainAxisAlignment.end,
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text('Usługi dla ludności', style: header().copyWith(color: CustomColors.white),),
                 gap(),
                 Text('Przewóz osób', style: header2().copyWith(color: CustomColors.white),),
                 gap(),
                 Row( children: [
                   Text('Stanisław ', style: header2().copyWith(color: CustomColors.white),),
                   textStroke(text: 'Gołaś', fillColor: CustomColors.red, strokeColor: CustomColors.white, strokeWidth: 0.5, fontSize: 36),
//                   Text('Gołaś', style: header().copyWith(color: CustomColors.red),),
                 ], )
               ],
             ),
           ),

         ],
       )

//       Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           textStroke(text: 'Usługi dla ludności', fillColor: Colors.white, strokeColor: Colors.black, strokeWidth: 0.5, fontSize: 24),
////           Text('Usługi dla ludności', style: header().copyWith(color: CustomColors.red),),
//           gap(h:6),
////           Text('Przewóz osób', style: header2().copyWith(color: CustomColors.red),),
//           textStroke(text: 'Przewóz osób', fillColor: Colors.white, strokeColor: Colors.black, strokeWidth: 0.5, fontSize: 24),
//           gap(h:6),
////           Text('Stanisław Gołaś', style: header2().copyWith(color: CustomColors.red),),
//           textStroke(text: 'Stanisław Gołaś', fillColor: Colors.white, strokeColor: Colors.black, strokeWidth: 0.5, fontSize: 24),
//         ],
//       ),
     );
  }
}