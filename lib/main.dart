
import 'package:flutter/material.dart';
import 'package:flutterlearn/bsxmobile/main.dart';
//import 'package:url_strategy/url_strategy.dart';

//import 'bus_app/main.dart';
//import 'organizer_app/main.dart';


void main() {
  print('run main()');

//  setPathUrlStrategy();

  runApp(
//    BusApp()
    BsxApp()
  );
}



//
//import 'dart:async';
//
//
//void main() {
//
//  Stopwatch stopwatch = Stopwatch();
//  stopwatch.start();
//  print('main start');
//  Future.delayed(duration)
//  Timer( const Duration(seconds: 5), () { print('timer callback! , elapsed = ${stopwatch.elapsedMicroseconds}'); } );
//  Timer.periodic( const Duration(seconds: 4), (timer) {
//    print('timer periodic: ${timer.tick}, elapsed: ${stopwatch.elapsedMicroseconds}');
//    if(timer.tick > 10) {
//      timer.cancel();
//      stopwatch.stop();
//    }
//  } );
//  Timer.run(() { print('timer run!, elapsed = ${stopwatch.elapsedMicroseconds}'); });
//  print('main end');
//
//  //zrobic przyklad z nadpisaenim zone dla print; oraz wyrzcenie wyjatku w zone; oraz delay w periodic timer
//}




