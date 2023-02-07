import 'package:flutterlearn/bus_app/bus_app.dart';

class Schedule extends AdminModel {
  Schedule({ super.data });

  int get sid => int.parse(data['sid'] ?? '0');
  int get sched_id => int.parse(data['c_schedule_id'] ?? '0');
  String get title => this['title'];
  String get title_rev => this['title_rev'];
  String get cities => this['cities'];
  String get hours => this['hours'];
  String get url => this['url'];
  String get url_rev => this['url_rev'];
  int get dir => int.parse( data['c_dir'] ?? '0' );
  List<ScheduleLegend> get legend {
    if( data['legend'] is List ) {
      return (data['legend'] as List).map((e) => ScheduleLegend(data: e)).toList();
    }
    return [];
  }
  String get mark => this['mark'];
  List<String> get markAsList => mark.split(';')..removeLast();


  set sched_id(int v) { data['c_schedule_id'] = '$v'; }
  set title(String v) { data['title'] = v; }
  set title_rev(String v) { data['title_rev'] = v; }
  set url(String v) { data['url'] = v; }
  set url_rev(String v) { data['url_rev'] = v; }
  set cities(String v) { data['cities'] = v; }
  set hours(String v) { data['hours'] = v; }
  set dir(int v) { data['c_dir'] = '$v'; }
  set mark(String v) { data['mark'] = v; }
  set legend(dynamic v) { data['legend'] = v; }

}