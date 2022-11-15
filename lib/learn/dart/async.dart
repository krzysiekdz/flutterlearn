import 'dart:async';

void main() {

  print('main start');
  foo(1);
  var f;
  runZoned(() {
    f = Future( ()=>foo(2) ).then( (r)=> foo(r) );//future działa tak jakby: scheduleEvent - dodanie do kolejki i pojscie dalej
    //kod w future wykona sie po wykonaniu kodu synchronicznego - jak scheduleEvent;
    // kod w then wywola sie asychronicznie - gdy zakonczy sie kod przekazany do future
  });
  print('main after zone');
  f.then( (r)=>foo(r) );
  print('main end');

}

int foo(int p) {
  print('foo $p, is in root zone =>  ${Zone.root == Zone.current}');
  return p+1;
}

/*
main start
foo 1, is in root zone =>  true
main after zone
main end
foo 2, is in root zone =>  false
foo 3, is in root zone =>  false
foo 4, is in root zone =>  true
* */

//doczytac dalej o zones; potem event loop, timer, futures, isolates

//if async function returns type, most time we call it with await; on contrary if async function returns void, we call it without await


void main2() {

  print('main start');
  Timer( const Duration(seconds: 5), () { print('timer callback!'); } );
  Timer.periodic( const Duration(seconds: 4), (timer) {
    print('timer periodic: ${timer.tick}');
    if(timer.tick > 10) { timer.cancel(); }
  } );
  Timer.run(() { print('timer run!'); });
  print('main end');

}


//main start
//main end
//timer run!
//timer periodic: 1
//timer callback!
//timer periodic: 2
//timer periodic: 3
//....
//timer periodic: 11

void main3() {

  Stopwatch stopwatch = Stopwatch();
  stopwatch.start();
  print('main start');
  Timer( const Duration(seconds: 5), () { print('timer callback! , elapsed = ${stopwatch.elapsedMicroseconds}'); } );
  Timer.periodic( const Duration(seconds: 4), (timer) {
    print('timer periodic: ${timer.tick}, elapsed: ${stopwatch.elapsedMicroseconds}');
    if(timer.tick > 10) {
      timer.cancel();
      stopwatch.stop();
    }
  } );
  Timer.run(() { print('timer run!, elapsed = ${stopwatch.elapsedMicroseconds}'); });
  print('main end');

}

//
//main start
//main end
//timer run!, elapsed = 1901
//timer periodic: 1, elapsed: 4007401 <-- mikro sekundy
//timer callback! , elapsed = 5021801
//timer periodic: 2, elapsed: 8007401
//timer periodic: 3, elapsed: 12008801
//timer periodic: 4, elapsed: 16008901
// ....
//timer jest dokładny - dokładnosc do milisekund, ponizej inny pomiar; wahania to max kilkanascie milisekund

//timer periodic: 1, elapsed: 4016300
//timer callback! , elapsed = 5000700
//timer periodic: 2, elapsed: 8000900
//timer periodic: 3, elapsed: 12016300
//timer periodic: 4, elapsed: 16008900
//timer periodic: 5, elapsed: 20008800
//timer periodic: 6, elapsed: 24008800
//timer periodic: 7, elapsed: 28016700
//timer periodic: 8, elapsed: 32007700
//timer periodic: 9, elapsed: 36007200
//timer periodic: 10, elapsed: 40007300
//timer periodic: 11, elapsed: 44007400