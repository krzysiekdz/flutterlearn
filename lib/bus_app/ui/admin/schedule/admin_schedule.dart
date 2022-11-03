import 'package:flutter/material.dart';
import 'package:flutterlearn/bus_app/ui/core/web_page.dart';
import 'package:flutterlearn/bus_app/utils/types.dart';



class AdminSchedule extends StatefulWidget {

  final ScreenSize screenSize;

  const AdminSchedule({required this.screenSize, super.key});

@override
State<StatefulWidget> createState() => _AdminScheduleState();
}

class _AdminScheduleState extends State<AdminSchedule> with AutomaticKeepAliveClientMixin<AdminSchedule> {

  @override
  void initState() {
    super.initState();
    print('AdminSchedule: initState()');
  }

  @override
  Widget build(BuildContext context) {
    print('AdminSchedule: build()');

    Widget page;
    if(widget.screenSize == ScreenSize.sm) { page = Center(child: Text('Rozkład small'),); }
    else { page = Center(child: Text('Rozdkład LARGE'),); }

    return page;

  }

  @override
  bool get wantKeepAlive => true;
}