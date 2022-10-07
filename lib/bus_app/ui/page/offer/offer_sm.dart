import 'package:flutter/material.dart';
import 'package:flutterlearn/bus_app/ui/core/web_page.dart';
import 'package:flutterlearn/bus_app/ui/page/offer/car_card.dart';
import 'package:flutterlearn/core/Functions.dart';
import '../../widgets/header.dart';


class OfferSM extends WebPage {
  const OfferSM({super.key, required super.routeUrl}) : super.route();

  @override
  Widget build(BuildContext context) {
    return Column(
      children:  [
        const Header(title: 'Autobusy'),
        gap(),
      ],
    );
  }
}