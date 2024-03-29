import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'AppColors.dart';



class CustomTheme {

  static ThemeData getTheme(BuildContext context, AppColors c) {
    ThemeData theme = Theme.of(context);
    TextTheme textTheme = theme.textTheme;

    return ThemeData(

      primaryColor: c.primary,

      textTheme: textTheme.apply(
        bodyColor: c.text,
        displayColor: c.text,
      ),

      scaffoldBackgroundColor: c.surface,

      appBarTheme: AppBarTheme(
          backgroundColor: c.bar,
          iconTheme: IconThemeData(color: c.text),
          foregroundColor: c.text,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: c.bar,
            statusBarIconBrightness: c.isDark ? Brightness.light : Brightness.dark,
          )
      ),

      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: c.bar,
        selectedItemColor: c.primary,
        unselectedItemColor: c.text,
      ),

      colorScheme: ColorScheme.fromSeed(seedColor: c.primary, primary: c.primary),

      splashColor: c.primary,

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: c.bar,
        hintStyle: TextStyle(
          color: c.hint,
        ),
        labelStyle: TextStyle(
          color: c.hint,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        helperStyle: TextStyle(
          color: c.hint,
        ),
        prefixIconColor: c.hint,
        suffixIconColor: c.hint,
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
//              side: const BorderSide(color: Colors.redAccent),
          )),
//          minimumSize: MaterialStateProperty.all(const Size.fromHeight(50)),
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            )),
//            minimumSize: MaterialStateProperty.all(const Size.fromHeight(50)),
            side: MaterialStateProperty.all( BorderSide(color: c.primary)),
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
        color: c.text,
      ),

      tabBarTheme: const TabBarTheme(
        labelColor: Colors.black,
        labelStyle: TextStyle(fontSize: 20)
      ),


      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: c.primary,
      ),

//      switchTheme: SwitchThemeData(
//        trackColor: MaterialStateProperty.all( c.primary ),
//        thumbColor: MaterialStateProperty.all( c.primary ),
//      ),


    );
  }
}