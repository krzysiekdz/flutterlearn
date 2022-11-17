import 'package:flutter/material.dart';
import 'package:flutterlearn/bus_app/models/car.dart';
import 'package:flutterlearn/bus_app/ui/core/web_page.dart';
import 'package:flutterlearn/bus_app/ui/page/offer/car_card.dart';
import 'package:flutterlearn/utils/widgets.dart';
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
        for(Car c in cars ) CarCard(car: c),
      ],
    );
  }
}