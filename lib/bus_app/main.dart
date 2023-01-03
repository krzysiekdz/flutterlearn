import 'package:flutterlearn/bus_app/bus_app.dart';

import '../utils/Styles.dart';



class BusApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    print('BusApp : build()');

    return MaterialApp.router(
      title: AppConfig.appName,
      debugShowCheckedModeBanner: false,
      theme: Styles.getTheme(context, CustomStyles.colorsLight),
      darkTheme: Styles.getTheme(context, CustomStyles.colorsDark),
      routeInformationParser: CustomRouteParser(),
      routerDelegate: AppRouter(),
    );

//    return MaterialApp(
//      title: AppConfig.appName,
//      debugShowCheckedModeBanner: false,
//      theme: Styles.getTheme(context, AppConfig.colorsLight),
//      darkTheme: Styles.getTheme(context, AppConfig.colorsDark),
//      onGenerateRoute: _onGenerateRoute,
//      initialRoute: Routes.admin,
//    );
  }

//  Route _onGenerateRoute(RouteSettings settings) {
//    print('BusApp : _onGenerateRoute =  ${settings.name}');
//
//    String route = settings.name ?? Routes.home;
//
//    Widget page;
//    if( route.startsWith(Routes.admin) ) { page = AdminScaffold(route: route); }
//    else { page = PageScaffold(route: route); }
//
//    return createRoute(page);
//  }

}