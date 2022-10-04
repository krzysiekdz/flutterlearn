import 'package:flutter/material.dart';
import 'package:flutterlearn/bus_app/models/routing.dart';
import 'package:flutterlearn/bus_app/utils/types.dart';


abstract class WebPage extends StatelessWidget {

  final ScreenSize screenSize;
  final RouteUrl routeUrl;

  WebPage({super.key, required WebPageParams params}):
        screenSize = params.screenSize,
        routeUrl = params.routeUrl;

  const WebPage.route({super.key,  required this.routeUrl, this.screenSize = ScreenSize.undefined });

  const WebPage.create({super.key, required this.routeUrl, required this.screenSize});

}

class WebPageParams {
  final ScreenSize screenSize;
  final RouteUrl routeUrl;

  const WebPageParams({ required this.screenSize, required this.routeUrl });
}