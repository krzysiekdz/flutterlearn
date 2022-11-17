import 'package:flutter/material.dart';
import 'package:flutterlearn/bus_app/models/routing.dart';
import 'package:flutterlearn/bus_app/ui/core/web_page.dart';
import 'package:flutterlearn/bus_app/utils/fun.dart';
import '../../../utils/Styles.dart';


class NotFoundScaffold extends StatelessWidget {

  final RouteUrl route;

  const NotFoundScaffold({super.key, required this.route});


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: route.routeData.builder( WebPageParams(screenSize: resolveScreenSize(context), routeUrl: route) ),
      ),
    );
  }

}

class NotFound extends WebPage {
  NotFound({required super.params});


  @override
  Widget build(BuildContext context) {
//    Widget page;
//    if(screenSize == ScreenSize.sm) { page = Home_SM(); }
//    else { page = Home_XL(); }
//
//    return page;

    return Center(
      child: Text('Nie znaleziono strony: ${routeUrl.url}', style: Styles.header()),
    );
  }
}