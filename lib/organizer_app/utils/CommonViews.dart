import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/AppColors.dart';
import '../../utils/ThemeHelper.dart';
import '../../utils/Styles.dart';
import '../config/AppConfig.dart';

class CommonViews {

  static AlertDialog closeAppDialog(BuildContext context) {
     return AlertDialog(
       title: const Text(AppConfig.appName),
       content: const Text('Czy zamknąć aplikację?'),
       actions: [
         TextButton(onPressed: () { Navigator.of(context).pop(true); }, child: const Text('Tak')),
         TextButton(onPressed: () { Navigator.of(context).pop(false); }, child: const Text('Nie')),
       ],
     );
  }

  static Widget getLogo(AppColors c) {
    return Image.asset('images/organizer.png', width: 80, height: 80, color: c.textColor,);
  }

  static Widget buildLogo() {
    return  Consumer<ThemeHelper>(
      builder: (context, themeHelper, child) => CommonViews.getLogo(themeHelper.currentColor),
    );
  }

  static Widget getAppTitle() {
    return Text(AppConfig.appName, style: Styles.header());
  }

}