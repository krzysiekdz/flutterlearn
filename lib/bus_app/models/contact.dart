import 'package:flutterlearn/bus_app/bus_app.dart';

class Contact extends AdminModel {
  Contact({ super.data });

  String get name1 => this['name1'];
  String get name2 => this['name2'];
  String get name3 => this['name3'];
  String get address1 => this['address1'];
  String get address2 => this['address2'];
  String get address3 => this['address3'];
  String get phone => this['phone'];
  String get email => this['email'];

  set name1(String v) { this['name1'] = v; }
  set name2(String v) { this['name2'] = v; }
  set name3(String v) { this['name3'] = v; }
  set address1(String v) { this['address1'] = v; }
  set address2(String v) { this['address2'] = v; }
  set address3(String v) { this['address3'] = v; }
  set phone(String v) { this['phone'] = v; }
  set email(String v) { this['email'] = v; }

}