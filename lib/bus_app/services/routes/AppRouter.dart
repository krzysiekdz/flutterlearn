import 'package:flutter/material.dart';
import 'package:flutterlearn/bus_app/config/routes.dart';
import 'package:flutterlearn/bus_app/models/routing.dart';
import 'package:flutterlearn/bus_app/services/routes/CustomRouteParser.dart';
import 'package:flutterlearn/bus_app/ui/admin/admin_scaffold/admin_scaffold.dart';
import 'package:flutterlearn/bus_app/ui/notfound/not_found.dart';
import 'package:flutterlearn/bus_app/ui/page/page_scaffold/PageScaffold.dart';



class AppRouter extends RouterDelegate<RouteUrl>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<RouteUrl> {

  //there is only one instance of AppRouter
  static final AppRouter _instance = AppRouter._init();
  AppRouter._init();
  factory AppRouter() => _instance;

  final GlobalKey<NavigatorState> _navKey = GlobalKey<NavigatorState>() ;
  @override
  GlobalKey<NavigatorState>? get navigatorKey => _navKey;

  RouteUrl? _routeUrl;
  RouteUrl get routeUrl => _routeUrl ?? RouteUrl(url: PageRoutes.home.path!, routeData: PageRoutes.home);
  String get url => _routeUrl?.url ?? PageRoutes.home.path!;

  @override
  RouteUrl? get currentConfiguration {
    print('AppRouter: get currentConfiguration = $url');
    return routeUrl;
  }

  List<Page> get pageStack =>  [
     MaterialPage(
      name: url,
      child: PageScaffold(route: routeUrl),
    ),
  ];

  List<Page> get notFound =>  [
    MaterialPage(
      name: url,
      child: NotFoundScaffold(route: routeUrl),
    ),
  ];

  List<Page> get adminStack =>  [
    MaterialPage(
      name: url,
      child: AdminScaffold(route: routeUrl),
    ),
  ];


  @override
  Widget build(BuildContext context) {
    var _stack = resolveStack();

    print('AppRouter : build(), _stack = ${_stack.toString()}');

    //here i can create Navigator by myself, not by default MaterialApp; i can create many navigators denpendend on config: page or admin stack
    return Navigator(
      key: navigatorKey,
      pages: _stack,
      onPopPage: (route, result) {
        print('AppRouter : onPopPage = ${route.settings.name}');
        _stack.removeLast();
//        _routeData = _stack?.last ?? Routes.home;
        return route.didPop(result);
      },
    );
  }

  List<Page> resolveStack() {
    if( PageRoutes.all.contains( routeUrl.routeData ) ) { return pageStack; }
    else if( AdminRoutes.all.contains( routeUrl.routeData ) ) { return adminStack; }
    else { return notFound; }
  }

  @override
  Future<void> setInitialRoutePath(RouteUrl configuration) {
    print('AppRouter : setInitialRoutePath = ${configuration.url}');
    return super.setInitialRoutePath(configuration);
  }

  @override
  Future<void> setNewRoutePath(RouteUrl configuration) async {
    print('AppRouter : setNewRoutePath = ${configuration.url}');
    _routeUrl = configuration; //setting config

    notifyListeners();//after notify, Router (from MaterialApp) gives currentConfiguration from AppRouter and pass it to RouterParser, which gives url (probably to set in browser)
    //and finally build is called
  }

  void setUrl(String url) {
     setNewRoutePath( CustomRouteParser.parseUrl(url) );
  }

}