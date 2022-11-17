import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'AppColors.dart';

class ThemeHelper extends ChangeNotifier{
  final AppColors colorsLight;
  final AppColors colorsDark;
  bool isDark = false;
  bool isLight = true;
  bool isFirstCall = true;


  ThemeHelper(this.colorsLight, this.colorsDark) {
    print('ThemeHelper : constructor');
    SingletonFlutterWindow? window = WidgetsBinding.instance?.window;
    handleThemeMode(window);
    applyThemeMode(window);
  }

  void handleThemeMode(SingletonFlutterWindow? window) {
    window?.onPlatformBrightnessChanged = () { //nadpisujemy jednym callbackiem, tzn zawsze wywoła się tylko ten callback
      applyThemeMode(window);
      WidgetsBinding.instance?.handlePlatformBrightnessChanged();
    };
  }

  void applyThemeMode(SingletonFlutterWindow? window) {
    final brightness = window?.platformBrightness;

    if(brightness == Brightness.light) { //light mode
      onThemeModeChange(isDark: false);
    }
    else { //dark mode
      onThemeModeChange(isDark: true);
    }
  }

  void onThemeModeChange({required bool isDark}) {
    SystemUiOverlayStyle systemTheme;

    this.isDark = isDark;
    isLight = !isDark;

    if(!isDark) { //light mode
      AppColors c = colorsLight;
      systemTheme = SystemUiOverlayStyle.dark.copyWith(
        systemNavigationBarColor: c.barColor,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor: c.barColor,
      );
    }
    else { //dark mode
      AppColors c = colorsDark;
      systemTheme = SystemUiOverlayStyle.light.copyWith(
        systemNavigationBarColor: c.barColor,
        systemNavigationBarIconBrightness: Brightness.light,
        systemNavigationBarDividerColor: c.barColor,
      );
    }

    SystemChrome.setSystemUIOverlayStyle(systemTheme);

    if(isFirstCall) {
      isFirstCall = false;
      print('ThemeHelper : first call');
    }
    else {
      notifyListeners();
      print('ThemeHelper : notify listeners');
    }
  }

  @override
  void dispose() {
    SingletonFlutterWindow? window = WidgetsBinding.instance?.window;
    window?.onPlatformBrightnessChanged = () {
      WidgetsBinding.instance?.handlePlatformBrightnessChanged();
    };

    super.dispose();
  }

  AppColors get currentColor {
    if (isDark) { return colorsDark; }
    else { return colorsLight; }
  }
}
