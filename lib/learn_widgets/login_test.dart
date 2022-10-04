import 'package:flutter/material.dart';
import 'global_keys.dart';

import '../core/XNavigator.dart';


class LoginTest extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _LoginTestState();

}


class _LoginTestState extends State<LoginTest> {

  final navState = GlobalKey<XNavigatorState>();
  bool canBack = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        bool goBackSucc = _navBack();
        if(goBackSucc) { return Future<bool>.value(false); }
        else { return isExitDesired(context); }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Logowanie'),
          leading: canBack ? IconButton(icon: const Icon(Icons.arrow_back,), onPressed: () { _navBack(); }, ) : const SizedBox(width: 12,),
        ),
        body: SafeArea(
            child: XNavigator(
              key: navState,
              onGenerateRoute: _onGenerateRoute,
//            initialRoute: '/screen1',
            )
        ),
      ),
    );
  }

  Future<bool> isExitDesired(BuildContext context) async {
    return await showDialog(context: context, builder: (context) => AlertDialog(
      title: const Text('Zeszycik Pro'),
      content: const Text('Czy zamknąć aplikację?'),
      actions: [
        TextButton(onPressed: () { Navigator.of(context).pop(true); }, child: Text('Tak')),
        TextButton(onPressed: () { Navigator.of(context).pop(false); }, child: Text('Nie')),
      ],
    ));
  }

  bool _navBack() {
    if(navState.currentState!.canPop()) {
      navState.currentState!.pop();
      navState.currentState!.printXHistory();

      if(navState.currentState!.isFirstRoute()) {
        setState(() {
          canBack = false;
        });
      }

      return true;
    }
    return false;
  }

  Route _onGenerateRoute(RouteSettings settings) {
    late Widget page;
    print('route = ${settings.name}');

    if(settings.name == '/screen1') { page = Screen1(goToView: _goToView,); }
    else if(settings.name == '/screen2') { page = Screen2(goToView: _goToView,); }
    else if(settings.name == '/screen3') { page = Screen3(goToView: _goToView,); }
    else { page = ScreenNoView(goToView: _goToView,); }

    return createRoute(page);
  }

  Route createRoute(Widget page) {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 300),
      reverseTransitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var tween = Tween(begin: const Offset(1.0, 0.0), end: Offset.zero).chain(CurveTween(curve: Curves.easeOut));

        return SlideTransition(position: animation.drive(tween), child: child,);
//        return SlideTransition(
//            position: animation.drive(tween),
//            child: FadeTransition(
//              opacity: animation,
//              child: child,
//            ),
//        );


      },
    );
  }

  void _goToView(String view) {
    navState.currentState!.pushNamed(view);
    navState.currentState!.printXHistory();
    setState(() {
      canBack = true;
    });
  }
}

typedef GoToView = void Function(String view);

class Screen1 extends StatelessWidget {

  final GoToView goToView;

  Screen1({ required this.goToView });

  @override
  Widget build(BuildContext context) {


    return Container(
      child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              const Text('Screen 1', style: TextStyle(fontStyle: FontStyle.italic, fontSize: 32, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12,),
              ElevatedButton(onPressed: (){ goToView('/screen2'); }, child: const Text('Next')),
              const SizedBox(height: 12,),
              Counter(),
              ],
            ),
          ),
    );
  }
}

class Screen2 extends StatelessWidget  {

  final GoToView goToView;

  Screen2({ required this.goToView });

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            const Text('Screen 2', style: TextStyle(fontStyle: FontStyle.italic, fontSize: 32, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12,),
            ElevatedButton(onPressed: (){ goToView('/screen3'); }, child: const Text('Next')),
            Counter(),
          ],
        ),
      ),
    );
  }
}

class Screen3 extends StatelessWidget  {

  final GoToView goToView;

  Screen3({ required this.goToView });

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            const Text('Screen 3', style: TextStyle(fontStyle: FontStyle.italic, fontSize: 32, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12,),
            ElevatedButton(onPressed: (){ goToView('/screen1'); }, child: const Text('Next')),
            Counter(),
          ],
        ),
      ),
    );
  }
}

class ScreenNoView extends StatelessWidget {

  final GoToView goToView;

  const ScreenNoView({ required this.goToView });

  @override
  Widget build(BuildContext context) {
    print('build Screen NoView');
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:   [
           const Text('No view...', style: TextStyle(fontStyle: FontStyle.italic, fontSize: 32, fontWeight: FontWeight.bold)),
          const Counter(),
          ElevatedButton(onPressed: (){ goToView('/screen1'); }, child: const Text('Next')),
        ],
      ),
    );
  }
}