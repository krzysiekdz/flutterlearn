import 'package:flutterlearn/bus_app/bus_app.dart';

class ScheduleLegend extends AdminModel {
  ScheduleLegend({ super.data });

  String get mark => this['mark'];
  String get descr => this['descr'];

  set mark(String v) { data['mark'] = v; }
  set descr(String v) { data['descr'] = v; }

}