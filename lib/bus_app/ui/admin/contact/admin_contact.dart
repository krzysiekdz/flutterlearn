import 'package:flutter/material.dart';
import 'package:flutterlearn/bus_app/ui/core/web_page.dart';
import 'package:flutterlearn/bus_app/utils/types.dart';



class AdminContact extends StatefulWidget {

  final ScreenSize screenSize;

  const AdminContact({required this.screenSize, super.key});

  @override
  State<StatefulWidget> createState() => _AdminContactState();

}

class _AdminContactState extends State<AdminContact> {

  @override
  void initState() {
    super.initState();
    print('AdminContact: initState()');
  }

  @override
  Widget build(BuildContext context) {
    print('AdminContact: build()');

    Widget page;
    if(widget.screenSize == ScreenSize.sm) { page = Center(child: Text(''),); }
    else { page = Center(child: Text(''),); }

    return page;

  }
}