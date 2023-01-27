import 'package:flutterlearn/bus_app/bus_app.dart';

import '../utils/Styles.dart';


class BusAppAdmin extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    print('BusAppAdmin : build()');

    return MaterialApp(
      title: 'AutobusyAdmin',
      debugShowCheckedModeBanner: false,
      theme: Styles.getTheme(context, CustomStyles.colorsLight),
      darkTheme: Styles.getTheme(context, CustomStyles.colorsDark),
      home: AdminMain(),
    );
  }



}