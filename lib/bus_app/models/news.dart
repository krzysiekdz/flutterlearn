import 'package:flutterlearn/bus_app/bus_app.dart';

class News extends BaseModel {
  News({ super.data });

  int get id => int.parse(data['id'] ?? '0');
  String get title => this['title'];
  String get content => this['content'];
  int get order => int.parse( data['c_order'] ?? '0' );
  bool get visible => int.parse( data['c_visible'] ?? '0' ) > 0;
  int get type => int.parse( data['c_type'] ?? '0' );

  set id(int v) { data['id'] = '$v'; }
  set title(String v) { data['title'] = v; }
  set content(String v) { data['content'] = v; }
  set visible(bool v) { data['c_visible'] = v ? '1' : '0'; }
  set order(int v) { data['c_order'] = '$v'; }

}