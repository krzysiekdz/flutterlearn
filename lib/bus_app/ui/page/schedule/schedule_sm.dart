import 'package:flutter/material.dart';
import 'package:flutterlearn/bus_app/ui/page/schedule/schedule_table_3.dart';
import '../../../data/schedule_data.dart';
import 'package:flutterlearn/core/Functions.dart';
import '../../widgets/header.dart';
import 'package:flutterlearn/bus_app/ui/core/web_page.dart';

class ScheduleSM extends WebPage {
  const ScheduleSM.route({required super.routeUrl}) : super.route();

  @override
  Widget build(BuildContext context) {
    return Column(
      children:   [
         const Header(title: 'Rozkłady jazdy'),
//         gap(h:48),
         ScheduleTable3(data: ScheduleData.spy_szcz),
      ],
    );
  }
}