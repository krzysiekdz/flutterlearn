import 'package:flutter/material.dart';
import 'package:flutterlearn/bsxmobile/models/config.dart';
import 'package:flutterlearn/bsxmobile/ui/mpfirma/login/login_initial.dart';
import 'package:flutterlearn/bsxmobile/ui/mpfirma/login/login_to_cloud.dart';
import 'package:flutterlearn/bsxmobile/ui/mpfirma/login/login_to_user.dart';
import 'package:flutterlearn/bsxmobile/utils/misc.dart';


class LoginScaffold extends StatefulWidget {

  final Config config;
  final LoginRoute initialRoute;
  const LoginScaffold({Key? key, required this.config, this.initialRoute = LoginRoute.initial}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginScaffoldState();

}

enum LoginRoute {
  user, cloud, initial;
  String get route => name; //można także zastosować extension, jak poniżej
}

//extension GetRouteExt on LoginRoute {
//  String get route => name;
//}

class _LoginScaffoldState extends State<LoginScaffold> {

  @override
  void initState() {
    super.initState();
    print('LoginScaffold : initState()');
  }


  @override
  Widget build(BuildContext context) {
    print('LoginScaffold : build()');

    return Scaffold(
      body: _buildBody(context),
    );
  }

  //navigator- przejscie, bez mozliwosci powrotu do poprzedniego
  //przemyslec - czy zrobic bez navigatora, a np z uzyciem transform (jak w sliderze) zeby byly przejscia pomiedzy
  //komponentami; dodatkowo nie dzielic na login scaffold, tylko wyjac widoki z niego: login user, login cloud, initial
  //i zrobic w jednym poziomie, aby przejscia byly dowolnie pomiedzy nimi a mainscaffold
  //sprawdzic jeszcze mozliwosc uzycia navigator - chociaz to bez sensu, skoro uzywam navigatora tylko dla efektu przejscia

  //tutaj:
  //zrobic tak, aby mozna bylo przejsc z user do mainscaffold - zeby byl efekt przejscia oraz po wylogowaniu
  //tak samo efekt przejscia do dowolnego z cloud, user, initial - chyba bez navigatora a jakis efekt przejscia
  Widget _buildBody(BuildContext context) {
    return  SafeArea(
        child: Navigator(
          onGenerateRoute: _onGenerateRoute,
          initialRoute: widget.initialRoute.route,
        ),
    );
  }

  Route _onGenerateRoute(RouteSettings settings) {
    Widget page;

    if(settings.name ==  LoginRoute.cloud.route) {
      page = LoginToCloud(config: widget.config);
    }
    else if (settings.name == LoginRoute.user.route) {
      page = LoginToUser(config: widget.config);
    }
    else if (settings.name == LoginRoute.initial.route) {
      page = LoginInitial(config: widget.config);
    }
    else {
      page = LoginInitial(config: widget.config);
    }

    return slideRoute(page);
  }


}

