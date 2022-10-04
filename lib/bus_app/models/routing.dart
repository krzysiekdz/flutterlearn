import 'package:flutter/material.dart';
import 'package:flutterlearn/bus_app/utils/types.dart';

class RouteData {
  final String? path;
  final int index;
  final String? captionShort;
  final IconData? icon;
  final WidgetFactory builder;

  const RouteData({
    this.path, required this.builder,
    this.index = 0, this.captionShort, this.icon,
  });

  bool get isUnknown => path == null;
}

class RouteUrl {
  final String url;
  final RouteData routeData;

  RouteUrl({ required this.url, required this.routeData });
}