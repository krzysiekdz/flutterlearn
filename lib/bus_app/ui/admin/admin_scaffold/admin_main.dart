
import 'package:flutter/material.dart';
import 'package:flutterlearn/bus_app/models/routing.dart';
import 'package:flutterlearn/bus_app/ui/admin/admin_scaffold/admin_scaffold_sm.dart';
import 'package:flutterlearn/bus_app/ui/admin/admin_scaffold/admin_scaffold_xl.dart';
import 'package:flutterlearn/bus_app/ui/admin/login/admin_login.dart';

import 'package:flutterlearn/bus_app/utils/fun.dart';
import 'package:flutterlearn/bus_app/utils/types.dart';
import 'package:flutterlearn/learn_widgets/global_keys.dart';
import 'package:flutterlearn/learn_widgets/inherited_widg_ex.dart';


class AdminMain extends StatefulWidget {

  const AdminMain({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AdminState();

}

class _AdminState extends State<AdminMain> {

  bool isLogged = true;

  @override
  void initState() {
    super.initState();
    print('AdminMain: initState()');
  }

  @override
  Widget build(BuildContext context) {
    print('AdminMain : build()');

    ScreenSize size = resolveScreenSize(context);

    //przypomnic sobie change notifier oraz provider
    Widget page;
    if(isLogged) {
      //uwaga: po przejsciu pomiedzy SM - XL stany wewnętrzne sie wyczyszczą
      if( size == ScreenSize.sm) { page = AdminScaffold_SM(); }
      else { page = AdminScaffold_XL(); }
    }
    else {
      page = AdminLogin();
    }


    return page;
  }
}