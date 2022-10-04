
import 'package:flutter/material.dart';

@immutable
class Todo {
  final int _id;
  final String _title ;
  final DateTime _date ;
  final int _priority ;
  final bool _isDone ;

  Todo({required String title, DateTime? date, int priority = 0, bool done = false, int id = 0})
      : _title = title, _date = date ?? DateTime.now(), _priority = priority, _isDone = done, _id = id ;


  String get title => _title;

  DateTime get date => _date;

  bool get isDone => _isDone;

  int get priority => _priority;

  int get id => _id;

  Todo.fromJson(Map<String, dynamic> json) :
        _id = int.parse(json['id'] ?? '0'),
        _title = json['task'] ?? '',
        _date = DateTime.now(),
        _priority = 0,
        _isDone = false
  ;

}