import 'package:flutterlearn/bus_app/bus_app.dart';

class News extends BaseModel {
  News({ super.data });

  int get id => data['id'] ?? 0;
  String get title => this['title'];
  String get content => this['content'];
  int get order => int.parse( data['c_order'] ?? '0' );
  bool get visible => int.parse( data['c_visible'] ?? '0' ) > 0;
  int get type => int.parse( data['c_type'] ?? '0' );

  set title(String v) { data['title'] = v; }
  set content(String v) { data['content'] = v; }
  set visible(bool v) { data['c_visible'] = v ? '1' : '0'; }

//  @override
//  Map<String, String> toMap() {
//    Map<String, String> map = {};
//    News item = News(data: map);
//    item.title = title;
//    item.content = content;
//    item.visible = visible;
//    return map;
//  }

}