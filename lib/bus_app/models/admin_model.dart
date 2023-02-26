import 'package:flutterlearn/bus_app/bus_app.dart';

class AdminModel extends BaseModel {
  AdminModel({ super.data });

  int get id => int.parse(data['id'] ?? '0');
  int get order => int.parse( data['c_order'] ?? '0' );
  bool get visible => int.parse( data['c_visible'] ?? '0' ) > 0;
  int get type => int.parse( data['c_type'] ?? '0' );

  set id(int v) { this['id'] = '$v'; }
  set order(int v) { this['c_order'] = '$v'; }
  set visible(bool v) { this['c_visible'] = v ? '1' : '0'; }
  set type(int v) { this['c_type'] = '$v'; }

}