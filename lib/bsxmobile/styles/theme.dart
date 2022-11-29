import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterlearn/bsxmobile/styles/styles.dart';

import 'package:flutterlearn/utils/AppColors.dart';


class CustomTheme {

  static ThemeData getTheme(BuildContext context, AppColors c) {
    ThemeData theme = Theme.of(context);
    TextTheme textTheme = theme.textTheme;

    return ThemeData(

      primaryColor: c.primary,

      textTheme: textTheme.apply(
        bodyColor: c.textColor,
        displayColor: c.textColor,
      ),

      scaffoldBackgroundColor: c.surface,

      appBarTheme: AppBarTheme(
          backgroundColor: c.barColor,
          iconTheme: IconThemeData(color: c.textColor),
          foregroundColor: c.textColor,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: c.barColor,
            statusBarIconBrightness: c.isDark ? Brightness.light : Brightness.dark,
          )
      ),

      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: c.barColor,
        selectedItemColor: c.primary,
        unselectedItemColor: c.textColor,
      ),

      colorScheme: ColorScheme.fromSeed(seedColor: c.primary, primary: c.primary),

      splashColor: c.primary,

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: c.barColor,
        hintStyle: TextStyle(
          color: c.hintColor,
        ),
        labelStyle: TextStyle(
          color: c.hintColor,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        helperStyle: TextStyle(
          color: c.hintColor,
        ),
        prefixIconColor: c.hintColor,
        suffixIconColor: c.hintColor,
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular( CustomStyles.borderRadius ),
//              side: const BorderSide(color: Colors.redAccent),
          )),
          minimumSize: MaterialStateProperty.all(const Size.fromHeight( CustomStyles.buttonHeight )),
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular( CustomStyles.borderRadius ),
            )),
            minimumSize: MaterialStateProperty.all(const Size.fromHeight( CustomStyles.buttonHeight )),
            side: MaterialStateProperty.all( BorderSide(color: c.primary)),
          )
      ),

      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular( CustomStyles.borderRadius ),
          )),
          minimumSize: MaterialStateProperty.all(const Size.fromHeight( CustomStyles.buttonHeight )),
        )
      ),

      textSelectionTheme: TextSelectionThemeData(
        cursorColor: c.primary,
        selectionColor: c.primary,
//        cursorRadius: Radius.circular(12), //tak mozna tylko w TextField
//        cursorWidth: 12,
      ),

      dialogTheme: DialogTheme(
        backgroundColor: c.surface,
      ),

      drawerTheme: DrawerThemeData(
        backgroundColor: c.surface,
      ),

      iconTheme: IconThemeData(
        color: c.textColor,
      ),

      popupMenuTheme: PopupMenuThemeData(
        color: c.surface,
      ),

      dividerTheme: DividerThemeData(
        color: c.dividerColor,
      ),



    );
  }
}