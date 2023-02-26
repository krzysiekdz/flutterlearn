import 'package:flutterlearn/bus_app/bus_app.dart';

class Attachment extends AdminModel {
  Attachment({ super.data });

  String get table => this['c_table'];
  String get url => this['url'];
  int get itemId => int.parse( data['c_item_id'] ?? '0' ) ;
  String get name => this['name'];
  String get ext => this['ext'];

  set table(String v) { this['c_table'] = v; }
  set itemId(int v) { this['c_item_id'] = '$v'; }
  set name(String v) { this['name'] = v; }
  set ext(String v) { this['ext'] = v; }

}