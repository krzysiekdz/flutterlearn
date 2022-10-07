import 'package:flutter/material.dart';
import 'package:flutterlearn/bus_app/ui/core/web_page.dart';
import 'package:flutterlearn/bus_app/ui/page/offer/offer_sm.dart';
import '../../widgets/header.dart';


class Offer extends WebPage {
  Offer({required super.params});

  @override
  Widget build(BuildContext context) => _Offer();
}

class _Offer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _OfferState();
}

class _OfferState extends State<_Offer> {

  @override
  Widget build(BuildContext context) {
    Widget page;
//    if(screenSize == ScreenSize.sm) { page = Home_SM(); }
//    else { page = Home_XL(); }
//

    page = OfferSM(routeUrl: routeUrl);

    return SingleChildScrollView(
      child: page,
    );
  }
}