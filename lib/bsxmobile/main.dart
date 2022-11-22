import 'package:flutter/material.dart';
import 'package:flutterlearn/bsxmobile/config/mpfaktura.dart';
import 'package:flutterlearn/bsxmobile/models/config.dart';
import 'package:flutterlearn/bsxmobile/styles/styles.dart';
import 'package:flutterlearn/bsxmobile/styles/theme.dart';
import 'package:flutterlearn/bsxmobile/ui/mpfirma/main.dart';
import 'package:flutterlearn/utils/AppColors.dart';

import 'config/mpfirma.dart';

class BsxApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    print('BsxApp : build()');

    //tutaj wybieramy jaką aplikację budujemy, np mpFirma, mpFaktura, b2b
    Config config = MpFirmaConfig();
//    Config config = MpFakturaConfig();

    AppColors colorsLight = CustomStyles.colorsLight;//kolory powinny isc z configu
    AppColors colorsDark = CustomStyles.colorsDark;

    return MaterialApp(
      title: config.appName,
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.getTheme(context, colorsLight),//style powinny isc z configu
      darkTheme: CustomTheme.getTheme(context, colorsDark),
      home:  MpFirma(config: config, colorsLight: colorsLight, colorsDark: colorsDark,),
    );

  }

}