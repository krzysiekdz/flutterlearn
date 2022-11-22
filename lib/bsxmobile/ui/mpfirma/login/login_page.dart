
import 'package:flutter/material.dart';
import 'package:flutterlearn/bsxmobile/styles/colors.dart';
import 'package:flutterlearn/bsxmobile/styles/styles.dart';
import 'package:flutterlearn/utils/ThemeHelper.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {

  final Widget child;

  const LoginPage({ required this.child, super.key });

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Consumer<ThemeHelper>(
        builder: (context, themeHelper, ch) => Container(
          width: double.infinity,
          decoration: BoxDecoration(color: themeHelper.currentColor.surface),
          child: ch,
        ),
        child: SingleChildScrollView(
          padding:  const EdgeInsets.all(CustomStyles.padding),
          child: child,
        ),
      ),
    );
  }
}