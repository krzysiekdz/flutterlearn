/*
import 'package:flutter/material.dart';
import 'package:flutterlearn/bsxmobile/models/config.dart';
import 'package:flutterlearn/bsxmobile/widgets/mpfirma/login/login_initial.dart';
import 'package:flutterlearn/bsxmobile/widgets/mpfirma/login/login_to_cloud.dart';
import 'package:flutterlearn/bsxmobile/widgets/mpfirma/login/login_to_user.dart';
import 'package:flutterlearn/bsxmobile/widgets/mpfirma/main.dart';
import 'package:flutterlearn/bsxmobile/utils/misc.dart';


class LoginRouter extends StatefulWidget {

  final Config config;
  final LoginRoute initialRoute;
  const LoginRouter({Key? key, required this.config, this.initialRoute = LoginRoute.initial}) : super(key: key);

  @override
  State<StatefulWidget> createState() => LoginRouterState();

  static LoginRouterState of(BuildContext context) {
    return context.findAncestorStateOfType<LoginRouterState>()!;
  }

}

enum LoginRoute {
  user, cloud, initial;
//  String get route => name; //można także zastosować extension, jak poniżej
}

//extension GetRouteExt on LoginRoute {
//  String get route => name;
//}

class LoginRouterState extends State<LoginRouter> {

  final _navKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
    print('LoginScaffold : initState()');
  }

  @override
  void dispose() {
    print('LoginScaffold : dispose()');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('LoginScaffold : build()');

    return  Navigator(
      key: _navKey,
      onGenerateRoute: _onGenerateRoute,
      initialRoute: widget.initialRoute.name,
    );
  }

  Route _onGenerateRoute(RouteSettings settings) {
    Widget page;

    if(settings.name ==  LoginRoute.cloud.name) {
      page = LoginToCloud(config: widget.config);
    }
    else if (settings.name == LoginRoute.user.name) {
      page = LoginToUser(config: widget.config);
    }
    else {
      page = LoginInitial(config: widget.config);
    }

    return slideRoute(page);
  }

  void goto(LoginRoute route) {
    _navKey.currentState!.pushNamedAndRemoveUntil(route.name, (route) => false);
  }


}

 */
