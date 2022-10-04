import 'package:flutter/material.dart';
import 'package:flutterlearn/bus_app/ui/core/web_page.dart';
import '../../widgets/header.dart';



class News extends WebPage {
  News({required super.params});



  @override
  Widget build(BuildContext context) {
//    Widget page;
//    if(screenSize == ScreenSize.sm) { page = Home_SM(); }
//    else { page = Home_XL(); }
//
//    return page;

    return Container(
      child: Column(
        children: const [

          Header(title: 'Aktualności'),
        ],
      ),
    );
  }
}