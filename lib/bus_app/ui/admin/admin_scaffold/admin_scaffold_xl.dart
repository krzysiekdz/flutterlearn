
import 'package:flutter/material.dart';
import 'package:flutterlearn/bus_app/models/routing.dart';
import 'package:flutterlearn/bus_app/ui/core/web_page.dart';
import 'package:flutterlearn/bus_app/utils/types.dart';

/*
* web widgets should be stateless?  all state is in url?
* */
class AdminScaffold_XL extends StatelessWidget {

  const AdminScaffold_XL({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    print('AdminScaffold_XL : build()');


    return Scaffold(
      appBar: AppBar(
        title: Text('AdminScaffold_XL'),
      ),
      body: Text('Admin XL')
    );
  }

}