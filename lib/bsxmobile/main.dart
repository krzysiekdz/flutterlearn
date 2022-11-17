import 'package:flutter/material.dart';
import 'package:flutterlearn/bsxmobile/models/config.dart';
import 'package:flutterlearn/bsxmobile/styles/styles.dart';
import 'package:flutterlearn/bsxmobile/styles/theme.dart';
import 'package:flutterlearn/bsxmobile/ui/mpfirma/main.dart';

import 'config/mpfirma.dart';

class BsxApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    print('BsxApp : build()');

    //tutaj wybieramy jaką aplikację budujemy, np mpFirma, mpFaktura, b2b
    Config config = MpFirmaConfig();

    return MaterialApp(
      title: config.appName,
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.getTheme(context, CustomStyles.colorsLight),//tez powinno isc z configu
      darkTheme: CustomTheme.getTheme(context, CustomStyles.colorsDark),
      home:  MpFirma(config: config),
    );

  }

}