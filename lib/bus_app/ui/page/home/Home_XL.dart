import 'package:flutter/material.dart';
import 'package:flutterlearn/bus_app/ui/core/web_page.dart';


class Home_XL extends WebPage {
  const Home_XL.route({super.key, required super.routeUrl}) : super.routeOnly();


  @override
  Widget build(BuildContext context) {

    return Container(
      child: Text(routeUrl.url),
    );
  }
}