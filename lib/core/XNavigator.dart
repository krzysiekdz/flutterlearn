import 'package:flutter/material.dart';

class XNavigator extends Navigator {

  XNavigator({ Key? key, String? initialRoute, RouteFactory? onGenerateRoute }) :
        super(key:key, initialRoute: initialRoute, onGenerateRoute: onGenerateRoute);

  @override
  NavigatorState createState() => XNavigatorState();

}

class XNavigatorState extends NavigatorState {

  List<String> xHistory = [];

  @override
  void initState() {
    super.initState();

    print('XNavigatorState : init()');

    xHistory.add( widget.initialRoute ?? '/initial' );
  }

  @override
  Future<T?> pushNamed<T extends Object?>(String routeName, {Object? arguments}) {
    xHistory.add(routeName);
    return super.pushNamed(routeName, arguments:arguments);
  }

  // pushNamed wywołuje wewnetrznie push, wiec nie nadpisywac push
//  @override
//  Future<T?> push<T extends Object?>(Route<T> route) {
//    xHistory.add( route.settings.name ?? 'anonymous');
//    return super.push(route);
//  }

  @override
  void pop<T extends Object?>([T? result]) {
    xHistory.removeLast();
    super.pop(result);
  }

  int getXHistoryLength() {
    return xHistory.length;
  }

  List<String> getXHistory() {
    return xHistory;
  }

  bool isFirstRoute() {
    return xHistory.length == 1;
  }

  void printXHistory() {
    print('history = ${xHistory.toString()}');
  }

}