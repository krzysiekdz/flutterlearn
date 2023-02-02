import 'package:flutterlearn/bus_app/bus_app.dart';

class AdminModel extends BaseModel {
  AdminModel({ super.data });

  int get id => int.parse(data['id'] ?? '0');
  int get order => int.parse( data['c_order'] ?? '0' );
  bool get visible => int.parse( data['c_visible'] ?? '0' ) > 0;
  int get type => int.parse( data['c_type'] ?? '0' );

  set id(int v) { data['id'] = '$v'; }
  set order(int v) { data['c_order'] = '$v'; }
  set visible(bool v) { data['c_visible'] = v ? '1' : '0'; }
  set type(int v) { data['c_type'] = '$v'; }

}