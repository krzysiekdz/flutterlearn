import 'package:flutterlearn/bus_app/bus_app.dart';

class News extends AdminModel {
  News({ super.data });

  String get title => this['title'];
  String get content => this['content'];

  set title(String v) { this['title'] = v; }
  set content(String v) { this['content'] = v; }

}