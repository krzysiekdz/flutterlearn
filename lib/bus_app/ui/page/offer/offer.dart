import 'package:flutter/material.dart';
import 'package:flutterlearn/bus_app/models/car.dart';
import 'package:flutterlearn/bus_app/services/car_service.dart';
import 'package:flutterlearn/bus_app/ui/core/web_page.dart';
import 'package:flutterlearn/bus_app/ui/page/offer/offer_sm.dart';


class Offer extends WebPage {
  Offer({required super.params});

  @override
  Widget build(BuildContext context) => _Offer(params: params!);
}

class _Offer extends WebPageStateful {
  _Offer({required super.params});

  @override
  State<StatefulWidget> createState() => _OfferState();
}

class _OfferState extends State<_Offer> {

  late final CarService carService;
  late final List<Car> cars;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    print('Offer : initState()');

    carService = CarServiceSample();
    initCars();
  }

  void initCars() async {
    cars = await carService.getCars();
    if(!mounted) return;
    setState(() {
      isLoading = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    print('Offer : build()');
    Widget page;
//    if(screenSize == ScreenSize.sm) { page = Home_SM(); }
//    else { page = Home_XL(); }

    if(isLoading) { page = const Center(child:  CircularProgressIndicator()); }
    else { page = SingleChildScrollView(  child: OfferSM(routeUrl: widget.routeUrl, cars: cars)); }

    return page;
  }
}

