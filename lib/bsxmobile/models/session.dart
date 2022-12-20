


import 'package:flutterlearn/bsxmobile/services/modules/core.dart';

class Session {

  Session();

  Cloud? cloudInfo;
  String get token => cloudInfo?.token ?? '';
  bool isLoggedToCloud() => cloudInfo != null;

}