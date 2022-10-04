import 'package:flutter/material.dart';
import 'package:flutterlearn/bus_app/ui/core/web_page.dart';

enum ScreenSize {
  sm,
  xl,
  undefined,
}

typedef WidgetFactory = Widget Function(WebPageParams params);