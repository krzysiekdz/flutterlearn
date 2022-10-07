import 'package:flutter/material.dart';
import 'package:flutterlearn/bus_app/ui/widgets/misc.dart';
import '../../../services/schedule_service.dart';
import 'package:flutterlearn/bus_app/styles/style_utils.dart';
import 'package:flutterlearn/bus_app/ui/page/schedule/schedule_select.dart';
import 'package:flutterlearn/bus_app/ui/page/schedule/schedule_table_3.dart';
import '../../widgets/header.dart';
import 'package:flutterlearn/bus_app/ui/core/web_page.dart';

class ScheduleSM extends WebPage {
  const ScheduleSM.route({required super.routeUrl}) : super.route();

  @override
  Widget build(BuildContext context) {
    print('Schedule: ${routeUrl.url}');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:   [
         const Header(title: 'Rozkłady jazdy'),
         ScheduleSelect.route(routeUrl: routeUrl),
         if( ScheduleService.notFound(routeUrl.url) ) CPadding(child: Text('Nie znaleziono kursu', style: header2(),)),
         if( ScheduleService.isMatched(routeUrl.url) ) ScheduleTable3(data: scheduleData(), title: title(),), //sprawdzic jeszcze resolveWith
      ],
    );
  }

  String title() {
    return ScheduleService.getTitle(routeUrl.url);
  }

  List<List<String>> scheduleData() {
    return ScheduleService.getData(routeUrl.url);
  }
}