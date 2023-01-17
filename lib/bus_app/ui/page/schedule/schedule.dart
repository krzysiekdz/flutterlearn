library bus_page_schedule;

import 'package:flutterlearn/bus_app/bus_app.dart';

part 'schedule_sm.dart';
part 'schedule_select.dart';
part 'schedule_table_3.dart';


class SchedulePage extends WebPage {
  SchedulePage({required super.params});

  @override
  Widget build(BuildContext context) {
    Widget page;
//    if(screenSize == ScreenSize.sm) { page = ScheduleSM.route(routeUrl: routeUrl); }
//    else { page = ScheduleXL.route(routeUrl: routeUrl); }

    page = ScheduleSM.route(routeUrl: routeUrl);

    return SingleChildScrollView(child: page);


  }
}