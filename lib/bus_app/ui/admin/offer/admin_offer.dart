import 'package:flutter/material.dart';
import 'package:flutterlearn/bus_app/ui/core/web_page.dart';
import 'package:flutterlearn/bus_app/utils/types.dart';



class AdminOffer extends StatefulWidget {

  final ScreenSize screenSize;

  const AdminOffer({required this.screenSize, super.key});

  @override
  State<StatefulWidget> createState() => _AdminOfferState();

}

class _AdminOfferState extends State<AdminOffer> {

  @override
  void initState() {
    super.initState();
    print('AdminOffer: initState()');
  }

  @override
  Widget build(BuildContext context) {
    print('AdminOffer: build()');

    Widget page;
    if(widget.screenSize == ScreenSize.sm) { page = Center(child: Text('Oferta small'),); }
    else { page = Center(child: Text('Oferta LARGE'),); }

    return page;

  }
}