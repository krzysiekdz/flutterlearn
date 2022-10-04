
import 'package:flutter/material.dart';
import 'package:flutterlearn/bus_app/models/routing.dart';
import 'package:flutterlearn/bus_app/ui/admin/admin_scaffold/admin_scaffold_sm.dart';
import 'package:flutterlearn/bus_app/ui/admin/admin_scaffold/admin_scaffold_xl.dart';

import 'package:flutterlearn/bus_app/utils/fun.dart';
import 'package:flutterlearn/bus_app/utils/types.dart';


class AdminScaffold extends StatelessWidget {

  final RouteUrl route;

  const AdminScaffold({Key? key, required this.route}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    print('AdminScaffold : build()');

    //only AdminScaffold|PageScaffold need to resolve screen size, all other widgets know it from it (the same is for other root Scaffolds)
    ScreenSize size = resolveScreenSize(context);

    Widget page;
    if( size == ScreenSize.sm) { page = AdminScaffold_SM(route: route); }
    else { page = AdminScaffold_XL(route: route); }

    return SafeArea(child: page);
  }
}