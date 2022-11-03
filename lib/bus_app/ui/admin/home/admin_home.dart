import 'package:flutter/material.dart';
import 'package:flutterlearn/bus_app/ui/core/web_page.dart';
import 'package:flutterlearn/bus_app/utils/types.dart';



class AdminHome extends StatefulWidget {

  final ScreenSize screenSize;

  const AdminHome({required this.screenSize, super.key});

  @override
  State<StatefulWidget> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {

  @override
  void initState() {
    super.initState();
    print('AdminHome: initState()');
  }

  @override
  Widget build(BuildContext context) {
    print('AdminHome: build()');

    Widget page;
    if(widget.screenSize == ScreenSize.sm) { page = Center(child: Text('Home small'),); }
    else { page = Center(child: Text('Home LARGE'),); }

    return page;

  }
}