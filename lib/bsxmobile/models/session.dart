


import 'package:flutterlearn/bsxmobile/services/modules/core.dart';

class Session {
  CloudInfo? cloudInfo;

  Session();

  String get token => cloudInfo?.token ?? '';

  bool isLoggedToCloud() => cloudInfo != null;

}