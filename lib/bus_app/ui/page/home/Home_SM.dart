import 'package:flutter/material.dart';
import 'package:flutterlearn/bus_app/ui/core/web_page.dart';
import 'package:flutterlearn/bus_app/ui/page/home/home_contact.dart';
import 'package:flutterlearn/bus_app/ui/page/home/home_news.dart';
import 'package:flutterlearn/bus_app/ui/page/home/home_offer.dart';
import 'package:flutterlearn/bus_app/ui/page/home/home_schedule.dart';
import 'package:flutterlearn/bus_app/ui/page/home/home_slider.dart';
import 'package:flutterlearn/core/widgets.dart';


class Home_SM extends WebPage {

  Home_SM.route({required super.routeUrl}) : super.routeOnly();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const HomeSlider(alignment: Alignment.centerLeft,),
          gap(),

          HomeNews(),
          gap(),

          HomeSchedule(),
          gap(),

          HomeOffer(),
          gap(),

          HomeContact()
        ],
      ),
    );
  }


}