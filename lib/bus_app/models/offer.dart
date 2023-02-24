import 'package:flutterlearn/bus_app/bus_app.dart';

class Offer extends AdminModel {
  Offer({ super.data });

  String get title => this['title'];
  String get subtitle => this['subtitle'];
  String get descr => this['descr'];
  String get url => this['url'];

  set title(String v) { data['title'] = v; }
  set subtitle(String v) { data['subtitle'] = v; }
  set descr(String v) { data['descr'] = v; }

}