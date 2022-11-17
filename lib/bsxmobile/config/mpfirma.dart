
import 'package:flutter/material.dart';
import 'package:flutterlearn/bsxmobile/models/config.dart';
import 'package:flutterlearn/bsxmobile/models/menu_data.dart';
import 'package:flutterlearn/bsxmobile/ui/mpfirma/home/home.dart';
import 'package:flutterlearn/bsxmobile/ui/mpfirma/modules_menu/modules_menu.dart';
import 'package:flutterlearn/bsxmobile/ui/mpfirma/settings/settings.dart';

class MpFirmaConfig extends Config{

  /*
  * app name
  * */
  @override
  String get appName => 'App';


  /*
  * bottom menu
  * */

  final List<MenuData> _bottomNav = [
    MenuData(builder: (p) => Home(key: p.key), caption: 'Pulpit', icon: Icons.home),
    MenuData(builder: (p) => ModulesMenu(key: p.key), caption: 'Moduły', icon: Icons.view_module),
    MenuData(builder: (p) => Settings(key: p.key,), caption: 'Ustawienia', icon: Icons.settings),
  ];

  @override
  List<MenuData> get bottomNav => _bottomNav;



}