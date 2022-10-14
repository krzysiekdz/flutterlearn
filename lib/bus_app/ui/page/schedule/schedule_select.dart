import 'package:flutter/material.dart';
import 'package:flutterlearn/bus_app/config/routes.dart';
import 'package:flutterlearn/bus_app/services/routes/AppRouter.dart';
import 'package:flutterlearn/bus_app/styles/custom_colors.dart';
import 'package:flutterlearn/bus_app/ui/widgets/misc.dart';
import '../../../services/schedule_service.dart';
import 'package:flutterlearn/bus_app/styles/style_utils.dart';
import 'package:flutterlearn/core/widgets.dart';

import '../../core/web_page.dart';

class ScheduleSelect extends WebPage {
  const ScheduleSelect.route({required super.routeUrl}) : super.routeOnly();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children:   [
          gap(h:18),
          Text('Wybierz kurs', style: header3()),
          gap(h:4),
          renderTextSelected(),
          gap(),
          renderLinkSpySzcz(),
          gap(),
          renderLinkSzczSpy()
        ],
      ),
    );
  }

  Widget renderTextSelected() {
    if(routeUrl.url == UrlNames.schedule || routeUrl.url == UrlNames.scheduleSpySzcz) {
      return const Text('Wybrano: ${ScheduleService.nameSpySzcz}', style: TextStyle(color: CustomColors.primary));
    }
    else if (routeUrl.url == UrlNames.scheduleSzczSpy) {
      return const Text('Wybrano: ${ScheduleService.nameSzczSpy}', style: TextStyle(color: CustomColors.primary));
    }
    else {
      return const SizedBox();
    }
  }

  Widget renderLinkSpySzcz() {
    if(routeUrl.url == UrlNames.schedule || routeUrl.url == UrlNames.scheduleSpySzcz) {
      return selectedLink(text: ScheduleService.nameSpySzcz, action: () {
        AppRouter().setUrl(UrlNames.scheduleSpySzcz);
      });
    }
    else {
      return buttonLink(text: ScheduleService.nameSpySzcz, action: () {
        AppRouter().setUrl(UrlNames.scheduleSpySzcz);
      });
    }
  }

  Widget renderLinkSzczSpy() {
    if (routeUrl.url == UrlNames.scheduleSzczSpy) {
      return selectedLink(text: ScheduleService.nameSzczSpy, action: () {
        AppRouter().setUrl(UrlNames.scheduleSzczSpy);
      });
    }
    else {
      return buttonLink(text: ScheduleService.nameSzczSpy, action: () {
        AppRouter().setUrl(UrlNames.scheduleSzczSpy);
      });
    }

  }
}