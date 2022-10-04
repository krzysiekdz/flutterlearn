
import 'package:flutter/material.dart';
import 'package:flutterlearn/bus_app/config/routes.dart';
import 'package:flutterlearn/bus_app/models/routing.dart';
import 'package:flutterlearn/bus_app/utils/fun.dart';


class CustomRouteParser  extends RouteInformationParser<RouteUrl> {

  @override
  Future<RouteUrl> parseRouteInformation(RouteInformation routeInformation) async {
    print('CustomRouteParser : parseRouteInformation = ${routeInformation.location}');

    String url = routeInformation.location ?? UrlNames.home;
    return parseUrl(url);
  }

  @override
  RouteInformation? restoreRouteInformation(RouteUrl configuration) {
    print('CustomRouteParser : restoreRouteInformation = ${configuration.url}');

    return RouteInformation(location: configuration.url);
  }


  static RouteUrl parseUrl(String url) {
    RouteData routeData = getRouteData(url, PageRoutes.all);
    if( routeData.isUnknown ) { routeData = getRouteData(url, AdminRoutes.all); }
    return RouteUrl(url: url, routeData: routeData );
  }

}