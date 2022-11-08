
/*  Future example

import 'dart:io';

Future longRun(String s) async {
  for(int i = 0; i < 5; i++) {
    print('long run $s: $i');
//    sleep(Duration(seconds: 1));
    await Future.delayed(Duration(seconds: 1));
  }
}

void main() async {
  print('main begin');

  longRun('a');

  for(int i = 10; i < 15; i++) {
    print('main index : $i');
//    sleep(Duration(seconds: 1));
    await Future.delayed(Duration(seconds: 1));
  }

  print('main end');
}
*/

// Event loop , Zone.current

// library, part, part of, export - przyklad z dwoma plikami ponizej: material.dart , widgets.dart


/* material.dart

//library material;
//part 'widgets.dart';
import  'widgets.dart';
export 'widgets.dart';

void fun1() { print('fun1'); }

void fun2() { print('fun2'); }

void fun3() { print('fun3'); }

enum PersonType { student, employee, none }

class Person {
  PersonType type;
  final String fname;
  final String lname;

  Person({required this.lname, required this.fname}) : type = PersonType.none;

  String toString() => '$type: $fname $lname';
}

PersonType getPersonType(Person p) { return p.type; }

StudentType getStudentType(Student s) { return s.studentType; }

*/

/* widgets.dart
*
* //part of material;

import 'material.dart';

void helloW1() {
  print('hello w1');
}

void helloW2() {
  print('hello w2');
}

enum StudentType { good, bad, none }

class Student extends Person {
  StudentType studentType;
  Student({required super.lname, required super.fname}) : studentType = StudentType.good {
    super.type = PersonType.student;
  }

  void makeBad() { studentType = StudentType.bad; }

  @override
  String toString() {
    return '${super.toString()} : student type = $studentType';
  }
}
* */

/* scheduleMicrotask; scheduleEvent - jako Future; kod asynchroniczny - wykonywany nie synchronicznie, tzn z kolejek sa pobierane zadania do wykonania, ktore pojawiaja sie w dowolnej koljenosci
  asynchronicznosc oznacza, ze zadania sie wykonaja, gdy wykona sie kod synchroczniy, nie wykonaja sie one natomiast rownolegle do kodu synchronicznego z main, tylko po nim
*
* import 'dart:async';

void main() async {
  scheduleMicrotask(() => print('hello world1'));
  print('hello world2');
  scheduleMicrotask(() => print('hello world3'));
}
*
* //wywola sie: 2,1,3
*
*
* main:
  Future(() => print('hello world 0'));//event queue; nie ma scheduleEvent tylko poprzez Future
  scheduleMicrotask(() => print('hello world1'));//micro task - zadanie o wysokim priorytecie - wywola sie zawsze przed eventem
  print('hello world2');
  scheduleMicrotask(() => print('hello world3'));
  print(Zone.current == Zone.root); //true
  Zone.current.scheduleMicrotask(() { print('hello world4');});
  wywoła sie: 2, true, 1, 3, 4, 0 - future wywola sie na koncu! bo jest jako event queue

* */