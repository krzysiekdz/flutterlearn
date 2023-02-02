import 'package:flutterlearn/bus_app/bus_app.dart';
import 'package:flutterlearn/bus_app/styles/admin_theme.dart';


class BusAppAdmin extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    print('BusAppAdmin : build()');

    return MaterialApp(
      title: 'AutobusyAdmin',
      debugShowCheckedModeBanner: false,
      theme: AdminTheme.getTheme(context, CustomStyles.adminColorsLight),
      darkTheme: AdminTheme.getTheme(context, CustomStyles.adminColorsDark),
      home: AdminMain(),
    );
  }



}