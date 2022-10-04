import 'package:flutter/material.dart';
import 'package:flutterlearn/bus_app/ui/core/web_page.dart';
import 'package:flutterlearn/bus_app/ui/page/schedule/schedule_xl.dart';
import 'package:flutterlearn/bus_app/utils/types.dart';

import 'schedule_sm.dart';

class Schedule extends WebPage {
  Schedule({required super.params});

  @override
  Widget build(BuildContext context) {
    Widget page;
//    if(screenSize == ScreenSize.sm) { page = ScheduleSM.route(routeUrl: routeUrl); }
//    else { page = ScheduleXL.route(routeUrl: routeUrl); }

    page = ScheduleSM.route(routeUrl: routeUrl);

    return SingleChildScrollView(child: page);


  }
}