import 'package:flutter/material.dart';
import '../../../utils/XNavigator.dart';
import '../../../utils/types.dart';
import '../../utils/CommonViews.dart';
import '../../utils/RouteHelper.dart';
import '../../utils/NotFound.dart';
import 'LoginView.dart';
import 'RegisterView.dart';

class LoginRouter extends StatelessWidget {

  static const String LOGIN_ROUTE = '/';
  static const String REGISTER_ROUTE = '/register';
  static const String FORGOT_PASS_ROUTE = '/forgot_pass';

  FunctionInt setAppView;
  final navState = GlobalKey<XNavigatorState>();

  LoginRouter({Key? key, required this.setAppView}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () => _onBackPressed(context),
        child: XNavigator(
          onGenerateRoute: _onGenerateRoute,
          key: navState,
        ),
    );
  }

  Future<bool> _onBackPressed(BuildContext context) {
    bool goBackSucc = _navBack();
    if(goBackSucc) { return Future<bool>.value(false); }
    else { return isExitDesired(context); }
  }

  Route _onGenerateRoute(RouteSettings settings) {
    Widget page;

    if(settings.name == LOGIN_ROUTE) { page = LoginView(goToView: _goToView, setAppView: setAppView,); }
    else if(settings.name == REGISTER_ROUTE) { page = RegisterView(); }
    else page = NotFound();

    return RouteHelper.createRoute(page);

  }

  void _goToView(String view) {
    navState.currentState!.pushNamed(view);
    navState.currentState!.printXHistory();
  }

  bool _navBack() {
    if(navState.currentState!.canPop()) {
      navState.currentState!.pop();
      navState.currentState!.printXHistory();
      return true;
    }
    return false;
  }

  Future<bool> isExitDesired(BuildContext context) async {
    return await showDialog(context: context, builder: (context) => CommonViews.closeAppDialog(context) );
  }

}

