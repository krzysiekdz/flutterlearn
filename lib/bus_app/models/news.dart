import 'package:flutterlearn/bus_app/bus_app.dart';

class News extends BaseModel {
  News({ super.data });

  int get id => data['id'] ?? 0;
  String get title => this['title'];
  String get content => this['content'];
}