

import 'package:flutterlearn/bus_app/models/config.dart';

class AppConfig {
  static const String appName = 'Gołaś';
  static const String phone = '604 281 529';

  static const String path_base = 'assets/images/bus_app/';
  static const String path_logo = '${path_base}logo.png';
  static const String path_slider = '${path_base}slider.jpg';
  static const String path_road = '${path_base}road.png';
  static const String path_road_2 = '${path_base}road2.png';
  static const String path_road_3 = '${path_base}road3.png';

  static const String a1 = '${path_base}a1.jpg';
  static const String a2 = '${path_base}a2.jpg';
  static const String a3 = '${path_base}a3.jpg';
  static const String a4 = '${path_base}a4.jpg';
  static const String a5 = '${path_base}a5.jpg';
  static const String a6 = '${path_base}a6.jpg';
  static const String a7 = '${path_base}a7.jpg';

  static const double WIDTH_SM = 600;
}

class DevConfig extends Config {
  @override
  bool get isDevMode => true;

}

class ProdConfig extends Config {
  @override
  bool get isDevMode => false;

}