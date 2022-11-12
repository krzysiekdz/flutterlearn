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

//doczytac dalej o zones; potem event loop, timer, futures

//if async function returns type, most time we call it with await; on contrary if async function returns void, we call it without await