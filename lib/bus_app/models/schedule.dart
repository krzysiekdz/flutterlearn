import 'package:flutterlearn/bus_app/bus_app.dart';

class Schedule extends BaseModel {
  Schedule({ super.data });

  int get id => int.parse(data['id'] ?? '0');
  int get sid => int.parse(data['sid'] ?? '0');
  String get title => this['title'];
  String get title_rev => this['title_rev'];
  String get cities => this['cities'];
  String get hours => this['hours'];
  String get url => this['url'];
  String get url_rev => this['url_rev'];
  int get dir => int.parse( data['c_dir'] ?? '0' );
  bool get visible => int.parse( data['c_visible'] ?? '0' ) > 0;


  set id(int v) { data['id'] = '$v'; }
  set title(String v) { data['title'] = v; }
  set title_rev(String v) { data['title_rev'] = v; }
  set url(String v) { data['url'] = v; }
  set url_rev(String v) { data['url_rev'] = v; }
  set cities(String v) { data['cities'] = v; }
  set hours(String v) { data['hours'] = v; }
  set dir(int v) { data['c_dir'] = '$v'; }
  set visible(bool v) { data['c_visible'] = v ? '1' : '0'; }

}