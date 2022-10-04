import 'package:flutter/material.dart';



class AppRouter extends RouterDelegate<RoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<RoutePath> {

  static final AppRouter _instance = AppRouter._init();

  //there is only one instance of AppRouter
  RoutePath? _path;
  final GlobalKey<NavigatorState> _navKey = GlobalKey<NavigatorState>() ;

  final List<MaterialPage> _stack =  [
//    const MaterialPage(
//      name: PageRoutes.contact,
//      child: PageScaffold(route: PageRoutes.contact),
//    ),
//    const MaterialPage(
//      name: PageRoutes.schedule,
//      child: PageScaffold(route: PageRoutes.schedule),
//    ),
//    const MaterialPage(
//      name: PageRoutes.offer,
//      child: PageScaffold(route: PageRoutes.offer),
//    ),
  ];


  AppRouter._init();

  factory AppRouter() => _instance;

  @override
  RoutePath? get currentConfiguration {
    print('AppRouter: get currentConfiguration = ${_path?.path}');
    return _path;
  }

  @override
  GlobalKey<NavigatorState>? get navigatorKey => _navKey;


  @override
  Widget build(BuildContext context) {
    print('CustomRouterDelegate : build(), _stack size = ${_stack.toString()}');

    //here i can create Navigator by myself, not by default MaterialApp; i can create many navigators denpendend on config: page or admin stack
    return Navigator(
      key: navigatorKey,
      pages: _stack,
      onPopPage: (route, result) {
        print('CustomRouterDelegate : onPopPage = ${route.settings.name}');
        _stack.removeLast();
//        _path = RoutePath(path: _stack?.last?.name ?? PageRoutes.home);
        return route.didPop(result);
      },
    );
  }

  @override
  Future<void> setInitialRoutePath(RoutePath configuration) {
    print('CustomRouterDelegate::setInitialRoutePath = ${configuration.path}');
    return super.setInitialRoutePath(configuration);
  }

  @override
  Future<void> setNewRoutePath(RoutePath configuration) async {
    print('CustomRouterDelegate::setNewRoutePath = ${configuration.path}');
    _path = configuration; //setting config
    notifyListeners();//after notify, Router (from MaterialApp) gives currentConfiguration from AppRouter and pass it to RouterParser, which gives url (probably to set in browser)
    //and finally build is called
  }

}


class RoutePath {
  final String? path;

  const RoutePath({ required this.path });

}