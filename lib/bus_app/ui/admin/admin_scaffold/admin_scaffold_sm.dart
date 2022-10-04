
import 'package:flutter/material.dart';
import 'package:flutterlearn/bus_app/config/routes.dart';


import 'package:flutterlearn/bus_app/models/routing.dart';
import 'package:flutterlearn/bus_app/services/routes/AppRouter.dart';
import 'package:flutterlearn/bus_app/ui/core/web_page.dart';
import 'package:flutterlearn/bus_app/utils/fun.dart';
import 'package:flutterlearn/bus_app/utils/types.dart';

/*
* web widgets should be stateless?  all state is in url?
* */
class AdminScaffold_SM extends StatelessWidget {

  final RouteUrl route;

  const AdminScaffold_SM({Key? key, required this.route}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('AdminScaffold_SM : build()');

    return Scaffold(
      body: route.routeData.builder( WebPageParams(screenSize: ScreenSize.sm, routeUrl: route) ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: route.routeData.index,
        type: BottomNavigationBarType.fixed,
        onTap: (int i) { onTapNav(i); },
        items: _buildNavItems(),
      ),
    );
  }

  void onTapNav( int i) {
    RouteData newRoute = getRouteDataByIndex(i, AdminRoutes.all);
    AppRouter().setNewRoutePath( RouteUrl(url: newRoute.path!, routeData: newRoute) );
  }

  List<BottomNavigationBarItem> _buildNavItems() {
    return AdminRoutes.all.map((e) =>
        BottomNavigationBarItem( icon: Icon(e.icon), label: e.captionShort )
    ).toList();
  }

}