/*
import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';

import 'bus_app/main.dart';
//import 'organizer_app/main.dart';


void main() {
  print('run main()');

//  setPathUrlStrategy();

  runApp(
    BusApp()
  );
}
*/



import 'dart:async';

import 'build_own_flutter/material.dart' ;



void main() async {
  Future(() => print('hello world 0'));
  scheduleMicrotask(() => print('hello world1'));
  print('hello world2');
  scheduleMicrotask(() => print('hello world3'));
  print(Zone.current == Zone.root);
  Zone.current.scheduleMicrotask(() { print('hello world4');});

  //doczytac dalej artykul o event loop oraz zones
}


