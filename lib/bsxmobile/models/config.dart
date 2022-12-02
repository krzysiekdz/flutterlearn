
import 'menu_data.dart';

abstract class Config {
  String get appName;
  List<MenuData> get bottomNav;
  String get assets;
  String get pathLogo;
  String get pathAvatar;
  String get versionName;
  double get padding;
}