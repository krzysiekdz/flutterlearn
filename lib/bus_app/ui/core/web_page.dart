import 'package:flutter/material.dart';
import 'package:flutterlearn/bus_app/models/routing.dart';
import 'package:flutterlearn/bus_app/utils/types.dart';


abstract class WebPage extends StatelessWidget {

  final ScreenSize screenSize;
  final RouteUrl routeUrl;
  final WebPageParams? params;

  WebPage({super.key, required this.params}):
        screenSize = params!.screenSize,
        routeUrl = params!.routeUrl;

  const WebPage.routeOnly({super.key,  required this.routeUrl, this.screenSize = ScreenSize.undefined, this.params});

}

abstract class WebPageStateful extends StatefulWidget {
  final ScreenSize screenSize;
  final RouteUrl routeUrl;

  WebPageStateful({super.key, required WebPageParams params}) :
    screenSize = params.screenSize,
    routeUrl = params.routeUrl;
}

class WebPageParams {
  final ScreenSize screenSize;
  final RouteUrl routeUrl;
  final Key? key;

  const WebPageParams({ required this.screenSize, required this.routeUrl, this.key });
}