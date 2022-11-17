
import 'package:flutter/material.dart';

class MenuData{
  final MenuPageBuilder builder;
  final String caption;
  final IconData icon;

  const MenuData({required this.builder, required this.caption, required this.icon});
}

typedef MenuPageBuilder = Widget Function( MenuPageParams p );

class MenuPageParams {
  BuildContext? context;
  Key? key;
  MenuPageParams({this.context, this.key});
}

