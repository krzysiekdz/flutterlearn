
import 'package:flutter/material.dart';
import 'package:flutterlearn/bsxmobile/styles/styles.dart';

class LoginPage extends StatelessWidget {

  final Widget child;

  const LoginPage({ required this.child, super.key });

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            padding:  const EdgeInsets.all(CustomStyles.padding),
            child: child,
          ),
        ),
      ),
    );

    //ustawiamy kolor, bo widget jest przezroczysty; jesli bysmy w navigatorze dodawali Scaffold, wtedy kolor bylby brany automatycznie ze stylu
//    return Center(
//      child: Consumer<ThemeHelper>(
//        builder: (context, themeHelper, ch) => Container(
//          width: double.infinity,
//          decoration: BoxDecoration(color: themeHelper.currentColor.surface),
//          child: ch,
//        ),
//        child: SingleChildScrollView(
//          padding:  const EdgeInsets.all(CustomStyles.padding),
//          child: child,
//        ),
//      ),
//    );

  }
}