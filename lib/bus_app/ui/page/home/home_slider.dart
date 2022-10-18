import 'package:flutter/material.dart';
import 'package:flutterlearn/bus_app/config/app_config.dart';
import 'package:flutterlearn/bus_app/styles/custom_colors.dart';
import 'package:flutterlearn/bus_app/styles/style_utils.dart';
import 'package:flutterlearn/core/widgets.dart';
import 'package:flutterlearn/styles/Styles.dart';

class HomeSlider extends StatelessWidget {

  final Alignment alignment;

  const HomeSlider({ required this.alignment});

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

           Align(alignment: alignment, child: Opacity(opacity: 0.4, child: Container(width: 250, height: 100, decoration: BoxDecoration(color: Colors.black),))),

           Padding(
             padding: const EdgeInsets.all(8),
             child: Column(
               mainAxisAlignment: getColumnMainAlign(alignment),
               crossAxisAlignment: getColumnCrossAlign(alignment),
               children: [
                 Text('Przewóz osób'.toUpperCase(), style: header().copyWith(color: CustomColors.white, ),),
                 gap(h:2),
                 Row(
                   mainAxisAlignment: getRowMainAlign(alignment),
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
                   Text('Stanisław ', style: header3().copyWith(color: CustomColors.white),),
                   TextStroke(text: 'Gołaś', fillColor: CustomColors.red, strokeColor: CustomColors.white, strokeWidth: 0.5, fontSize: 36),
                 ], )
               ],
             ),
           ),

         ],
       )
     );
  }

  MainAxisAlignment getColumnMainAlign(Alignment alignment) {
    if(alignment == Alignment.topLeft || alignment == Alignment.topCenter || alignment == Alignment.topRight) { return MainAxisAlignment.start; }
    else if(alignment == Alignment.centerLeft || alignment == Alignment.center || alignment == Alignment.centerRight) { return MainAxisAlignment.center; }
    else { return MainAxisAlignment.end; }
  }

  CrossAxisAlignment getColumnCrossAlign(Alignment alignment) {
    if(alignment == Alignment.centerLeft || alignment == Alignment.bottomLeft || alignment == Alignment.topLeft) { return CrossAxisAlignment.start; }
    else if(alignment == Alignment.center || alignment == Alignment.topCenter || alignment == Alignment.bottomCenter) { return CrossAxisAlignment.center; }
    else { return CrossAxisAlignment.end; }
  }

  MainAxisAlignment getRowMainAlign(Alignment alignment) {
    if(alignment == Alignment.centerLeft || alignment == Alignment.bottomLeft || alignment == Alignment.topLeft) { return MainAxisAlignment.start; }
    else if(alignment == Alignment.center || alignment == Alignment.topCenter || alignment == Alignment.bottomCenter) { return MainAxisAlignment.center; }
    else { return MainAxisAlignment.end; }
  }

  CrossAxisAlignment getRowCrossAlign(Alignment alignment) {
    if(alignment == Alignment.topLeft || alignment == Alignment.topCenter || alignment == Alignment.topRight) { return CrossAxisAlignment.start; }
    else if(alignment == Alignment.centerLeft || alignment == Alignment.center || alignment == Alignment.centerRight) { return CrossAxisAlignment.center; }
    else { return CrossAxisAlignment.end; }
  }
}