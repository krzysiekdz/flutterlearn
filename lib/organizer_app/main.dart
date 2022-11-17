import 'package:flutter/material.dart';

import '../utils/AppColors.dart';
import '../utils/Styles.dart';

import 'config/AppConfig.dart';
import 'ui/app.dart';


class OrganizerApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    print('OrganizerApp : build()');

    AppColors colorsLight = AppConfig.style1;
    AppColors colorsDark = AppConfig.style1Dark;

    return  MaterialApp(
      title: AppConfig.appName,
      debugShowCheckedModeBanner: false,
      theme: Styles.getTheme(context, colorsLight),
      darkTheme: Styles.getTheme(context, colorsDark),
      home: App(
        colorsLight: colorsLight,
        colorsDark: colorsDark,
      ),
    );
  }
}