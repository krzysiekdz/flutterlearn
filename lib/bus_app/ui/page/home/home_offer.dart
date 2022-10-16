import 'package:flutter/material.dart';
import 'package:flutterlearn/bus_app/config/routes.dart';
import 'package:flutterlearn/bus_app/models/car.dart';
import 'package:flutterlearn/bus_app/services/car_service.dart';
import 'package:flutterlearn/bus_app/services/routes/AppRouter.dart';
import 'package:flutterlearn/bus_app/styles/style_utils.dart';
import 'package:flutterlearn/bus_app/ui/widgets/misc.dart';
import 'package:flutterlearn/bus_app/ui/widgets/slider.dart';
import 'package:flutterlearn/core/widgets.dart';
import 'package:flutterlearn/styles/Styles.dart';

class HomeOffer extends StatelessWidget {

  final CarService carService = CarServiceSample();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding:   const EdgeInsets.all(CustomStyles.padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Text('Autobusy', style: header2(),),
          linePrimary(),

          gap(),
          const Text('W ofercie posiadamy 3 autobusy', style: TextStyle(fontWeight: FontWeight.bold),),
          gap(h:18),
          buttonLink(text: 'Szczegóły', action: () { AppRouter().setUrl(UrlNames.offer); }),
          gap(h:18),

          CSlider(
              height: 200,
              items: carService.getCars2().map( (c) => CarHomeSlide(car: c) ).toList()
          ),


        ],
      ),
    );
  }
}

class CarHomeSlide extends StatelessWidget {

  final Car car;

  const CarHomeSlide({required this.car});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Image.asset(car.img[0], height: 150,),
          gap(),
          Text(car.title, style: header3(),)
        ]
    );
  }
}