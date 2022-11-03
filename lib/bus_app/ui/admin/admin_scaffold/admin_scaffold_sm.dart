
import 'package:flutter/material.dart';
import 'package:flutterlearn/bus_app/config/routes.dart';


import 'package:flutterlearn/bus_app/models/routing.dart';
import 'package:flutterlearn/bus_app/services/routes/AppRouter.dart';
import 'package:flutterlearn/bus_app/ui/core/web_page.dart';
import 'package:flutterlearn/bus_app/utils/fun.dart';
import 'package:flutterlearn/bus_app/utils/types.dart';


class AdminScaffold_SM extends StatefulWidget {

  const AdminScaffold_SM({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AdminSM_State();

}

class _AdminSM_State extends State<AdminScaffold_SM> {

  int selectedTab = 0;
  //zrobic bez uzycia page view - zobaczyc w jaki sposob samemu uzyskam mechanizm zakladek

  @override
  void initState() {
    super.initState();
    print('AdminScaffold_SM : initState()');
  }

  void setTab(int i) {
    setState(() {
      selectedTab = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('AdminScaffold_SM : build()');

    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildBody() {
    return SafeArea(
        child: getViewForTab()
    );
  }

  Widget getViewForTab() {
    RouteData newRoute = getRouteDataByIndex(selectedTab, AdminRoutes.all);
    return newRoute.builder(WebPageParams(
        screenSize: ScreenSize.sm,
        routeUrl: RouteUrl(url: UrlNames.admin, routeData: AdminRoutes.home)
    ));
  }


  Widget _buildBottomNav() {
    return BottomNavigationBar(
      currentIndex: selectedTab,
      type: BottomNavigationBarType.fixed,
      onTap: (int i) { onTapNav(i); },
      items: _buildNavItems(),
    );
  }

  void onTapNav( int i) {
    setTab(i);
  }

  List<BottomNavigationBarItem> _buildNavItems() {
    return AdminRoutes.all.map((e) =>
        BottomNavigationBarItem( icon: Icon(e.icon), label: e.captionShort )
    ).toList();
  }
}

