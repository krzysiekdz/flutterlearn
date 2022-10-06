
import 'package:flutter/material.dart';
import 'package:flutterlearn/bus_app/models/routing.dart';
import 'package:flutterlearn/bus_app/ui/core/web_page.dart';
import 'package:flutterlearn/bus_app/utils/types.dart';

/*
* web widgets should be stateless?  all state is in url?
* */
class PageScaffold_XL extends StatelessWidget {

  final RouteUrl route;

  const PageScaffold_XL({Key? key, required this.route}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    print('PageScaffold_XL : build()');


    return Scaffold(
      appBar: AppBar(
        title: Text('PageScaffold_XL'),
      ),
      body: route.routeData.builder( WebPageParams(screenSize: ScreenSize.xl, routeUrl: route) ),
    );
  }

}