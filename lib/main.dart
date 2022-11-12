
import 'package:flutter/material.dart';
//import 'package:url_strategy/url_strategy.dart';

import 'bus_app/main.dart';
//import 'organizer_app/main.dart';


void main() {
  print('run main()');

//  setPathUrlStrategy();

  runApp(
    BusApp()
  );
}




//import 'dart:async';

//import 'build_own_flutter/material.dart' ;



//void main() async {
//
//  print('main start');
//  foo(1);
//  var f;
//  runZoned(() {
//     f = Future( ()=>foo(2) ).then( (r)=> foo(r) );
//  });
//  print('main after zone');
//  f.then( (r)=>foo(r) );
//  print('main end');
//
//}
//
//int foo(int p) {
//  print('foo $p, is in root zone =>  ${Zone.root == Zone.current}');
//  return p+1;
//}

/*
main start
foo 1, is in root zone =>  true
main after zone
main end
foo 2, is in root zone =>  false
foo 3, is in root zone =>  false
foo 4, is in root zone =>  true
* */


