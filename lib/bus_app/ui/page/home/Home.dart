import 'package:flutter/material.dart';
import 'package:flutterlearn/bus_app/ui/core/web_page.dart';
import 'package:flutterlearn/bus_app/ui/page/home/Home_SM.dart';
import 'package:flutterlearn/bus_app/ui/page/home/Home_XL.dart';
import 'package:flutterlearn/bus_app/utils/types.dart';



class Home extends WebPage {
  Home({required super.params});


  @override
  Widget build(BuildContext context) {
    Widget page;
    if(screenSize == ScreenSize.sm) { page = Home_SM.route(routeUrl: routeUrl); }
    else { page = Home_XL.route(routeUrl: routeUrl); }

    return page;
  }
}