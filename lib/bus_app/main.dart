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

  }

}