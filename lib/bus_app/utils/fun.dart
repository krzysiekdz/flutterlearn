import 'package:flutter/material.dart';

import 'package:flutterlearn/bus_app/config/routes.dart';
import 'package:flutterlearn/bus_app/models/routing.dart';
import 'package:flutterlearn/bus_app/utils/types.dart';
import 'package:flutterlearn/bus_app/config/app_config.dart';

ScreenSize resolveScreenSize(BuildContext context) {
  double w = MediaQuery.of(context).size.width;

  if( w <= AppConfig.WIDTH_SM ) { return ScreenSize.sm; }
  else { return ScreenSize.xl; }
}


RouteData getRouteData(String url, List<RouteData> all) {
  bool test(RouteData i) {
    if(i.path == '/') { return url == '/'; }
    else { return url.startsWith(i.path!); }
    //Uri.parse(url); - uzyc tego zamiast powyzszego
  }
  return all.firstWhere( test , orElse: () => not_found);
}

RouteData getRouteDataByIndex(int index, List<RouteData> all) {
  return all.firstWhere((i) => i.index == index, orElse: () => all[0] );
}


