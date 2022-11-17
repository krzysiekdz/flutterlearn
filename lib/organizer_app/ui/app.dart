import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../utils/AppColors.dart';
import '../../utils/ThemeHelper.dart';
import '../../utils/CommonData.dart';
import '../../learn/animate_physics.dart';
import 'login/LoginRouter.dart';
import 'main_scaffold/main_scaffold.dart';

//zaczac od: zrobienie animacji dla przelaczania widgetow w glownym stanie albo zmiana sposobu na navigator dla tych widgetow

//initial screen zrobic - to tutaj decyzja gdzie przechodzimy : login czy main oraz niech przez 2 sekundy pokazuje sie ładowanie i logo
//po czym przejscie na wlasciwy widget - tutaj animacja fade in/out - pomiedzy login oraz main
//na razie po 2s przejscie do logowania i rejestracji - tutaj zrobic logowanie i rejestracje i zapamietywanie i wtedy na initial rozpoznawac
//wtedy widok main - kategorie

class App extends StatelessWidget {
  static const int INIT_VIEW = 0;
  static const int LOGIN_VIEW = 1;
  static const int MAIN_VIEW = 2;

  const App({Key? key, required this.colorsLight, required this.colorsDark}) : super(key: key);
  final AppColors colorsLight;
  final AppColors colorsDark;


  /*
  * build app
  * */
  @override
  Widget build(BuildContext context) {
    print('App : build()');
    return ChangeNotifierProvider<ThemeHelper>(
        create: (context) => ThemeHelper(colorsLight, colorsDark),
        child: CommonData(child: _App())
    );
  }
}

class _App extends StatefulWidget {

  @override
  State<_App> createState() => _AppState();
}

class _AppState extends State<_App> {

  late int currView;
  double opacity = 1;

  @override
  void initState() {
    super.initState();

    print('_AppState : initState()');
    currView = App.INIT_VIEW;
  }

  /*
  * build app
  * */
  @override
  Widget build(BuildContext context) {
    print('_AppState : build()');
    return Scaffold(
      body: AnimatedOpacity(
          opacity: opacity,
          duration: const Duration(milliseconds: 500),
          child: resolveView()
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () { test(); },
        child: const Icon(Icons.refresh),
      ),
    );
  }

  Widget resolveView() {
    if( currView == App.MAIN_VIEW ) { return MainScaffold(setAppView: setAppView,); }
    else if ( currView == App.LOGIN_VIEW ) { return LoginRouter(setAppView: setAppView,); }
//    else { return InitialView(setAppView: setAppView, test: test); }
    else { return PhysicsCardDemo(); }
  }

  void setAppView(int i) {
    setState(() {
      currView = i;
    });
  }

  void test() {
    setState(() {
      if(opacity == 1) {
        opacity = 0;
      }
      else {
        opacity = 1;
      }
    });
  }
}

