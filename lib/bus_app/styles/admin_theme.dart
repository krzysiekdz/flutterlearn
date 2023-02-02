import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterlearn/utils/AppColors.dart';
import 'package:flutterlearn/bus_app/styles/style_utils.dart';

class AdminTheme {

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
          iconTheme: IconThemeData(color: c.textAlt ?? c.text),
          foregroundColor: c.textAlt ?? c.text,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: c.bar,
            statusBarIconBrightness: c.isDark ? Brightness.light : Brightness.dark,
          )
      ),

      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: c.bottomNav ?? c.bar,
        selectedItemColor: c.primary,
        unselectedItemColor: c.text,
      ),

      colorScheme: ColorScheme.fromSeed(seedColor: c.primary, primary: c.primary),

      splashColor: c.splash,

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: c.surface,
        hintStyle: TextStyle(
          color: c.hint,
        ),
        labelStyle: TextStyle(
          color: c.hint,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: c.text),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: c.text),
        ),
        helperStyle: TextStyle(
          color: c.hint,
        ),
        prefixIconColor: c.hint,
        suffixIconColor: c.hint,
        contentPadding: const EdgeInsets.all(16),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
//          backgroundColor: MaterialStateProperty.resolveWith<Color?>((states) {
//            if(states.contains(MaterialState.disabled)) { return Colors.grey; }
//          }),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular( CustomStyles.borderRadius ),
//              side: const BorderSide(color: Colors.redAccent),
          )),
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular( CustomStyles.borderRadius ),
            )),
            side: MaterialStateProperty.all( BorderSide(color: c.primary)),
          )
      ),

      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular( CustomStyles.borderRadius ),
            )),
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

      popupMenuTheme: PopupMenuThemeData(
        color: c.surface,
      ),

      dividerTheme: DividerThemeData(
        color: c.divider,
      ),

      listTileTheme: ListTileThemeData(
        iconColor: c.text,
        textColor: c.text,
        tileColor: c.listTile,
      ),

    );
  }
}