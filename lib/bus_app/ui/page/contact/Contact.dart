import 'package:flutter/material.dart';
import 'package:flutterlearn/bus_app/ui/core/web_page.dart';
import '../../widgets/header.dart';


class Contact extends WebPage {
  Contact({required super.params});

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Column(
        children: const [

          Header(title: 'Kontakt'),
        ],
      ),
    );
  }




}