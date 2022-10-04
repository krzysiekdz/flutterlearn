import 'package:flutter/material.dart';

import 'package:flutterlearn/bus_app/models/routing.dart';
import 'package:flutterlearn/bus_app/utils/fun.dart';
import 'package:flutterlearn/bus_app/utils/types.dart';
import 'PageScaffold_SM.dart';
import 'PageScaffold_XL.dart';

class PageScaffold extends StatelessWidget {

  final RouteUrl route;

  const PageScaffold({Key? key, required this.route}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('PageScaffold : build()');

    //only PageScaffold need to resolve screen size, all other widgets know it from PageScaffold (the same is for other root Scaffolds)
    ScreenSize size = resolveScreenSize(context);

    Widget page;
    if( size == ScreenSize.sm) { page = PageScaffold_SM(route: route); }
//    else { page = PageScaffold_XL(route: route); }
    else { page = PageScaffold_SM(route: route); }

    return SafeArea(child: page);
  }



}