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

  late final List<int> data;
  int len = 100;

  @override
  void initState() {
    super.initState();
    print('AdminHome: initState()');

    data = List.filled(len, 0);
    for(int i = 0; i < len; i++) { data[i] = i; }
  }

  @override
  Widget build(BuildContext context) {
    print('AdminHome: build()');

    Widget page;
//    if(widget.screenSize == ScreenSize.sm) { page = Center(child: Text('Home small'),); }
//    else { page = Center(child: Text('Home LARGE'),); }

    //przecwiczyc jak tworzyc ListTiles na rozne sposoby, a potem zrobic list tiles dla home news
    page = ListView.builder(
        itemCount: len,
        itemExtent: 100,
        itemBuilder: (context, i) {
          print('ListTile $i');
          return Card(
              child: ListTile(
                title: Text('Item no $i'),
                tileColor: Colors.lightBlue,
                textColor: Colors.white,
              )
          );
        }
    );

    return page;

  }
}