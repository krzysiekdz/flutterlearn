
import 'package:flutter/material.dart';
import 'package:flutterlearn/bus_app/config/app_config.dart';
import 'package:flutterlearn/bus_app/config/routes.dart';

import 'package:flutterlearn/bus_app/models/routing.dart';
import 'package:flutterlearn/bus_app/services/routes/AppRouter.dart';
import 'package:flutterlearn/bus_app/ui/core/web_page.dart';
import 'package:flutterlearn/bus_app/utils/fun.dart';
import 'package:flutterlearn/bus_app/utils/types.dart';
import 'package:flutterlearn/utils/widgets.dart';
import 'package:url_launcher/url_launcher.dart';


class PageScaffold_SM extends StatelessWidget {

  final RouteUrl route;

  const PageScaffold_SM({Key? key, required this.route}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('PageScaffold_SM : build()');

    return Scaffold(
      appBar: _buildAppBar(context),
      body: route.routeData.builder( WebPageParams(screenSize: ScreenSize.sm, routeUrl: route) ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: route.routeData.index,
        type: BottomNavigationBarType.fixed,
        onTap: (int i) { _onTapNav(i); },
        items: _buildNavItems(),
      ),
    );
  }

  void _onTapNav( int i) {
    RouteData newRoute = getRouteDataByIndex(i, PageRoutes.all);
    AppRouter().setUrl( newRoute.path! );
  }

  List<BottomNavigationBarItem> _buildNavItems() {
    return PageRoutes.all.map((e) =>
        BottomNavigationBarItem( icon: Icon(e.icon), label: e.captionShort )
    ).toList();
  }

  AppBar _buildAppBar(BuildContext context) {
    //route moglby takze zawierac appbar, tak jak zawiera body
    return AppBar(
      title: Image.asset(AppConfig.path_logo, width: 100, height: 40,),
      actions: [
         _buildPhoneButton()
      ],
    );
  }

  Widget _buildPhoneButton() {
    return  Container(
      margin: const EdgeInsets.all(8),
      child: OutlinedButton(
        onPressed: (){ launch('tel://604281529'); },
        child: Row(
          children: [
            const Icon(Icons.phone),
            gap(),
            const Text(AppConfig.phone),
          ],
        ),
      ),
    );
  }

}