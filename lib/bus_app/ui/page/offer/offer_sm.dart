import 'package:flutter/material.dart';
import 'package:flutterlearn/bus_app/models/car.dart';
import 'package:flutterlearn/bus_app/styles/style_utils.dart';
import 'package:flutterlearn/bus_app/ui/core/web_page.dart';
import 'package:flutterlearn/bus_app/ui/page/offer/car_card.dart';
import 'package:flutterlearn/core/Functions.dart';
import '../../widgets/header.dart';


class OfferSM extends WebPage {
  final List<Car> cars;
  const OfferSM({super.key, required super.routeUrl, required this.cars}) : super.routeOnly();

  @override
  Widget build(BuildContext context) {
    return Column(
      children:  [
        const Header(title: 'Autobusy'),
        gap(),
        Text(cars[0]?.title ?? '', style: header2n(),),
        Text(cars[1]?.title ?? '', style: header2n(),),
        Text(cars[2]?.title ?? '', style: header2n(),),
      ],
    );
  }
}