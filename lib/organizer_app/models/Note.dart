
import 'package:flutter/material.dart';

@immutable
class Note {

  final int? id;
  final String? text;

  const Note({this.id, this.text});

  Note.fromJson(Map<String, dynamic> parsedJson):
        id = int.parse(parsedJson['id'] ?? '0'),
        text = parsedJson['title'];

}