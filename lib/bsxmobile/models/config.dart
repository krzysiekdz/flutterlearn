
import 'menu_data.dart';

abstract class Config {
  String get appName;
  List<MenuData> get bottomNav;
  String get assets;
  String get pathLogo;
  double get padding;
}