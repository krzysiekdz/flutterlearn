import 'package:flutter/material.dart';
import 'package:flutterlearn/bus_app/config/routes.dart';
import 'package:flutterlearn/bus_app/services/routes/AppRouter.dart';
import 'package:flutterlearn/bus_app/ui/widgets/misc.dart';
import '../../../services/schedule_service.dart';
import 'package:flutterlearn/bus_app/styles/style_utils.dart';
import 'package:flutterlearn/core/Functions.dart';

import '../../core/web_page.dart';

class ScheduleSelect extends WebPage {
  const ScheduleSelect.route({required super.routeUrl}) : super.routeOnly();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:   [
          CPadding(child: Text('Wybierz kurs', style: header2n())),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: CustomStyles.padding, right: CustomStyles.padding),
            child: Row(
              children: [
                buttonLink(text: ScheduleService.nameSpySzcz, action: () { AppRouter().setUrl(UrlNames.scheduleSpySzcz); }),
                gap(),
                buttonLink(text: ScheduleService.nameSzczSpy, action: () { AppRouter().setUrl(UrlNames.scheduleSzczSpy); }),
                gap(),
                buttonLink(text: 'Szczytno - Olsztyn', action: () { AppRouter().setUrl(UrlNames.schedule + '/szczytno-olsztyn'); }),
              ],
            ),
          )
        ],
      ),
    );
  }
}