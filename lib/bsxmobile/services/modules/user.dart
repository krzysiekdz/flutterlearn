

import 'package:flutterlearn/bsxmobile/models/bsx_model.dart';

class User extends BsxModel {
  User({super.data});

  String get pfirstname => this['pfirstname'];
  String get plastname => this['plastname'];
  String get login => this['login'];
  String get password => this['password'];
  bool get isUser => login != '' && password != '';
}